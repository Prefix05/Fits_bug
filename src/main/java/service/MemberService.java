package service;

import dto.MemberDTO;

public interface MemberService {
    int join(MemberDTO m);
    MemberDTO login(String email, String password);
}