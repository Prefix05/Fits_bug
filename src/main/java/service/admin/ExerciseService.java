package service.admin;

import java.util.List;

import dto.admin.ExerciseDTO;

public interface ExerciseService {
	//운동가이드 전체 등록(insert, 운동정보 + 가이드정보)
	void registerExerciseGuide(ExerciseDTO dto) throws Exception;
	List<ExerciseDTO> getExerciseGuideList(String targetMuscle) throws Exception;
	ExerciseDTO getExerciseDetail(int egNum) throws Exception;
	void modifyExerciseGuide(ExerciseDTO dto) throws Exception;
	void removeExerciseGuide(int egNum) throws Exception;
}
