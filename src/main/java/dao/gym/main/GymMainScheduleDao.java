package dao.gym.main;

import dto.gym.Schedule;

public interface GymMainScheduleDao {
	Schedule selectScheduleByGym(int gymNum) throws Exception;
}
