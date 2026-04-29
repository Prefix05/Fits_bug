package dao.gym;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.gym.GymTrainerView;
import util.MybatisSqlSessionFactory;

public class GymMainTrainerViewDaoImpl implements GymMainTrainerViewDao {
	
	@Override
	public List<GymTrainerView> selectGymTrainerViewByGym(int gymId) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList("mapper.trainerView.selectTrainerViewByGym", gymId);
		}finally{
			sqlSession.close();
		}
	}

}
