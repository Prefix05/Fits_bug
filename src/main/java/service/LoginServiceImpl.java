package service;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.MemberDTO;

public class LoginServiceImpl implements LoginService {

    private MemberDAO dao = new MemberDAOImpl();

    @Override
    public MemberDTO login(String email, String password) {
        return dao.login(email, password);
    }
}