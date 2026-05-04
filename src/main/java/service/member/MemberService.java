package service.member;

import dto.member.MemberDTO;
import java.util.List;

public interface MemberService {

    // MEMBER INSERT (회원가입 step3)
    int insertMember(MemberDTO dto);

    // 이메일로 MEMBER + USER 조회 (로그인 후 세션용)
    MemberDTO findByEmail(String email);

    // MEMBER.id로 조회
    MemberDTO findById(int id);

    // USER.id로 조회
    MemberDTO findByUserId(int userId);

    // 이메일로 MEMBER.id 조회
    int findMemberIdByEmail(String email);

    // MEMBER 수정
    int update(MemberDTO dto);

    // 트레이너 소속 회원 목록
    List<MemberDTO> findByTrainerId(int trainerId);

    // 헬스장 소속 회원 목록
    List<MemberDTO> findByGymId(int gymId);
}
