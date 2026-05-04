package service.member;

import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dto.member.MemberDTO;

public class MemberServiceImpl implements MemberService {

    private MemberDAO dao = new MemberDAOImpl();

    @Override
    public int join(MemberDTO m){
        return dao.insertMember(m);
    }

    @Override
    public MemberDTO login(String email, String password){
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