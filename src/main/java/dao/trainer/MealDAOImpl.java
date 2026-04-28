package dao.trainer;

import dao.trainer.MealDAO;
import dto.trainer.MealDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MealDAOImpl implements MealDAO {

    @Override
    public List<MealDTO> selectMealsByDay(int clientId, String day) {

        try (SqlSession session =
                     MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {

            Map<String, Object> param = new HashMap<>();
            param.put("userId", clientId);   // must match XML
            param.put("date", day);          // must match XML

            return session.selectList(
                    "mapper.trainer.meal.selectMealsByDay",
                    param
            );
        }
    }
}