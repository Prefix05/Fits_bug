package service.member;

import dto.member.MemberDTO;
import java.util.List;

public interface MemberService {
    int insertMember(MemberDTO dto);
    MemberDTO findByEmail(String email);
    MemberDTO findById(int id);
    MemberDTO findByUserId(int userId);
    int findMemberIdByEmail(String email);
    int update(MemberDTO dto);
    List<MemberDTO> findByTrainerId(int trainerId);
    List<MemberDTO> findByGymId(int gymId);
}
