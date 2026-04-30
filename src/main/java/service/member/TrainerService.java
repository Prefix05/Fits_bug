package service.member;

import java.util.List;

import dto.member.TrainerDTO;

public interface TrainerService {
    List<TrainerDTO> getTrainerList(String keyword, String category, String sort);
    
    TrainerDTO getTrainerDetail(int trainerId);
}