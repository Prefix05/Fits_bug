package dao.gym.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.gym.GymTrainerView;
import util.MybatisSqlSessionFactory;

public class GymTrainerViewDaoImpl implements GymTrainerViewDao {
	
	@Override
	public List<GymTrainerView> selectGymTrainerViewBtGym(int gymId) throws Exception {
		SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList("mapper.trainerView.selectTrainerViewByGym", gymId);
		}finally{
			sqlSession.close();
		}
	}

}
