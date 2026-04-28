package dao.trainer;

import dto.trainer.MealDTO;

import java.util.List;

public interface MealDAO {
    List<MealDTO> selectMealsByDay(int clientId, String day) throws Exception;
}
