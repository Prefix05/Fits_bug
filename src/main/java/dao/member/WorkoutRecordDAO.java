package dao.member;

import java.util.List;

import dto.member.WorkoutLogDTO;

public interface WorkoutRecordDAO {
    int insertRecord(WorkoutLogDTO dto);
    List<WorkoutLogDTO> getRecords(String email);
}