package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dao.member.UserDAO;
import dao.member.UserDAOImpl;
import dto.member.MemberDTO;
import dto.member.UserDTO;

@WebServlet("/member/step3")
public class Step3Controller extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        // ── step1 세션 데이터 ──────────────────────────────────────
        String email    = (String) session.getAttribute("username");  // 이메일
        String password = (String) session.getAttribute("password");
        String nickname = (String) session.getAttribute("nickname");
        String name     = (String) session.getAttribute("name");
        String phone    = (String) session.getAttribute("phone");     // phone (tel 아님)

        // ── step2 세션 데이터 ──────────────────────────────────────
        String heightStr = (String) session.getAttribute("height");
        String weightStr = (String) session.getAttribute("weight");
        String diet      = (String) session.getAttribute("diet");

        // ── step3 파라미터 ─────────────────────────────────────────
        String purpose   = request.getParameter("goal");    // 운동 목표
        String level     = request.getParameter("level");   // 운동 레벨
        String frequency = request.getParameter("workout"); // 주간 운동 횟수

        // ── null 방어 ───────────────────────────────────────────────
        int height = 0, weight = 0;
        try { height = Integer.parseInt(heightStr); } catch (Exception ignored) {}
        try { weight = Integer.parseInt(weightStr); } catch (Exception ignored) {}

        // ── Step1: USER 테이블 INSERT ──────────────────────────────
        UserDTO user = new UserDTO();
        user.setEmail(email);
        user.setPassword(password);
        user.setNickname(nickname);
        user.setName(name);
        user.setPhone(phone);           // phone 필드 (tel 아님)
        user.setEmailVerified(true);    // 이메일 인증 완료
        user.setRole("MEMBER");

        UserDAO userDao = new UserDAOImpl();
        userDao.insert(user);

        // ── 방금 INSERT한 USER의 id 조회 (MEMBER FK용) ─────────────
        UserDTO insertedUser = userDao.findByEmail(email);
        int userId = (insertedUser != null) ? insertedUser.getId() : 0;

        // ── Step2: MEMBER 테이블 INSERT ────────────────────────────
        MemberDTO member = new MemberDTO();
        member.setUserId(userId);
        member.setHeight(height);
        member.setWeight(weight);
        member.setDiet(diet);
        member.setPurpose(purpose);
        member.setStatus("active");

        MemberDAO memberDao = new MemberDAOImpl();
        memberDao.insertMember(member);

        // ── 세션 정리 ───────────────────────────────────────────────
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.removeAttribute("nickname");
        session.removeAttribute("name");
        session.removeAttribute("phone");
        session.removeAttribute("role");
        session.removeAttribute("height");
        session.removeAttribute("weight");
        session.removeAttribute("diet");
        session.removeAttribute("authCode");
        session.removeAttribute("authTime");
        session.removeAttribute("authEmail");

        // ── 로그인 세션 저장 (UserDTO 기준) ────────────────────────
        if (insertedUser != null) {
            session.setAttribute("loginUser",  insertedUser);
            session.setAttribute("loginEmail", email);
        }

        response.sendRedirect(request.getContextPath() + "/member/main");
    }
}
