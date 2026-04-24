package service.gym;

import java.util.List;
import java.util.Map;

import dto.gym.GymNotice;

public interface GymNoticeService {
	int getNoticeCount(int gymId) throws Exception;
	List<GymNotice> getNoticeList(Map<String, Object> param) throws Exception;
	GymNotice getNoticeDetail(int id) throws Exception;
	void increaseViewCount(int id) throws Exception;
	void writeNotice(GymNotice notice) throws Exception;
}
