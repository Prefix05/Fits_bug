package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.MemberDTO;
import dto.member.MessageRoomDTO;
import service.member.MessageService;
import service.member.MessageServiceImpl;

@WebServlet("/messageList")
public class MessageListController extends HttpServlet {

    private MessageService service = new MessageServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession();
        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");

        List<MessageRoomDTO> list = service.getMessageRoomList(user.getEmail());

        resp.setContentType("application/json;charset=UTF-8");

        StringBuilder json = new StringBuilder();
        json.append("[");

        for(int i=0; i<list.size(); i++){
            MessageRoomDTO c = list.get(i);

            json.append("{");
            json.append("\"email\":\"").append(c.getEmail()).append("\",");
            json.append("\"nickname\":\"").append(c.getNickname()).append("\",");
            json.append("\"lastMessage\":\"").append(c.getLastMessage()).append("\",");
            json.append("\"unreadCount\":").append(c.getUnreadCount());
            json.append("}");

            if(i < list.size()-1) json.append(",");
        }

        json.append("]");

        resp.getWriter().write(json.toString());
    }
}