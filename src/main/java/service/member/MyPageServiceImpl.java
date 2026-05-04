package service.member;

import dao.member.MyPageDAO;
import dao.member.MyPageDAOImpl;
import dto.member.MyPageDTO;
import dto.member.UserDTO;
import dto.member.WorkoutPlanDTO;

public class MyPageServiceImpl implements MyPageService {

    private MyPageDAO dao = new MyPageDAOImpl();

    @Override
    public MyPageDTO getMyPage(String email) {

        UserDTO user = dao.selectUser(email);
        WorkoutPlanDTO plan = dao.selectWorkoutPlan(email);

        MyPageDTO dto = new MyPageDTO();
        dto.setUser(user);
        dto.setPlan(plan);

        return dto;
    }

    @Override
    public void updateMyPage(UserDTO user, WorkoutPlanDTO plan) {

        dao.updateUser(user);
        dao.updateWorkoutPlan(plan);
    }

    @Override
    public void updateProfileImg(UserDTO user) {
        dao.updateProfileImg(user);
    }
}