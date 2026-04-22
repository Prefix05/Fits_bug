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
package service;

import dao.JoinDAO;
import dao.JoinDAOImpl;

public class JoinServiceImpl implements JoinService {

    JoinDAO dao = new JoinDAOImpl();

    public void join(String id, String pw, String role) {
        dao.insert(id, pw, role);
    }
}