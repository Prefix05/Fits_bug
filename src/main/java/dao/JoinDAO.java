/*
 * package dao;
 * 
 * import org.json.simple.JSONObject;
 * 
 * public interface JoinDAO { void insertUser(JSONObject json); void
 * insertTrainer(JSONObject json); void insertGym(JSONObject json); }
 */
package dao;

public interface JoinDAO {
    void insert(String id, String pw, String role);
}