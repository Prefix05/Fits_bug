package service;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.MemberDTO;

public class MemberServiceImpl implements MemberService {

    private MemberDAO dao = new MemberDAOImpl(); // ⭐ 핵심 수정

    @Override
    public int join(MemberDTO m){
        return dao.insertMember(m);
    }

    @Override
    public MemberDTO login(String email, String password){
        return dao.login(email, password);
    }
}