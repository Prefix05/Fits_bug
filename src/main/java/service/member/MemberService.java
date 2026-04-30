package service.member;

import dto.member.LoginDTO;

public interface MemberService {
    int join(LoginDTO m);
    LoginDTO login(String email, String password);
    boolean isEmailExists(String email);
    String getNickname(String email);
}