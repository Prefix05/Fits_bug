package dao.trainer;

import dto.trainer.TrainerDTO;

public interface TrainerDAO {
    public int insertTrainer(TrainerDTO dto);
    public TrainerDTO getTrainerByEmail(String email);
}
