package dao.gym;

import java.util.List;

import dto.gym.GymTrainerView;

public interface GymTrainerViewDao {
	List<GymTrainerView> selectGymTrainerViewBtGym(int gymId) throws Exception;
}
