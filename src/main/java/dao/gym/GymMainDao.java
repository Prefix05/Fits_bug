package dao;

import dto.Gym;

public interface GymMainDao {
	Gym selectGymMainInfo(int gymId) throws Exception;
}
