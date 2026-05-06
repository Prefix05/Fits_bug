package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.member.SupportDTO;
import util.MybatisSqlSessionFactory;

public class SupportDAOImpl implements SupportDAO {

    @Override
    public void insertSupport(SupportDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            sqlSession.insert("mapper.member.InquiryMapper.insertSupport", dto);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }

    @Override
    public List<SupportDTO> selectByEmail(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<SupportDTO> list = null;
        try {
            list = sqlSession.selectList("mapper.member.InquiryMapper.selectByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return list;
    }
}
