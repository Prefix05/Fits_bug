package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.FoodRecordDTO;
import util.DBUtil;

public class FoodRecordDAOImpl implements FoodRecordDAO {

    @Override
    public int insert(FoodRecordDTO dto) {
        String sql = "INSERT INTO food_record(email, food_name, gram, calorie) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dto.getEmail());
            ps.setString(2, dto.getFoodName());
            ps.setDouble(3, dto.getGram());
            ps.setDouble(4, dto.getCalorie());

            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public List<FoodRecordDTO> findByEmail(String email) {

        List<FoodRecordDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM food_record WHERE email=? ORDER BY record_date DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FoodRecordDTO dto = new FoodRecordDTO();

                dto.setFoodName(rs.getString("food_name"));
                dto.setGram(rs.getDouble("gram"));
                dto.setCalorie(rs.getDouble("calorie"));
                dto.setRecordDate(rs.getString("record_date"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<FoodRecordDTO> getRecords(String email) {
        return findByEmail(email);
    }
}