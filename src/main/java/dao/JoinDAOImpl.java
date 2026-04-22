/*
 * package dao;
 * 
 * import org.json.simple.JSONObject;
 * 
 * public class JoinDAOImpl implements JoinDAO {
 * 
 * @Override public void insertUser(JSONObject json) {
 * System.out.println("USER 저장: " + json); }
 * 
 * @Override public void insertTrainer(JSONObject json) {
 * System.out.println("TRAINER 저장: " + json); }
 * 
 * @Override public void insertGym(JSONObject json) {
 * System.out.println("GYM 저장: " + json); } }
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;  

public class JoinDAOImpl implements JoinDAO {

    public void insert(String id, String pw, String role) {

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();

            String sql = "INSERT INTO member(id, pw, role) VALUES(?,?,?)";

            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, pw);
            ps.setString(3, role);

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        } finally {
            try {
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
}