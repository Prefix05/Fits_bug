package dao.member;

import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;
import java.util.HashMap;
import java.util.Map;

public class PostReactionDAOImpl implements PostReactionDAO {

    @Override
    public int addReaction(int postId, String userId, String type) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            Map<String, Object> param = new HashMap<>();
            param.put("postId", postId);
            param.put("userId", userId);
            param.put("type",   type);
            result = sqlSession.insert("mapper.PostReactionMapper.addReaction", param);
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
    public int getReactionCount(int postId, String type) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            Map<String, Object> param = new HashMap<>();
            param.put("postId", postId);
            param.put("type",   type);
            result = sqlSession.selectOne("mapper.PostReactionMapper.getReactionCount", param);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        return result;
    }
}
