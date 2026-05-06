package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.gym.Review;
import service.gym.GymReviewService;
import service.gym.GymReviewServiceImpl;

@WebServlet("/gym/reviewDelete")
public class GymReviewDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GymReviewDelete() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loginUser") == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/member/login");
            return;
        }

        String reviewNumStr = request.getParameter("reviewNum");

        if (reviewNumStr == null || reviewNumStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        try {
            int loginUserId = (Integer) session.getAttribute("userId");
            int reviewNum = Integer.parseInt(reviewNumStr);

            GymReviewService service = new GymReviewServiceImpl();

            Review origin = service.getReview(reviewNum);

            if (origin == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            service.deleteReview(reviewNum, loginUserId);

            response.sendRedirect(request.getContextPath() + "/gym/main?gymId=" + origin.getGymId());

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("리뷰 삭제 중 오류", e);
        }
    }
}