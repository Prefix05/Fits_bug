package controller.gym;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		GymTrainerManageService service = new GymTrainerManageServiceImpl();
		
		// ✔ 세션에서 gymId 가져오기
        HttpSession session = request.getSession();
        Integer gymIdObj = (Integer) session.getAttribute("gymId");

        if (gymIdObj == null) {
            // 세션 없으면 로그인 페이지로 보내는 게 안전
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int gymId = gymIdObj;

        String keyword = request.getParameter("keyword");
        if (keyword == null) {
            keyword = "";
        }

        List<TrainerList> trainerList = service.getTrainerList(gymId, keyword);
        List<TrainerAssign> assignList = service.getTrainerAssignList(gymId);

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
