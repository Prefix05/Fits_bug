package controller.gym;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.gym.GymNotice;
import dto.gym.NoticeImages;
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
            int noticeId = Integer.parseInt(request.getParameter("noticeId"));

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("gymId") == null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }

            int loginGymId = (int) session.getAttribute("gymId");

            GymNotice notice = service.getNoticeDetail(noticeId);

            if (notice == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            if (notice.getGymId() != loginGymId) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

         // 1. 이미지 목록 조회
            List<NoticeImages> imageList = service.getImagesByNoticeId(noticeId);
            
            // 2. 실제 이미지 파일 삭제
            String uploadPath = request.getServletContext().getRealPath("/noticeDetailImages");

            if (imageList != null) {
                for (NoticeImages image : imageList) {
                    File file = new File(uploadPath, image.getImageUrl());

                    if (file.exists()) {
                        file.delete();
                    }
                }
            }

            // 3. 이미지 DB 삭제
            service.deleteImagesByNoticeId(noticeId);

            // 4. 공지 DB 삭제
            service.deleteNotice(noticeId);

           

            response.sendRedirect(request.getContextPath()
                    + "/gym/notice?gymId=" + loginGymId);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
	

}
