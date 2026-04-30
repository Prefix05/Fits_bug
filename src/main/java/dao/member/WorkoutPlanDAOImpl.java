package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.member.WorkoutPlanDTO;
import util.DBUtil;

public class WorkoutPlanDAOImpl implements WorkoutPlanDAO {

    // 조회
    @Override
    public WorkoutPlanDTO getPlan(String email) {

        String sql = "SELECT * FROM workout_plan WHERE email=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                WorkoutPlanDTO plan = new WorkoutPlanDTO();

                plan.setEmail(rs.getString("email"));
                plan.setGoal(rs.getString("goal"));
                plan.setLevel(rs.getString("level"));
                plan.setHeight(rs.getInt("height"));
                plan.setWeight(rs.getInt("weight"));
                plan.setDiet(rs.getString("diet"));
                plan.setFrequency(rs.getString("frequency"));

                return plan;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return null;
    }

    // 저장 (UPSERT)
    @Override
    public int savePlan(WorkoutPlanDTO plan) {
        String sql = 
        "INSERT INTO workout_plan(email, goal, level, height, weight, diet, frequency)" +
        "VALUES (?, ?, ?, ?, ?, ?, ?)" +
        "ON DUPLICATE KEY UPDATE" +
        "goal=?, level=?, height=?, weight=?, diet=?, frequency=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, plan.getEmail());
            ps.setString(2, plan.getGoal());
            ps.setString(3, plan.getLevel());
            ps.setInt(4, plan.getHeight());
            ps.setInt(5, plan.getWeight());
            ps.setString(6, plan.getDiet());
            ps.setString(7, plan.getFrequency());

            ps.setString(8, plan.getGoal());
            ps.setString(9, plan.getLevel());
            ps.setInt(10, plan.getHeight());
            ps.setInt(11, plan.getWeight());
            ps.setString(12, plan.getDiet());
            ps.setString(13, plan.getFrequency());

            return ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public boolean update(WorkoutPlanDTO dto) {

        String sql = "UPDATE workout_plan SET goal=?, level=?, height=?, weight=?, diet=? WHERE member_email=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, dto.getGoal());
            ps.setString(2, dto.getLevel());
            ps.setInt(3, dto.getHeight());
            ps.setInt(4, dto.getWeight());
            ps.setString(5, dto.getDiet());
            ps.setString(6, dto.getEmail());

            return ps.executeUpdate() > 0;

        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }
}