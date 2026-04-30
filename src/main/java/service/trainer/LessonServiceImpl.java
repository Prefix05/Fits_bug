package service.trainer;

import dao.trainer.ClientDAO;
import dao.trainer.ClientDAOImpl;
import dao.trainer.LessonDAO;
import dao.trainer.LessonDAOImpl;
import dto.trainer.ClientDTO;
import dto.trainer.LessonDTO;
import dto.trainer.LessonInfoResponse;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.Comparator;
import java.util.List;

public class LessonServiceImpl implements LessonService {

    private final LessonDAO lessonDAO = new LessonDAOImpl();
    private final ClientDAO clientDAO = new ClientDAOImpl();

    @Override
    public List<LessonDTO> getLessonsByDate(LocalDate date, int trainerId) {
        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession();

        try {
            return lessonDAO.selectLessonsByDate(session, date, trainerId);
        } finally {
            session.close();
        }
    }

    @Override
    public LessonInfoResponse getLessonInfo(int trainerId, int lessonId) {
        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession();

        try {
            List<LessonDTO> lessons =
                    lessonDAO.selectLessonsByDate(session, LocalDate.now(), trainerId);

            lessons.sort(Comparator.comparing(this::safeStartTime));
            applyDynamicStatuses(lessons, LocalTime.now());

            LessonDTO selected = findById(lessons, lessonId);

            if (selected == null) {
                return null;
            }

            ClientDTO client =
                    clientDAO.selectClientById(session, selected.getClientId());

            return new LessonInfoResponse(selected, client);

        } finally {
            session.close();
        }
    }
//DAO     → select / insert / update (SQL language)
//Service → get / create / update   (business language)
private void applyDynamicStatuses(List<LessonDTO> lessons, LocalTime now) {
    int nowIndex = -1;
    for (int i = 0; i < lessons.size(); i++) {
        LessonDTO lesson = lessons.get(i);
        lesson.setStatus("Booked");
        if (isInLessonRange(now, lesson.getStartTime(), lesson.getEndTime())) {
            nowIndex = i;
        }
    }

    if (nowIndex != -1) {
        lessons.get(nowIndex).setStatus("Now");
        if (nowIndex + 1 < lessons.size()) {
            lessons.get(nowIndex + 1).setStatus("Up Next");
        }
        return;
    }

    int upNextIndex = findFirstUpcomingIndex(lessons, now);
    if (upNextIndex != -1) {
        lessons.get(upNextIndex).setStatus("Up Next");
    }
}


    private boolean isInLessonRange(LocalTime now, String startTime, String endTime) {
        try {
            LocalTime start = LocalTime.parse(startTime);
            LocalTime end = LocalTime.parse(endTime);
            return !now.isBefore(start) && now.isBefore(end);
        } catch (DateTimeParseException e) {
            return false;
        }
    }

    private LocalTime parseTime(String value) {
        try {
            return LocalTime.parse(value);
        } catch (DateTimeParseException e) {
            return null;
        }
    }

    private LocalTime safeStartTime(LessonDTO lesson) {
        LocalTime start = parseTime(lesson.getStartTime());
        return start != null ? start : LocalTime.MAX;
    }

    private int findFirstUpcomingIndex(List<LessonDTO> lessons, LocalTime now) {
        for (int i = 0; i < lessons.size(); i++) {
            LocalTime start = parseTime(lessons.get(i).getStartTime());
            if (start != null && start.isAfter(now)) {
                return i;
            }
        }
        return -1;
    }

    private Integer parseLessonId(String rawLessonId) {
        if (rawLessonId == null || rawLessonId.trim().isEmpty()) {
            return null;
        }
        try {
            return Integer.parseInt(rawLessonId);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private LessonDTO findById(List<LessonDTO> lessons, Integer lessonId) {
        for (LessonDTO lesson : lessons) {
            if (lesson.getLessonId() == lessonId) {
                return lesson;
            }
        }
        return null;
    }

    private String escapeJson(String value) {
        if (value == null) {
            return "";
        }
        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }
}
