package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.member.WorkoutLogDTO;
import util.MybatisSqlSessionFactory;

public class WorkoutRecordDAOImpl implements WorkoutRecordDAO {

    @Override
    public int insertRecord(WorkoutLogDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.insert("mapper.WorkoutRecordMapper.insertRecord", dto);
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
    public List<WorkoutLogDTO> getRecords(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<WorkoutLogDTO> list = null;
        try {
            list = sqlSession.selectList("mapper.WorkoutRecordMapper.getRecords", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return list;
    }
}
