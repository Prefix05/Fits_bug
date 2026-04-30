package dao.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.CommunityDTO;

public class CommunityDAOImpl implements CommunityDAO {

    private Connection getConn() throws Exception {
        return DriverManager.getConnection(
                "jdbc:mariadb://localhost:3306/fitsbug",
                "root",
                "7564"
        );
    }

    @Override
    public List<CommunityDTO> selectAll() throws Exception {

        List<CommunityDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM community ORDER BY id DESC";

        try (Connection conn = getConn();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CommunityDTO dto = new CommunityDTO();

                dto.setId(rs.getInt("id"));
                dto.setUserEmail(rs.getString("user_email"));
                dto.setCategory(rs.getString("category"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setHashtags(rs.getString("hashtags"));
                dto.setImage(rs.getString("image"));

                dto.setCreatedAt(rs.getTimestamp("created_at"));

                dto.setLikeCount(rs.getInt("like_count"));
                dto.setGoodCount(rs.getInt("good_count"));
                dto.setMuscleCount(rs.getInt("muscle_count"));

                list.add(dto);
            }
        }

        return list;
    }

    @Override
    public CommunityDTO selectById(int id) throws Exception {

        String sql = "SELECT * FROM community WHERE id=?";

        try (Connection conn = getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    CommunityDTO dto = new CommunityDTO();

                    dto.setId(rs.getInt("id"));
                    dto.setUserEmail(rs.getString("user_email"));
                    dto.setCategory(rs.getString("category"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setHashtags(rs.getString("hashtags"));
                    dto.setImage(rs.getString("image"));

                    dto.setCreatedAt(rs.getTimestamp("created_at"));

                    dto.setLikeCount(rs.getInt("like_count"));
                    dto.setGoodCount(rs.getInt("good_count"));
                    dto.setMuscleCount(rs.getInt("muscle_count"));

                    return dto;
                }
            }
        }

        return null;
    }
}