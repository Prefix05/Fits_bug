package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.MemberDTO;
import dao.MemberDAO;
import dao.MemberDAOImpl;
import util.KakaoUtil;

@WebServlet("/kakaoLogin")
public class KakaoLoginController extends HttpServlet {

    private MemberDAO dao = new MemberDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String code = request.getParameter("code");

        // 1. accessToken 받기
        String accessToken = KakaoUtil.getAccessToken(code);

        // 2. 이메일 가져오기
        String email = KakaoUtil.getUserEmail(accessToken);

        if (email == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 3. 기존 회원 확인
        MemberDTO user = dao.findByEmail(email);

        // 4. 없으면 자동 회원가입
        if (user == null) {
            user = new MemberDTO();
            user.setEmail(email);
            user.setNickname("카카오회원");
            user.setEmailVerified(true);
            user.setSocialType("KAKAO");

            dao.insertKakaoUser(user);
        }

        // 5. 세션 저장
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", user);

        response.sendRedirect("mypage");
    }
}