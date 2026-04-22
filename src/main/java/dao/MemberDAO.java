package dao;

import dto.MemberDTO;

public interface MemberDAO {
	// 회원가입
	int insertMember(MemberDTO member);
	
    // 로그인
    MemberDTO login(String email, String password);

    // 이메일 중복 체크
    boolean isEmailExists(String email);

    // 카카오 회원 가입
    void insertKakaoUser(MemberDTO dto);
    
    // 로그인 체크
    MemberDTO loginCheck(MemberDTO dto);
    
    // 회원 조회
    MemberDTO findByEmail(String email);
    
}