package service.member;

import java.util.List;

import dto.member.MessageDTO;
import dto.member.MessageRoomDTO;

public interface MessageService {
    void sendMessage(MessageDTO dto);

    List<MessageDTO> getChatList(String sender, String receiver);

    void readMessage(int messageId);
    
    void readMessageByRoom(String sender, String receiver);
    
    List<MessageRoomDTO> getMessageRoomList(String email);
}