package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.member.MemberDTO;
import util.DBUtil;

public class MemberDAOImpl implements MemberDAO {
    @Override
    public int insertMember(MemberDTO member) {

        String sql = "INSERT INTO member(email, password, nickname, phone, profile_image, email_verified, social_type) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, member.getEmail());
            ps.setString(2, member.getPassword());
            ps.setString(3, member.getNickname());
            ps.setString(4, member.getPhone());
            ps.setString(5, member.getProfileImage());
            ps.setBoolean(6, member.isEmailVerified());
            ps.setString(7, member.getSocialType());

            return ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return 0;
    }
	
    @Override
    public MemberDTO login(String email, String password) {

        String sql = "SELECT * FROM member WHERE email=? AND password=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                MemberDTO m = new MemberDTO();
                m.setEmail(rs.getString("email"));
                m.setNickname(rs.getString("nickname"));
                m.setProfileImage(rs.getString("profile_image"));
                return m;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean isEmailExists(String email) {

        String sql = "SELECT COUNT(*) FROM member WHERE email=?";

        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                return rs.getInt(1) > 0;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }
    
    @Override
    public MemberDTO findByEmail(String email) {
    	MemberDTO user = null;
        try (Connection conn = DBUtil.getConnection()) {

            String sql = "SELECT * FROM member WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new MemberDTO();
                user.setEmail(rs.getString("email"));
                user.setNickname(rs.getString("nickname"));
                user.setProfileImage(rs.getString("profile_image"));
                user.setEmailVerified(rs.getBoolean("email_verified"));
                user.setSocialType(rs.getString("social_type"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public void insertKakaoUser(MemberDTO dto) {
    	try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO member(email, nickname, email_verified, social_type) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, dto.getEmail());
            ps.setString(2, dto.getNickname());
            ps.setBoolean(3, dto.isEmailVerified());
            ps.setString(4, dto.getSocialType());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	@Override
	public MemberDTO loginCheck(MemberDTO dto) {
		MemberDTO user = null;
        try (Connection conn = DBUtil.getConnection()) {

            String sql = "SELECT * FROM member WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, dto.getEmail());
            ps.setString(2, dto.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new MemberDTO();
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setNickname(rs.getString("nickname"));
                user.setPhone(rs.getString("phone"));
                user.setProfileImage(rs.getString("profile_image"));
                user.setEmailVerified(rs.getBoolean("email_verified"));
                user.setSocialType(rs.getString("social_type"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
	}

	@Override
	public String getNicknameByEmail(String email) {

	    String sql = "SELECT nickname FROM member WHERE email=?";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getString("nickname");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return null;
	}

	@Override
	public boolean update(MemberDTO dto) {

	    String sql = "UPDATE member SET nickname=?, password=? WHERE email=?";

	    try(Connection conn = DBUtil.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql)){

	        ps.setString(1, dto.getNickname());
	        ps.setString(2, dto.getPassword());
	        ps.setString(3, dto.getEmail());

	        return ps.executeUpdate() > 0;

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return false;
	}
}