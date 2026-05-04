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
import dao.member.WorkoutPlanDAO;
import dao.member.WorkoutPlanDAOImpl;
import dto.member.MemberDTO;
import dto.member.WorkoutPlanDTO;

@WebServlet("/member/step3")
public class Step3Controller extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        // ── step1 데이터 (session) ──
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String nickname = (String) session.getAttribute("nickname");
        String name     = (String) session.getAttribute("name");
        String phone    = (String) session.getAttribute("phone");

        // ── step2 데이터 (session or request) ──
        // Step2Controller 에서 세션에 저장한 값 우선, 없으면 request 파라미터
        String height = session.getAttribute("height") != null
                ? (String) session.getAttribute("height")
                : request.getParameter("height");
        String weight = session.getAttribute("weight") != null
                ? (String) session.getAttribute("weight")
                : request.getParameter("weight");
        String diet   = session.getAttribute("diet") != null
                ? (String) session.getAttribute("diet")
                : request.getParameter("diet");

        // ── step3 데이터 ──
        String goal      = request.getParameter("goal");      // 운동 목표 (step3.jsp)
        String level     = request.getParameter("level");     // 운동 레벨
        String frequency = request.getParameter("workout");   // 주간 운동 횟수

        // ── null 방어 ──
        int h = 0, w = 0;
        try { h = Integer.parseInt(height); } catch (Exception ignored) {}
        try { w = Integer.parseInt(weight); } catch (Exception ignored) {}

        // ── MemberDTO 구성 ──
        MemberDTO user = new MemberDTO();
        user.setEmail(username);
        user.setPassword(password);
        user.setNickname(nickname);
        user.setPhone(phone);
        user.setEmailVerified(true);   // 이메일 인증 완료 후 가입이므로 true

        // ── WorkoutPlanDTO 구성 ──
        WorkoutPlanDTO plan = new WorkoutPlanDTO();
        plan.setEmail(username);
        plan.setGoal(goal);
        plan.setLevel(level);
        plan.setHeight(h);
        plan.setWeight(w);
        plan.setDiet(diet);
        plan.setFrequency(frequency);

        // ── DB 저장 ──
        MemberDAO memberDao = new MemberDAOImpl();
        memberDao.insertMember(user);

        WorkoutPlanDAO planDao = new WorkoutPlanDAOImpl();
        planDao.savePlan(plan);

        // ── 세션 정리 (회원가입용 임시 데이터 제거) ──
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

        // ── 로그인 처리 ──
        session.setAttribute("loginUser", user);

        // ✅ /main 컨트롤러로 리다이렉트 (URL: localhost:8080/Fitsbug/main)
        response.sendRedirect(request.getContextPath() + "/main");
    }
}
