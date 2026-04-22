package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.MemberDTO;
import service.MemberService;
import service.MemberServiceImpl;
import util.KakaoUtil;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        session.invalidate();

        response.sendRedirect("login.jsp");
    }
}