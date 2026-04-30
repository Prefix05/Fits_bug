package dao.trainer;

import dto.trainer.TrainerDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

public class TrainerDAOImpl implements TrainerDAO {

//    @Override
//    public int insertTrainer(TrainerDTO dto) throws Exception{
//        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
//        int result = 0;
//        try {
//            result = sqlSession.insert("trainer.insertTrainer", dto);
//            sqlSession.commit();
//        } catch (Exception e) {
//            sqlSession.rollback();
//            e.printStackTrace();
//        } finally {
//            sqlSession.close();
//        }
//        return result;
//    }

    @Override
    public int insertTrainer(SqlSession session, TrainerDTO dto) {
        return session.insert("trainer.insertTrainer", dto);
    }

    public TrainerDTO getTrainerByEmail(SqlSession session, String email) throws Exception {
        return session.selectOne("trainer.getTrainerByEmail", email);
    }


//    @Override
//    public TrainerDTO getTrainerByEmail(String email) throws Exception {
//        SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
//        TrainerDTO trainer = null;
//        try {
//            trainer = sqlSession.selectOne("trainer.getTrainerByEmail", email);
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            sqlSession.close();
//        }
//        return trainer;
//    }
}
