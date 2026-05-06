package controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.PaymentDTO;
import dto.member.TrainerDTO;
import dto.member.UserDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

@WebServlet("/member/paymentSuccess")
public class PaymentSuccessController extends HttpServlet {

    private static final double FEE_RATE = 0.20;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // ── 1. Session check ─────────────────────────────────────────────
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            // Not logged in — store the success params so we can resume after login
            resp.sendRedirect(req.getContextPath() + "/member/login");
            return;
        }

        // ── 2. Parse Toss params ──────────────────────────────────────────
        String orderId   = req.getParameter("orderId");
        String amountStr = req.getParameter("amount");

        if (orderId == null || !orderId.startsWith("PT-")) {
            resp.sendRedirect(req.getContextPath() + "/member/main");
            return;
        }

        // orderId format: PT-{trainerId}-{sessionCount}-{timestamp}
        String[] parts = orderId.split("-");
        if (parts.length < 4) {
            req.setAttribute("errorMsg", "잘못된 주문 ID 형식입니다: " + orderId);
            req.getRequestDispatcher("/member/paymentSuccess.jsp").forward(req, resp);
            return;
        }

        int trainerId;
        int sessionCount;
        double amount;
        try {
            trainerId    = Integer.parseInt(parts[1]);
            sessionCount = Integer.parseInt(parts[2]);
            amount       = Double.parseDouble(amountStr != null ? amountStr : "0");
        } catch (NumberFormatException e) {
            req.setAttribute("errorMsg", "결제 금액 파싱 오류: " + e.getMessage());
            req.getRequestDispatcher("/member/paymentSuccess.jsp").forward(req, resp);
            return;
        }

        UserDTO user    = (UserDTO) session.getAttribute("loginUser");
        int    userId   = user.getId();
        String userName = user.getName() != null ? user.getName() : user.getNickname();
        double fee      = Math.round(amount * FEE_RATE * 100.0) / 100.0;

        // ── 3. Save to DB ─────────────────────────────────────────────────
        TrainerDTO trainer = null;
        try (SqlSession sql = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {

            trainer = sql.selectOne("mapper.TrainerMapper.findById", trainerId);

            PaymentDTO payment = new PaymentDTO();
            payment.setUserId(userId);
            payment.setUserName(userName);
            payment.setTrainerId(trainerId);
            payment.setPaymentPrice(amount);
            payment.setPaymentFee(fee);
            payment.setMethod("카드");
            payment.setStatus("결제완료");
            payment.setPaymentType("PT");

            sql.insert("mapper.PaymentMapper.insert", payment);

            Map<String, Object> memberUpdate = new HashMap<>();
            memberUpdate.put("userId",      userId);
            memberUpdate.put("trainerId",   trainerId);
            memberUpdate.put("sessionCount", sessionCount);
            sql.update("mapper.MemberMapper.updateTrainerAndLessons", memberUpdate);

            sql.commit();

        } catch (Exception e) {
            e.printStackTrace();
            // Surface the real error so it's visible during development
            req.setAttribute("errorMsg", "DB 저장 오류: " + e.getMessage());
            req.setAttribute("trainerName",  trainer != null ? trainer.getName() : "트레이너");
            req.setAttribute("sessionCount", sessionCount);
            req.setAttribute("amount",       (long) amount);
            req.setAttribute("fee",          (long) fee);
            req.getRequestDispatcher("/member/paymentSuccess.jsp").forward(req, resp);
            return;
        }

        // ── 4. Forward to success page ────────────────────────────────────
        req.setAttribute("trainerName",  trainer != null ? trainer.getName() : "트레이너");
        req.setAttribute("sessionCount", sessionCount);
        req.setAttribute("amount",       (long) amount);
        req.setAttribute("fee",          (long) fee);
        req.getRequestDispatcher("/member/paymentSuccess.jsp").forward(req, resp);
    }
}
