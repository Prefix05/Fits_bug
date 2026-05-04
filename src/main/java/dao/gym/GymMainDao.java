package dao.gym;

import java.util.Map;

import dto.gym.Gym;
import dto.gym.HotTime;

public interface GymMainDao {
	Gym selectGymMainInfo(int gymId) throws Exception;
	HotTime selectTodayHotTime(Map<String, Object> param) throws Exception;
}
