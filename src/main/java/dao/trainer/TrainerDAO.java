package dao.trainer;

import dto.trainer.TrainerDTO;
import org.apache.ibatis.session.SqlSession;

public interface TrainerDAO {
    public int insertTrainer(SqlSession session, TrainerDTO dto) throws Exception;
    public TrainerDTO getTrainerByEmail(SqlSession session, String email) throws Exception;
}
