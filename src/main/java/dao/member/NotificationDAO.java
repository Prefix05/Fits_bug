package dao.member;

import java.util.List;
import dto.member.NotificationDTO;

public interface NotificationDAO {

    List<NotificationDTO> findByEmail(String email);

    int countUnread(String email);

    int insert(NotificationDTO dto);

    int updateReadAll(String email);
    
    int updateReadOne(int id);
}