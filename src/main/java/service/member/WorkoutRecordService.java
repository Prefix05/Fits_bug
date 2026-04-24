package service.member;

import java.util.List;

import dto.member.WorkoutRecordDTO;

public interface WorkoutRecordService {
    int insertRecord(WorkoutRecordDTO dto);
    List<WorkoutRecordDTO> getRecords(String email);
}