package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.member.MealLogDTO;
import util.MybatisSqlSessionFactory;

public class FoodRecordDAOImpl implements FoodRecordDAO {

    @Override
    public int insert(MealLogDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.insert("mapper.FoodRecordMapper.insert", dto);
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
    public List<MealLogDTO> findByEmail(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<MealLogDTO> list = null;
        try {
            list = sqlSession.selectList("mapper.FoodRecordMapper.findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return list;
    }

    @Override
    public List<MealLogDTO> getRecords(String email) {
        return findByEmail(email);
    }
}
