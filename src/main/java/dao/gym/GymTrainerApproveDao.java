package dao.gym;

import java.util.List;

import dto.gym.TrainerApprove;

public interface GymTrainerApproveDao {
	List<TrainerApprove> selectPendingTrainerList(int gymId) throws Exception;
    void approveTrainer(int trainerId, int gymId) throws Exception;
    List<TrainerApprove> selectApprovedTrainerList(int gymId) throws Exception;
}
