package service.member;

import dao.member.UserDAO;
import dao.member.UserDAOImpl;
import dto.member.UserDTO;

import java.util.List;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO = new UserDAOImpl();

    // ─── 일반 회원가입 ───────────────────────────────────────────
    @Override
    public int register(UserDTO dto) {
        // 이메일 중복 체크
        if (userDAO.isEmailExists(dto.getEmail())) {
            return 0;
        }
        // role 기본값 설정
        if (dto.getRole() == null || dto.getRole().isEmpty()) {
            dto.setRole("MEMBER");
        }
        return userDAO.insert(dto);
    }

    // ─── 소셜 회원가입 ───────────────────────────────────────────
    @Override
    public int registerSocial(UserDTO dto) {
        // 이미 가입된 소셜 계정이면 skip
        if (userDAO.findByEmail(dto.getEmail()) != null) {
            return 0;
        }
        dto.setRole("MEMBER");
        return userDAO.insertSocial(dto);
    }

    // ─── 로그인 ──────────────────────────────────────────────────
    @Override
    public UserDTO login(String email, String password) {
        UserDTO user = userDAO.findByEmailAndPassword(email, password);
        if (user != null && !user.isDeleted()) {
            return user;
        }
        return null;
    }

    // ─── 이메일 중복 체크 ─────────────────────────────────────────
    @Override
    public boolean isEmailExists(String email) {
        if (email == null || email.trim().isEmpty()) return false;
        return userDAO.isEmailExists(email);
    }

    // ─── 이메일로 조회 ───────────────────────────────────────────
    @Override
    public UserDTO findByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    // ─── 전체 조회 ───────────────────────────────────────────────
    @Override
    public List<UserDTO> findAll() {
        return userDAO.findAll();
    }

    // ─── 정보 수정 ───────────────────────────────────────────────
    @Override
    public int update(UserDTO dto) {
        return userDAO.update(dto);
    }

    // ─── 비밀번호 변경 ────────────────────────────────────────────
    @Override
    public int updatePassword(String email, String password) {
        return userDAO.updatePassword(email, password);
    }

    // ─── 탈퇴 ────────────────────────────────────────────────────
    @Override
    public int delete(int id) {
        return userDAO.delete(id);
    }
}
