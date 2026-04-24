package service.gym;

import java.util.List;

import dao.gym.main.GymMainDao;
import dao.gym.main.GymMainDaoImpl;
import dao.gym.main.GymMainNoticeDao;
import dao.gym.main.GymMainNoticeDaoImpl;
import dao.gym.main.GymTrainerViewDao;
import dao.gym.main.GymTrainerViewDaoImpl;
import dao.gym.main.MembershipDao;
import dao.gym.main.MembershipDaoImpl;
import dao.gym.main.ReviewDao;
import dao.gym.main.ReviewDaoImpl;
import dao.gym.main.ScheduleDao;
import dao.gym.main.ScheduleDaoImpl;
import dto.gym.Gym;
import dto.gym.GymNotice;
import dto.gym.GymTrainerView;
import dto.gym.Membership;
import dto.gym.Review;
import dto.gym.Schedule;

public class GymServiceImpl implements GymService {
	private GymMainDao mainDao = new GymMainDaoImpl();
	private GymMainNoticeDao noticeDao = new GymMainNoticeDaoImpl();
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
