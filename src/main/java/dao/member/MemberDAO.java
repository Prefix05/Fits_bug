package dao.member;

import java.util.List;

import dto.member.MemberDTO;

public interface MemberDAO {
    int insertMember(MemberDTO dto);
    MemberDTO findByUserId(int userId);
    MemberDTO findById(int id);
    MemberDTO findByEmail(String email);        // USER JOIN 포함
    int findMemberIdByEmail(String email);
    int update(MemberDTO dto);
    List<MemberDTO> findByTrainerId(int trainerId);
    List<MemberDTO> findByGymId(int gymId);
    MemberDTO selectMemberByUserId(Integer userId) throws Exception;
}