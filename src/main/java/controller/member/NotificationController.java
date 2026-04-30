package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.MemberDTO;
import dto.member.NotificationDTO;
import service.member.NotificationService;
import service.member.NotificationServiceImpl;

@WebServlet("/notification")
public class NotificationController extends HttpServlet {

    private NotificationService service = new NotificationServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json;charset=UTF-8");

        PrintWriter out = resp.getWriter();

        MemberDTO user = (MemberDTO) req.getSession().getAttribute("loginUser");

        if(user == null){
            out.print("{\"error\":\"login required\"}");
            return;
        }

        String email = user.getEmail();
        String action = req.getParameter("action");

        // 🔥 전체 읽음 처리
        if("readAll".equals(action)){
            service.readAll(email);
            return;
        }

        // 🔥 단일 읽음 처리 (추가)
        if("readOne".equals(action)){
            int id = Integer.parseInt(req.getParameter("id"));
            service.readOne(id);

        List<NotificationDTO> list = service.getList(email);
        int count = service.getUnreadCount(email);

        StringBuilder json = new StringBuilder();

        json.append("{");
        json.append("\"count\":").append(count).append(",");
        json.append("\"list\":[");

        for(int i=0;i<list.size();i++){
            NotificationDTO n = list.get(i);

            json.append("{");
            json.append("\"id\":").append(n.getId()).append(",");
            json.append("\"type\":\"").append(n.getType()).append("\",");
            json.append("\"message\":\"").append(escape(n.getMessage())).append("\",");
            json.append("\"url\":\"").append(n.getUrl()).append("\",");
            json.append("\"isRead\":").append(n.isRead()).append(",");
            json.append("\"createdAt\":\"").append(n.getCreatedAt()).append("\"");
            json.append("}");

            if(i != list.size()-1){
                json.append(",");
            }
        }

        json.append("]}");

        out.print(json.toString());
        }
    }

    private String escape(String str){
        if(str == null) return "";
        return str.replace("\"", "\\\"");
    }
}