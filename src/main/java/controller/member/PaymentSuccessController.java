package controller.member;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.UserDTO;
import service.member.PaymentService;
import service.member.PaymentServiceImpl;

@WebServlet("/member/paymentSuccess")
public class PaymentSuccessController extends HttpServlet {

    private PaymentService service = new PaymentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        resp.setContentType("text/html;charset=UTF-8");

        String orderId = req.getParameter("orderId");

        if (orderId == null || orderId.trim().isEmpty()) {
            resp.getWriter().write("잘못된 접근입니다 (orderId 없음)");
            return;
        }

        HttpSession session = req.getSession(false);
        if (session == null) {
            // ✅ .jsp 직접 참조 제거 → 컨트롤러 경로
            resp.sendRedirect(req.getContextPath() + "/member/login");
            return;
        }

        // ✅ MemberDTO → UserDTO
        UserDTO user = (UserDTO) session.getAttribute("loginUser");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/member/login");
            return;
        }

        try {
            service.success(orderId, user.getEmail());
            // ✅ /member/main.jsp → /member/main 컨트롤러 경로
            resp.sendRedirect(req.getContextPath() + "/member/main");

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("결제 처리 중 오류 발생");
        }
    }
}
