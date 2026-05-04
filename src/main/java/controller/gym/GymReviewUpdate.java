package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.gym.Review;
import service.gym.GymReviewService;
import service.gym.GymReviewServiceImpl;

@WebServlet("/gym/reviewUpdate")
public class GymReviewUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GymReviewUpdate() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            int loginUserId = (Integer) session.getAttribute("userId");

            int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
            int star = Integer.parseInt(request.getParameter("star"));
            String comment = request.getParameter("comment");

            GymReviewService service = new GymReviewServiceImpl();

            Review review = new Review();
            review.setReviewNum(reviewNum);
            review.setClientId(loginUserId);
            review.setRating((double)star);
            review.setComment(comment);

            service.updateReview(review, loginUserId);

            response.sendRedirect(request.getContextPath() + "/gym/main");

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("리뷰 수정 중 오류", e);
        }
    }
}