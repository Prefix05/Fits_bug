package dao;

import java.util.List;

import dto.GymTrainerView;

public interface GymTrainerViewDao {
	List<GymTrainerView> selectGymTrainerViewBtGym(int gymId) throws Exception;
}
