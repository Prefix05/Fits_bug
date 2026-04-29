package dao.gym;

import java.util.List;
import java.util.Map;

import dto.gym.TrainerAssign;
import dto.gym.TrainerList;
import dto.gym.TrainerMemberView;

public interface TrainerManageDao {
	List<TrainerList> selectTrainerList(Map<String, Object> param);
    List<TrainerAssign> selectTrainerAssignList(int gymId);
	List<TrainerMemberView> selectCurrentMembers(int trainerId);
	List<TrainerMemberView> selectPastMembers(int trainerId);
}
