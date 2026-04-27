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

import dto.admin.Member;
import dto.gym.Membership;
import dto.gym.MembershipRegistration;
import dto.gym.Payment;
import service.gym.GymPaymentService;
import service.gym.GymPaymentServiceImpl;

/**
 * Servlet implementation class GymPayment
 */
@WebServlet("/gym/payment")
public class GymPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public GymPayment() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GymPaymentService paymentService = new GymPaymentServiceImpl();
		
		request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

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
        mr.setMemberNum(loginUser.getMemberNum());// 추후 수정 필요@@@@
        mr.setMembershipNum(membershipNum);
        mr.setStartDate(Date.valueOf(startLocalDate));
        mr.setEndDate(Date.valueOf(endLocalDate));
        mr.setStatus("active");

        Payment payment = new Payment();
        payment.setUserNum(loginUser.getMemberNum());// 추후 수정 필요@@@@
        payment.setMembershipNum(membershipNum);
        payment.setPaymentPrice(BigDecimal.valueOf(membership.getPrice()));
        payment.setPaymentFee(BigDecimal.ZERO);
        payment.setMethod("CARD");
        payment.setStatus("paid");

        paymentService.registerMembershipAndPayment(mr, payment);

        response.sendRedirect(request.getContextPath() + "/payment/success");
	}

}
