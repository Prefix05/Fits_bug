package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.member.ExerciseGuideDTO;
import util.DBUtil;

public class ExerciseDAOImpl implements ExerciseDAO {

    // ── ResultSet → ExerciseGuideDTO 변환 ────────────────────
    private ExerciseGuideDTO map(ResultSet rs) throws Exception {
        ExerciseGuideDTO e = new ExerciseGuideDTO();

        e.setId(rs.getInt("id"));                        // PK: id
        e.setTitle(rs.getString("title"));               // title (이전 name 아님)
        e.setDifficulty(rs.getString("difficulty"));
        e.setTargetMuscle(rs.getString("targetMuscle")); // DB 컬럼명 그대로
        e.setType(rs.getString("type"));
        e.setDescription(rs.getString("description"));
        e.setKeyPoint(rs.getString("keyPoint"));         // keyPoint (DB 컬럼명 그대로)
        e.setImage(rs.getString("image"));               // image (thumbnail/gif 통합)
        e.setVideo(rs.getString("video"));               // video (youtube URL)

        // reg_date: Date 타입이므로 getDate 사용
        e.setRegDate(rs.getDate("reg_date"));

        return e;
    }

    // ── 전체 조회 ─────────────────────────────────────────────
    @Override
    public List<ExerciseGuideDTO> getAllExercises() {
        List<ExerciseGuideDTO> list = new ArrayList<>();

        // 수정: EXERCISE_GUIDE 테이블, reg_date 내림차순
        String sql = "SELECT id, title, difficulty, targetMuscle, type, " +
                     "       description, keyPoint, image, video, reg_date " +
                     "FROM EXERCISE_GUIDE " +
                     "ORDER BY reg_date DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(map(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ── 키워드 검색 ───────────────────────────────────────────
    @Override
    public List<ExerciseGuideDTO> searchExercises(String keyword) {
        List<ExerciseGuideDTO> list = new ArrayList<>();

        // 수정: 컬럼명 title / targetMuscle / difficulty
        String sql = "SELECT id, title, difficulty, targetMuscle, type, " +
                     "       description, keyPoint, image, video, reg_date " +
                     "FROM EXERCISE_GUIDE " +
                     "WHERE title LIKE ? OR targetMuscle LIKE ? OR difficulty LIKE ? " +
                     "ORDER BY reg_date DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String k = "%" + keyword + "%";
            ps.setString(1, k);
            ps.setString(2, k);
            ps.setString(3, k);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(map(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ── id로 단건 조회 ────────────────────────────────────────
    public ExerciseGuideDTO findById(int id) {
        String sql = "SELECT id, title, difficulty, targetMuscle, type, " +
                     "       description, keyPoint, image, video, reg_date " +
                     "FROM EXERCISE_GUIDE WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return map(rs);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // ── targetMuscle로 필터 조회 ──────────────────────────────
    public List<ExerciseGuideDTO> findByMuscle(String targetMuscle) {
        List<ExerciseGuideDTO> list = new ArrayList<>();

        String sql = "SELECT id, title, difficulty, targetMuscle, type, " +
                     "       description, keyPoint, image, video, reg_date " +
                     "FROM EXERCISE_GUIDE " +
                     "WHERE targetMuscle = ? " +
                     "ORDER BY reg_date DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, targetMuscle);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(map(rs));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
