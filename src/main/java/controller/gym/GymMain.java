package controller.gym;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.gym.Gym;
import dto.gym.GymNotice;
import dto.gym.GymTrainerView;
import dto.gym.Membership;
import dto.gym.Review;
import dto.gym.Schedule;
import service.gym.GymService;
import service.gym.GymServiceImpl;

/**
 * Servlet implementation class Main
 */
@WebServlet("/main")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GymService service = new GymServiceImpl();
		try {
			int gymId = Integer.parseInt(request.getParameter("gymId"));
			
			Gym gym = service.getGymMainInfo(gymId);
			List<GymNotice> noticeList = service.getNoticeList(gymId);
			List<Review> reviewList = service.getReviewList(gymId);
			List<Membership> membershipList = service.getMembershipList(gymId);
			Schedule schedule = service.getSchedule(gymId);
			List<GymTrainerView> trainerList = service.getGymTrainerViewList(gymId);
			
			request.setAttribute("gym", gym);
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("membershipList", membershipList);
			request.setAttribute("schedule", schedule);
			request.setAttribute("trainerList", trainerList);
			request.setAttribute("trainerCount", trainerList.size());
			
			request.getRequestDispatcher("COMMON/gym_main.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException();
		}
		
	}

}
