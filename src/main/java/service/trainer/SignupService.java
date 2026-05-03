package service.trainer;

import dto.trainer.TrainerDTO;
import dto.trainer.UserDTO;

public interface SignupService {
    int signupTrainer(UserDTO dto);
    int signupTrainerProfile(TrainerDTO dto);
}
