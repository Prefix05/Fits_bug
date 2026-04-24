package controller.gym;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dto.gym.GymNotice;
import dto.gym.NoticeImages;
import service.gym.GymNoticeService;
import service.gym.GymNoticeServiceImpl;

/**
 * Servlet implementation class GymNoticeUpdate
 */
@WebServlet("/gym/noticeUpdate")
public class GymNoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymNoticeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
GymNoticeService service = new GymNoticeServiceImpl();
		
		request.setCharacterEncoding("UTF-8");
		
		try {
			int noticeId = Integer.parseInt(request.getParameter("noticeId"));
			
			// 1. 로그인 세션 확인
			HttpSession session = request.getSession(false);
			
			if(session == null || session.getAttribute("gymId")==null) {
				response.sendRedirect(request.getContextPath() + "/login.jsp");
				return;
			}
			
			int loginGymId = (int)session.getAttribute("gymId");
			
			// 2. DB에서 기존 공지 조회
			GymNotice originNotice = service.getNoticeDetail(noticeId);
			
			if(originNotice == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}
			
			// 3. 내 헬스장 공지인지 확인
			if(originNotice.getGymId() != loginGymId) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}
			
			// 4. 공지 수정
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			GymNotice notice = new GymNotice();
			notice.setId(noticeId);
			notice.setGymId(loginGymId);
			notice.setTitle(title);
			notice.setContent(content);
			service.updateNotice(notice);
			
			// 5. 체크된 이미지 삭제
			String[] deleteImageIds = request.getParameterValues("deleteImageIds");
			
			if(deleteImageIds != null && deleteImageIds.length > 0) {
				List<Integer> imageIdList = new ArrayList<>();
				
				for(String id : deleteImageIds) {
					imageIdList.add(Integer.parseInt(id));
				}
				
				service.removeImages(imageIdList);
			}
			
			// 6. 새 이미지 업로드
			String uploadPath = request.getServletContext().getRealPath("/noticeDetailImages");
			
			File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            int orderIndex = 0;

            for (Part part : request.getParts()) {
                if ("noticeImages".equals(part.getName()) && part.getSize() > 0) {

                    String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();

                    if (fileName != null && !fileName.isEmpty()) {
                        part.write(uploadPath + File.separator + fileName);

                        NoticeImages image = new NoticeImages();
                        image.setNoticeId(noticeId);
                        image.setImageUrl(fileName);
                        image.setOrderIndex(orderIndex++);

                        service.addImage(image);
                    }
                }
            }
            
            response.sendRedirect(request.getContextPath() + "/gym/noticeDetail?noticeId=" + noticeId + "&gymId=" + loginGymId);
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}

}
