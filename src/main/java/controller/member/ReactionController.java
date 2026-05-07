package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.PostReactionDAO;
import dao.member.PostReactionDAOImpl;
import dto.member.UserDTO;

@WebServlet("/member/reaction")
public class ReactionController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    PostReactionDAO dao = new PostReactionDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	HttpSession session = request.getSession();
    	UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
    	
    	String userId = loginUser.getEmail();
        int postNum = Integer.parseInt(request.getParameter("postNum"));
        String type = request.getParameter("type");

        dao.addReaction(postNum, userId, type);

        response.getWriter().write("ok");
    }
}