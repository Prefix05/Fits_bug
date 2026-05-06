package dao.gym;

import dto.gym.Gym;

public interface GymDetailCardDao {
	Gym selectGymDetailCard(int gymId) throws Exception;
}
