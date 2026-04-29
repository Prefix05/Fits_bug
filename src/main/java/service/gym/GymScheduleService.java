package service.gym;

import java.util.Map;

public interface GymScheduleService {
	Map<String, Object> getSchedulePageData(int gymId) throws Exception;
}
