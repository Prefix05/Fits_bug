package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.member.InbodyRecordDTO;
import util.MybatisSqlSessionFactory;

public class InbodyRecordDAOImpl implements InbodyRecordDAO {

    @Override
    public int insert(InbodyRecordDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.insert("mapper.InbodyRecordMapper.insert", dto);
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
    public List<InbodyRecordDTO> findByEmail(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<InbodyRecordDTO> list = null;
        try {
            list = sqlSession.selectList("mapper.InbodyRecordMapper.findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return list;
    }

    @Override
    public List<InbodyRecordDTO> getRecords(String email) {
        return findByEmail(email);
    }
}
