package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/step2")
public class Step2Controller extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        session.setAttribute("height", request.getParameter("height"));
        session.setAttribute("weight", request.getParameter("weight"));
        session.setAttribute("diet", request.getParameter("diet"));

        response.sendRedirect("step3.jsp");
    }
}