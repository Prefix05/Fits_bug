package controller.member;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dto.member.UserDTO;
import service.member.UserService;
import service.member.UserServiceImpl;

@WebServlet("/member/login")
public class LoginController extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 이미 로그인된 경우 main으로
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loginUser") != null) {
            response.sendRedirect(request.getContextPath() + "/member/main");
            return;
        }
        request.getRequestDispatcher("/member/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        // UserDTO 기반 로그인 (USER 테이블)
        UserDTO loginUser = userService.login(email, password);

        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser",  loginUser);
            session.setAttribute("loginEmail", email);
            response.sendRedirect(request.getContextPath() + "/member/main");
        } else {
            request.setAttribute("errorMsg", "아이디 또는 비밀번호가 틀렸습니다.");
            request.getRequestDispatcher("/member/login.jsp").forward(request, response);
        }
    }
}
