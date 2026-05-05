package service.member;

import dto.member.UserDTO;
import java.util.List;

public interface UserService {

    // 회원가입 (일반)
    int register(UserDTO dto);

    // 소셜 회원가입 (카카오/네이버)
    int registerSocial(UserDTO dto);

    // 로그인
    UserDTO login(String email, String password);

    // 이메일 중복 체크
    boolean isEmailExists(String email);

    // 이메일로 조회
    UserDTO findByEmail(String email);

    // 전체 조회 (관리자용)
    List<UserDTO> findAll();

    // 정보 수정
    int update(UserDTO dto);

    // 비밀번호 변경
    int updatePassword(String email, String password);

    // 탈퇴
    int delete(int id);
}
