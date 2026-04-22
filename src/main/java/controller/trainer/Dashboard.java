package controller;

import dao.ClientDAO;
import dto.ClientDTO;
import service.DashboardData;
import service.DashboardServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

public class Dashboard extends HttpServlet {

    private final DashboardServiceImpl dashboardService = new DashboardServiceImpl();
    private final ClientDAO clientDAO = new ClientDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = resolveUserId(request);
        Integer lessonId = parseLessonId(request.getParameter("lessonId"));

        DashboardData data = dashboardService.getDashboardData(userId, lessonId);

        request.setAttribute("todayDate", data.getTodayDate());
        request.setAttribute("todayLessons", data.getLessons());
        request.setAttribute("selectedLesson", data.getSelectedLesson());
        if (data.getSelectedLesson() != null) {
            ClientDTO client = clientDAO.selectClientByName(data.getSelectedLesson().getMemberName());
            request.setAttribute("client", client);
        }
        request.setAttribute("notifications", data.getNotifications());
        request.setAttribute("hasSelectedLesson", data.getSelectedLesson() != null);
        request.getRequestDispatcher("/WEB-INF/dashboard.jsp").forward(request, response);
    }

//    Helper Functions
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

}

