package dao.trainer;

import dto.trainer.MealDTO;

import java.util.List;

public interface MealDAO {
    public List<MealDTO> selectMealsByDay(int clientId, String day);
}