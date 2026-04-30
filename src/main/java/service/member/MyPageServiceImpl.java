package service.member;

import dao.member.MyPageDAO;
import dao.member.MyPageDAOImpl;
import dto.member.LoginDTO;
import dto.member.MyPageDTO;
import dto.member.WorkoutPlanDTO;

public class MyPageServiceImpl implements MyPageService {

    private MyPageDAO dao = new MyPageDAOImpl();

    @Override
    public MyPageDTO getMyPage(String email) {

        LoginDTO member = dao.selectMember(email);
        WorkoutPlanDTO plan = dao.selectWorkoutPlan(email);

        MyPageDTO dto = new MyPageDTO();
        dto.setMember(member);
        dto.setPlan(plan);

        return dto;
    }

    @Override
    public void updateMyPage(LoginDTO member, WorkoutPlanDTO plan) {

        dao.updateMember(member);
        dao.updateWorkoutPlan(plan);
    }

    @Override
    public void updateProfileImg(LoginDTO member) {
        dao.updateProfileImg(member);
    }
}