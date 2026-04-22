package dao;

import java.sql.*;
import java.util.*;

import dto.SupportDTO;
import util.DBUtil;

public class SupportDAOImpl implements SupportDAO {

    @Override
    public void insertSupport(SupportDTO dto) {

        String sql = "INSERT INTO support(email, type, title, content, file_path) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dto.getEmail());
            ps.setString(2, dto.getType());
            ps.setString(3, dto.getTitle());
            ps.setString(4, dto.getContent());
            ps.setString(5, dto.getFilePath());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<SupportDTO> selectByEmail(String email) {

        List<SupportDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM support WHERE email=? ORDER BY id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SupportDTO dto = new SupportDTO();

                dto.setId(rs.getInt("id"));
                dto.setEmail(rs.getString("email"));
                dto.setType(rs.getString("type"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setFilePath(rs.getString("file_path"));
                dto.setStatus(rs.getString("status"));
                dto.setCreatedAt(rs.getString("created_at"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}