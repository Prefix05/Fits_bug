package controller;

import dto.MemberDTO;
import service.MemberService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/complete")
public class CompleteJoinController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String workout = request.getParameter("workout");

        HttpSession session = request.getSession();

        String height = (String) session.getAttribute("height");
        String weight = (String) session.getAttribute("weight");
        String diet = (String) session.getAttribute("diet");

        // TODO: DB 저장

        response.sendRedirect("main.jsp");
    }
}