package dao.gym.main;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Gym;
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

}
