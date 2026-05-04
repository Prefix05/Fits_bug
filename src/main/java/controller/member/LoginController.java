package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.LoginDTO;
import dto.member.MemberDTO;
import service.member.MemberService;
import service.member.MemberServiceImpl;

@WebServlet("/member/login") // ⭐ login으로 매핑 (폼 action이랑 맞춰야함)
public class LoginController extends HttpServlet {

    private MemberService memberService = new MemberServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        MemberDTO loginUser = memberService.login(email, password);

        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", loginUser);

            response.sendRedirect("main.jsp"); // ⭐ 로그인 성공
        } else {
            request.setAttribute("errorMsg", "아이디 또는 비밀번호가 틀렸습니다.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}