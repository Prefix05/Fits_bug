package dao.trainer;

import dto.trainer.PayoutAccountDTO;
import dto.trainer.TrainerDTO;
import org.apache.ibatis.session.SqlSession;

public interface TrainerDAO {
    int insertTrainer(SqlSession session, TrainerDTO dto) throws Exception;

    TrainerDTO findByUserId(SqlSession session, int userId);

    int updateTrainer(SqlSession session, TrainerDTO dto);

    void deleteSpecializations(SqlSession session, int trainerId);

    void insertSpecialization(SqlSession session, int trainerId, String type);

    void deleteTraits(SqlSession session, int trainerId);

    void insertTrait(SqlSession session, int trainerId, String type);

    void updateProfileImage(SqlSession session, int trainerId, String fileName);

    Integer findGymIdByGymCode(SqlSession session, String gymCode);

    int insertPayoutAccount(SqlSession session, PayoutAccountDTO dto);
}
