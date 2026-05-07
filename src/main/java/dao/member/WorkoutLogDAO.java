package dao.member;

import dto.member.WorkoutLogDTO;
import java.util.List;

public interface WorkoutLogDAO {

    int insert(WorkoutLogDTO dto);

    int insertWithDetails(WorkoutLogDTO dto);

    // member_id로 전체 조회
    List<WorkoutLogDTO> findByMemberId(int memberId);

    // email로 전체 조회
    List<WorkoutLogDTO> findByEmail(String email);

    // 오늘 날짜 운동 기록 조회 (main.jsp 운동기록 카드용)
    List<WorkoutLogDTO> findTodayByMemberId(int memberId);
}
