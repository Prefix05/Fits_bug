package dao.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.TrainerDTO;

public class TrainerDAOImpl implements TrainerDAO {
    private Connection getConn() throws Exception {
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/fitsbug",
            "root",
            "1234"
        );
    }

    // ✅ 기존 insert 기능 유지
    @Override
    public void insertTrainer(Connection conn, String id, String pw, String name) throws Exception {

        String sql = "INSERT INTO trainer (id, pw, name) VALUES (?, ?, ?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, pw);
        ps.setString(3, name);

        ps.executeUpdate();
    }

    // ✅ 리스트 조회 기능 추가
    @Override
    public List<TrainerDTO> getTrainerList(String keyword, String category, String sort) {

        List<TrainerDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM trainer WHERE 1=1 ";

        if (keyword != null && !keyword.isEmpty()) {
            sql += " AND name LIKE ? ";
        }

        if (category != null && !category.equals("전체")) {
            sql += " AND specialty = ? ";
        }

        // 정렬
        if ("rating".equals(sort)) {
            sql += " ORDER BY rating DESC ";
        } else if ("price".equals(sort)) {
            sql += " ORDER BY price10 ASC ";
        } else {
            sql += " ORDER BY similarity DESC ";
        }

        try (Connection conn = getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int idx = 1;

            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(idx++, "%" + keyword + "%");
            }

            if (category != null && !category.equals("전체")) {
                ps.setString(idx++, category);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TrainerDTO t = new TrainerDTO();

                t.setId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setProfileImg(rs.getString("profile_img"));
                t.setSpecialty(rs.getString("specialty"));
                t.setRating(rs.getDouble("rating"));
                t.setSimilarity(rs.getDouble("similarity"));
                t.setPrice10(rs.getInt("price10"));
                t.setPrice1(rs.getInt("price1"));
                t.setCareer(rs.getString("career"));

                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public TrainerDTO getTrainerDetail(int trainerId) {

        TrainerDTO t = null;

        String sql = "SELECT * FROM trainer WHERE trainer_id = ?";

        try (Connection conn = getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, trainerId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                t = new TrainerDTO();

                t.setId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setProfileImg(rs.getString("profile_img"));
                t.setSpecialty(rs.getString("specialty"));
                t.setRating(rs.getDouble("rating"));
                t.setSimilarity(rs.getDouble("similarity"));
                t.setPrice10(rs.getInt("price10"));
                t.setPrice1(rs.getInt("price1"));
                t.setCareer(rs.getString("career"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return t;
    }
}