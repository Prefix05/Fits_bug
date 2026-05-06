package dao.member;

import dto.member.WorkoutLogDTO;
import java.util.List;

/**
 * WorkoutRecordDAO → WorkoutLogDAO 로 변경
 * WORKOUT_LOG + WORKOUT_DETAIL 테이블 기준
 */
public interface WorkoutLogDAO {
    int insert(WorkoutLogDTO dto);
    List<WorkoutLogDTO> findByMemberId(int memberId);
    List<WorkoutLogDTO> findByEmail(String email);
}
