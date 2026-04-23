package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBUtil;

public class PostReactionDAOImpl implements PostReactionDAO {

    Connection conn;

    public PostReactionDAOImpl() {
        conn = DBUtil.getConnection();
    }

    @Override
    public int addReaction(int postId, String userId, String type) {

        int result = 0;

        String sql = "INSERT INTO post_reaction(post_id, user_id, type) VALUES(?,?,?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, postId);
            ps.setString(2, userId);
            ps.setString(3, type);

            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

	@Override
	public int getReactionCount(int postId, String type) {
		String sql = "SELECT COUNT(*) FROM post_reaction WHERE post_id=? AND type=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, postId);
            ps.setString(2, type);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
		return 0;
	}
}