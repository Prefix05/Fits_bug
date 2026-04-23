package dao.member;

import dto.member.MemberDTO;
import dto.member.WorkoutPlanDTO;

public interface MyPageDAO {

    MemberDTO selectMember(String email);

    WorkoutPlanDTO selectWorkoutPlan(String email);

    void updateMember(MemberDTO member);

    void updateWorkoutPlan(WorkoutPlanDTO plan);

    void updateProfileImg(MemberDTO member);
}