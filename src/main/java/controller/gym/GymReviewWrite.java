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
 * Servlet implementation class GymReviewWrite
 */
@WebServlet("/review/write")
public class GymReviewWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymReviewWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("loginUser")==null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
		
		try {
			int loginUserId = (Integer)session.getAttribute("loginUserId");
			
			int gymId = Integer.parseInt(request.getParameter("gymId"));
			int star = Integer.parseInt(request.getParameter("star"));
			String comment = request.getParameter("comment");
			
			Review review = new Review();
			review.setGymId(gymId);
			review.setClientId(loginUserId);
			review.setStar(star);
			review.setComment(comment);
			
			GymReviewService service = new GymReviewServiceImpl();
			service.writeReview(review);
			
			response.sendRedirect(request.getContextPath() + "main?gymId=" + gymId);
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException("리뷰 작성 중 오류", e);
		}
	}

}
