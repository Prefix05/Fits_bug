package service.gym;

import java.util.List;
import java.util.Map;

import dto.gym.Gym;
import dto.gym.GymPeakTime;
import dto.gym.Membership;
import dto.gym.Schedule;

public interface GymInfoEditService {
	Gym selectGymMypage(int gymId);
    int updateGym(Gym gym);
    int updateGymUser(Gym gym);
    int updatePassword(Map<String, Object> param);
    int countEmail(String emailId);
    Schedule selectSchedule(int gymId);
    int updateSchedule(Schedule schedule);
    List<Membership> selectMembershipList(int gymId);
    int updateMembership(Membership membership);
    int insertMembership(Membership membership);
    int deleteMembership(int membershipNum);
    List<GymPeakTime> selectPeakTimeList(int gymId);
    int deletePeakTimeByGymId(int gymId);
    int insertPeakTime(GymPeakTime peakTime);
    boolean isEmailAvailable(String emailId);
}
