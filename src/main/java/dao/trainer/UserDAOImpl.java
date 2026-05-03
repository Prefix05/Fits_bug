package dao.trainer;

import dto.trainer.UserDTO;
import org.apache.ibatis.session.SqlSession;

public class UserDAOImpl implements UserDAO {
    public UserDTO getUserTrainer (SqlSession session, String email) throws Exception {
            return session.selectOne("user.selectUserTrainer", email);
    }

    public int insertUserTrainer(SqlSession session, UserDTO dto) throws Exception {
        return session.insert("user.insertUserTrainer", dto);
    }
}
