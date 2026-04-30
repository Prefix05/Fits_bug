package dao.member;

import dto.member.LoginDTO;

public interface LoginDAO {
	// 회원가입
	int insertMember(LoginDTO member);
	
    // 로그인
    LoginDTO login(String email, String password);

    // 이메일 중복 체크
    boolean isEmailExists(String email);

    // 카카오 회원 가입
    void insertKakaoUser(LoginDTO dto);
    
    // 로그인 체크
    LoginDTO loginCheck(LoginDTO dto);
    
    // 회원 조회
    LoginDTO findByEmail(String email);
    
    // 이메일로 닉네임 조회
    String getNicknameByEmail(String email);
    
    boolean update(LoginDTO dto);
    
}