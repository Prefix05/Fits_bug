package controller.gym;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.gym.Gym;
import dto.gym.GymTrainerView;
import dto.gym.HotTime;
import dto.gym.Membership;
import dto.gym.Review;
import dto.gym.Schedule;
import service.gym.GymMainService;
import service.gym.GymMainServiceImpl;
import service.gym.GymReviewService;
import service.gym.GymReviewServiceImpl;

/**
 * Servlet implementation class GymMain
 */
@WebServlet("/gym/main")
public class GymMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GymMain() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {

			String gymIdStr = request.getParameter("gymId");

	        if (gymIdStr == null) {
	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "gymId 없음");
	            return;
	        }

	        int gymId = Integer.parseInt(gymIdStr);

			GymMainService service = new GymMainServiceImpl();
			GymReviewService reviewService = new GymReviewServiceImpl();

			Gym gym = service.getGymMainInfo(gymId);
			List<Review> reviewList = service.getReviewList(gymId);
			List<Membership> membershipList = service.getMembershipList(gymId);
			Schedule schedule = service.getSchedule(gymId);
			List<GymTrainerView> trainerList = service.getGymTrainerViewList(gymId);
			HotTime todayHotTime = service.getTodayHotTime(gymId);

			List<Review> allReviewList = reviewService.getReviewListByGymId(gymId);

			request.setAttribute("gym", gym);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("membershipList", membershipList);
			request.setAttribute("schedule", schedule);
			request.setAttribute("trainerList", trainerList);
			request.setAttribute("trainerCount", trainerList == null ? 0 : trainerList.size());
			request.setAttribute("todayHotTime", todayHotTime);
			request.setAttribute("allReviewList", allReviewList);

			request.getRequestDispatcher("/gym/gym_main.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("메인페이지 로딩 오류", e);
		}
	}

}
