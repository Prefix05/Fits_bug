package service.member;

import java.util.List;

import dao.member.TrainerDAO;
import dao.member.TrainerDAOImpl;
import dto.member.TrainerDTO;

public class TrainerServiceImpl implements TrainerService {
    private TrainerDAO dao = new TrainerDAOImpl();

    @Override
    public List<TrainerDTO> getTrainerList(String keyword, String category, String sort) {
        return dao.getTrainerList(keyword, category, sort);
    }

    @Override
    public TrainerDTO getTrainerDetail(int trainerId) {
        return dao.getTrainerDetail(trainerId);
    }
}