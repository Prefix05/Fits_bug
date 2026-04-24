package dao.gym.main;

import java.util.List;

import dto.gym.GymTrainerView;

public interface GymMainTrainerViewDao {
	List<GymTrainerView> selectGymTrainerViewBtGym(int gymId) throws Exception;
}
