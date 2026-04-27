package dao.gym;

import org.apache.ibatis.session.SqlSession;

import dao.gym.main.GymMainDao;
import dto.gym.Gym;
import util.MybatisSqlSessionFactory;

public class GymMainDaoImpl implements GymMainDao {
	private SqlSession sqlSession;
	
	public GymMainDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	@Override
	public Gym selectGymMainInfo(int gymId) throws Exception {
		return sqlSession.selectOne("mapper.main.selectGymMainInfo", gymId);
	}

}
