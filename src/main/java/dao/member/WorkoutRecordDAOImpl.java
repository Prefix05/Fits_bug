package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.member.WorkoutRecordDTO;
import util.MybatisSqlSessionFactory;

public class WorkoutRecordDAOImpl implements WorkoutRecordDAO {

    @Override
    public int insertRecord(WorkoutRecordDTO dto) {
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
    public List<WorkoutRecordDTO> getRecords(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<WorkoutRecordDTO> list = null;
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
