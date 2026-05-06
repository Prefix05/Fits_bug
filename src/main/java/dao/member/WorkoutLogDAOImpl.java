package dao.member;

import org.apache.ibatis.session.SqlSession;
import dto.member.WorkoutDetailDTO;
import dto.member.WorkoutLogDTO;
import util.MybatisSqlSessionFactory;

import java.util.ArrayList;
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
    public int insertWithDetails(WorkoutLogDTO dto) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        int result = 0;
        try {
            result = session.insert(NS + "insert", dto);

            if (result > 0 && dto.getDetails() != null) {
                for (WorkoutDetailDTO detail : dto.getDetails()) {
                    detail.setWorkoutId(dto.getId()); // 생성된 workout_id 세팅
                    session.insert(NS + "insertDetail", detail);
                }
            }

            session.commit();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
            result = 0;
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public List<WorkoutLogDTO> findByMemberId(int memberId) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<WorkoutLogDTO> list = new ArrayList<>();
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
        List<WorkoutLogDTO> list = new ArrayList<>();
        try {
            list = session.selectList(NS + "findByEmail", email);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    // ✅ 오늘 날짜 기록만 조회
    @Override
    public List<WorkoutLogDTO> findTodayByMemberId(int memberId) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
        List<WorkoutLogDTO> list = new ArrayList<>();
        try {
            list = session.selectList(NS + "findTodayByMemberId", memberId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
}
