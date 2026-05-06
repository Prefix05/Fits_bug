package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.UserDTO;
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

        try {
    		HttpSession session = request.getSession();
    		UserDTO user = (UserDTO)session.getAttribute("loginUser");
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/member/login");
                return;
            }
            

            Integer gymId = user.getOtherId();        	
            int trainerId = Integer.parseInt(request.getParameter("trainerId"));
            System.out.println(gymId);
            System.out.println(trainerId);

            GymTrainerApproveService service = new GymTrainerApproveServiceImpl();
            service.approveTrainer(trainerId, gymId);

            response.sendRedirect(request.getContextPath() + "/gym/trainer");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/gym/trainerPending");
        }
    }
}