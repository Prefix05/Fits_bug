package dao.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.member.MessageDTO;
import dto.member.MessageRoomDTO;
import util.MybatisSqlSessionFactory;

public class MessageDAOImpl implements MessageDAO {

    @Override
    public void insert(MessageDTO dto) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            sqlSession.insert("mapper.MessageMapper.insert", dto);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }

    @Override
    public List<MessageDTO> getChatList(String sender, String receiver) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<MessageDTO> list = null;
        try {
            Map<String, String> param = new HashMap<>();
            param.put("sender",   sender);
            param.put("receiver", receiver);
            list = sqlSession.selectList("mapper.MessageMapper.getChatList", param);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return list;
    }

    @Override
    public void updateRead(int messageId) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            sqlSession.update("mapper.MessageMapper.updateRead", messageId);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }

    @Override
    public int getUnreadCount(String receiver) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = sqlSession.selectOne("mapper.MessageMapper.getUnreadCount", receiver);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }

    @Override
    public void markAsRead(String sender, String receiver) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            Map<String, String> param = new HashMap<>();
            param.put("sender",   sender);
            param.put("receiver", receiver);
            sqlSession.update("mapper.MessageMapper.markAsRead", param);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }

    @Override
    public List<MessageRoomDTO> getMessageRoomList(String email) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<MessageRoomDTO> list = null;
        try {
            list = sqlSession.selectList("mapper.MessageMapper.getMessageRoomList", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return list;
    }
}
