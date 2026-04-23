package dao.gym;

import java.util.List;

import dto.gym.GymNotice;

public interface GymNoticeDao {
	List<GymNotice> selectRecentNoticeByGym(int gymId) throws Exception;
}
