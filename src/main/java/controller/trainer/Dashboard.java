package controller.trainer;

import dao.trainer.ClientDAOImpl;
import dto.trainer.ClientDTO;
import service.trainer.DashboardData;
import service.trainer.DashboardService;
import service.trainer.DashboardServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/dashboard")
public class Dashboard extends HttpServlet {

    private final DashboardService dashboardService = new DashboardServiceImpl();
    private final ClientDAOImpl clientDAO = new ClientDAOImpl();

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
        request.getRequestDispatcher("/trainer/dashboard.jsp").forward(request, response);
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

