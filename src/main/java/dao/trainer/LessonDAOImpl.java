
package dao.trainer;

import dto.trainer.LessonDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

import java.time.LocalDate;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import util.MybatisSqlSessionFactory;

public class LessonDAOImpl implements LessonDAO {
    private final SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    @Override
    public List<LessonDTO> findLessonsByDate(LocalDate date, int trainerId) {

        try (SqlSession session = sqlSessionFactory.openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("date", date.toString());
            params.put("trainerId", trainerId);
            return session.selectList("lesson.findLessonsByDate", params);
        }
    }
}