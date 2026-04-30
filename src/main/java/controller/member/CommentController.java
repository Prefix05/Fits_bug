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

@WebServlet("/comment")
public class CommentController extends HttpServlet {
    private CommentService service = new CommentServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int postId = Integer.parseInt(req.getParameter("postId"));
        String nickname = req.getParameter("nickname");
        String content = req.getParameter("content");

        CommentDTO dto = new CommentDTO();
        dto.setPostId(postId);
        dto.setNickname(nickname);
        dto.setContent(content);

        service.write(dto);

        resp.getWriter().write("ok");
    }
}