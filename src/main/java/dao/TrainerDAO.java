package dao;

import java.sql.*;

public class TrainerDAO {

    public void insertTrainer(Connection conn, String id, String pw, String name) throws Exception {
        String sql = "INSERT INTO trainer VALUES (?, ?, ?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, pw);
        ps.setString(3, name);

        ps.executeUpdate();
    }
}