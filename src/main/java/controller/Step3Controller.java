package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.MemberDAO;

@WebServlet("/step3")
public class Step3Controller extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // step2 값 저장
        request.getSession().setAttribute("height", request.getParameter("height"));
        request.getSession().setAttribute("weight", request.getParameter("weight"));
        request.getSession().setAttribute("diet", request.getParameter("diet"));

        request.getRequestDispatcher("step3.jsp").forward(request, response);
    }
}