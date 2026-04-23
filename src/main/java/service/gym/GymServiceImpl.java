package service;

import java.util.ArrayList;
import java.util.List;

import dao.GymMainDao;
import dao.GymMainDaoImpl;
import dao.GymNoticeDao;
import dao.GymNoticeDaoImpl;
import dao.GymTrainerViewDao;
import dao.GymTrainerViewDaoImpl;
import dao.MembershipDao;
import dao.MembershipDaoImpl;
import dao.ReviewDao;
import dao.ReviewDaoImpl;
import dao.ScheduleDao;
import dao.ScheduleDaoImpl;
import dto.Gym;
import dto.GymNotice;
import dto.GymTrainerView;
import dto.Membership;
import dto.Review;
import dto.Schedule;

public class GymServiceImpl implements GymService {
	private GymMainDao mainDao = new GymMainDaoImpl();
	private GymNoticeDao noticeDao = new GymNoticeDaoImpl();
	private MembershipDao membershipDao = new MembershipDaoImpl();
	private GymTrainerViewDao trainerViewDao = new GymTrainerViewDaoImpl();
	private ReviewDao reviewDao = new ReviewDaoImpl();
	private ScheduleDao scheduleDao = new ScheduleDaoImpl();

	@Override
	public Gym getGymMainInfo(int gymId) throws Exception {
		return mainDao.selectGymMainInfo(gymId);
		
	}

	@Override
	public List<GymNotice> getNoticeList(int gymId) throws Exception {
		return noticeDao.selectRecentNoticeByGym(gymId);
		
	}

	@Override
	public List<Review> getReviewList(int gymId) throws Exception {
		return reviewDao.selectRecentReviewByGym(gymId);
		 
	}

	@Override
	public List<Membership> getMembershipList(int gymId) throws Exception {
		return membershipDao.selectMembershipByGym(gymId);
		
	}

	@Override
	public Schedule getSchedule(int gymId) throws Exception {
		return scheduleDao.selectScheduleByGym(gymId);
		
	}

	@Override
	public List<GymTrainerView> getGymTrainerViewList(int gymId) throws Exception {
		return trainerViewDao.selectGymTrainerViewBtGym(gymId);
		
	}

}
