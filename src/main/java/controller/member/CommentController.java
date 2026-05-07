package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.CommentDTO;
import service.member.CommentService;
import service.member.CommentServiceImpl;

@WebServlet("/member/comment")
public class CommentController extends HttpServlet {
    private CommentService service = new CommentServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int postNum = Integer.parseInt(req.getParameter("postNum"));
        String userId = req.getParameter("userId");
        String body = req.getParameter("body");

        CommentDTO dto = new CommentDTO();
        dto.setPostNum(postNum);
        dto.setUserId(userId);
        dto.setBody(body);

        service.write(dto);

        resp.getWriter().write("ok");
    }
}