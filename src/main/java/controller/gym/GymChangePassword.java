package controller.gym;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.gym.GymInfoEditService;
import service.gym.GymInfoEditServiceImpl;

/**
 * Servlet implementation class GymChangePassword
 */
@WebServlet("/gym/changePassword")
public class GymChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GymInfoEditService service = new GymInfoEditServiceImpl();
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain; charset=UTF-8");

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        String password = request.getParameter("password");

        Map<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        param.put("password", password);

        int result = service.updatePassword(param);

        response.getWriter().write(result > 0 ? "success" : "fail");
	}

}
