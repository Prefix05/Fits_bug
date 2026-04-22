package service;

import dao.MyPageDAO;
import dao.MyPageDAOImpl;
import dto.MemberDTO;
import dto.MyPageDTO;
import dto.WorkoutPlanDTO;

public class MyPageServiceImpl implements MyPageService {

    private MyPageDAO dao = new MyPageDAOImpl();

    @Override
    public MyPageDTO getMyPage(String email) {

        MemberDTO member = dao.selectMember(email);
        WorkoutPlanDTO plan = dao.selectWorkoutPlan(email);

        MyPageDTO dto = new MyPageDTO();
        dto.setMember(member);
        dto.setPlan(plan);

        return dto;
    }

    @Override
    public void updateMyPage(MemberDTO member, WorkoutPlanDTO plan) {

        dao.updateMember(member);
        dao.updateWorkoutPlan(plan);
    }

    @Override
    public void updateProfileImg(MemberDTO member) {
        dao.updateProfileImg(member);
    }
}