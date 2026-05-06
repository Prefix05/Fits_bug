package controller.member;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dto.member.MemberDTO;
import dto.member.MyPageDTO;
import dto.member.UserDTO;
import service.member.MyPageService;
import service.member.MyPageServiceImpl;

@WebServlet("/member/mypage")
public class MyPageController extends HttpServlet {

    private MyPageService service = new MyPageServiceImpl();

    /** 마이페이지 조회 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/member/login");
            return;
        }

        String tab = request.getParameter("tab");
        request.setAttribute("tab", tab);

        // ── DB 통합 조회 ──────────────────────────────────────
        // ✅ WorkoutPlanDTO 없음 → MyPageDTO.getMember() 에 모든 정보 포함
        MyPageDTO dto = service.getMyPage(loginUser.getEmail());

        // ── null 방어 ─────────────────────────────────────────
        if (dto == null || dto.getMember() == null) {
            dto = new MyPageDTO();
            MemberDTO fallback = new MemberDTO();
            fallback.setEmail(loginUser.getEmail());
            fallback.setNickname(loginUser.getNickname());
            fallback.setProfile_image(loginUser.getProfile_image());
            fallback.setRole(loginUser.getRole());
            dto.setMember(fallback);
        }

        // ── request attribute 세팅 ───────────────────────────
        MemberDTO member = dto.getMember();
        request.setAttribute("member", member);   // mypage.jsp 에서 member 로 접근
        request.setAttribute("user",   member);   // 이전 코드 호환 (user 로도 접근)

        request.getRequestDispatcher("/member/mypage.jsp").forward(request, response);
    }

    /** 마이페이지 수정 (AJAX) */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String email = loginUser.getEmail();

        // ── 1. UserDTO (닉네임, 전화번호) ─────────────────────
        UserDTO user = new UserDTO();
        user.setId(loginUser.getId());
        user.setNickname(request.getParameter("nickname"));
        user.setPhone(request.getParameter("phone"));

        // ── 2. MemberDTO (운동 계획 통합) ─────────────────────
        // ✅ WorkoutPlanDTO 완전 제거 → MemberDTO 에서 처리
        MemberDTO member = new MemberDTO();
        member.setEmail(email);  // WHERE 조건용
        member.setGoals(request.getParameter("goal"));
        member.setExperience(request.getParameter("level"));
        member.setLevel(request.getParameter("level"));
        member.setFrequency(request.getParameter("frequency"));

        try {
            member.setHeight(Integer.parseInt(request.getParameter("height")));
            member.setWeight(Integer.parseInt(request.getParameter("weight")));
        } catch (Exception e) {
            member.setHeight(0);
            member.setWeight(0);
        }

        member.setDiet(request.getParameter("diet"));

        // ── 3. DB 업데이트 ────────────────────────────────────
        service.updateMyPage(user, member);

        // ── 4. 세션 동기화 ────────────────────────────────────
        loginUser.setNickname(user.getNickname());
        loginUser.setPhone(user.getPhone());
        session.setAttribute("loginUser", loginUser);

        // memberInfo 세션 최신화
        MemberDTO cached = (MemberDTO) session.getAttribute("memberInfo");
        if (cached != null) {
            cached.setGoals(member.getGoals());
            cached.setExperience(member.getExperience());
            cached.setHeight(member.getHeight());
            cached.setWeight(member.getWeight());
            cached.setDiet(member.getDiet());
            session.setAttribute("memberInfo", cached);
        }

        // ── 5. 응답 ──────────────────────────────────────────
        response.setContentType("text/plain;charset=UTF-8");
        response.getWriter().write("success");
    }
}
