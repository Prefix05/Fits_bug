package dao;

import dto.Schedule;

public interface ScheduleDao {
	Schedule selectScheduleByGym(int gymNum) throws Exception;
}
