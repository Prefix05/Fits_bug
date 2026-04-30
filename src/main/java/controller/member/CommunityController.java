package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.CommunityDTO;
import service.member.CommunityService;
import service.member.CommunityServiceImpl;

@WebServlet("/community")
public class CommunityController extends HttpServlet {

    private CommunityService service = new CommunityServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<CommunityDTO> postList = service.getPostList();

            req.setAttribute("postList", postList);

            req.getRequestDispatcher("/community.jsp")
               .forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("community load fail");
        }
    }
}