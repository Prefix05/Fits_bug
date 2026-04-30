package dao.member;

import java.util.List;

import dto.member.WorkoutRecordDTO;

public interface WorkoutRecordDAO {
    int insertRecord(WorkoutRecordDTO dto);
    List<WorkoutRecordDTO> getRecords(String email);
}