package service;

import dao.LessonDAO;
import dao.LessonMyBatisDAO;
import dao.NotificationDAO;
import dao.NotificationMyBatisDAO;
import dto.LessonDTO;
import dto.NotificationDTO;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.Comparator;
import java.util.List;

public class DashboardServiceImpl {

    private final LessonDAO lessonDAO = new LessonMyBatisDAO();
    private final NotificationDAO notificationDAO = new NotificationMyBatisDAO();

    public DashboardData getDashboardData(String userId, Integer lessonId) {
        LocalDate today = LocalDate.now();
        LocalTime now = LocalTime.now();

        // 1. Fetch data
        List<LessonDTO> lessons = lessonDAO.findLessonsByDate(today);

        // 2. Process lessons (business logic)
        lessons.sort(Comparator.comparing(this::safeStartTime));

        int nowIndex = -1;

        for (int i = 0; i < lessons.size(); i++) {
            LessonDTO lesson = lessons.get(i);

            // default status
            lesson.setStatus("Booked");

            if (isInLessonRange(now, lesson.getStartTime(), lesson.getEndTime())) {
                nowIndex = i;
            }
        }

        int upNextIndex = -1;

        if (nowIndex != -1) {
            lessons.get(nowIndex).setStatus("Now");

            if (nowIndex + 1 < lessons.size()) {
                upNextIndex = nowIndex + 1;
                lessons.get(upNextIndex).setStatus("Up Next");
            }
        } else {
            upNextIndex = findFirstUpcomingIndex(lessons, now);

            if (upNextIndex != -1) {
                lessons.get(upNextIndex).setStatus("Up Next");
            }
        }

        // 3. Select lesson
        LessonDTO selectedLesson = findById(lessons, lessonId);

        if (selectedLesson == null) {
            if (nowIndex != -1) {
                selectedLesson = lessons.get(nowIndex);
            } else if (upNextIndex != -1) {
                selectedLesson = lessons.get(upNextIndex);
            } else if (!lessons.isEmpty()) {
                selectedLesson = lessons.get(0);
            }
        }

        // 4. Notifications
        String selectedMemberName =
                selectedLesson != null ? selectedLesson.getMemberName() : null;

        List<NotificationDTO> notifications =
                notificationDAO.findRecentByUserAndMember(
                        userId,
                        selectedMemberName,
                        20
                );

        // 5. Return aggregated data
        return new DashboardData(
                today.toString(),
                lessons,
                selectedLesson,
                notifications
        );
    }

    // =========================
    // Business Logic Helpers
    // =========================

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

    private LessonDTO findById(List<LessonDTO> lessons, Integer lessonId) {
        if (lessonId == null) return null;

        for (LessonDTO lesson : lessons) {
            if (lesson.getLessonId() == lessonId) {
                return lesson;
            }
        }
        return null;
    }
}