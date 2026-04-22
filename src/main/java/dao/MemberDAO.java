package dao;

import java.sql.*;

import dto.MemberDTO;

public class MemberDAO {

    public void insertUser(String username, String password, String nickname,
                           String phone, String role,
                           String height, String weight,
                           String diet, String workout) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/yourdb",
                "root",
                "1234"
            );

            String sql = "INSERT INTO users VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, nickname);
            ps.setString(4, phone);
            ps.setString(5, role);
            ps.setString(6, height);
            ps.setString(7, weight);
            ps.setString(8, diet);
            ps.setString(9, workout);

            ps.executeUpdate();

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	public MemberDTO loginCheck(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return null;
	}
}