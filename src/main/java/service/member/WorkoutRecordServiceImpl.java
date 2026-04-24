package service.member;

import java.util.List;

import dao.member.WorkoutRecordDAO;
import dao.member.WorkoutRecordDAOImpl;
import dto.member.WorkoutRecordDTO;

public class WorkoutRecordServiceImpl implements WorkoutRecordService {
    private WorkoutRecordDAO dao = new WorkoutRecordDAOImpl();

    @Override
    public int insertRecord(WorkoutRecordDTO dto) {
        return dao.insertRecord(dto);
    }

    @Override
    public List<WorkoutRecordDTO> getRecords(String email) {
        return dao.getRecords(email);
    }
}