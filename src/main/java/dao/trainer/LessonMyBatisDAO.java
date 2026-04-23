package dao.trainer;

import java.time.LocalDate;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.trainer.LessonDTO;
import util.MybatisSqlSessionFactory;

public class LessonMyBatisDAO implements LessonDAO {
    @Override
    public List<LessonDTO> findLessonsByDate(LocalDate date) {
        if (date == null) {
            return Collections.emptyList();
        }

        try (SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            return sqlSession.selectList("lesson.findLessonsByDate", date.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
}