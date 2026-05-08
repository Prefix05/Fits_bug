package controller.member;

import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dto.member.MealLogDTO;
import dto.member.UserDTO;
import service.member.MealLogService;
import service.member.MealLogServiceImpl;

@WebServlet("/member/food")
public class FoodRecordController extends HttpServlet {

    private MealLogService service = new MealLogServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");
        if (user == null) { response.setStatus(401); return; }

        List<MealLogDTO> list = service.getListByEmail(user.getEmail());

        response.setContentType("application/json;charset=UTF-8");
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < list.size(); i++) {
            MealLogDTO f = list.get(i);
            json.append("{")
                .append("\"id\":").append(f.getId()).append(",")
                .append("\"date\":\"").append(f.getMealDate()).append("\",")
                .append("\"meal\":\"").append(escape(f.getMeal())).append("\",")
                .append("\"description\":\"").append(escape(f.getDescription())).append("\",")
                .append("\"calorie\":").append(f.getTotCalorie()).append(",")
                .append("\"mealTime\":\"").append(nvl(f.getMealTime())).append("\",")
                .append("\"calories\":").append(f.getCalories()).append(",")
                .append("\"protein\":").append(f.getProtein()).append(",")
                .append("\"carbs\":").append(f.getCarbs()).append(",")
                .append("\"fat\":").append(f.getFat()).append(",")
                .append("\"imageUrl\":\"").append(nvl(f.getImageUrl())).append("\"")
                .append("}");
            if (i != list.size() - 1) json.append(",");
        }
        json.append("]");
        response.getWriter().write(json.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");
        if (user == null) { response.setStatus(401); return; }

        dao.member.MemberDAO memberDao = new dao.member.MemberDAOImpl();
        int memberId = user.getOtherId();

        MealLogDTO dto = new MealLogDTO();
        dto.setMemberId(memberId);
        dto.setMealDate(request.getParameter("mealDate") != null
                ? request.getParameter("mealDate")
                : new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
        dto.setMeal(request.getParameter("meal"));
        dto.setDescription(request.getParameter("description"));
        dto.setMealTime(request.getParameter("mealTime"));

        String calStr     = request.getParameter("totCalorie");
        String caloriesStr = request.getParameter("calories");
        String proteinStr = request.getParameter("protein");
        String carbsStr   = request.getParameter("carbs");
        String fatStr     = request.getParameter("fat");

        dto.setTotCalorie(parseIntOrZero(calStr));
        dto.setCalories(parseIntOrZero(caloriesStr));
        dto.setProtein(parseIntOrZero(proteinStr));
        dto.setCarbs(parseIntOrZero(carbsStr));
        dto.setFat(parseIntOrZero(fatStr));
        dto.setImageUrl(request.getParameter("imageUrl"));

        int result = service.save(dto);
        response.getWriter().write(result > 0 ? "success" : "fail");
    }

    private String escape(String s) { return s == null ? "" : s.replace("\"", "\\\""); }
    private String nvl(String s)    { return s == null ? "" : s; }
    private int parseIntOrZero(String s) {
        try { return s != null ? Integer.parseInt(s) : 0; } catch (Exception e) { return 0; }
    }
}
