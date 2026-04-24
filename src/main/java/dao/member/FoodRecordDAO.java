package dao.member;

import java.util.List;

import dto.member.FoodRecordDTO;

public interface FoodRecordDAO {
    int insert(FoodRecordDTO dto);
    List<FoodRecordDTO> findByEmail(String email);
	List<FoodRecordDTO> getRecords(String email);
}