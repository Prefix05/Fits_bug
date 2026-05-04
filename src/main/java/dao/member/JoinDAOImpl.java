package dao.member;

import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;
import java.util.HashMap;
import java.util.Map;

public class JoinDAOImpl implements JoinDAO {

    @Override
    public void insert(String id, String pw, String role) {
        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        try {
            Map<String, String> param = new HashMap<>();
            param.put("id",   id);
            param.put("pw",   pw);
            param.put("role", role);
            sqlSession.insert("mapper.MemberMapper.insertMember", param);
            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }
}
