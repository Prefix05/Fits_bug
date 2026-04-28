package dao.member;

import java.sql.*;
import java.util.*;
import dto.member.PtFeedbackDTO;
import util.DBUtil;

public class PtFeedbackDAOImpl implements PtFeedbackDAO {
    @Override
    public List<PtFeedbackDTO> getFeedbackList(String email) {

        List<PtFeedbackDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM pt_feedback WHERE user_email=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                PtFeedbackDTO dto = new PtFeedbackDTO();

                dto.setId(rs.getInt("id"));
                dto.setUserEmail(rs.getString("user_email"));
                dto.setTrainerName(rs.getString("trainer_name"));
                dto.setSessionDate(rs.getTimestamp("session_date").toLocalDateTime());

                list.add(dto);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public PtFeedbackDTO getFeedbackDetail(int id) {

        String sql = "SELECT * FROM pt_feedback WHERE id=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                PtFeedbackDTO dto = new PtFeedbackDTO();

                dto.setId(id);
                dto.setTrainerName(rs.getString("trainer_name"));
                dto.setSessionDate(rs.getTimestamp("session_date").toLocalDateTime());
                dto.setExercise(rs.getString("exercise"));
                dto.setFood(rs.getString("food"));    
                dto.setInbody(rs.getString("inbody"));
                dto.setFeedback(rs.getString("feedback"));
                dto.setGrowth(rs.getString("growth"));
                dto.setNextPlan(rs.getString("next_plan"));

                return dto;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void insertFeedback(PtFeedbackDTO dto) {

        String sql = "INSERT INTO pt_feedback(user_email, trainer_email, content, created_at) VALUES (?, ?, ?, NOW())";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, dto.getUserEmail());
            ps.setString(2, dto.getTrainerName());
            ps.setString(3, dto.getContent());

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}