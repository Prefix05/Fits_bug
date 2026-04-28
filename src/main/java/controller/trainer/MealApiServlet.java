package controller.trainer;

import dto.trainer.MealDTO;
import service.trainer.MealService;
import service.trainer.MealService.WeekResult;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/trainer/meals")
public class MealApiServlet extends HttpServlet {

    private final MealService mealService = new MealService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 1. Parse params
            String offsetParam = request.getParameter("weekOffset");
            int weekOffset = (offsetParam != null) ? Integer.parseInt(offsetParam) : 0;
            String selectedDate = request.getParameter("selectedDate");

            // 2. Delegate all logic to service
            WeekResult result = mealService.getMealData(1, weekOffset, selectedDate);

            // 3a. AJAX → write JSON
            String accept = request.getHeader("Accept");
            if (accept != null && accept.contains("application/json")) {
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(toJson(result));
                return;
            }

            // 3b. Normal load → set attributes and forward
            request.setAttribute("weekMeals",    result.weekMeals);
            request.setAttribute("meals",        result.dayMeals);
            request.setAttribute("weekOffset",   weekOffset);
            request.setAttribute("selectedDate", result.selectedDate);
            request.setAttribute("isDailyView",  result.isDailyView);
            request.setAttribute("avgCal",       result.avgCal);
            request.setAttribute("avgProt",      result.avgProt);
            request.setAttribute("avgCarbs",     result.avgCarbs);
            request.setAttribute("avgFat",       result.avgFat);
            request.setAttribute("dayCal",       result.dayCal);
            request.setAttribute("dayProt",      result.dayProt);
            request.setAttribute("dayCarbs",     result.dayCarbs);
            request.setAttribute("dayFat",       result.dayFat);
            request.getRequestDispatcher("/trainer/clientMealLog.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String toJson(WeekResult r) {
        StringBuilder json = new StringBuilder();
        json.append("{");
        json.append("\"isDailyView\":").append(r.isDailyView).append(",");
        json.append("\"selectedDate\":\"").append(r.selectedDate).append("\",");
        json.append("\"avgCal\":").append(r.avgCal).append(",");
        json.append("\"avgProt\":").append(r.avgProt).append(",");
        json.append("\"avgCarbs\":").append(r.avgCarbs).append(",");
        json.append("\"avgFat\":").append(r.avgFat).append(",");
        json.append("\"dayCal\":").append(r.dayCal).append(",");
        json.append("\"dayProt\":").append(r.dayProt).append(",");
        json.append("\"dayCarbs\":").append(r.dayCarbs).append(",");
        json.append("\"dayFat\":").append(r.dayFat).append(",");

        // chartData object
        json.append("\"chartData\":{");
        boolean first = true;
        for (Map.Entry<String, Integer> e : r.chartData.entrySet()) {
            if (!first) json.append(",");
            json.append("\"").append(e.getKey()).append("\":").append(e.getValue());
            first = false;
        }
        json.append("},");

        // meals array
        json.append("\"meals\":[");
        for (int i = 0; i < r.dayMeals.size(); i++) {
            MealDTO m = r.dayMeals.get(i);
            if (i > 0) json.append(",");
            json.append("{");
            json.append("\"mealName\":\"").append(m.getMealName()).append("\",");
            json.append("\"mealTime\":\"").append(m.getMealTime()).append("\",");
            json.append("\"description\":\"").append(m.getDescription()).append("\",");
            json.append("\"imageUrl\":\"").append(m.getImageUrl()).append("\",");
            json.append("\"calories\":").append(m.getCalories()).append(",");
            json.append("\"protein\":").append(m.getProtein()).append(",");
            json.append("\"carbs\":").append(m.getCarbs()).append(",");
            json.append("\"fat\":").append(m.getFat()).append(",");
            json.append("\"mealType\":\"").append(m.getMealType()).append("\"");
            json.append("}");
        }
        json.append("]}");

        return json.toString();
    }
}