package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MessageDAO;
import dao.member.MessageDAOImpl;
import dto.member.MessageDTO;
import service.member.MessageService;
import service.member.MessageServiceImpl;

@WebServlet("/message")
public class MessageController extends HttpServlet {

    private MessageService service = new MessageServiceImpl();

    // 🔥 채팅 조회 + 읽음 처리
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String sender = req.getParameter("sender");
        String receiver = req.getParameter("receiver");

        // 1. 채팅 목록 가져오기
        List<MessageDTO> list = service.getChatList(sender, receiver);

        // 🔥 2. 읽음 처리 (핵심)
        service.readMessageByRoom(sender, receiver);

        // 3. JSON 응답
        resp.setContentType("application/json;charset=UTF-8");

        StringBuilder json = new StringBuilder();
        json.append("[");

        boolean first = true;

        for (MessageDTO m : list) {

            if (!first) {
                json.append(",");
            }

            json.append("{");
            json.append("\"id\":").append(m.getId()).append(",");
            json.append("\"sender\":\"").append(m.getSender()).append("\",");
            json.append("\"receiver\":\"").append(m.getReceiver()).append("\",");
            json.append("\"content\":\"").append(m.getContent()).append("\",");
            json.append("\"sendTime\":\"").append(m.getSendTime()).append("\",");
            json.append("\"isRead\":").append(m.getIsRead());
            json.append("}");

            first = false;
        }

        json.append("]");

        resp.getWriter().write(json.toString());
    }

    // 🔥 메시지 전송 + 알림 생성
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        
        String action = req.getParameter("action");

        if("readAll".equals(action)){
            String receiver = req.getParameter("receiver");

            MessageDAO dao = new MessageDAOImpl();
            dao.markAsRead(receiver, (String)req.getSession().getAttribute("loginUserEmail"));

            return;
        }
        MessageDTO msg = new MessageDTO();
        msg.setSender(req.getParameter("sender"));
        msg.setReceiver(req.getParameter("receiver"));
        msg.setContent(req.getParameter("content"));

        // 🔥 Service 호출 (여기서 알림까지 생성됨)
        service.sendMessage(msg);

        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().write("ok");
    }
}