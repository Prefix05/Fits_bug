package service.member;

import java.util.List;

import dto.member.FoodRecordDTO;

public interface FoodRecordService {
    int save(FoodRecordDTO dto);
    List<FoodRecordDTO> getList(String email);
    double calculateCalorie(double baseCal, double baseGram, double intakeGram);
}