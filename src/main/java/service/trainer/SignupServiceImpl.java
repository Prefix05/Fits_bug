package service.trainer;

import dao.trainer.TrainerDAO;
import dao.trainer.TrainerDAOImpl;
import dto.trainer.TrainerDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

public class SignupServiceImpl implements SignupService {

    private TrainerDAO trainerDAO = new TrainerDAOImpl();

    @Override
    public int signupTrainer(TrainerDTO dto) {

        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession(false); // transaction control

        try {
            int result = trainerDAO.insertTrainer(session, dto);

            session.commit(); // ✅ success
            return result;

        } catch (Exception e) {
            session.rollback(); // ❌ fail
            throw new RuntimeException("Signup failed", e);

        } finally {
            session.close();
        }
    }
}