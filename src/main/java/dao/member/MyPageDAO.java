package dao.member;

import dto.member.UserDTO;
import dto.member.WorkoutPlanDTO;

public interface MyPageDAO {
    UserDTO selectUser(String email);

    WorkoutPlanDTO selectWorkoutPlan(String email);

    void updateUser(UserDTO user);

    void updateWorkoutPlan(WorkoutPlanDTO plan);

    void updateProfileImg(UserDTO user);
}