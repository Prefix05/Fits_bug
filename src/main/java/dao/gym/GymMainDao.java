package dao.gym;

import dto.gym.Gym;

public interface GymMainDao {
	Gym selectGymMainInfo(int gymId) throws Exception;
}
