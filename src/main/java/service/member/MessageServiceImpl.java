package service.member;

import java.util.List;

import dao.member.MessageDAO;
import dao.member.MessageDAOImpl;
import dto.member.MessageDTO;
import dto.member.MessageRoomDTO;
import dto.member.NotificationDTO;

public class MessageServiceImpl implements MessageService {

    private MessageDAO dao = new MessageDAOImpl();
    private MemberService memberService = new MemberServiceImpl();
    
    MessageRoomDTO dto = new MessageRoomDTO();
  
    // 🔥 알림 서비스
    private NotificationService notificationService = new NotificationServiceImpl();

    @Override
    public void sendMessage(MessageDTO dto) {

        // 1. 메시지 저장
        dao.insert(dto);

        // 2. 🔥 알림 생성 (받는 사람 기준)
        NotificationDTO n = new NotificationDTO();
        n.setEmail(dto.getReceiver());   // 👉 receiver = email
        n.setType("chat");
        n.setMessage("새 메시지가 도착했습니다");
        n.setUrl("chat.jsp");

        notificationService.create(n);
    }

    @Override
    public List<MessageDTO> getChatList(String sender, String receiver) {
        return dao.getChatList(sender, receiver);
    }

    @Override
    public void readMessage(int messageId) {
        dao.updateRead(messageId);
    }

	@Override
	public void readMessageByRoom(String sender, String receiver) {
		dao.markAsRead(sender, receiver);
		
	}

	@Override
	public List<MessageRoomDTO> getMessageRoomList(String email) {

	    List<MessageRoomDTO> list = dao.getMessageRoomList(email);

	    for(MessageRoomDTO dto : list){
	        String nickname = memberService.getNickname(dto.getEmail());
	        dto.setNickname(nickname);
	    }

	    return list;
	}
}