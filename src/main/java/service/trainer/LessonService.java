package service.trainer;

import dto.trainer.LessonDTO;
import dto.trainer.LessonInfoResponse;
import org.apache.ibatis.session.SqlSession;

import java.time.LocalDate;
import java.util.List;

public interface LessonService {
    List<LessonDTO> getLessonsByDate(LocalDate date, int trainerId);

    LessonInfoResponse getLessonInfo(int trainerId, int lessonId);

}

//DAO     → select / insert / update (SQL language)
//Service → get / create / update   (business language)
