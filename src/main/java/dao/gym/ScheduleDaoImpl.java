package dao.gym;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Schedule;
import util.MybatisSqlSessionFactory;

public class ScheduleDaoImpl implements ScheduleDao {
	private SqlSession sqlSession;
	
	public ScheduleDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public Schedule selectScheduleByGym(int gymNum) throws Exception {
		return sqlSession.selectOne("mapper.schedule.selectScheduleByGym", gymNum);
	}

}
