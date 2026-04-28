package controller.trainer;

import dao.trainer.MealDAO;
import dao.trainer.MealDAOImpl;
import dto.trainer.MealDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/trainer/meals")
public class MealApiServlet extends HttpServlet {

    private MealDAO mealDAO = new MealDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String offsetParam = request.getParameter("weekOffset");
            int weekOffset = (offsetParam != null) ? Integer.parseInt(offsetParam) : 0;

            LocalDate targetDate = LocalDate.now().plusWeeks(weekOffset);
            List<MealDTO> meals = mealDAO.selectMealsByWeek(1, targetDate);

            // Calculate averages (only count days that have data)
            int totalCal = 0, totalProt = 0, totalCarbs = 0, totalFat = 0;
            for (MealDTO meal : meals) {
                totalCal   += meal.getCalories();
                totalProt  += meal.getProtein();
                totalCarbs += meal.getCarbs();
                totalFat   += meal.getFat();
            }

            // Group by date to get number of distinct days with data
            long daysWithData = meals.stream()
                    .map(MealDTO::getMealDate)
                    .distinct()
                    .count();

            int divisor = (daysWithData > 0) ? (int) daysWithData : 1;

            request.setAttribute("meals",    meals);
            request.setAttribute("weekOffset", weekOffset);
            request.setAttribute("avgCal",   totalCal   / divisor);
            request.setAttribute("avgProt",  totalProt  / divisor);
            request.setAttribute("avgCarbs", totalCarbs / divisor);
            request.setAttribute("avgFat",   totalFat   / divisor);

            request.getRequestDispatcher("/trainer/clientMealLog.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}