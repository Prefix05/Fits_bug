package dao.gym.notice;

import java.util.List;
import java.util.Map;

import dto.gym.GymNotice;

public interface GymNoticeDao {
	int selectNoticeCount(int gymId) throws Exception;
	List<GymNotice> selectNoticeList(Map<String, Object> param) throws Exception;
	GymNotice selectNoticeDetail(int id) throws Exception;
	void updateViewCount(int id) throws Exception;
	void insertNotice(GymNotice notice) throws Exception;
}
