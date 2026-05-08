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

import dto.member.MemberDTO;
import dto.member.MyPageDTO;
import dto.member.UserDTO;
import service.member.MyPageService;
import service.member.MyPageServiceImpl;

@WebServlet("/member/mypage")
public class MyPageController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MyPageService service = new MyPageServiceImpl();

    /** 마이페이지 조회 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        UserDTO loginUser =
                (UserDTO) session.getAttribute("loginUser");

        if (loginUser == null) {

            response.sendRedirect(
                    request.getContextPath() + "/member/login"
            );

            return;
        }

        String tab = request.getParameter("tab");

        request.setAttribute("tab", tab);

        // ── DB 조회 ─────────────────────────────────────────
        MyPageDTO dto =
                service.getMyPage(loginUser.getEmail());

        // ── null 방어 ──────────────────────────────────────
        if (dto == null || dto.getMember() == null) {

            dto = new MyPageDTO();

            Map<String, Object> fallback =
                    new HashMap<>();

            fallback.put("email", loginUser.getEmail());
            fallback.put("nickname", loginUser.getNickname());
            fallback.put("profile_image", loginUser.getProfileImage());
            fallback.put("role", loginUser.getRole());

            dto.setMember(fallback);
        }

        // ── request attribute ─────────────────────────────
        Map<String, Object> member = dto.getMember();

        request.setAttribute("member", member);

        request.setAttribute("user", member);

        request.getRequestDispatcher("/member/mypage.jsp")
                .forward(request, response);
    }

    /** 마이페이지 수정 */
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        UserDTO loginUser =
                (UserDTO) session.getAttribute("loginUser");

        if (loginUser == null) {

            response.setStatus(
                    HttpServletResponse.SC_UNAUTHORIZED
            );

            return;
        }

        String email = loginUser.getEmail();

        // ── USER 수정 정보 ─────────────────────────────────
        UserDTO user = new UserDTO();

        user.setId(loginUser.getId());

        user.setNickname(
                request.getParameter("nickname")
        );

        user.setPhone(
                request.getParameter("phone")
        );

        // ── MEMBER 수정 정보 ───────────────────────────────
        MemberDTO member = new MemberDTO();

        member.setEmail(email);

        member.setGoals(
                request.getParameter("goal")
        );

        member.setExperience(
                request.getParameter("level")
        );

        try {

            member.setHeight(
                    Integer.parseInt(
                            request.getParameter("height")
                    )
            );

            member.setWeight(
                    Integer.parseInt(
                            request.getParameter("weight")
                    )
            );

        } catch (Exception e) {

            member.setHeight(0);

            member.setWeight(0);
        }

        member.setDiet(
                request.getParameter("diet")
        );

        // ── DB 업데이트 ────────────────────────────────────
        service.updateMyPage(user, member);

        // ── 세션 동기화 ────────────────────────────────────
        loginUser.setNickname(user.getNickname());

        loginUser.setPhone(user.getPhone());

        session.setAttribute("loginUser", loginUser);

        // memberInfo 세션 최신화
        Object memberInfoObj =
                session.getAttribute("memberInfo");

        if (memberInfoObj instanceof Map) {

            @SuppressWarnings("unchecked")
            Map<String, Object> cached =
                    (Map<String, Object>) memberInfoObj;

            cached.put("goals", member.getGoals());

            cached.put(
                    "experience",
                    member.getExperience()
            );

            cached.put("height", member.getHeight());

            cached.put("weight", member.getWeight());

            cached.put("diet", member.getDiet());

            cached.put(
                    "nickname",
                    user.getNickname()
            );

            session.setAttribute(
                    "memberInfo",
                    cached
            );
        }

        // ── 응답 ──────────────────────────────────────────
        response.setContentType(
                "text/plain;charset=UTF-8"
        );

        response.getWriter().write("success");
    }
}