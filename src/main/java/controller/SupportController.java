package controller;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dto.MemberDTO;
import dto.SupportDTO;
import service.SupportService;
import service.SupportServiceImpl;

@WebServlet("/support")
public class SupportController extends HttpServlet {

    private SupportService service = new SupportServiceImpl();

    // 문의 목록 + 페이지 진입
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<SupportDTO> list = service.getList(loginUser.getEmail());

        request.setAttribute("list", list);
        request.getRequestDispatcher("support.jsp").forward(request, response);
    }

    // 문의 등록
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.setStatus(401);
            return;
        }

        SupportDTO dto = new SupportDTO();

        dto.setEmail(loginUser.getEmail());
        dto.setType(request.getParameter("type"));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));

        // 파일 업로드는 일단 생략 (추후 추가 가능)
        dto.setFilePath(null);

        service.write(dto);

        response.sendRedirect("support");
    }
}