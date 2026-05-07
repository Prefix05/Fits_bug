package controller.gym;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dto.gym.GymNotice;
import dto.gym.NoticeImages;
import dto.member.UserDTO;
import service.gym.GymNoticeService;
import service.gym.GymNoticeServiceImpl;

/**
 * Servlet implementation class GymNoticeUpdate
 */
@WebServlet("/gym/noticeUpdate")
@MultipartConfig
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		try {

			// 1. 로그인 세션 확인
			HttpSession session = request.getSession();
			UserDTO loginUser = (UserDTO)session.getAttribute("loginUser"); 
			if (loginUser == null || loginUser.getOtherId()==null) {
				response.sendRedirect(request.getContextPath() + "/member/login");
				return;
			}

			GymNoticeService service = new GymNoticeServiceImpl();

			Integer noticeId = Integer.parseInt(request.getParameter("noticeId"));

			// 4. 공지 수정
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			GymNotice notice = new GymNotice();
			notice.setId(noticeId);
			notice.setTitle(title);
			notice.setContent(content);
			service.updateNotice(notice);

//			// 5. 체크된 이미지 삭제
//			String[] deleteImageIds = request.getParameterValues("deleteImageIds");
//
//			if (deleteImageIds != null && deleteImageIds.length > 0) {
//			    List<NoticeImages> currentImages = service.getImagesByNoticeId(noticeId);
//			    List<Integer> imageIdList = new ArrayList<>();
//
//			    String uploadPath = request.getServletContext().getRealPath("/noticeDetailImages");
//
//			    for (String id : deleteImageIds) {
//			        int imageId = Integer.parseInt(id);
//			        imageIdList.add(imageId);
//
//			        for (NoticeImages img : currentImages) {
//			            if (img.getImageId() == imageId && img.getImageUrl() != null) {
//			                File file = new File(uploadPath, new File(img.getImageUrl()).getName());
//			                if (file.exists()) {
//			                    file.delete();
//			                }
//			            }
//			        }
//			    }
//
//			    service.removeImages(imageIdList);
//			}
//
//			// 6. 새 이미지 업로드
//			String uploadPath = request.getServletContext().getRealPath("/noticeDetailImages");
//
//			File uploadDir = new File(uploadPath);
//			if (!uploadDir.exists()) {
//				uploadDir.mkdirs();
//			}
//
//			int orderIndex = 0;
//
//			for (Part part : request.getParts()) {
//			    if ("noticeImages".equals(part.getName()) && part.getSize() > 0) {
//
//			        String contentType = part.getContentType();
//
//			        if (contentType == null || !contentType.startsWith("image/")) {
//			            continue;
//			        }
//
//			        String originalFileName = new File(part.getSubmittedFileName()).getName();
//
//			        if (originalFileName == null || originalFileName.trim().isEmpty()) {
//			            continue;
//			        }
//
//			        String ext = "";
//			        int dotIndex = originalFileName.lastIndexOf(".");
//			        if (dotIndex != -1) {
//			            ext = originalFileName.substring(dotIndex);
//			        }
//
//			        String fileName =
//			                System.currentTimeMillis() + "_" +
//			                java.util.UUID.randomUUID().toString().replace("-", "") +
//			                ext;
//
//			        part.write(uploadPath + File.separator + fileName);
//
//			        NoticeImages image = new NoticeImages();
//			        image.setNoticeId(noticeId);
//			        image.setImageUrl(fileName);
//			        image.setOrderIndex(orderIndex++);
//
//			        service.addImage(image);
//			    }
//			}for (Part part : request.getParts()) {
//			    if ("noticeImages".equals(part.getName()) && part.getSize() > 0) {
//
//			        String contentType = part.getContentType();
//
//			        if (contentType == null || !contentType.startsWith("image/")) {
//			            continue;
//			        }
//
//			        String originalFileName = new File(part.getSubmittedFileName()).getName();
//
//			        if (originalFileName == null || originalFileName.trim().isEmpty()) {
//			            continue;
//			        }
//
//			        String ext = "";
//			        int dotIndex = originalFileName.lastIndexOf(".");
//			        if (dotIndex != -1) {
//			            ext = originalFileName.substring(dotIndex);
//			        }
//
//			        String fileName =
//			                System.currentTimeMillis() + "_" +
//			                java.util.UUID.randomUUID().toString().replace("-", "") +
//			                ext;
//
//			        part.write(uploadPath + File.separator + fileName);
//
//			        NoticeImages image = new NoticeImages();
//			        image.setNoticeId(noticeId);
//			        image.setImageUrl(fileName);
//			        image.setOrderIndex(orderIndex++);
//
//			        service.addImage(image);
//			    }
//			}
//
			response.sendRedirect(request.getContextPath() + "/gym/noticeDetail?noticeId=" + noticeId);

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}

}
