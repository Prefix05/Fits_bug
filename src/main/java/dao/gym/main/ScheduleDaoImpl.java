package dao.gym.main;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Schedule;
import util.MybatisSqlSessionFactory;

public class ScheduleDaoImpl implements ScheduleDao {
	
	@Override
	public Schedule selectScheduleByGym(int gymNum) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne("mapper.schedule.selectScheduleByGym", gymNum);
		}finally{
			sqlSession.close();
		}
	}

}
