package controller.gym;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.gym.TrainerAssign;
import dto.gym.TrainerList;
import service.gym.GymTrainerManageService;
import service.gym.GymTrainerManageServiceImpl;

/**
 * Servlet implementation class GymTrainerManage
 */
@WebServlet("/gym/trainer")
public class GymTrainerManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public GymTrainerManage() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		GymTrainerManageService service = new GymTrainerManageServiceImpl();
		
		// ✔ 세션에서 gymId 가져오기
        HttpSession session = request.getSession();
        Integer gymIdObj = (Integer) session.getAttribute("gymId");

        if (gymIdObj == null) {
            // 세션 없으면 로그인 페이지로 보내는 게 안전
//            response.sendRedirect(request.getContextPath() + "/login.jsp");
//            return;
        	session.setAttribute("gymId", 1); // 더미 데이터
            gymIdObj = 1; // 더미 데이터
        }

        int gymId = gymIdObj;

        String keyword = request.getParameter("keyword");
        if (keyword == null) {
            keyword = "";
        }

//        List<TrainerList> trainerList = service.getTrainerList(gymId, keyword);
//        List<TrainerAssign> assignList = service.getTrainerAssignList(gymId);
        //더미 데이터
        
        List<TrainerList> trainerList = new ArrayList<>();

        TrainerList t = new TrainerList();
        t.setId(1);
        t.setName("김트레이너");
        t.setPhoneNum("010-1111-1111");
        t.setProfileImg(null);
        t.setMemberCount(2);

        trainerList.add(t);


        List<TrainerAssign> assignList = new ArrayList<>();

        TrainerAssign a1 = new TrainerAssign();
        a1.setTrainerName("김트레이너");
        a1.setMemberName("이회원");
        a1.setAssignedAt("2024-04-01");
        a1.setMembershipName("PT 20회");
        a1.setRemainingInfo("15회");
        a1.setStatus("이용중");

        assignList.add(a1);

        TrainerAssign a2 = new TrainerAssign();
        a2.setTrainerName("김트레이너");
        a2.setMemberName("박회원");
        a2.setAssignedAt("2024-03-01");
        a2.setMembershipName("PT 10회");
        a2.setRemainingInfo("0회");
        a2.setStatus("종료");

        assignList.add(a2);
        //더미 데이터

        if (trainerList == null) {
            trainerList = new ArrayList<>();
        }

        if (assignList == null) {
            assignList = new ArrayList<>();
        }

        request.setAttribute("trainerList", trainerList);
        request.setAttribute("assignList", assignList);
        request.setAttribute("keyword", keyword);
        
        request.getRequestDispatcher("/gym/gym_trainerManage.jsp").forward(request, response);
    
	}

}
