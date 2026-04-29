package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dto.member.TrainerReviewDTO;
import util.DBUtil;

public class TrainerReviewDAOImpl implements TrainerReviewDAO {
    @Override
    public int insert(TrainerReviewDTO dto) {
        String sql = "INSERT INTO trainer_review(user_email, trainer_id, rating, content, image_path) VALUES (?, ?, ?, ?, ?)";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, dto.getUserEmail());
            ps.setInt(2, dto.getTrainerId());
            ps.setInt(3, dto.getRating());
            ps.setString(4, dto.getContent());
            ps.setString(5, dto.getImagePath());

            return ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }
}