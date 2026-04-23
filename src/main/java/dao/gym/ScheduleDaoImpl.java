package dao;

import org.apache.ibatis.session.SqlSession;

import dto.Schedule;
import util.MyBatisSqlSessionFactory;

public class ScheduleDaoImpl implements ScheduleDao {
	private SqlSession sqlSession;
	
	public ScheduleDaoImpl() {
		sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public Schedule selectScheduleByGym(int gymNum) throws Exception {
		return sqlSession.selectOne("mapper.schedule.selectScheduleByGym", gymNum);
	}

}
