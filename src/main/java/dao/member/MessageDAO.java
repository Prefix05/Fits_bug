package dao.member;

import java.util.List;
import dto.member.MessageDTO;
import dto.member.MessageRoomDTO;

public interface MessageDAO {
    void insert(MessageDTO dto);

    List<MessageDTO> getChatList(String sender, String receiver);

    void updateRead(int messageId);

    int getUnreadCount(String receiver);

	void markAsRead(String sender, String receiver);
	
	List<MessageRoomDTO> getMessageRoomList(String email);
}