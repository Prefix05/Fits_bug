package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.WorkoutRecordDTO;
import util.DBUtil;

public class WorkoutRecordDAOImpl implements WorkoutRecordDAO {

    // ===== 저장 =====
    @Override
    public int insertRecord(WorkoutRecordDTO dto) {
        String sql = "INSERT INTO records(email, name, weight, reps, sets, date) VALUES (?, ?, ?, ?, ?, NOW())";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dto.getEmail());
            ps.setString(2, dto.getName());
            ps.setInt(3, dto.getWeight());
            ps.setInt(4, dto.getReps());
            ps.setInt(5, dto.getSets());

            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    // ===== 조회 =====
    @Override
    public List<WorkoutRecordDTO> getRecords(String email) {

        List<WorkoutRecordDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM records WHERE email=? ORDER BY date DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                WorkoutRecordDTO dto = new WorkoutRecordDTO();

                dto.setId(rs.getInt("id"));
                dto.setEmail(rs.getString("email"));
                dto.setName(rs.getString("name"));
                dto.setWeight(rs.getInt("weight"));
                dto.setReps(rs.getInt("reps"));
                dto.setSets(rs.getInt("sets"));
                dto.setDate(rs.getString("date"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}