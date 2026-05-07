package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.ReportDTO;
import service.member.ReportService;
import service.member.ReportServiceImpl;

@WebServlet("/member/report")
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

        response.sendRedirect(request.getContextPath() + "/member/community");
    }
}