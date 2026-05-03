package service.trainer;

import dto.trainer.PayoutAccountDTO;
import dto.trainer.TrainerDTO;

public interface TrainerService {

    TrainerDTO getTrainerByUserId(int userId);

    int insertTrainer(TrainerDTO trainer);

    int updateTrainer(TrainerDTO trainer);

    void updateProfileWithTagsAndImage(TrainerDTO trainer,
                                       String[] specializations,
                                       String[] strengths,
                                       String fileName);

    Integer findGymIdByGymCode(String gymCode);

    int insertPayoutAccount(PayoutAccountDTO dto);
}
