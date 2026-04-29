package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.admin.ExerciseDTO;
import service.admin.ExerciseService;
import service.admin.ExerciseServiceImpl;

/**
 * Servlet implementation class ExGuideList
 */
@WebServlet("/admin/exGuideList")
public class ExGuideList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ExerciseService exerciseService = new ExerciseServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExGuideList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String targetMuscle = request.getParameter("targetMuscle");
	        // 1. DB에서 목록을 수확함
	        List<ExerciseDTO> list = exerciseService.getExerciseGuideList(targetMuscle);
	        
	        // 2. 수확한 목록을 'guideList'라는 이름으로 박스(request)에 담음
	        request.setAttribute("guideList", list);
	        
	        // 3. 목록 화면으로 이동
	        request.getRequestDispatcher("/admin/exGuideList.jsp").forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect(request.getContextPath() + "/common/error.jsp");
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
