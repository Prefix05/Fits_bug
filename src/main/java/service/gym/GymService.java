package service;

import java.util.List;

import dto.Gym;
import dto.GymTrainerView;
import dto.Membership;
import dto.GymNotice;
import dto.Review;
import dto.Schedule;

public interface GymService {
	Gym getGymMainInfo(int gymId) throws Exception;
	List<GymNotice> getNoticeList(int gymId) throws Exception;
	List<Review> getReviewList(int gymId) throws Exception;
	List<Membership> getMembershipList(int gymId) throws Exception;
	Schedule getSchedule(int gymId) throws Exception;
	List<GymTrainerView> getGymTrainerViewList(int gymId) throws Exception;
}
