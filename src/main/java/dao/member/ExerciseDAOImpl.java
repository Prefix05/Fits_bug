package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.ExerciseGuideDTO;
import util.DBUtil;

public class ExerciseDAOImpl implements ExerciseDAO {
    private ExerciseGuideDTO map(ResultSet rs) throws Exception {
        ExerciseGuideDTO e = new ExerciseGuideDTO();

        e.setExerciseId(rs.getInt("exercise_id"));
        e.setName(rs.getString("name"));
        e.setDescription(rs.getString("description"));
        e.setMuscle(rs.getString("muscle"));
        e.setDifficulty(rs.getString("difficulty"));
        e.setThumbnail(rs.getString("thumbnail"));
        e.setGifUrl(rs.getString("gif_url"));
        e.setYoutubeUrl(rs.getString("youtube_url"));

        return e;
    }

    @Override
    public List<ExerciseGuideDTO> getAllExercises() {

        List<ExerciseGuideDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM exercise ORDER BY exercise_id DESC";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {
                list.add(map(rs));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<ExerciseGuideDTO> searchExercises(String keyword) {

        List<ExerciseGuideDTO> list = new ArrayList<>();

        String sql =
        "SELECT * FROM exercise " +
        "WHERE name LIKE ? OR muscle LIKE ? OR difficulty LIKE ? " +
        "ORDER BY exercise_id DESC";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            String k = "%" + keyword + "%";

            ps.setString(1, k);
            ps.setString(2, k);
            ps.setString(3, k);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                list.add(map(rs));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}