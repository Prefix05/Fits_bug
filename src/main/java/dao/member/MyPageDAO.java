package dao.member;

import dto.member.LoginDTO;
import dto.member.WorkoutPlanDTO;

public interface MyPageDAO {

    LoginDTO selectMember(String email);

    WorkoutPlanDTO selectWorkoutPlan(String email);

    void updateMember(LoginDTO member);

    void updateWorkoutPlan(WorkoutPlanDTO plan);

    void updateProfileImg(LoginDTO member);
}