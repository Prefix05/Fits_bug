package service.gym;

import java.util.List;

import dto.gym.TrainerApprove;

public interface GymTrainerApproveService {
	List<TrainerApprove> selectPendingTrainerList(int gymId) throws Exception;
    void approveTrainer(int trainerId) throws Exception;
    List<TrainerApprove> selectApprovedTrainerList(int gymId) throws Exception;
}
