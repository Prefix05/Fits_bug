package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.gym.GymPaymentService;
import service.gym.GymPaymentServiceImpl;

@WebServlet("/gym/paymentCancelApprove")
public class GymPaymentCancelApprove extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GymPaymentCancelApprove() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain; charset=UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("gymId") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("login_required");
            return;
        }

        String paymentNumStr = request.getParameter("paymentNum");

        if (paymentNumStr == null || paymentNumStr.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("invalid_payment");
            return;
        }

        try {
            int paymentNum = Integer.parseInt(paymentNumStr);

            GymPaymentService service = new GymPaymentServiceImpl();
            service.approveCancel(paymentNum);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("success");

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("invalid_payment");

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("fail");
        }
    }
}