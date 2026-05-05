package dao.member;

import java.util.List;

import dto.member.MealLogDTO;

public interface FoodRecordDAO {
    int insert(MealLogDTO dto);
    List<MealLogDTO> findByEmail(String email);
	List<MealLogDTO> getRecords(String email);
}