package dao.member;

import dto.member.CommentDTO;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAOImpl implements CommentDAO {

    @Override
    public void insert(CommentDTO dto) {

        String sql = "INSERT INTO comment (post_id, nickname, content) VALUES (?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, dto.getPostId());
            ps.setString(2, dto.getNickname());
            ps.setString(3, dto.getContent());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<CommentDTO> findByPostId(int postId) {

        List<CommentDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM comment WHERE post_id=? ORDER BY id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, postId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CommentDTO dto = new CommentDTO();

                dto.setId(rs.getInt("id"));
                dto.setPostId(rs.getInt("post_id"));
                dto.setNickname(rs.getString("nickname"));
                dto.setContent(rs.getString("content"));
                dto.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}