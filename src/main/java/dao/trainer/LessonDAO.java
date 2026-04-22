package dao;

import dto.LessonDTO;

import java.time.LocalDate;
import java.util.List;

public interface LessonDAO {
    List<LessonDTO> findLessonsByDate(LocalDate date);
}
