package dao.member;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import dto.member.UserDTO;
import util.MybatisSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAOImpl implements UserDAO {

    private static final String NS = "mapper.UserMapper.";
    private SqlSessionFactory factory = MybatisSqlSessionFactory.getSqlSessionFactory();

    // ─── 회원가입 ────────────────────────────────────────────────
    @Override
    public int insert(UserDTO dto) {
        SqlSession session = factory.openSession();
        int result = 0;
        try {
            result = session.insert(NS + "insert", dto);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    // ─── 소셜 회원가입 (카카오/네이버) ───────────────────────────
    @Override
    public int insertSocial(UserDTO dto) {
        SqlSession session = factory.openSession();
        int result = 0;
        try {
            result = session.insert(NS + "insertSocial", dto);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    // ─── 로그인 (email + password) ───────────────────────────────
    @Override
    public UserDTO findByEmailAndPassword(String email, String password) {
        SqlSession session = factory.openSession();
        UserDTO user = null;
        try {
            Map<String, String> param = new HashMap<>();
            param.put("email",    email);
            param.put("password", password);
            user = session.selectOne(NS + "findByEmailAndPassword", param);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }

    // ─── 이메일로 조회 ───────────────────────────────────────────
    @Override
    public UserDTO findByEmail(String email) {
        SqlSession session = factory.openSession();
        UserDTO user = null;
        try {
            user = session.selectOne(NS + "findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }

    // ─── 이메일 중복 체크 ─────────────────────────────────────────
    @Override
    public boolean isEmailExists(String email) {
        SqlSession session = factory.openSession();
        boolean result = false;
        try {
            int count = session.selectOne(NS + "isEmailExists", email);
            result = count > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    // ─── 전체 조회 (관리자) ───────────────────────────────────────
    @Override
    public List<UserDTO> findAll() {
        SqlSession session = factory.openSession();
        List<UserDTO> list = null;
        try {
            list = session.selectList(NS + "findAll");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    // ─── 회원 정보 수정 ──────────────────────────────────────────
    @Override
    public int update(UserDTO dto) {
        SqlSession session = factory.openSession();
        int result = 0;
        try {
            result = session.update(NS + "update", dto);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    // ─── 비밀번호 변경 ────────────────────────────────────────────
    @Override
    public int updatePassword(String email, String password) {
        SqlSession session = factory.openSession();
        int result = 0;
        try {
            Map<String, String> param = new HashMap<>();
            param.put("email",    email);
            param.put("password", password);
            result = session.update(NS + "updatePassword", param);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    // ─── 회원 탈퇴 (soft delete) ─────────────────────────────────
    @Override
    public int delete(int id) {
        SqlSession session = factory.openSession();
        int result = 0;
        try {
            result = session.update(NS + "delete", id);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }
}
