package service.member;

import java.util.List;

import dao.member.ExerciseDAO;
import dao.member.ExerciseDAOImpl;
import dto.member.ExerciseDTO;

public class ExerciseServiceImpl implements ExerciseService {
    private ExerciseDAO dao = new ExerciseDAOImpl();

    @Override
    public List<ExerciseDTO> getAllExercises() {
        return dao.getAllExercises();
    }

    @Override
    public List<ExerciseDTO> searchExercises(String keyword) {
        return dao.searchExercises(keyword);
    }
}