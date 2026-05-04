package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.FoodRecordDTO;
import dto.member.LoginDTO;
import service.member.FoodRecordService;
import service.member.FoodRecordServiceImpl;

@WebServlet("/member/food")
public class FoodRecordController extends HttpServlet {

    private FoodRecordService service = new FoodRecordServiceImpl();

    // ===== 조회 =====
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        LoginDTO user = (LoginDTO) request.getSession().getAttribute("loginUser");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        List<FoodRecordDTO> list = service.getList(user.getEmail());

        response.setContentType("application/json;charset=UTF-8");

        StringBuilder json = new StringBuilder();
        json.append("[");

        for (int i = 0; i < list.size(); i++) {

            FoodRecordDTO f = list.get(i);

            json.append("{");
            json.append("\"date\":\"").append(f.getRecordDate()).append("\",");
            json.append("\"food\":\"").append(f.getFoodName()).append("\",");
            json.append("\"calorie\":").append(f.getCalorie());
            json.append("}");

            if (i != list.size() - 1) json.append(",");
        }

        json.append("]");

        response.getWriter().write(json.toString());
    }

    // ===== 저장 =====
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        LoginDTO user = (LoginDTO) request.getSession().getAttribute("loginUser");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        FoodRecordDTO dto = new FoodRecordDTO();

        dto.setEmail(user.getEmail());
        dto.setFoodName(request.getParameter("foodName"));
        dto.setGram(Double.parseDouble(request.getParameter("gram")));
        dto.setCalorie(Double.parseDouble(request.getParameter("calorie")));

        int result = service.save(dto);

        if (result > 0) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
    }
}