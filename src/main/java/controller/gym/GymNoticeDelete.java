package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.UserDTO;
import service.gym.GymNoticeService;
import service.gym.GymNoticeServiceImpl;

/**
 * Servlet implementation class GymNoticeDelete
 */
@WebServlet("/gym/noticeDelete")
public class GymNoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymNoticeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GymNoticeService service = new GymNoticeServiceImpl();
		
		try {
			
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO)session.getAttribute("loginUser");
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/member/login");
                return;
            }

			int noticeId = Integer.parseInt(request.getParameter("noticeId"));

            service.deleteNotice(noticeId);
            response.sendRedirect(request.getContextPath() + "/gym/notice?gymId="+user.getOtherId());

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

}
