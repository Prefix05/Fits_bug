package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.member.LoginDTO;
import dto.member.WorkoutPlanDTO;
import util.DBUtil;

public class MyPageDAOImpl implements MyPageDAO {

    // 회원 조회
    @Override
    public LoginDTO selectMember(String email) {

        LoginDTO dto = null;

        try (Connection conn = DBUtil.getConnection()) {

            String sql = "SELECT * FROM member WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto = new LoginDTO();
                dto.setEmail(rs.getString("email"));
                dto.setPassword(rs.getString("password"));
                dto.setNickname(rs.getString("nickname"));
                dto.setPhone(rs.getString("phone"));
                dto.setProfileImage(rs.getString("profile_image"));
                dto.setEmailVerified(rs.getBoolean("email_verified"));
                dto.setSocialType(rs.getString("social_type"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }

    // 운동 계획 조회
    @Override
    public WorkoutPlanDTO selectWorkoutPlan(String email) {

        WorkoutPlanDTO dto = null;

        try (Connection conn = DBUtil.getConnection()) {

            String sql = "SELECT * FROM workout_plan WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dto = new WorkoutPlanDTO();
                dto.setEmail(rs.getString("email"));
                dto.setGoal(rs.getString("goal"));
                dto.setLevel(rs.getString("level"));
                dto.setHeight(rs.getInt("height"));
                dto.setWeight(rs.getInt("weight"));
                dto.setDiet(rs.getString("diet"));
                dto.setFrequency(rs.getString("frequency"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }

    // 회원 수정
    @Override
    public void updateMember(LoginDTO dto) {

        try (Connection conn = DBUtil.getConnection()) {

            String sql = "UPDATE member SET nickname=?, phone=? WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, dto.getNickname());
            ps.setString(2, dto.getPhone());
            ps.setString(3, dto.getEmail());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 운동 계획 수정
    @Override
    public void updateWorkoutPlan(WorkoutPlanDTO dto) {

        try (Connection conn = DBUtil.getConnection()) {

            String sql = "UPDATE workout_plan SET goal=?, level=?, height=?, weight=?, diet=?, frequency=? WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, dto.getGoal());
            ps.setString(2, dto.getLevel());
            ps.setInt(3, dto.getHeight());
            ps.setInt(4, dto.getWeight());
            ps.setString(5, dto.getDiet());
            ps.setString(6, dto.getFrequency());
            ps.setString(7, dto.getEmail());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 프로필 이미지 수정
    @Override
    public void updateProfileImg(LoginDTO dto) {

        try (Connection conn = DBUtil.getConnection()) {

            String sql = "UPDATE member SET profile_image=? WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, dto.getProfileImage());
            ps.setString(2, dto.getEmail());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}