package controller.member;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dao.member.UserDAO;
import dao.member.UserDAOImpl;
import dto.member.MemberDTO;
import dto.member.UserDTO;

@WebServlet("/member/step3")
public class Step3Controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    // step3.jsp 보여주기
	    RequestDispatcher rd = request.getRequestDispatcher("/member/step3.jsp");
	    rd.forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        // ── Step1 세션 데이터 ─────────────────────────────────
        String email    = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String nickname = (String) session.getAttribute("nickname");
        String name     = (String) session.getAttribute("name");
        String phone    = (String) session.getAttribute("phone");

        // ── Step2 세션 데이터 ─────────────────────────────────
        String heightStr = (String) session.getAttribute("height");
        String weightStr = (String) session.getAttribute("weight");
        String diet      = (String) session.getAttribute("diet");

        // ── Step3 파라미터 ────────────────────────────────────
        String purpose       = request.getParameter("goal");       // ENUM('diet','balance','bulk-up')
        String experience    = request.getParameter("level");      // 운동 수준
        String frequency     = request.getParameter("workout");    // 운동 빈도
        String exerciseCntGoal = request.getParameter("exerciseCntGoal"); // <=2 / 3~4 / >5

        int height = 0, weight = 0;
        try { height = Integer.parseInt(heightStr); } catch (Exception ignored) {}
        try { weight = Integer.parseInt(weightStr); } catch (Exception ignored) {}

        // ── 1단계: USER 테이블 INSERT ─────────────────────────
        UserDTO user = new UserDTO();
        user.setEmail(email);
        user.setPassword(password);
        user.setNickname(nickname);
        user.setName(name);
        user.setPhone(phone);
        user.setEmailVerified(true);
        user.setRole("MEMBER");

        UserDAO userDao = new UserDAOImpl();
        userDao.insert(user);

        // ── 방금 INSERT 된 USER.id 조회 ──────────────────────
        UserDTO inserted = userDao.findByEmail(email);
        int userId = (inserted != null) ? inserted.getId() : 0;

        // ── 2단계: MEMBER 테이블 INSERT ───────────────────────
        /*
         * ✅ WorkoutPlanDAO 완전 제거
         *    MEMBER 테이블이 height/weight/diet/goals/experience 모두 포함
         *    → 단 한 번의 INSERT 로 모든 정보 저장
         */
        MemberDTO member = new MemberDTO();
        member.setUserId(userId);
        member.setPurpose(purpose);             // diet / balance / bulk-up
        member.setExperience(experience);       // first(0) / beginner(<1) / ...
        member.setHeight(height);              // ✅ WorkoutPlan 통합
        member.setWeight(weight);              // ✅ WorkoutPlan 통합
        member.setDiet(diet);                  // ✅ WorkoutPlan 통합
        member.setGoals(purpose);              // goals 는 purpose 와 동일로 초기화
        member.setFrequency(frequency);        // 화면 표시용 (level 필드에 매핑)
        member.setLevel(experience);           // level 은 experience 별칭
        if (exerciseCntGoal != null) {
            member.setExerciseCountGoal(exerciseCntGoal);
        }
        member.setStatus("active");

        MemberDAO memberDao = new MemberDAOImpl();
        memberDao.insertMember(member);

        // ── 세션 정리 ─────────────────────────────────────────
        for (String key : new String[]{
                "username","password","nickname","name","phone",
                "role","height","weight","diet",
                "authCode","authTime","authEmail"}) {
            session.removeAttribute(key);
        }

        // ── 로그인 세션 저장 ──────────────────────────────────
        if (inserted != null) {
            session.setAttribute("loginUser",  inserted);
            session.setAttribute("loginEmail", email);
            // memberInfo 세션에 MEMBER 전체 정보 저장 (MainController 캐싱)
            member.setEmail(email);
            member.setNickname(nickname);
            session.setAttribute("memberInfo", member);
        }

        response.sendRedirect(request.getContextPath() + "/member/main");
    }
}
