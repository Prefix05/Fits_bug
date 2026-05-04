package dao.member;

import org.apache.ibatis.session.SqlSession;

import dto.member.MemberDTO;
import util.MybatisSqlSessionFactory;

public class MemberDAOImpl implements MemberDAO {

    @Override
    public int insertMember(MemberDTO member) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.insert("mapper.MemberMapper.insertMember", member);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }

    @Override
    public MemberDTO login(String email, String password) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        MemberDTO result = null;
        try {
            MemberDTO param = new MemberDTO();
            param.setEmail(email);
            param.setPassword(password);
            result = sqlSession.selectOne("mapper.MemberMapper.loginCheck", param);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }

    @Override
    public boolean isEmailExists(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        boolean result = false;
        try {
            int count = sqlSession.selectOne("mapper.MemberMapper.isEmailExists", email);
            result = count > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }

    @Override
    public MemberDTO findByEmail(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        MemberDTO result = null;
        try {
            result = sqlSession.selectOne("mapper.MemberMapper.findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }

    @Override
    public void insertKakaoUser(MemberDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            sqlSession.insert("mapper.MemberMapper.insertKakaoUser", dto);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }

    @Override
    public MemberDTO loginCheck(MemberDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        MemberDTO result = null;
        try {
            result = sqlSession.selectOne("mapper.MemberMapper.loginCheck", dto);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }

    @Override
    public String getNicknameByEmail(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        String result = null;
        try {
            result = sqlSession.selectOne("mapper.MemberMapper.getNicknameByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }

    @Override
    public boolean update(MemberDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        boolean result = false;
        try {
            int cnt = sqlSession.update("mapper.MemberMapper.update", dto);
            sqlSession.commit();
            result = cnt > 0;
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }
}
