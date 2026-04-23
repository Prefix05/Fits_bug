/*
 * package service;
 * 
 * import dao.JoinDAO; import dao.JoinDAOImpl; import
 * org.json.simple.JSONObject;
 * 
 * public class JoinServiceImpl implements JoinService {
 * 
 * private JoinDAO dao = new JoinDAOImpl();
 * 
 * @Override public void join(JSONObject json) { dao.insertUser(json); }
 * 
 * @Override public void trainer(JSONObject json) { dao.insertTrainer(json); }
 * 
 * @Override public void gym(JSONObject json) { dao.insertGym(json); } }
 */
package service.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;

import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dto.member.MemberDTO;

public class KakaoServiceImpl implements KakaoService {

    private MemberDAO dao = new MemberDAOImpl();

    @Override
    public String getAccessToken(String code) {
        String accessToken = "";

        try {
            URL url = new URL("https://kauth.kakao.com/oauth/token");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            String params = "grant_type=authorization_code"
                    + "&client_id=REST_API_KEY"
                    + "&redirect_uri=http://localhost:8080/kakaoLogin"
                    + "&code=" + code;

            OutputStream os = conn.getOutputStream();
            os.write(params.getBytes());
            os.flush();

            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));

            String result = "";
            String line;

            while ((line = br.readLine()) != null) {
                result += line;
            }

            JSONObject json = new JSONObject(result);
            accessToken = json.getString("access_token");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return accessToken;
    }

    @Override
    public MemberDTO getUserInfo(String token) {
        MemberDTO member = null;

        try {
            URL url = new URL("https://kapi.kakao.com/v2/user/me");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + token);

            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));

            String result = "";
            String line;

            while ((line = br.readLine()) != null) {
                result += line;
            }

            JSONObject json = new JSONObject(result);
            JSONObject account = json.getJSONObject("kakao_account");

            String email = account.getString("email");

            member = dao.findByEmail(email);

            if (member == null) {
            	member = new MemberDTO();
            	member.setEmail(email);
            	member.setNickname("카카오회원");

                dao.insertKakaoUser(member);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return member;
    }
}