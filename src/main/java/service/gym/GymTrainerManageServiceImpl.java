package service.gym;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.gym.trainerManage.TrainerManageDao;
import dao.gym.trainerManage.TrainerManageDaoImpl;
import dto.gym.TrainerAssign;
import dto.gym.TrainerList;
import dto.gym.TrainerMemberView;

public class GymTrainerManageServiceImpl implements GymTrainerManageService {

	private TrainerManageDao dao = new TrainerManageDaoImpl();

    @Override
    public List<TrainerMemberView> getCurrentMembers(int trainerId) {
        return dao.selectCurrentMembers(trainerId);
    }

    @Override
    public List<TrainerMemberView> getPastMembers(int trainerId) {
        return dao.selectPastMembers(trainerId);
    }

    @Override
    public List<TrainerMemberView> getMembers(int trainerId, String type) {
        if ("past".equals(type)) {
            return getPastMembers(trainerId);
        }

        return getCurrentMembers(trainerId);
    }

	@Override
	public List<TrainerList> getTrainerList(int gymId, String keyword) {
		Map<String, Object> param = new HashMap<>();
        param.put("gymId", gymId);
        param.put("keyword", keyword);

        return dao.selectTrainerList(param);
	}

	@Override
	public List<TrainerAssign> getTrainerAssignList(int gymId) {
		return dao.selectTrainerAssignList(gymId);
	}

}
