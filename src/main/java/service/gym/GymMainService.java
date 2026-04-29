package service.gym;

import java.util.List;

import dto.gym.Gym;
import dto.gym.GymNotice;
import dto.gym.GymTrainerView;
import dto.gym.Membership;
import dto.gym.Review;
import dto.gym.Schedule;

public interface GymMainService {
	Gym getGymMainInfo(int gymId) throws Exception;
    List<GymNotice> getNoticeList(int gymId) throws Exception;
    List<Review> getReviewList(int gymId) throws Exception;
    List<Membership> getMembershipList(int gymId) throws Exception;
    Schedule getSchedule(int gymId) throws Exception;
    List<GymTrainerView> getGymTrainerViewList(int gymId) throws Exception;
}
