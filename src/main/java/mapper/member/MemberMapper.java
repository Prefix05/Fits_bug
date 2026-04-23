package mapper.member;

import org.apache.ibatis.annotations.Mapper;

import dto.member.MemberDTO;

@Mapper
public interface MemberMapper {
    // 아이디와 비밀번호가 일치하는 회원을 찾는 쿼리 메서드
    MemberDTO loginCheck(MemberDTO memberDTO);
}