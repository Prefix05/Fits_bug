package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.InbodyRecordDTO;
import util.DBUtil;

public class InbodyRecordDAOImpl implements InbodyRecordDAO {

    // ===== 저장 =====
    @Override
    public int insert(InbodyRecordDTO dto) {
        String sql = "INSERT INTO inbody_record(email, weight, muscle, fat, image_path) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dto.getEmail());
            ps.setDouble(2, dto.getWeight());
            ps.setDouble(3, dto.getMuscle());
            ps.setDouble(4, dto.getFat());
            ps.setString(5, dto.getImagePath());

            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    // ===== 기존 조회 =====
    @Override
    public List<InbodyRecordDTO> findByEmail(String email) {

        List<InbodyRecordDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM inbody_record WHERE email=? ORDER BY record_date DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                InbodyRecordDTO dto = new InbodyRecordDTO();

                dto.setWeight(rs.getDouble("weight"));
                dto.setMuscle(rs.getDouble("muscle"));
                dto.setFat(rs.getDouble("fat"));
                dto.setImagePath(rs.getString("image_path"));
                dto.setRecordDate(rs.getString("record_date"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<InbodyRecordDTO> getRecords(String email) {
        return findByEmail(email);
    }
}