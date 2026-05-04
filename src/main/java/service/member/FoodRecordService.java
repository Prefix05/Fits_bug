package service.member;

import java.util.List;

import dto.member.MealLogDTO;

public interface FoodRecordService {
    int save(MealLogDTO dto);
    List<MealLogDTO> getList(String email);
    double calculateCalorie(double baseCal, double baseGram, double intakeGram);
}