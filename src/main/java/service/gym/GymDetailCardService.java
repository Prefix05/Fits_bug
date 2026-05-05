package service.gym;

import dto.gym.Gym;

public interface GymDetailCardService {
	Gym getGymDetailCard(int gymId) throws Exception;
}
