package service.member;

import java.util.List;

import dto.member.WorkoutLogDTO;

public interface WorkoutRecordService {
    int insertRecord(WorkoutLogDTO dto);
    List<WorkoutLogDTO> getRecords(String email);
}