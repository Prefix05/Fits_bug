package dao.member;

import java.util.List;

import dto.member.ExerciseDTO;

public interface ExerciseDAO {
    // 전체 조회
    List<ExerciseDTO> getAllExercises();

    // 검색 (AJAX)
    List<ExerciseDTO> searchExercises(String keyword);
}