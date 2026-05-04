package service.member;

import java.util.List;

import dao.member.FoodRecordDAO;
import dao.member.FoodRecordDAOImpl;
import dto.member.MealLogDTO;

public class FoodRecordServiceImpl implements FoodRecordService {
    private FoodRecordDAO dao = new FoodRecordDAOImpl();

    @Override
    public int save(MealLogDTO dto) {
        return dao.insert(dto);
    }

    @Override
    public List<MealLogDTO> getList(String email) {
        return dao.findByEmail(email);
    }

    // ⭐ 핵심 칼로리 계산
    @Override
    public double calculateCalorie(double baseCal, double baseGram, double intakeGram) {
        return (baseCal / baseGram) * intakeGram;
    }
}