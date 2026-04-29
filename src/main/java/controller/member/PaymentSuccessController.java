package controller.member;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.member.MemberDTO;
import service.member.PaymentService;
import service.member.PaymentServiceImpl;

@WebServlet("/paymentSuccess")
public class PaymentSuccessController extends HttpServlet {

    private PaymentService service = new PaymentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        resp.setContentType("text/html;charset=UTF-8");

        // 1. orderId 체크
        String orderId = req.getParameter("orderId");

        if(orderId == null || orderId.trim().isEmpty()){
            resp.getWriter().write("잘못된 접근입니다 (orderId 없음)");
            return;
        }

        // 2. 로그인 체크
        HttpSession session = req.getSession(false);
        if(session == null){
            resp.sendRedirect("login.jsp");
            return;
        }

        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");

        if(user == null){
            resp.sendRedirect("login.jsp");
            return;
        }

        // 3. 결제 성공 처리 (DB + 예약 + 알림)
        try {
            service.success(orderId, user.getEmail());

            // 4. 성공 페이지로 이동
            resp.sendRedirect("main.jsp");

        } catch(Exception e){
            e.printStackTrace();

            // 실패 처리
            resp.getWriter().write("결제 처리 중 오류 발생");
        }
    }
}