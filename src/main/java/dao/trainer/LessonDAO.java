package dao.trainer;

import dto.trainer.LessonDTO;
import org.apache.ibatis.session.SqlSession;

import java.time.LocalDate;
import java.util.List;

public interface LessonDAO {
    List<LessonDTO> selectLessonsByDate(SqlSession session, LocalDate date, int trainerId);


}

//DAO     → select / insert / update (SQL language)
//Service → get / create / update   (business language)