package dao.gym.main;

import dto.gym.Gym;

public interface GymMainDao {
	Gym selectGymMainInfo(int gymId) throws Exception;
}
