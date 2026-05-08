package dao.member;

import org.apache.ibatis.session.SqlSession;
import dto.member.MemberDTO;
import dto.member.UserDTO;
import util.MybatisSqlSessionFactory;

public class MyPageDAOImpl implements MyPageDAO {

    private static final String USER_NS   = "mapper.UserMapper.";
    private static final String MEMBER_NS = "mapper.MemberMapper.";

    /** USER 테이블 조회 */
    @Override
    public UserDTO selectUser(String email) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        UserDTO result = null;
        try {
            result = session.selectOne(USER_NS + "findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public MemberDTO selectMember(String email) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        MemberDTO result = null;
        try {
            result = session.selectOne(MEMBER_NS + "findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    /** USER 기본 정보 수정 */
    @Override
    public void updateUser(UserDTO user) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            session.update(USER_NS + "update", user);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    @Override
    public void updateMemberPlan(MemberDTO member) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            session.update(MEMBER_NS + "updatePlan", member);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    /** 프로필 이미지 수정 */
    @Override
    public void updateProfileImg(UserDTO user) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            session.update(MEMBER_NS + "updateProfileImage", user);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
