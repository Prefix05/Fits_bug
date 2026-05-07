package service.member;

import dao.member.WorkoutLogDAO;
import dao.member.WorkoutLogDAOImpl;
import dto.member.WorkoutDetailDTO;
import dto.member.WorkoutLogDTO;

import java.util.List;

public class WorkoutLogServiceImpl implements WorkoutLogService {
    private WorkoutLogDAO dao = new WorkoutLogDAOImpl();

    @Override
    public int save(WorkoutLogDTO dto) {
        return dao.insertWithDetails(dto);
    }

    @Override
    public List<WorkoutLogDTO> getListByMemberId(int memberId) {
        return dao.findByMemberId(memberId);
    }

    @Override
    public List<WorkoutLogDTO> getListByEmail(String email) {
        return dao.findByEmail(email);
    }
}
