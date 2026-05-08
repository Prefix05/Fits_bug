package controller.member;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dto.member.MemberDTO;
import dto.member.MembershipRegistrationDTO;
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

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/member/login");
            return;
        }


        String orderId   = req.getParameter("orderId");
        String amountStr = req.getParameter("amount");

        if (orderId == null || !orderId.startsWith("PT-")) {
            resp.sendRedirect(req.getContextPath() + "/member/main");
            return;
        }

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


        TrainerDTO trainer = null;
        try (SqlSession sql = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {

            // MEMBER.id 조회
            MemberDTO memberDto = sql.selectOne("mapper.MemberMapper.findByUserId", userId);
            if (memberDto == null) {
                req.setAttribute("errorMsg", "회원 정보를 찾을 수 없습니다.");
                req.getRequestDispatcher("/member/paymentSuccess.jsp").forward(req, resp);
                return;
            }
            int memberId = memberDto.getId();

            trainer = sql.selectOne("mapper.TrainerMapper.findById", trainerId);

            MembershipRegistrationDTO mpDto = new MembershipRegistrationDTO();
            mpDto.setMemberId(memberId);
            mpDto.setTrainerId(trainerId);
            mpDto.setRegisterDate(LocalDate.now().toString());
            mpDto.setStartDate(LocalDate.now().toString());
            mpDto.setEndDate(LocalDate.now().plusMonths(3).toString()); // 기본 3개월
            mpDto.setStatus("active");
            mpDto.setLessonCount(sessionCount);
            sql.insert("mapper.MembershipMapper.insertRegistration", mpDto);


            PaymentDTO payment = new PaymentDTO();
            payment.setUserId(userId);
            payment.setUserName(userName);
            payment.setTrainerId(trainerId);
            payment.setMpId(mpDto.getId());  // mp_id 설정
            payment.setPaymentPrice(amount);
            payment.setPaymentFee(fee);
            payment.setMethod("카드");
            payment.setStatus("결제완료");
            payment.setPaymentType("PT");
            sql.insert("mapper.PaymentMapper.insert", payment);

            Map<String, Object> ptParams = new HashMap<>();
            ptParams.put("memberId",     memberId);
            ptParams.put("trainerId",    trainerId);
            ptParams.put("sessionCount", sessionCount);

            int existing = sql.selectOne("mapper.MemberMapper.findMembershipPtByMemberAndTrainer", ptParams);
            if (existing > 0) {
                sql.update("mapper.MemberMapper.updateMembershipPtLessons", ptParams);
            } else {
                sql.insert("mapper.MemberMapper.insertMembershipPt", ptParams);
            }

            sql.commit();

            MemberDAO memberDao = new MemberDAOImpl();
            Map<String,Object> freshMember = memberDao.findByEmail(user.getEmail());
            if (freshMember != null) {
                session.setAttribute("memberInfo", freshMember);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "DB 저장 오류: " + e.getMessage());
            req.setAttribute("trainerName",  trainer != null ? trainer.getName() : "트레이너");
            req.setAttribute("sessionCount", sessionCount);
            req.setAttribute("amount",       (long) amount);
            req.setAttribute("fee",          (long) fee);
            req.getRequestDispatcher("/member/paymentSuccess.jsp").forward(req, resp);
            return;
        }

        req.setAttribute("trainerName",  trainer != null ? trainer.getName() : "트레이너");
        req.setAttribute("sessionCount", sessionCount);
        req.setAttribute("amount",       (long) amount);
        req.setAttribute("fee",          (long) fee);
        req.getRequestDispatcher("/member/paymentSuccess.jsp").forward(req, resp);
    }
}
