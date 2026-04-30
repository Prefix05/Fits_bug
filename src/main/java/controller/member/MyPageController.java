package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.MemberDTO;
import dto.member.MyPageDTO;
import dto.member.WorkoutPlanDTO;
import service.member.MyPageService;
import service.member.MyPageServiceImpl;

@WebServlet("/mypage")
public class MyPageController extends HttpServlet {
    private MyPageService service = new MyPageServiceImpl();

    /**
     * 마이페이지 조회
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        // 로그인 체크
        if (loginUser == null) {
        	response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        String tab = request.getParameter("tab");
        request.setAttribute("tab", tab);
        
        // 통합 조회
        MyPageDTO dto = service.getMyPage(loginUser.getEmail());

        // null 방어
        if (dto == null) {
            dto = new MyPageDTO();
            dto.setMember(loginUser);
            
            // 운동 계획
            WorkoutPlanDTO plan = new WorkoutPlanDTO(
                    loginUser.getEmail(),
                    "근육 증가",
                    "초급",
                    175,
                    70,
                    "고단백",
                    "주 3회"
            );
            dto.setPlan(plan);
        }

        request.setAttribute("member", dto.getMember());
        request.setAttribute("plan", dto.getPlan());

        request.getRequestDispatcher("mypage.jsp").forward(request, response);
    }

    /**
     * 마이페이지 수정 (AJAX)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String email = loginUser.getEmail();

        // ======================
        // 1. MemberDTO
        // ======================
        MemberDTO member = new MemberDTO();
        member.setEmail(email);
        member.setNickname(request.getParameter("nickname"));
        member.setPhone(request.getParameter("phone"));

        // ======================
        // 2. WorkoutPlanDTO
        // ======================
        WorkoutPlanDTO plan = new WorkoutPlanDTO();
        plan.setEmail(email);

        try {
            plan.setHeight(Integer.parseInt(request.getParameter("height")));
            plan.setWeight(Integer.parseInt(request.getParameter("weight")));
        } catch (Exception e) {
            plan.setHeight(0);
            plan.setWeight(0);
        }

        plan.setGoal(request.getParameter("goal"));
        plan.setLevel(request.getParameter("level"));
        plan.setDiet(request.getParameter("diet"));
        plan.setFrequency(request.getParameter("frequency"));

        // ======================
        // 3. DB 업데이트
        // ======================
        service.updateMyPage(member, plan);

        // ======================
        // 4. 세션 동기화
        // ======================
        loginUser.setNickname(member.getNickname());
        loginUser.setPhone(member.getPhone());

        session.setAttribute("loginUser", loginUser);

        // ======================
        // 5. 응답
        // ======================
        response.setContentType("text/plain;charset=UTF-8");
        response.getWriter().write("success");
    }
}