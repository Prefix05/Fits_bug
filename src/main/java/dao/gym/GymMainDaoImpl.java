package dao.gym;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Gym;
import util.MyBatisSqlSessionFactory;

public class GymMainDaoImpl implements GymMainDao {
	private SqlSession sqlSession;
	
	public GymMainDaoImpl() {
		sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	@Override
	public Gym selectGymMainInfo(int gymId) throws Exception {
		return sqlSession.selectOne("mapper.main.selectGymMainInfo", gymId);
	}

}
