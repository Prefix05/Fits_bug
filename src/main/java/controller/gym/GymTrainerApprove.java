package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.gym.GymTrainerApproveService;
import service.gym.GymTrainerApproveServiceImpl;

@WebServlet("/gym/trainerApprove")
public class GymTrainerApprove extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GymTrainerApprove() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("gymId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            int trainerId = Integer.parseInt(request.getParameter("trainerId"));

            GymTrainerApproveService service = new GymTrainerApproveServiceImpl();
            service.approveTrainer(trainerId);

            response.sendRedirect(request.getContextPath() + "/gym/trainer");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/gym/trainerPending");
        }
    }
}