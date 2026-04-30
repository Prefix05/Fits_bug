package mapper.member;

import org.apache.ibatis.annotations.Mapper;

import dto.member.LoginDTO;

@Mapper
public interface LoginMapper {
    // 아이디와 비밀번호가 일치하는 회원을 찾는 쿼리 메서드
    LoginDTO loginCheck(LoginDTO memberDTO);
}