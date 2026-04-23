package dao.trainer;

import java.time.LocalDate;
import java.util.List;

import dto.trainer.LessonDTO;

public interface LessonDAO {
    List<LessonDTO> findLessonsByDate(LocalDate date);
}
