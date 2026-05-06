package controller.member;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dto.member.PostDTO;
import service.member.PostService;
import service.member.PostServiceImpl;

@WebServlet("/member/community")
public class CommunityController extends HttpServlet {

    private PostService postService = new PostServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<PostDTO> postList = postService.getPosts();
        request.setAttribute("postList", postList);
        request.getRequestDispatcher("/member/community.jsp").forward(request, response);
    }
}
