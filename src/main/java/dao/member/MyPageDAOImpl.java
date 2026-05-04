package dao.member;

import org.apache.ibatis.session.SqlSession;

import dto.member.MemberDTO;
import dto.member.WorkoutPlanDTO;
import util.MybatisSqlSessionFactory;

public class MyPageDAOImpl implements MyPageDAO {

    @Override
    public MemberDTO selectMember(String email) {
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
    public WorkoutPlanDTO selectWorkoutPlan(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        WorkoutPlanDTO result = null;
        try {
            result = sqlSession.selectOne("mapper.WorkoutPlanMapper.getPlan", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }

    @Override
    public void updateMember(MemberDTO member) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            sqlSession.update("mapper.MemberMapper.update", member);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }

    @Override
    public void updateWorkoutPlan(WorkoutPlanDTO plan) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            sqlSession.update("mapper.WorkoutPlanMapper.update", plan);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }

    @Override
    public void updateProfileImg(MemberDTO member) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            sqlSession.update("mapper.MemberMapper.updateProfileImage", member);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }
}
