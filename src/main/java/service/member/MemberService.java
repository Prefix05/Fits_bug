package service.member;

import dto.member.MemberDTO;

public interface MemberService {
    int join(MemberDTO m);
    MemberDTO login(String email, String password);
    boolean isEmailExists(String email);
    String getNickname(String email);
}