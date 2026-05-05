package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.gym.Gym;
import service.gym.GymDetailCardService;
import service.gym.GymDetailCardServiceImpl;

/**
 * Servlet implementation class GymDetailCard
 */
@WebServlet("/gym/detailCard")
public class GymDetailCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymDetailCard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GymDetailCardService service = new GymDetailCardServiceImpl();
		
		try {
            // 1. 파라미터 받기
			String gymIdStr = request.getParameter("gymId");

			if (gymIdStr == null || gymIdStr.isEmpty()) {
			    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "gymId 없음");
			    return;
			}

			int gymId = Integer.parseInt(gymIdStr);

            // 2. 서비스 호출
            Gym gym = service.getGymDetailCard(gymId);

            // 3. null 체크
            if (gym == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "헬스장 없음");
                return;
            }

            // 4. request에 담기
            request.setAttribute("gym", gym);

            // 5. JSP 이동
            request.getRequestDispatcher("/gym/gym_detailCard.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("헬스장 상세 조회 실패", e);
        }
	}

}
