package dao.member;

import dto.member.MemberDTO;
import java.util.List;

public interface MemberDAO {

    // MEMBER 테이블 INSERT (USER INSERT 후 user_id 연결)
    int insertMember(MemberDTO dto);

    // USER.id로 MEMBER 조회
    MemberDTO findByUserId(int userId);

    // MEMBER.id로 조회
    MemberDTO findById(int id);

    // USER.email로 MEMBER + USER JOIN 조회
    MemberDTO findByEmail(String email);

    // USER.email로 MEMBER.id 조회
    int findMemberIdByEmail(String email);

    // MEMBER 정보 수정
    int update(MemberDTO dto);

    // trainer_id에 속한 회원 목록
    List<MemberDTO> findByTrainerId(int trainerId);

    // gym_id에 속한 회원 목록
    List<MemberDTO> findByGymId(int gymId);
}
