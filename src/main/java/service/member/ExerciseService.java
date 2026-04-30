package service.member;

import java.util.List;

import dto.member.ExerciseDTO;

public interface ExerciseService {
    List<ExerciseDTO> getAllExercises();

    List<ExerciseDTO> searchExercises(String keyword);
}