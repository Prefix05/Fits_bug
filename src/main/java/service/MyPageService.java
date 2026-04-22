package service;

import dto.MemberDTO;
import dto.MyPageDTO;
import dto.WorkoutPlanDTO;

public interface MyPageService {

    // 마이페이지 통합 조회
    MyPageDTO getMyPage(String email);

    // 마이페이지 통합 수정
    void updateMyPage(MemberDTO member, WorkoutPlanDTO plan);

    // 프로필 이미지
    void updateProfileImg(MemberDTO member);
}