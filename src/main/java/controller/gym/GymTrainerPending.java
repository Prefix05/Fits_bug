package controller.gym;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.gym.TrainerApprove;
import service.gym.GymTrainerApproveService;
import service.gym.GymTrainerApproveServiceImpl;

@WebServlet("/gym/trainerPending")
public class GymTrainerPending extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GymTrainerPending() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("loginUser") == null || session.getAttribute("gymId") == null) {
                response.sendRedirect(request.getContextPath() + "/member/login");
                return;
            }

            int gymId = (int) session.getAttribute("gymId");

            GymTrainerApproveService service = new GymTrainerApproveServiceImpl();

            List<TrainerApprove> trainerList = service.selectPendingTrainerList(gymId);

            request.setAttribute("trainerList", trainerList);

            request.getRequestDispatcher("/gym/gym_trainerApprove.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("승인 대기 트레이너 조회 중 오류", e);
        }
    }
}