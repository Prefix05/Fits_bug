package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.MemberDTO;
import dto.member.RecordDTO;

@WebServlet("/records")
public class RecordController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");

        List<RecordDTO> list = new RecordServiceImpl().getRecords(user.getUserId());

        response.setContentType("application/json");

        PrintWriter out = response.getWriter();
        out.print(new Gson().toJson(list));
    }
}