/*
 * package service;
 * 
 * import org.json.simple.JSONObject;
 * 
 * public interface JoinService { void join(JSONObject json); void
 * trainer(JSONObject json); void gym(JSONObject json); }
 */
package service;

import dto.MemberDTO;

public interface LoginService {
    MemberDTO login(String email, String password);
}