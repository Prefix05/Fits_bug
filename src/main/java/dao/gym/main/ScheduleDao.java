package dao.gym.main;

import dto.gym.Schedule;

public interface ScheduleDao {
	Schedule selectScheduleByGym(int gymNum) throws Exception;
}
