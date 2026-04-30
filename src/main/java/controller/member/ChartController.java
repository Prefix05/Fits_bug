package controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.ChartDTO;
import dto.member.MemberDTO;
import service.member.ChartService;
import service.member.ChartServiceImpl;

@WebServlet("/chart")
public class ChartController extends HttpServlet {

    private ChartService service = new ChartServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String type = req.getParameter("type");

        MemberDTO user = (MemberDTO) req.getSession().getAttribute("loginUser");

        // ✅ 로그인 체크
        if(user == null){
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        List<ChartDTO> list = null;

		/*
		 * if("workout".equals(type)){ list = service.getWorkoutChart(user.getEmail());
		 * }else if("food".equals(type)){ list = service.getFoodChart(user.getEmail());
		 * }else if("inbody".equals(type)){ list =
		 * service.getInbodyChart(user.getEmail()); }
		 */
        // 더미 데이터
        if("workout".equals(type)){

            list = new ArrayList<>();

            ChartDTO d1 = new ChartDTO();
            d1.setDate("04-01");
            d1.setValue(500);

            ChartDTO d2 = new ChartDTO();
            d2.setDate("04-02");
            d2.setValue(700);

            list.add(d1);
            list.add(d2);
        }else if("food".equals(type)){

            list = new ArrayList<>();

            ChartDTO d1 = new ChartDTO();
            d1.setDate("04-01");
            d1.setFood("닭가슴살");
            d1.setCalorie(300);

            ChartDTO d2 = new ChartDTO();
            d2.setDate("04-02");
            d2.setFood("고구마");
            d2.setCalorie(250);

            list.add(d1);
            list.add(d2);
        }else if("inbody".equals(type)){

            list = new ArrayList<>();

            ChartDTO d1 = new ChartDTO();
            d1.setDate("04-01");
            d1.setWeight(75);
            d1.setMuscle(30);
            d1.setFat(12);

            ChartDTO d2 = new ChartDTO();
            d2.setDate("04-10");
            d2.setWeight(74);
            d2.setMuscle(31);
            d2.setFat(11);

            list.add(d1);
            list.add(d2);
        }

        if(list == null) list = new ArrayList<>();

        resp.setContentType("application/json;charset=UTF-8");

        StringBuilder json = new StringBuilder("[");

        for(int i=0;i<list.size();i++){
            ChartDTO c = list.get(i);

            json.append("{");
            json.append("\"date\":\"").append(c.getDate()).append("\",");

            if("food".equals(type)){
                json.append("\"food\":\"").append(c.getFood()).append("\",");
                json.append("\"calorie\":").append(c.getCalorie());

            }else if("inbody".equals(type)){
                json.append("\"weight\":").append(c.getWeight()).append(",");
                json.append("\"muscle\":").append(c.getMuscle()).append(",");
                json.append("\"fat\":").append(c.getFat());

            }else{ // workout
                json.append("\"value\":").append(c.getValue());
            }

            json.append("}");
            
            if(i < list.size()-1) json.append(",");
    }
        json.append("]");

        resp.getWriter().write(json.toString());
}
}