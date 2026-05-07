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

        if (email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMsg", "이메일과 비밀번호를 입력해주세요.");
            request.getRequestDispatcher("/member/login.jsp").forward(request, response);
            return;
        }

        UserDTO loginUser = null;
        try {
            loginUser = userService.login(email.trim(), password);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "로그인 처리 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
            request.getRequestDispatcher("/member/login.jsp").forward(request, response);
            return;
        }

        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", loginUser);
            session.setAttribute("loginEmail", email.trim());

            // 역할별 리다이렉트
            String role = loginUser.getRole();
            if ("GYM".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/gym/main");
            } else if ("TRAINER".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/trainer/main");
            } else if ("ADMIN".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/admin/main");
            } else {
                response.sendRedirect(request.getContextPath() + "/member/main");
            }
        } else {
            request.setAttribute("errorMsg", "아이디 또는 비밀번호가 틀렸습니다.");
            request.getRequestDispatcher("/member/login.jsp").forward(request, response);
        }
    }
}