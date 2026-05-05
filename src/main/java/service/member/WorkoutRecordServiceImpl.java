package service.member;

import java.util.List;

import dao.member.WorkoutRecordDAO;
import dao.member.WorkoutRecordDAOImpl;
import dto.member.WorkoutLogDTO;

public class WorkoutRecordServiceImpl implements WorkoutRecordService {
    private WorkoutRecordDAO dao = new WorkoutRecordDAOImpl();

    @Override
    public int insertRecord(WorkoutLogDTO dto) {
        return dao.insertRecord(dto);
    }

    @Override
    public List<WorkoutLogDTO> getRecords(String email) {
        return dao.getRecords(email);
    }
}