package dao.member;

import dto.member.UserDTO;
import java.util.List;

public interface UserDAO {

    // 회원가입 (USER 테이블 INSERT)
    int insert(UserDTO dto);

    // 소셜 회원가입 (카카오/네이버)
    int insertSocial(UserDTO dto);

    // 로그인 (email + password)
    UserDTO findByEmailAndPassword(String email, String password);

    // 이메일로 조회 (중복체크 / 소셜로그인 확인)
    UserDTO findByEmail(String email);

    // 이메일 중복 체크 (COUNT)
    boolean isEmailExists(String email);

    // 전체 조회 (관리자용)
    List<UserDTO> findAll();

    // 회원 정보 수정
    int update(UserDTO dto);

    // 비밀번호 변경
    int updatePassword(String email, String password);

    // 회원 탈퇴 (soft delete)
    int delete(int id);
}
