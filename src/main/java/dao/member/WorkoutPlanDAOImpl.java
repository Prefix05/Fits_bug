package dao.member;

import org.apache.ibatis.session.SqlSession;

import dto.member.WorkoutPlanDTO;
import util.MybatisSqlSessionFactory;

public class WorkoutPlanDAOImpl implements WorkoutPlanDAO {

    @Override
    public WorkoutPlanDTO getPlan(String email) {
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
    public int savePlan(WorkoutPlanDTO plan) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.insert("mapper.WorkoutPlanMapper.savePlan", plan);
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
    public boolean update(WorkoutPlanDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        boolean result = false;
        try {
            int cnt = sqlSession.update("mapper.WorkoutPlanMapper.update", dto);
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
