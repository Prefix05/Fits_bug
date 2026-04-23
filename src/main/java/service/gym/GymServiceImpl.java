package service.gym;

import java.util.List;

import dao.gym.GymMainDao;
import dao.gym.GymMainDaoImpl;
import dao.gym.GymNoticeDao;
import dao.gym.GymNoticeDaoImpl;
import dao.gym.GymTrainerViewDao;
import dao.gym.GymTrainerViewDaoImpl;
import dao.gym.MembershipDao;
import dao.gym.MembershipDaoImpl;
import dao.gym.ReviewDao;
import dao.gym.ReviewDaoImpl;
import dao.gym.ScheduleDao;
import dao.gym.ScheduleDaoImpl;
import dto.gym.Gym;
import dto.gym.GymNotice;
import dto.gym.GymTrainerView;
import dto.gym.Membership;
import dto.gym.Review;
import dto.gym.Schedule;

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
