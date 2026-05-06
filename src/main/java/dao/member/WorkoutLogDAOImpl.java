package dao.member;

import org.apache.ibatis.session.SqlSession;
import dto.member.WorkoutLogDTO;
import util.MybatisSqlSessionFactory;
import java.util.List;

public class WorkoutLogDAOImpl implements WorkoutLogDAO {

    private static final String NS = "mapper.WorkoutLogMapper.";

    @Override
    public int insert(WorkoutLogDTO dto) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = session.insert(NS + "insert", dto);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public List<WorkoutLogDTO> findByMemberId(int memberId) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<WorkoutLogDTO> list = null;
        try {
            list = session.selectList(NS + "findByMemberId", memberId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    @Override
    public List<WorkoutLogDTO> findByEmail(String email) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<WorkoutLogDTO> list = null;
        try {
            list = session.selectList(NS + "findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
}
