package service.gym;

import dao.gym.GymDetailCardDao;
import dao.gym.GymDetailCardDaoImpl;
import dto.gym.Gym;

public class GymDetailCardServiceImpl implements GymDetailCardService {
	private GymDetailCardDao gymDetailCardDao = new GymDetailCardDaoImpl();
	@Override
	public Gym getGymDetailCard(int gymId) throws Exception {
		return gymDetailCardDao.selectGymDetailCard(gymId);
	}

}
