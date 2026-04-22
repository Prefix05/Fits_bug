package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/gymJoin")
public class GymJoinController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gymName = request.getParameter("gymName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String ceo = request.getParameter("ceo");

        // 👉 DB 저장 처리

        // 완료 후 인증 페이지 이동
        response.sendRedirect("gymVerify.jsp");
    }
}