package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

        // USER 테이블 기준 로그인
        UserDTO loginUser = userService.login(email, password);

        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", loginUser);      // UserDTO 저장
            session.setAttribute("loginEmail", email);         // 이메일 별도 저장 (다른 DAO에서 사용)

            response.sendRedirect(request.getContextPath() + "/member/main");

        } else {
            request.setAttribute("errorMsg", "아이디 또는 비밀번호가 틀렸습니다.");
            request.getRequestDispatcher("/member/login.jsp").forward(request, response);
        }
    }
}
