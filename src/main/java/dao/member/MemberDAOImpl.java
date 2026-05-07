package dao.member;

import org.apache.ibatis.session.SqlSession;
import dto.member.MemberDTO;
import util.MybatisSqlSessionFactory;
import java.util.List;

public class MemberDAOImpl implements MemberDAO {

    private static final String NS = "mapper.MemberMapper.";

    @Override
    public int insertMember(MemberDTO dto) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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

    @Override
    public MemberDTO findByUserId(int userId) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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

    @Override
    public MemberDTO findById(int id) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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

    @Override
    public MemberDTO findByEmail(String email) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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

    @Override
    public int findMemberIdByEmail(String email) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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

    @Override
    public int update(MemberDTO dto) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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

    @Override
    public List<MemberDTO> findByTrainerId(int trainerId) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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

    @Override
    public List<MemberDTO> findByGymId(int gymId) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
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

	@Override
	public MemberDTO selectMemberByUserId(Integer userId) throws Exception {
		MemberDTO memberDto = null;
		try (SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {

			memberDto = sqlSession.selectOne("mapper.MemberMapper.selectMemberByUserId", userId);
		}
		return memberDto;
	}
}