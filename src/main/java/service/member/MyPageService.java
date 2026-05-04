package service.member;

import dto.member.LoginDTO;
import dto.member.MemberDTO;
import dto.member.MyPageDTO;
import dto.member.WorkoutPlanDTO;

public interface MyPageService {

    // 마이페이지 통합 조회
    MyPageDTO getMyPage(String email);

    // 마이페이지 통합 수정
    void updateMyPage(MemberDTO member, WorkoutPlanDTO plan);

    // 프로필 이미지
    void updateProfileImg(MemberDTO member);
}