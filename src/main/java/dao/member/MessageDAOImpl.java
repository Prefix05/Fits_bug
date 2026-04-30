package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.MessageDTO;
import dto.member.MessageRoomDTO;
import util.DBUtil;

public class MessageDAOImpl implements MessageDAO {

    // 🔥 메시지 저장
    @Override
    public void insert(MessageDTO msg) {

        String sql = "INSERT INTO message(sender, receiver, content, send_time, is_read) VALUES(?,?,?,NOW(),0)";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, msg.getSender());
            ps.setString(2, msg.getReceiver());
            ps.setString(3, msg.getContent());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 🔥 채팅 조회
    @Override
    public List<MessageDTO> getChatList(String sender, String receiver) {

        List<MessageDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM message WHERE " +
                "(sender=? AND receiver=?) OR (sender=? AND receiver=?) " +
                "ORDER BY send_time";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, sender);
            ps.setString(2, receiver);
            ps.setString(3, receiver);
            ps.setString(4, sender);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                MessageDTO m = new MessageDTO();

                m.setId(rs.getInt("id"));
                m.setSender(rs.getString("sender"));
                m.setReceiver(rs.getString("receiver"));
                m.setContent(rs.getString("content"));
                m.setSendTime(rs.getTimestamp("send_time"));
                m.setIsRead(rs.getInt("is_read"));

                list.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔥 읽음 처리 (메시지 1개 기준)
    @Override
    public void updateRead(int messageId) {

        String sql = "UPDATE message SET is_read=1 WHERE id=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setInt(1, messageId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 🔥 안읽은 메시지 수
    @Override
    public int getUnreadCount(String receiver) {

        String sql = "SELECT COUNT(*) FROM message WHERE receiver=? AND is_read=0";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, receiver);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public void markAsRead(String sender, String receiver) {

        String sql = "UPDATE message SET is_read=1 WHERE sender=? AND receiver=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, sender);
            ps.setString(2, receiver);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<MessageRoomDTO> getMessageRoomList(String email) {

        List<MessageRoomDTO> list = new ArrayList<>();

        String sql =
            "SELECT " +
            "  CASE WHEN sender=? THEN receiver ELSE sender END AS chat_user, " +
            "  MAX(content) AS last_message, " +
            "  SUM(CASE WHEN receiver=? AND is_read=0 THEN 1 ELSE 0 END) AS unread_count " +
            "FROM message " +
            "WHERE sender=? OR receiver=? " +
            "GROUP BY chat_user " +
            "ORDER BY MAX(send_time) DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, email);
            ps.setString(3, email);
            ps.setString(4, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                MessageRoomDTO dto = new MessageRoomDTO();

                dto.setEmail(rs.getString("chat_user"));
                dto.setLastMessage(rs.getString("last_message"));
                dto.setUnreadCount(rs.getInt("unread_count"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}