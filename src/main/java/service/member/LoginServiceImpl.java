package service.member;

import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dto.member.MemberDTO;

public class LoginServiceImpl implements LoginService {

    private MemberDAO dao = new MemberDAOImpl();

    @Override
    public MemberDTO login(String email, String password) {
        return dao.login(email, password);
    }
}