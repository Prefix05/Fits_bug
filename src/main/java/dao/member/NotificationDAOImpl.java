package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.member.NotificationDTO;
import util.MybatisSqlSessionFactory;

public class NotificationDAOImpl implements NotificationDAO {

    @Override
    public List<NotificationDTO> findByEmail(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<NotificationDTO> list = null;
        try {
            list = sqlSession.selectList("mapper.NotificationMapper.findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return list;
    }

    @Override
    public int countUnread(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.selectOne("mapper.NotificationMapper.countUnread", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }

    @Override
    public int insert(NotificationDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.insert("mapper.NotificationMapper.insert", dto);
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
    public int updateReadAll(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.update("mapper.NotificationMapper.updateReadAll", email);
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
    public int updateReadOne(int id) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.update("mapper.NotificationMapper.updateReadOne", id);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }
}
