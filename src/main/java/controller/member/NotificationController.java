/*
 * package controller;
 * 
 * import java.io.IOException; import java.io.PrintWriter; import
 * java.util.List;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.*;
 * 
 * import dto.MemberDTO; import dto.NotificationDTO; import
 * service.NotificationService; import service.NotificationServiceImpl;
 * 
 * @WebServlet("/notification") public class NotificationController extends
 * HttpServlet {
 * 
 * private NotificationService service = new NotificationServiceImpl();
 * 
 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException {
 * 
 * resp.setContentType("application/json;charset=UTF-8");
 * 
 * PrintWriter out = resp.getWriter();
 * 
 * MemberDTO user = (MemberDTO) req.getSession().getAttribute("loginUser");
 * 
 * if(user == null){ out.print("{\"error\":\"login required\"}"); return; }
 * 
 * String email = user.getEmail(); String action = req.getParameter("action");
 * 
 * // 🔥 전체 읽음 처리 if("readAll".equals(action)){ service.readAll(email); return;
 * }
 * 
 * // 🔥 단일 읽음 처리 (추가) if("readOne".equals(action)){ int id =
 * Integer.parseInt(req.getParameter("id")); service.readOne(id);
 * 
 * List<NotificationDTO> list = service.getList(email); int count =
 * service.getUnreadCount(email);
 * 
 * StringBuilder json = new StringBuilder();
 * 
 * json.append("{"); json.append("\"count\":").append(count).append(",");
 * json.append("\"list\":[");
 * 
 * for(int i=0;i<list.size();i++){ NotificationDTO n = list.get(i);
 * 
 * json.append("{"); json.append("\"id\":").append(n.getId()).append(",");
 * json.append("\"type\":\"").append(n.getType()).append("\",");
 * json.append("\"message\":\"").append(escape(n.getMessage())).append("\",");
 * json.append("\"url\":\"").append(n.getUrl()).append("\",");
 * json.append("\"isRead\":").append(n.isRead()).append(",");
 * json.append("\"createdAt\":\"").append(n.getCreatedAt()).append("\"");
 * json.append("}");
 * 
 * if(i != list.size()-1){ json.append(","); } }
 * 
 * json.append("]}");
 * 
 * out.print(json.toString()); } }
 * 
 * private String escape(String str){ if(str == null) return ""; return
 * str.replace("\"", "\\\""); } }
 */
package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.MemberDTO;
import dto.member.NotificationDTO;

@WebServlet("/notification")
public class NotificationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        MemberDTO user = (MemberDTO) req.getSession().getAttribute("loginUser");

        if(user == null){
            out.print("{\"error\":\"login required\"}");
            return;
        }

        String action = req.getParameter("action");

        // 🔥 더미데이터 생성
        List<NotificationDTO> list = new ArrayList<>();

        NotificationDTO n1 = new NotificationDTO();
        n1.setId(1);
        n1.setType("feedback");
        n1.setMessage("트레이너 김태훈님의 피드백이 도착했습니다.");
        n1.setUrl("feedback.jsp");
        n1.setRead(false);
        n1.setCreatedAt("2026-04-30");

        NotificationDTO n2 = new NotificationDTO();
        n2.setId(2);
        n2.setType("schedule");
        n2.setMessage("내일 PT 수업이 예약되어 있습니다.");
        n2.setUrl("schedule.jsp");
        n2.setRead(true);
        n2.setCreatedAt("2026-04-29");

        list.add(n1);
        list.add(n2);

        // 🔥 읽지 않은 개수 계산
        int count = 0;
        for(NotificationDTO n : list){
            if(!n.isRead()) count++;
        }

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

    private String escape(String str){
        if(str == null) return "";
        return str.replace("\"", "\\\"");
    }
}