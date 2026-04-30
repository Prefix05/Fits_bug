package service.member;

import dao.member.LoginDAO;
import dao.member.LoginDAOImpl;
import dto.member.LoginDTO;

public class MemberServiceImpl implements MemberService {

    private LoginDAO dao = new LoginDAOImpl(); // ⭐ 핵심 수정

    @Override
    public int join(LoginDTO m){
        return dao.insertMember(m);
    }

    @Override
    public LoginDTO login(String email, String password){
        return dao.login(email, password);
    }

	@Override
	public String getNickname(String email) {
		return dao.getNicknameByEmail(email);
	}

	@Override
    public boolean isEmailExists(String email) {

        if (email == null || email.trim().isEmpty()) {
            return false;
        }

        return dao.isEmailExists(email);
    }
}