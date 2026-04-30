package service.trainer;

import at.favre.lib.crypto.bcrypt.BCrypt;
import dao.trainer.TrainerDAO;
import dao.trainer.TrainerDAOImpl;
import dto.trainer.TrainerDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

public class LoginServiceImpl implements LoginService {
    private TrainerDAO trainerDAO = new TrainerDAOImpl();

    @Override
    public TrainerDTO loginTrainer(String email, String password) {

        SqlSession session = MybatisSqlSessionFactory
                .getSqlSessionFactory()
                .openSession();

        try {
            TrainerDTO trainer = trainerDAO.getTrainerByEmail(session, email);

            if (trainer == null) return null;

            BCrypt.Result result = BCrypt.verifyer().verify(
                    password.toCharArray(),
                    trainer.getPassword()
            );

            return result.verified ? trainer : null;

        } catch (Exception e) {
            throw new RuntimeException("Login failed", e);

        } finally {
            session.close();
        }
    }
}
