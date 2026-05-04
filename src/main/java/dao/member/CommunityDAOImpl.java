package dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.member.CommunityDTO;
import util.MybatisSqlSessionFactory;

public class CommunityDAOImpl implements CommunityDAO {

    @Override
    public List<CommunityDTO> selectAll() {

        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<CommunityDTO> list = null;

        try {
            list = sqlSession.selectList("mapper.CommunityMapper.selectAll");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }

        return list;
    }

    @Override
    public CommunityDTO selectById(int id) {

        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        CommunityDTO dto = null;

        try {
            dto = sqlSession.selectOne("mapper.CommunityMapper.selectById", id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }

        return dto;
    }
}