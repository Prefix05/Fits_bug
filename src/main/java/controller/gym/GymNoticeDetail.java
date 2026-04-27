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
import service.gym.GymNoticeService;
import service.gym.GymNoticeServiceImpl;

/**
 * Servlet implementation class GymNoticeDetail
 */
@WebServlet("/gym/noticeDetail")
@MultipartConfig
public class GymNoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymNoticeDetail() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("GymNoticeDetail doGet 들어옴");
    	GymNoticeService service = new GymNoticeServiceImpl();

        try {
//            int noticeId = Integer.parseInt(request.getParameter("noticeId"));

            // 조회수 증가
//            service.increaseViewCount(noticeId);

            // 공지 조회
//            GymNotice notice = service.getNoticeDetail(noticeId);

            // 이미지 조회
//            List<NoticeImages> imageList = service.getImagesByNoticeId(noticeId);
        	
        	//더미 데이터
        	int noticeId = 1;

            // 🔹 공지 더미
            GymNotice notice = new GymNotice();
            notice.setId(noticeId);
            notice.setGymId(1);
            notice.setTitle("추석 연휴 운영 안내");
            notice.setContent("안녕하세요.\n추석 연휴 기간 운영 시간이 변경됩니다.\n이용에 참고 바랍니다.");
            notice.setViewCount(123);

            // 🔹 이미지 더미
            List<NoticeImages> imageList = new ArrayList<>();

            NoticeImages img1 = new NoticeImages();
            img1.setImageId(1);
            img1.setNoticeId(noticeId);
            img1.setImageUrl("sample1.jpg");
            img1.setOrderIndex(0);
            imageList.add(img1);

            NoticeImages img2 = new NoticeImages();
            img2.setImageId(2);
            img2.setNoticeId(noticeId);
            img2.setImageUrl("sample2.jpg");
            img2.setOrderIndex(1);
            imageList.add(img2);

            // 🔹 이전글 / 다음글 (선택)
            GymNotice prev = new GymNotice();
            prev.setId(0);
            prev.setTitle("이전 공지입니다");

            GymNotice next = new GymNotice();
            next.setId(2);
            next.setTitle("다음 공지입니다");
            //더미 데이터

            request.setAttribute("notice", notice);
            request.setAttribute("imageList", imageList);
            request.setAttribute("prevNotice", prev);
            request.setAttribute("nextNotice", next);

            request.getRequestDispatcher("/gym/gym_noticeDetail.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

}
