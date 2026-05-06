package dao.gym;

import org.apache.ibatis.session.SqlSession;

import dto.gym.Gym;
import util.MybatisSqlSessionFactory;

public class GymDetailCardDaoImpl implements GymDetailCardDao {

	@Override
	public Gym selectGymDetailCard(int gymId) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne("mapper.gymDetailCard.selectGymDetailCard", gymId);
		}finally{
			sqlSession.close();
		}
	}

	

}
