package dao.member;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import dto.member.MemberDTO;
import util.MybatisSqlSessionFactory;

import java.util.List;

public class MemberDAOImpl implements MemberDAO {

    private static final String NS = "mapper.MemberMapper.";
    private SqlSessionFactory factory = MybatisSqlSessionFactory.getSqlSessionFactory();

    // ─── MEMBER INSERT ───────────────────────────────────────────
    @Override
    public int insertMember(MemberDTO dto) {
        SqlSession session = factory.openSession();
        int result = 0;
        try {
            result = session.insert(NS + "insertMember", dto);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    // ─── USER.id로 MEMBER 조회 ───────────────────────────────────
    @Override
    public MemberDTO findByUserId(int userId) {
        SqlSession session = factory.openSession();
        MemberDTO result = null;
        try {
            result = session.selectOne(NS + "findByUserId", userId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    // ─── MEMBER.id로 조회 ─────────────────────────────────────────
    @Override
    public MemberDTO findById(int id) {
        SqlSession session = factory.openSession();
        MemberDTO result = null;
        try {
            result = session.selectOne(NS + "findById", id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    // ─── 이메일로 MEMBER + USER JOIN 조회 ────────────────────────
    @Override
    public MemberDTO findByEmail(String email) {
        SqlSession session = factory.openSession();
        MemberDTO result = null;
        try {
            result = session.selectOne(NS + "findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    // ─── 이메일로 MEMBER.id 조회 ─────────────────────────────────
    @Override
    public int findMemberIdByEmail(String email) {
        SqlSession session = factory.openSession();
        Integer result = null;
        try {
            result = session.selectOne(NS + "findMemberIdByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result == null ? 0 : result;
    }

    // ─── MEMBER 수정 ─────────────────────────────────────────────
    @Override
    public int update(MemberDTO dto) {
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

    // ─── trainer_id로 회원 목록 ──────────────────────────────────
    @Override
    public List<MemberDTO> findByTrainerId(int trainerId) {
        SqlSession session = factory.openSession();
        List<MemberDTO> list = null;
        try {
            list = session.selectList(NS + "findByTrainerId", trainerId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    // ─── gym_id로 회원 목록 ──────────────────────────────────────
    @Override
    public List<MemberDTO> findByGymId(int gymId) {
        SqlSession session = factory.openSession();
        List<MemberDTO> list = null;
        try {
            list = session.selectList(NS + "findByGymId", gymId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
}
