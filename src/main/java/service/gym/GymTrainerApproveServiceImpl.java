package service.gym;

import java.util.List;

import dao.gym.GymTrainerApproveDao;
import dao.gym.GymTrainerApproveDaoImpl;
import dto.gym.TrainerApprove;

public class GymTrainerApproveServiceImpl implements GymTrainerApproveService{
	private GymTrainerApproveDao dao = new GymTrainerApproveDaoImpl();
	
	@Override
	public List<TrainerApprove> selectPendingTrainerList(int gymId) throws Exception {
		return dao.selectPendingTrainerList(gymId);
	}

	@Override
	public void approveTrainer(int trainerId, int gymId) throws Exception {
		dao.approveTrainer(trainerId, gymId);
	}

	@Override
	public List<TrainerApprove> selectApprovedTrainerList(int gymId) throws Exception {
		return dao.selectApprovedTrainerList(gymId);
	}

}
