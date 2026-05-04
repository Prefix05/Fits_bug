package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.MemberDTO;
import service.member.MemberService;
import service.member.MemberServiceImpl;

@WebServlet("/member/login")
public class MemberController extends HttpServlet {

    private MemberService memberService = new MemberServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 이미 로그인된 상태면 main으로 바로 이동
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loginUser") != null) {
            response.sendRedirect(request.getContextPath() + "/main");
            return;
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        MemberDTO loginUser = memberService.login(email, password);

        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", loginUser);

            // ✅ main.jsp 직접 접근이 아닌 /main 컨트롤러로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/main");
        } else {
            request.setAttribute("errorMsg", "아이디 또는 비밀번호가 틀렸습니다.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
