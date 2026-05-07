package controller.member;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.member.CommentService;
import service.member.CommentServiceImpl;

@WebServlet("/member/commentList")
public class CommentListController extends HttpServlet {
    private CommentService service = new CommentServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int postNum = Integer.parseInt(req.getParameter("postNum"));

        var list = service.getComments(postNum);

        resp.setContentType("application/json;charset=UTF-8");

        StringBuilder json = new StringBuilder("[");
        for(int i=0; i<list.size(); i++){
            var c = list.get(i);

            json.append("{")
                .append("\"userId\":\"").append(c.getUserId()).append("\",")
                .append("\"body\":\"").append(c.getBody()).append("\"")
                .append("}");

            if(i < list.size()-1) json.append(",");
        }
        json.append("]");

        resp.getWriter().write(json.toString());
    }
}