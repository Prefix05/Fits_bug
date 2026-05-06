package controller.member;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dto.member.MemberDTO;
import dto.member.UserDTO;

@WebServlet("/member/main")
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/member/login");
            return;
        }

        /*
         * ✅ WorkoutPlanDAO 완전 제거
         *    MemberDAO.findByEmail 로 MEMBER 테이블에서
         *    회원 기본정보 + 운동계획(height/weight/diet/goals) 한 번에 조회
         */
        if (session.getAttribute("memberInfo") == null) {
            MemberDAO memberDao = new MemberDAOImpl();
            MemberDTO memberInfo = memberDao.findByEmail(loginUser.getEmail());
            if (memberInfo != null) {
                session.setAttribute("memberInfo", memberInfo);
            }
        }

        request.getRequestDispatcher("/member/main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
