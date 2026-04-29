package controller.gym;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.gym.TrainerApprove;

/**
 * Servlet implementation class GymTrainerPending
 */
@WebServlet("/gym/trainerPending")
public class GymTrainerPending extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymTrainerPending() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		GymTrainerApproveService service = new GymTrainerApproveServiceImpl();
		
		try {
//            HttpSession session = request.getSession();
//            int gymId = (int) session.getAttribute("gymId"); // 로그인 시 넣어둔 값
//
//            List<TrainerApprove> trainerList = service.selectPendingTrainerList(gymId);
			//더미 데이터
			List<TrainerApprove> trainerList = new ArrayList<>();
			trainerList.add(new TrainerApprove(1, "강태호", "010-1111-1111", "trainer1.jpg", "PENDING"));
	        trainerList.add(new TrainerApprove(2, "이민서", "010-2222-2222", "trainer2.jpg", "PENDING"));
	        trainerList.add(new TrainerApprove(3, "박준영", "010-3333-3333", "trainer3.jpg", "PENDING"));
	        //더미 데이터

            request.setAttribute("trainerList", trainerList);

            request.getRequestDispatcher("/gym/gym_trainerApprove.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/gym/trainerPending");
        }
		
	}

}
