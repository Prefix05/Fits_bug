package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.gym.GymTrainerApproveService;
import service.gym.GymTrainerApproveServiceImpl;

/**
 * Servlet implementation class GymTrainerApprove
 */
@WebServlet("/gym/trainerApprove")
public class GymTrainerApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymTrainerApprove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GymTrainerApproveService service = new GymTrainerApproveServiceImpl();
		
		try {
            int trainerId = Integer.parseInt(request.getParameter("trainerId"));

//            service.approveTrainer(trainerId);

            response.sendRedirect(request.getContextPath() + "/gym/trainer");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/gym/trainerPending");
        }
	}

}
