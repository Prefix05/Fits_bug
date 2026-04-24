package controller.gym;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.gym.GymNotice;
import service.gym.GymNoticeService;
import service.gym.GymNoticeServiceImpl;

/**
 * Servlet implementation class GymNotice
 */
@WebServlet("/common/notice")
public class GymNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GymNoticeService service = new GymNoticeServiceImpl();
		try {
			HttpSession session = request.getSession();
			
			if(session.getAttribute("gymId")==null) { // 임시
				session.setAttribute("gymId", 1);
			}
			
			Integer gymId = (Integer) session.getAttribute("gymId");
			
			if(gymId == null) {
				response.sendRedirect(request.getContextPath() + "/login.jsp");
				return;
			}
			
			String sort = request.getParameter("sort");
			if(sort == null || sort.isEmpty()) {
				sort="latest";
			}
			
			int page = 1;
			String pageStr = request.getParameter("page");
			if(pageStr != null && !pageStr.isEmpty()) {
				page=Integer.parseInt(pageStr);
			}
			
			int pageSize = 5;
			int offset = (page - 1) * pageSize;
			
			Map<String, Object> param = new HashMap<>();
			param.put("gymId", gymId);
			param.put("sort", sort);
			param.put("pageSize", pageSize);
			param.put("offset", offset);
			
//			int totalCount = service.getNoticeCount(gymId);
//			List<GymNotice> noticeList = service.getNoticeList(param);
			int totalCount = 12;

			List<GymNotice> noticeList = new java.util.ArrayList<>();

			GymNotice n1 = new GymNotice();
			n1.setId(1);
			n1.setGymId(gymId);
			n1.setTitle("여름 맞이 바디프로필 챌린지 1기 모집");
			n1.setContent("회원 여러분의 성원에 힘입어 첫 번째 공식 바디프로필 프로젝트를 시작합니다.");
			n1.setViewCount(1290);
			n1.setCreatedAt(new java.util.Date());
			noticeList.add(n1);

			GymNotice n2 = new GymNotice();
			n2.setId(2);
			n2.setGymId(gymId);
			n2.setTitle("추석 연휴 센터 운영 시간 안내");
			n2.setContent("다가오는 추석 명절 연휴 기간 동안의 센터 운영 일정을 안내드립니다.");
			n2.setViewCount(892);
			n2.setCreatedAt(new java.util.Date());
			noticeList.add(n2);

			GymNotice n3 = new GymNotice();
			n3.setId(3);
			n3.setGymId(gymId);
			n3.setTitle("신규 웨이트 머신 5종 입고 안내");
			n3.setContent("회원님들의 더 나은 운동 환경을 위해 최신형 웨이트 기구들을 새롭게 도입하였습니다.");
			n3.setViewCount(521);
			n3.setCreatedAt(new java.util.Date());
			noticeList.add(n3);

			GymNotice n4 = new GymNotice();
			n4.setId(4);
			n4.setGymId(gymId);
			n4.setTitle("7월 우수 회원 시상 결과");
			n4.setContent("지난 한 달간 가장 열정적으로 운동해주신 회원님들을 발표합니다.");
			n4.setViewCount(2105);
			n4.setCreatedAt(new java.util.Date());
			noticeList.add(n4);

			GymNotice n5 = new GymNotice();
			n5.setId(5);
			n5.setGymId(gymId);
			n5.setTitle("센터 내부 청소 일정 공지");
			n5.setContent("보다 쾌적한 운동 환경을 위한 정기 청소 일정을 안내드립니다.");
			n5.setViewCount(310);
			n5.setCreatedAt(new java.util.Date());
			noticeList.add(n5);
			
			int totalPage = (int)Math.ceil((double) totalCount / pageSize);
			
			int blockSize = 5;
			int startPage = ((page - 1) / blockSize) * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if(endPage > totalPage) endPage = totalPage;
			
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("noticeCount", totalCount);
			request.setAttribute("sort", sort);
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			request.getRequestDispatcher("/gym/common/gym_notice.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException("공지사항 목록 조회 중 오류", e);
		}
	}

}
