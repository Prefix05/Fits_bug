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
 * Servlet implementation class GymReviewUpdate
 */
@WebServlet("/review/update")
public class GymReviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymReviewUpdate() {
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
			
			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			int star = Integer.parseInt(request.getParameter("star"));
			String comment = request.getParameter("comment");
			
			GymReviewService service = new GymReviewServiceImpl();
			Review origin = service.getReview(reviewNum);
			
			Review review = new Review();
			review.setReviewNum(reviewNum);
			review.setClientId(loginUserId);
			review.setStar(star);
			review.setComment(comment);
			review.setFile(origin.getFile());
			
			
			service.updateReview(review, loginUserId);
			
			response.sendRedirect(request.getContextPath() + "/main?gymId=" + origin.getGymId());
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException("리뷰 수정 중 오류", e);
		}
	}

}
