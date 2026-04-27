package service.gym;

import java.util.List;

import dto.gym.TrainerAssign;
import dto.gym.TrainerList;
import dto.gym.TrainerMemberView;

public interface GymTrainerManageService {
	List<TrainerList> getTrainerList(int gymId, String keyword);
    List<TrainerAssign> getTrainerAssignList(int gymId);
	List<TrainerMemberView> getCurrentMembers(int trainerId);
    List<TrainerMemberView> getPastMembers(int trainerId);
    List<TrainerMemberView> getMembers(int trainerId, String type);
}
