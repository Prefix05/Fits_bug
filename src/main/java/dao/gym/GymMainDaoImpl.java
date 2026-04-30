package dao.gym;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Gym;
import dto.gym.HotTime;
import util.MybatisSqlSessionFactory;

public class GymMainDaoImpl implements GymMainDao {
	
	@Override
	public Gym selectGymMainInfo(int gymId) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne("mapper.gymMain.selectGymMainInfo", gymId);
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public HotTime selectTodayHotTime(Map<String, Object> param) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne("mapper.gymMain.selectTodayHotTime", param);
		}finally{
			sqlSession.close();
		}
	}

}
