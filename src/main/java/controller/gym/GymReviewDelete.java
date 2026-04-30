package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.gym.Review;
import service.gym.GymReviewService;
import service.gym.GymReviewServiceImpl;

/**
 * Servlet implementation class GymReviewDelete
 */
@WebServlet("/review/delete")
public class GymReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymReviewDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("loginUser")==null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
		
		try {
			int loginUserId = (Integer)session.getAttribute("loginUserId");
			
			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			
			GymReviewService service = new GymReviewServiceImpl();
			Review origin = service.getReview(reviewNum);
			int gymId = origin.getGymId();
			
			service.deleteReview(reviewNum, loginUserId);
			
			response.sendRedirect(request.getContextPath() + "/main?gymId=" + gymId);
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException("리뷰 삭제 중 오류", e);
		}
	}

}
