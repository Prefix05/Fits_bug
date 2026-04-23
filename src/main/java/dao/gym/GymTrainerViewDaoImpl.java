package dao.gym;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.gym.GymTrainerView;
import util.MyBatisSqlSessionFactory;

public class GymTrainerViewDaoImpl implements GymTrainerViewDao {
	private SqlSession sqlSession;
	
	public GymTrainerViewDaoImpl() {
		sqlSession = MyBatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public List<GymTrainerView> selectGymTrainerViewBtGym(int gymId) throws Exception {
		return sqlSession.selectList("mapper.trainerView.selectTrainerViewByGym", gymId);
	}

}
