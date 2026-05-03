package dao.trainer;

import dto.trainer.TrainerDTO;
import dto.trainer.UserDTO;
import org.apache.ibatis.session.SqlSession;

public interface UserDAO {
    public UserDTO getUserTrainer(SqlSession session, String email) throws Exception;

    public int insertUserTrainer(SqlSession session, UserDTO dto) throws Exception;

}
