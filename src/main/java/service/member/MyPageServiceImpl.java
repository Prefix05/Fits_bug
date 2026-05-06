package service.member;

import dao.member.MyPageDAO;
import dao.member.MyPageDAOImpl;
import dto.member.MemberDTO;
import dto.member.MyPageDTO;
import dto.member.UserDTO;

/**
 * ✅ WorkoutPlanDTO 완전 제거
 *    selectWorkoutPlan → selectMember 로 교체
 *    updateWorkoutPlan → updateMemberPlan 으로 교체
 */
public class MyPageServiceImpl implements MyPageService {

    private MyPageDAO dao = new MyPageDAOImpl();

    @Override
    public MyPageDTO getMyPage(String email) {

        // USER 기본 정보
        UserDTO userDto = dao.selectUser(email);

        // MEMBER 통합 정보 (운동계획 포함)
        // ✅ WorkoutPlanMapper 대신 MemberMapper.findByEmail 사용
        MemberDTO member = dao.selectMember(email);

        if (member == null) {
            member = new MemberDTO();
        }

        // USER 정보를 member JOIN 필드에 보완 (null 방어)
        if (userDto != null) {
            if (member.getEmail() == null)      member.setEmail(userDto.getEmail());
            if (member.getNickname() == null)   member.setNickname(userDto.getNickname());
            if (member.getProfileImg() == null) member.setProfileImg(userDto.getProfileImg());
            if (member.getRole() == null)       member.setRole(userDto.getRole());
        }

        MyPageDTO dto = new MyPageDTO();
        dto.setMember(member);
        return dto;
    }

    @Override
    public void updateMyPage(UserDTO user, MemberDTO member) {
        // USER 기본 정보 수정 (nickname, phone)
        if (user != null) {
            dao.updateUser(user);
        }
        // MEMBER 운동 계획 수정 (height, weight, diet, goals, experience)
        // ✅ WorkoutPlanMapper.update 대신 MemberMapper.updatePlan 사용
        if (member != null) {
            dao.updateMemberPlan(member);
        }
    }

    @Override
    public void updateProfileImg(UserDTO user) {
        dao.updateProfileImg(user);
    }
}
