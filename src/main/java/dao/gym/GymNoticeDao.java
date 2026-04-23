package dao;

import java.util.List;

import dto.GymNotice;

public interface GymNoticeDao {
	List<GymNotice> selectRecentNoticeByGym(int gymId) throws Exception;
}
