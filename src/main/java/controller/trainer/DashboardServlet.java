package controller.trainer;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.Comparator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.trainer.LessonDAO;
import dao.trainer.LessonMyBatisDAO;
import dao.trainer.NotificationDAO;
import dao.trainer.NotificationMyBatisDAO;
import dto.trainer.LessonDTO;
import dto.trainer.NotificationDTO;

public class DashboardServlet extends HttpServlet {
    private final LessonDAO lessonDAO = new LessonMyBatisDAO();
    private final NotificationDAO notificationDAO = new NotificationMyBatisDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDate today = LocalDate.now();
        List<LessonDTO> todayLessons = lessonDAO.findLessonsByDate(today);
        LocalTime now = LocalTime.now();

        todayLessons.sort(Comparator.comparing(this::safeStartTime));


        // Assign status to "Booked", find index of current lesson
        int nowIndex = -1;
        for (int i = 0; i < todayLessons.size(); i++) {
            LessonDTO lesson = todayLessons.get(i);
            lesson.setStatus("Booked");
            if (isInLessonRange(now, lesson.getStartTime(), lesson.getEndTime())) {
                nowIndex = i;
            }
        }

        // Assign status for (Now) and (Up Next) lessons
        int upNextIndex = -1;
        if (nowIndex != -1) {
            todayLessons.get(nowIndex).setStatus("Now");
            if (nowIndex + 1 < todayLessons.size()) {
                upNextIndex = nowIndex + 1;
                todayLessons.get(upNextIndex).setStatus("Up Next");
            }
        } else {
            upNextIndex = findFirstUpcomingIndex(todayLessons, now);
            if (upNextIndex != -1) {
                todayLessons.get(upNextIndex).setStatus("Up Next");
            }
        }

        Integer selectedLessonId = parseLessonId(request.getParameter("lessonId"));
        LessonDTO selectedLesson = findById(todayLessons, selectedLessonId);
        if (selectedLesson == null) {
            if (nowIndex != -1) {
                selectedLesson = todayLessons.get(nowIndex);
            } else if (upNextIndex != -1) {
                selectedLesson = todayLessons.get(upNextIndex);
            } else if (!todayLessons.isEmpty()) {
                selectedLesson = todayLessons.get(0);
            }
        }

        request.setAttribute("todayDate", today.toString());
        request.setAttribute("todayLessons", todayLessons);
        request.setAttribute("selectedLesson", selectedLesson);
        request.setAttribute("hasSelectedLesson", selectedLesson != null);

        String userId = resolveUserId(request);
        String selectedMemberName = selectedLesson != null ? selectedLesson.getMemberName() : null;
        List<NotificationDTO> notifications = notificationDAO.findRecentByUserAndMember(userId, selectedMemberName, 20);
        request.setAttribute("notifications", notifications);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/dashboard.jsp");
        dispatcher.forward(request, response);
    }

    private String resolveUserId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Object id = session.getAttribute("id");
            if (id != null && !String.valueOf(id).trim().isEmpty()) {
                return String.valueOf(id).trim();
            }
        }
        return "demo-user";
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
        if (lessonId == null) {
            return null;
        }
        for (LessonDTO lesson : lessons) {
            if (lesson.getLessonId() == lessonId) {
                return lesson;
            }
        }
        return null;
    }
}
