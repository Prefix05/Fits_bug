package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;

public class MembershipDAOImpl implements MembershipDAO {
    @Override
    public void decreaseCount(String email) {

        String sql = "UPDATE membership SET remain_count = remain_count - 1 WHERE email=? AND remain_count > 0";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, email);
            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}