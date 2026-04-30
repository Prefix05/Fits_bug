package service.member;

import dao.member.LoginDAO;
import dao.member.LoginDAOImpl;
import dto.member.LoginDTO;

public class LoginServiceImpl implements LoginService {

    private LoginDAO dao = new LoginDAOImpl();

    @Override
    public LoginDTO login(String email, String password) {
        return dao.login(email, password);
    }
}