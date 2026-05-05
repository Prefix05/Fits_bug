package dao.gym;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.gym.TrainerApprove;
import util.MybatisSqlSessionFactory;

public class GymTrainerApproveDaoImpl implements GymTrainerApproveDao{

	@Override
	public List<TrainerApprove> selectPendingTrainerList(int gymId) throws Exception {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return session.selectList("mapper.trainerApprove.selectPendingTrainerList", gymId);
		}finally {
			session.close();
		}
	}

	@Override
	public void approveTrainer(int trainerId, int gymId) throws Exception {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	    try {
	        Map<String, Object> param = new HashMap<>();
	        param.put("trainerId", trainerId);
	        param.put("gymId", gymId);

	        session.update("mapper.trainerApprove.approveTrainer", param);
	        session.commit();

	    } catch (Exception e) {
	        session.rollback();
	        throw e;

	    } finally {
	        session.close();
	    }
		
	}

	@Override
	public List<TrainerApprove> selectApprovedTrainerList(int gymId) throws Exception {
		SqlSession session = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
		try {
			return session.selectList("mapper.trainerApprove.selectApprovedTrainerList", gymId);
		}finally {
			session.close();
		}
	}
	
}
