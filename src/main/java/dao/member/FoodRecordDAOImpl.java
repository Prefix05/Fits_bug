package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.member.FoodRecordDTO;
import util.MybatisSqlSessionFactory;

public class FoodRecordDAOImpl implements FoodRecordDAO {

    @Override
    public int insert(FoodRecordDTO dto) {
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
    public List<FoodRecordDTO> findByEmail(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<FoodRecordDTO> list = null;
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
    public List<FoodRecordDTO> getRecords(String email) {
        return findByEmail(email);
    }
}
