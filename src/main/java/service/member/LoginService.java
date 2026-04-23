/*
 * package service;
 * 
 * import org.json.simple.JSONObject;
 * 
 * public interface JoinService { void join(JSONObject json); void
 * trainer(JSONObject json); void gym(JSONObject json); }
 */
package service.member;

import dto.member.MemberDTO;

public interface LoginService {
    MemberDTO login(String email, String password);
}