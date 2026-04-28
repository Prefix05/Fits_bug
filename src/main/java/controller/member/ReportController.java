package controller.member;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.member.ReportDTO;
import service.member.ReportService;
import service.member.ReportServiceImpl;

@WebServlet("/report")
public class ReportController extends HttpServlet {

    private ReportService service = new ReportServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        ReportDTO dto = new ReportDTO();
        dto.setPostId(Integer.parseInt(request.getParameter("postId")));
        dto.setReason(request.getParameter("reason"));
        dto.setDetail(request.getParameter("detail"));

        HttpSession session = request.getSession();
        dto.setUserId((String)session.getAttribute("userId"));

        service.insertReport(dto);

        response.sendRedirect("community.jsp");
    }
}