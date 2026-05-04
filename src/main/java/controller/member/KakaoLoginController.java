package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.UserDAO;
import dao.member.UserDAOImpl;
import dto.member.UserDTO;
import util.KakaoUtil;

@WebServlet("/member/kakaoLogin")
public class KakaoLoginController extends HttpServlet {

    private UserDAO userDao = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String code = request.getParameter("code");

        // 1. 인가코드 → AccessToken
        String accessToken = KakaoUtil.getAccessToken(code);

        // 2. AccessToken → 이메일
        String email = KakaoUtil.getUserEmail(accessToken);

        if (email == null) {
            request.setAttribute("errorMsg", "카카오 로그인 중 오류가 발생했습니다.");
            response.sendRedirect(request.getContextPath() + "/member/login");
            return;
        }

        // 3. 기존 USER 확인
        UserDTO user = userDao.findByEmail(email);

        // 4. 없으면 자동 회원가입 (USER 테이블 INSERT)
        if (user == null) {
            user = new UserDTO();
            user.setEmail(email);
            user.setNickname("카카오회원_" + System.currentTimeMillis() % 10000);
            user.setEmailVerified(true);
            user.setRole("MEMBER");
            user.setProvider("kakao");   // ENUM('kakao','naver')
            // provider_id는 KakaoUtil에서 추가 조회 가능

            userDao.insertSocial(user);

            // INSERT 후 재조회
            user = userDao.findByEmail(email);
        }

        // 5. 탈퇴 회원 체크
        if (user.isDeleted()) {
            request.setAttribute("errorMsg", "탈퇴한 계정입니다.");
            response.sendRedirect(request.getContextPath() + "/member/login");
            return;
        }

        // 6. 세션 저장
        HttpSession session = request.getSession();
        session.setAttribute("loginUser",  user);
        session.setAttribute("loginEmail", email);

        response.sendRedirect(request.getContextPath() + "/member/main");
    }
}
