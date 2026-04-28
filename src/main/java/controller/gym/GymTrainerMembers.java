package controller.gym;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.gym.TrainerMemberView;

/**
 * Servlet implementation class GymTrainerMembers
 */
@WebServlet("/gym/trainerMembers")
public class GymTrainerMembers extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public GymTrainerMembers() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		GymTrainerManageService service = new GymTrainerManageServiceImpl();
		
		int trainerId = 0;
        try {
            trainerId = Integer.parseInt(request.getParameter("trainerId"));
        } catch (Exception e) {
            trainerId = 0;
        }

        String type = request.getParameter("type");
        if (type == null || type.equals("")) {
            type = "current";
        }

//        List<TrainerMemberView> list = service.getMembers(trainerId, type);
        //더미 데이터
        List<TrainerMemberView> list = new ArrayList<>();

        if ("past".equals(type)) {

            TrainerMemberView m1 = new TrainerMemberView();
            m1.setMemberName("박회원");
            m1.setMembershipName("PT 10회");
            m1.setRemainingSession(0);
            m1.setStartDate("2024-03-01");

            list.add(m1);

        } else {

            TrainerMemberView m1 = new TrainerMemberView();
            m1.setMemberName("이회원");
            m1.setMembershipName("PT 20회");
            m1.setRemainingSession(15);
            m1.setStartDate("2024-04-01");

            list.add(m1);

            TrainerMemberView m2 = new TrainerMemberView();
            m2.setMemberName("최회원");
            m2.setMembershipName("PT 30회");
            m2.setRemainingSession(20);
            m2.setStartDate("2024-04-10");

            list.add(m2);
        }
        //더미 데이터

        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();
        StringBuilder json = new StringBuilder();

        json.append("[");

        for (int i = 0; i < list.size(); i++) {
            TrainerMemberView m = list.get(i);

            json.append("{");
            json.append("\"memberName\":\"").append(jsonEscape(m.getMemberName())).append("\",");
            json.append("\"membershipName\":\"").append(jsonEscape(m.getMembershipName())).append("\",");
            json.append("\"remainingSession\":").append(m.getRemainingSession()).append(",");
            json.append("\"startDate\":\"").append(jsonEscape(m.getStartDate())).append("\"");
            json.append("}");

            if (i < list.size() - 1) {
                json.append(",");
            }
        }

        json.append("]");

        out.print(json.toString());
        out.flush();
    }

    private String jsonEscape(String value) {
        if (value == null) {
            return "";
        }

        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }
	

}
