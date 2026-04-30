package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.NotificationDTO;
import util.DBUtil;

public class NotificationDAOImpl implements NotificationDAO {
    @Override
    public List<NotificationDTO> findByEmail(String email) {

        List<NotificationDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM notification WHERE member_email=? ORDER BY id DESC";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                NotificationDTO dto = new NotificationDTO();

                dto.setId(rs.getInt("id"));
                dto.setEmail(rs.getString("email"));
                dto.setType(rs.getString("type"));
                dto.setMessage(rs.getString("message"));
                dto.setUrl(rs.getString("url"));
                dto.setRead(rs.getBoolean("is_read"));
                dto.setCreatedAt(rs.getString("created_at"));

                list.add(dto);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int countUnread(String email) {

        String sql = "SELECT COUNT(*) FROM notification WHERE member_email=? AND is_read=false";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                return rs.getInt(1);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int insert(NotificationDTO dto) {

        String sql = "INSERT INTO notification(member_email, type, message, url) VALUES(?,?,?,?)";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, dto.getEmail());
            ps.setString(2, dto.getType());
            ps.setString(3, dto.getMessage());
            ps.setString(4, dto.getUrl());

            return ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int updateReadAll(String email) {

        String sql = "UPDATE notification SET is_read=true WHERE member_email=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, email);

            return ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int updateReadOne(int id) {

        String sql = "UPDATE notification SET is_read=true WHERE id=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setInt(1, id);
            return ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }
}