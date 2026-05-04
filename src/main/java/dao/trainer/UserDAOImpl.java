package dao.trainer;

import dto.trainer.UserDTO;
import org.apache.ibatis.session.SqlSession;

public class UserDAOImpl implements UserDAO {
    public UserDTO getUserTrainer (SqlSession session, String email) throws Exception {
            return session.selectOne("user.selectUserTrainer", email);
    }

    public UserDTO getUserById(SqlSession session, int id) throws Exception {
        return session.selectOne("user.selectUserById", id);
    }

    public int insertUserTrainer(SqlSession session, UserDTO dto) throws Exception {
        return session.insert("user.insertUserTrainer", dto);
    }

    public int updateUser(SqlSession session, UserDTO dto) throws Exception {
        return session.update("user.updateUser", dto);
    }

    public int updateUserProfile(SqlSession session, UserDTO dto) throws Exception {
        return session.update("user.updateUserProfile", dto);
    }
}
