package dao.trainer;

import dto.trainer.PayoutAccountDTO;
import dto.trainer.TrainerDTO;
import org.apache.ibatis.session.SqlSession;

import java.util.Map;

public class TrainerDAOImpl implements TrainerDAO {

    @Override
    public int insertTrainer(SqlSession session, TrainerDTO dto) {
        return session.insert("trainer.insertTrainer", dto);
    }

    @Override
    public TrainerDTO findByUserId(SqlSession session, int userId) {
        return session.selectOne("trainer.findByUserId", userId);
    }

    @Override
    public int updateTrainer(SqlSession session, TrainerDTO dto) {
        return session.update("trainer.updateTrainer", dto);
    }

    @Override
    public void deleteSpecializations(SqlSession session, int trainerId) {
        session.delete("trainer.deleteSpecializations", trainerId);
    }

    @Override
    public void insertSpecialization(SqlSession session, int trainerId, String type) {
        session.insert("trainer.insertSpecialization",
                Map.of("trainerId", trainerId, "type", type));
    }

    @Override
    public void deleteTraits(SqlSession session, int trainerId) {
        session.delete("trainer.deleteTraits", trainerId);
    }

    @Override
    public void insertTrait(SqlSession session, int trainerId, String type) {
        session.insert("trainer.insertTrait",
                Map.of("trainerId", trainerId, "type", type));
    }

    @Override
    public void updateProfileImage(SqlSession session, int trainerId, String fileName) {
        session.update("trainer.updateProfileImage",
                Map.of("trainerId", trainerId, "fileName", fileName));
    }

    @Override
    public Integer findGymIdByGymCode(SqlSession session, String gymCode) {
        return session.selectOne("trainer.findGymIdByGymCode", gymCode);
    }

    @Override
    public int insertPayoutAccount(SqlSession session, PayoutAccountDTO dto) {
        return session.insert("payoutAccount.insertPayoutAccount", dto);
    }
}
