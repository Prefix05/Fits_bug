package dao;

import java.sql.*;
import dto.ReportDTO;
import util.DBUtil;

public class ReportDAOImpl implements ReportDAO {

    @Override
    public void insert(ReportDTO dto){

        String sql = "INSERT INTO report(post_id, reason, detail, user_id) VALUES(?,?,?,?)";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setInt(1, dto.getPostId());
            ps.setString(2, dto.getReason());
            ps.setString(3, dto.getDetail());
            ps.setString(4, dto.getUserId());

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}