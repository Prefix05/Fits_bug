package dao.trainer;

import dto.trainer.MealDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MealDAOImpl implements MealDAO {

    @Override
    public List<MealDTO> selectMealsByDay(int clientId, String day) throws Exception {

        try (SqlSession session =
                     MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {

            Map<String, Object> param = new HashMap<>();
            param.put("clientId", clientId);
            param.put("day", day);

            return session.selectList("mapper.meal.selectMealsByDay", param);
        }
    }

}
