package dao.trainer;

import java.util.List;

import dto.trainer.NotificationDTO;

public interface NotificationDAO {
    List<NotificationDTO> findRecentByUser(String userId, int limit);

    List<NotificationDTO> findRecentByUserAndMember(String userId, String memberName, int limit);

    int markAsRead(int notificationId, String userId);

    int markAllAsRead(String userId, String memberName);
}
