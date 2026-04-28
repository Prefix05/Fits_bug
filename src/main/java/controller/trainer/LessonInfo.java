package controller.trainer;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.trainer.ClientDAOImpl;
import dao.trainer.LessonDAO;
import dao.trainer.LessonDAOImpl;
import dto.trainer.ClientDTO;
import dto.trainer.LessonDTO;

public class LessonInfo extends HttpServlet {
    private final LessonDAO lessonDAO = new LessonDAOImpl();
    private final ClientDAOImpl clientDAO = new ClientDAOImpl(); // 추가

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer lessonId = parseLessonId(request.getParameter("lessonId"));
        if (lessonId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "lessonId is required");
            return;
        }

        List<LessonDTO> todayLessons = lessonDAO.findLessonsByDate(LocalDate.now());
        todayLessons.sort(Comparator.comparing(this::safeStartTime));
        applyDynamicStatuses(todayLessons, LocalTime.now());

        LessonDTO selected = findById(todayLessons, lessonId);
        if (selected == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Lesson not found");
            return;
        }

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        ClientDTO client = clientDAO.selectClientByName(selected.getMemberName());
        int lessonCount = (client != null) ? client.getLessonCount() : 0;

        String json = "{" +
                "\"lessonId\":" + selected.getLessonId() + "," +
                "\"goal\":\"" + escapeJson(selected.getGoal()) + "\"," +
                "\"memberName\":\"" + escapeJson(selected.getMemberName()) + "\"," +
                "\"startTime\":\"" + escapeJson(selected.getStartTime()) + "\"," +
                "\"endTime\":\"" + escapeJson(selected.getEndTime()) + "\"," +
                "\"durationMinutes\":" + selected.getDurationMinutes() + "," +
                "\"status\":\"" + escapeJson(selected.getStatus()) + "\"," +
                "\"lessonCount\":" + lessonCount +
                "}";

        response.getWriter().write(json);
    }

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
