package service;

import dto.MemberDTO;
import dao.MemberDAO;

public class MemberService {
    private MemberDAO memberDAO;

    public MemberDTO login(MemberDTO memberDTO) {
        // 추가적인 비즈니스 로직이 있다면 여기서 처리 (예: 암호화된 비밀번호 비교 등)
        return memberDAO.loginCheck(memberDTO);
    }
}