package controller.gym;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;
import service.gym.GymPaymentService;
import service.gym.GymPaymentServiceImpl;

@WebServlet("/gym/payment/*")
public class GymPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GymPayment() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        GymPaymentService paymentService = new GymPaymentServiceImpl();
        HttpSession session = request.getSession();

        String path = request.getPathInfo();

        if ("/complete".equals(path)) {

            String impUid = request.getParameter("imp_uid");
            String merchantUid = request.getParameter("merchant_uid");
            int membershipNum = Integer.parseInt(request.getParameter("membershipId"));
            String startDateStr = request.getParameter("startDate");

            Membership membership = paymentService.getMembership(membershipNum);

            if (membership == null) {
                response.sendRedirect(request.getContextPath() + "/gym/main");
                return;
            }

            LocalDate startLocalDate = LocalDate.parse(startDateStr, DateTimeFormatter.ISO_DATE);
            LocalDate endLocalDate;

            if ("day".equals(membership.getType())) {
                endLocalDate = startLocalDate.plusDays(membership.getTypeRep());
            } else if ("month".equals(membership.getType())) {
                endLocalDate = startLocalDate.plusMonths(membership.getTypeRep());
            } else {
                throw new ServletException("알 수 없는 멤버십 타입입니다: " + membership.getType());
            }

            MembershipRegistration mr = new MembershipRegistration();

            // 로그인 연결 전 임시 이메일
            mr.setMemberEmail("test@test.com");

            mr.setMembershipNum(membershipNum);
            mr.setStartDate(Date.valueOf(startLocalDate));
            mr.setEndDate(Date.valueOf(endLocalDate));
            mr.setStatus("active");

            Payment payment = new Payment();

            // 로그인 연결 전 임시 이메일
            payment.setUserEmail("test@test.com");

            payment.setMembershipNum(membershipNum);
            payment.setPaymentPrice(BigDecimal.valueOf(membership.getPrice()));
            payment.setPaymentFee(BigDecimal.ZERO);
            payment.setMethod("PORTONE");
            payment.setStatus("paid");

            // DB 연결 안 될 때는 주석 유지
             paymentService.registerMembershipAndPayment(mr, payment);

            System.out.println("impUid = " + impUid);
            System.out.println("merchantUid = " + merchantUid);
            System.out.println("membershipNum = " + membershipNum);
            System.out.println("startDate = " + startDateStr);

            response.sendRedirect(request.getContextPath() + "/success.jsp");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/gym/main");
    }
}