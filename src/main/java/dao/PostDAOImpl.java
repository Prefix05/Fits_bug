package dao;

import java.sql.*;
import java.util.*;

import dto.PostDTO;
import util.DBUtil;

public class PostDAOImpl implements PostDAO {
    Connection conn;

    public PostDAOImpl() {
        conn = DBUtil.getConnection();
    }

    // 게시글 저장
    @Override
    public int insert(PostDTO dto) {

        int result = 0;

        String sql = "INSERT INTO post(user_id, category, title, content, image, hashtags) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getUserId());
            ps.setString(2, dto.getCategory());
            ps.setString(3, dto.getTitle());
            ps.setString(4, dto.getContent());
            ps.setString(5, dto.getImage());
            ps.setString(6, dto.getHashtags());

            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // 전체 게시글 조회
    @Override
    public List<PostDTO> getList() {
        List<PostDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM post ORDER BY id DESC";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                PostDTO dto = new PostDTO();

                dto.setId(rs.getInt("id"));
                dto.setUserId(rs.getString("user_id"));
                dto.setCategory(rs.getString("category"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setImage(rs.getString("image"));
                dto.setHashtags(rs.getString("hashtags"));
                dto.setCreatedAt(rs.getString("created_at"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}