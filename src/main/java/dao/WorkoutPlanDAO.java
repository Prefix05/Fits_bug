package dao;

import dto.WorkoutPlanDTO;

public interface WorkoutPlanDAO {
    // 조회
    WorkoutPlanDTO getPlan(String email);

    // 저장 (insert or update)
    int savePlan(WorkoutPlanDTO plan);
}