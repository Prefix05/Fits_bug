package service.gym;

import java.util.List;
import java.util.Map;

import dao.gym.notice.GymNoticeDao;
import dao.gym.notice.GymNoticeDaoImpl;
import dto.gym.GymNotice;

public class GymNoticeServiceImpl implements GymNoticeService {
	private GymNoticeDao gymNoticeDao = new GymNoticeDaoImpl();
	
	@Override
	public int getNoticeCount(int gymId) throws Exception {
		return gymNoticeDao.selectNoticeCount(gymId);
	}

	@Override
	public List<GymNotice> getNoticeList(Map<String, Object> param) throws Exception {
		return gymNoticeDao.selectNoticeList(param);
	}

	@Override
	public GymNotice getNoticeDetail(int id) throws Exception {
		return gymNoticeDao.selectNoticeDetail(id);
	}

	@Override
	public void increaseViewCount(int id) throws Exception {
		gymNoticeDao.updateViewCount(id);
	}

	@Override
	public void writeNotice(GymNotice notice) throws Exception {
		gymNoticeDao.insertNotice(notice);
	}

}
