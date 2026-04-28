package controller.gym;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.gym.Gym;
import dto.gym.GymNotice;
import dto.gym.GymTrainerView;
import dto.gym.Membership;
import dto.gym.Review;
import dto.gym.Schedule;
//import service.gym.GymService;
//import service.gym.GymServiceImpl;

/**
 * Servlet implementation class GymMain
 */
@WebServlet("/gym/main")
public class GymMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//			GymService service = new GymServiceImpl();

			try {
//				String gymIdStr = request.getParameter("gymId");
//				if(gymIdStr == null || gymIdStr.isEmpty()) {
//					gymIdStr ="1";
//				}
//				
//				int gymId = Integer.parseInt(gymIdStr);
				
				// =========================
		        // 더미 데이터 시작
		        // =========================
				int gymId = 1;
				
		        Gym gym = new Gym();
		        gym.setId(gymId);
		        gym.setName("핏츠버그 강남점");
		        gym.setPhoneNum("02-1234-5678");
		        gym.setAddress("서울 강남구 테헤란로 123");
		        gym.setDescription("24시간 운영 / PT / GX / 샤워실 완비");
		        gym.setFile("gym1.jpg,gym2.jpg,gym3.jpg,gym4.jpg");

		        // 리뷰
		        List<Review> reviewList = new java.util.ArrayList<>();

		        Review r1 = new Review();
		        r1.setReviewNum(1);
		        r1.setGymId(gymId);
		        r1.setClientId(101);
		        r1.setClientName("홍길동");
		        r1.setStar(5);
		        r1.setRating(4.8);
		        r1.setComment("시설이 깔끔하고 트레이너분들이 친절합니다.");
		        r1.setCreatedAt(new java.util.Date());
		        r1.setFile("review1.jpg");
		        reviewList.add(r1);

		        Review r2 = new Review();
		        r2.setReviewNum(2);
		        r2.setGymId(gymId);
		        r2.setClientId(102);
		        r2.setClientName("김영희");
		        r2.setStar(4);
		        r2.setRating(4.2);
		        r2.setComment("기구가 많고 좋아요.");
		        r2.setCreatedAt(new java.util.Date());
		        reviewList.add(r2);

		        // 이용권
		        List<Membership> membershipList = new java.util.ArrayList<>();

		        Membership m1 = new Membership();
		        m1.setMembershipNum(1);
		        m1.setGymNum(gymId);
		        m1.setType("1개월 이용권");
		        m1.setPrice(120000);
		        membershipList.add(m1);

		        Membership m2 = new Membership();
		        m2.setMembershipNum(2);
		        m2.setGymNum(gymId);
		        m2.setType("3개월 이용권");
		        m2.setPrice(300000);
		        membershipList.add(m2);

		        // 스케줄
		        Schedule schedule = new Schedule();
		        schedule.setAvailableWeekdayStart("06:00");
		        schedule.setAvailableWeekdayEnd("23:00");
		        schedule.setAvailableWeekendStart("09:00");
		        schedule.setAvailableWeekendEnd("20:00");

		        // 트레이너
		        List<GymTrainerView> trainerList = new java.util.ArrayList<>();

		        GymTrainerView t1 = new GymTrainerView();
		        t1.setId(1);
		        t1.setName("김트레이너");
		        t1.setProfileImg("trainer1.jpg");
		        t1.setMemberCount(20);

		        java.util.List<String> adv1 = new java.util.ArrayList<>();
		        adv1.add("다이어트");
		        adv1.add("체형교정");
		        t1.setAdvList(adv1);

		        trainerList.add(t1);

		        // =========================
		        // 더미 데이터 끝
		        // =========================
				
				// 🔹 DB에서 가져오기
//				Gym gym = service.getGymMainInfo(gymId);
//				List<GymNotice> noticeList = service.getNoticeList(gymId);
//				List<Review> reviewList = service.getReviewList(gymId);
//				List<Membership> membershipList = service.getMembershipList(gymId);
//				Schedule schedule = service.getSchedule(gymId);
//				List<GymTrainerView> trainerList = service.getGymTrainerViewList(gymId);
				
				HttpSession session = request.getSession(false);
				Object loginUserId = null;
				Object loginGym = null;
				
				if(session != null) {
					loginUserId = session.getAttribute("loginUserId");
					loginGym = session.getAttribute("loginGym");
				}

				// 🔹 request에 담기
				request.setAttribute("gym", gym);
//				request.setAttribute("noticeList", noticeList);
				request.setAttribute("reviewList", reviewList);
				request.setAttribute("membershipList", membershipList);
				request.setAttribute("schedule", schedule);
				request.setAttribute("trainerList", trainerList);
				request.setAttribute("trainerCount", trainerList.size());
				request.setAttribute("loginUserId", loginUserId);
				request.setAttribute("loginGym", loginGym);

				// 🔹 JSP 이동
				request.getRequestDispatcher("/gym/gym_main.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException("메인페이지 로딩 오류", e);
			}
		}
			
	}


