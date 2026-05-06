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
                .append("\"date\":\"").append(f.getMealDate()).append("\",")
                .append("\"meal\":\"").append(escape(f.getMeal())).append("\",")
                .append("\"calorie\":").append(f.getTotCalorie())
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

        // MEAL_LOG는 member_id FK → email로 member_id 조회
        dao.member.MemberDAO memberDao = new dao.member.MemberDAOImpl();
        int memberId = memberDao.findMemberIdByEmail(user.getEmail());

        MealLogDTO dto = new MealLogDTO();
        dto.setMemberId(memberId);
        dto.setMealDate(request.getParameter("mealDate") != null
                ? request.getParameter("mealDate")
                : new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
        dto.setMeal(request.getParameter("meal"));
        String calStr = request.getParameter("totCalorie");
        dto.setTotCalorie(calStr != null ? Integer.parseInt(calStr) : 0);

        int result = service.save(dto);
        response.getWriter().write(result > 0 ? "success" : "fail");
    }

    private String escape(String s) { return s == null ? "" : s.replace("\"", "\\\""); }
}
