package service.trainer;

import dto.trainer.TrainerDTO;

public interface LoginService {
    public TrainerDTO loginTrainer(String email, String password);
}
