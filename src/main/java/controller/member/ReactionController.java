package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.member.PostReactionDAO;
import dao.member.PostReactionDAOImpl;

@WebServlet("/reaction")
public class ReactionController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    PostReactionDAO dao = new PostReactionDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = (String) request.getSession().getAttribute("loginUser");
        int postId = Integer.parseInt(request.getParameter("postId"));
        String type = request.getParameter("type");

        dao.addReaction(postId, userId, type);

        response.getWriter().write("ok");
    }
}