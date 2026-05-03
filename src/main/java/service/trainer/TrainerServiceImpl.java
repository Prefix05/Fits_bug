package service.trainer;

import dao.trainer.TrainerDAO;
import dao.trainer.TrainerDAOImpl;
import dto.trainer.PayoutAccountDTO;
import dto.trainer.TrainerDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

public class TrainerServiceImpl implements TrainerService {

    private TrainerDAO trainerDAO = new TrainerDAOImpl();

    @Override
    public TrainerDTO getTrainerByUserId(int userId) {
        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession();
        try {
            return trainerDAO.findByUserId(session, userId);
        } finally {
            session.close();
        }
    }

    @Override
    public int insertTrainer(TrainerDTO trainer) {
        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession(false);
        try {
            int result = trainerDAO.insertTrainer(session, trainer);
            session.commit();
            return result;
        } catch (Exception e) {
            session.rollback();
            throw new RuntimeException("Insert trainer failed", e);
        } finally {
            session.close();
        }
    }

    @Override
    public int updateTrainer(TrainerDTO trainer) {
        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession(false);
        try {
            int result = trainerDAO.updateTrainer(session, trainer);
            session.commit();
            return result;
        } catch (Exception e) {
            session.rollback();
            throw new RuntimeException("Update trainer failed", e);
        } finally {
            session.close();
        }
    }

    @Override
    public void updateProfileWithTagsAndImage(TrainerDTO trainer,
                                              String[] specializations,
                                              String[] strengths,
                                              String fileName) {
        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession(false);
        try {
            TrainerDTO existing = trainerDAO.findByUserId(session, trainer.getUserId());

            if (existing == null) {
                trainerDAO.insertTrainer(session, trainer);
            } else {
                trainer.setTrainerId(existing.getTrainerId());
                trainerDAO.updateTrainer(session, trainer);
            }

            TrainerDTO saved = trainerDAO.findByUserId(session, trainer.getUserId());
            int trainerId = saved.getTrainerId();

            trainerDAO.deleteSpecializations(session, trainerId);
            if (specializations != null) {
                for (String spec : specializations) {
                    trainerDAO.insertSpecialization(session, trainerId, spec);
                }
            }

            trainerDAO.deleteTraits(session, trainerId);
            if (strengths != null) {
                for (String strength : strengths) {
                    trainerDAO.insertTrait(session, trainerId, strength);
                }
            }

            if (fileName != null) {
                trainerDAO.updateProfileImage(session, trainerId, fileName);
            }

            session.commit();

        } catch (Exception e) {
            session.rollback();
            throw new RuntimeException("Trainer profile step2 failed", e);
        } finally {
            session.close();
        }
    }

    @Override
    public Integer findGymIdByGymCode(String gymCode) {
        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession();
        try {
            return trainerDAO.findGymIdByGymCode(session, gymCode);
        } finally {
            session.close();
        }
    }

    @Override
    public int insertPayoutAccount(PayoutAccountDTO dto) {
        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession(false);
        try {
            int result = trainerDAO.insertPayoutAccount(session, dto);
            session.commit();
            return result;
        } catch (Exception e) {
            session.rollback();
            throw new RuntimeException("Payout account insert failed", e);
        } finally {
            session.close();
        }
    }
}
