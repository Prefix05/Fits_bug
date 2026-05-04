package dao.member;

import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

public class MembershipDAOImpl implements MembershipDAO {

    @Override
    public void decreaseCount(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            sqlSession.update("mapper.MembershipMapper.decreaseCount", email);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }
}
