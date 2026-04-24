package controller.gym;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.gym.Gym;
import dto.gym.GymNotice;
import dto.gym.GymTrainerView;
import dto.gym.Membership;
import dto.gym.Review;
import dto.gym.Schedule;
import service.gym.GymService;
import service.gym.GymServiceImpl;

/**
 * Servlet implementation class Main
 */
@WebServlet("/main")
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
		GymService service = new GymServiceImpl();
		try {
			String gymIdStr = request.getParameter("gymId");
			
			//임시
			if(gymIdStr == null || gymIdStr.isEmpty()) {
				gymIdStr = "1";
			}
			
			int gymId = Integer.parseInt(gymIdStr);
			
			// =========================
            // DB 대신 더미 데이터 시작
            // =========================

            Gym gym = new Gym();
            gym.setId(gymId);
            gym.setName("핏츠버그 강남점");
            gym.setPhoneNum("02-1234-5678");
            gym.setAddress("서울 강남구 테헤란로 123");
            gym.setDescription("24시간 운영 / PT / GX / 샤워실 완비");

            List<GymNotice> noticeList = new ArrayList<>();

            GymNotice n1 = new GymNotice();
            n1.setId(1);
            n1.setGymId(gymId);
            n1.setTitle("4월 이벤트 안내");
            n1.setContent("PT 할인 이벤트 진행 중입니다.");
            n1.setViewCount(120);
            n1.setCreatedAt(new java.util.Date());
            noticeList.add(n1);
            
            List<Review> reviewList = new ArrayList<>();

            Review r1 = new Review();
            r1.setReviewNum(1);
            r1.setGymId(gymId);
            r1.setClientId(101);
            r1.setClientName("홍길동");
            r1.setStar(5);
            r1.setRating(4.8);
            r1.setComment("시설이 깔끔하고 트레이너분들이 정말 친절합니다.");
            r1.setCreatedAt(new java.util.Date());
            r1.setFile("review1.jpg"); // 이미지 파일명
            reviewList.add(r1);

            Review r2 = new Review();
            r2.setReviewNum(2);
            r2.setGymId(gymId);
            r2.setClientId(102);
            r2.setClientName("김영희");
            r2.setStar(4);
            r2.setRating(4.2);
            r2.setComment("기구 종류가 많아서 좋아요. 다만 사람이 조금 많습니다.");
            r2.setCreatedAt(new java.util.Date());
            r2.setFile(null); // 이미지 없는 경우
            reviewList.add(r2);

            Review r3 = new Review();
            r3.setReviewNum(3);
            r3.setGymId(gymId);
            r3.setClientId(103);
            r3.setClientName("이철수");
            r3.setStar(5);
            r3.setRating(5.0);
            r3.setComment("PT 받았는데 효과 확실합니다. 강추!");
            r3.setCreatedAt(new java.util.Date());
            r3.setFile("review3.jpg");
            reviewList.add(r3);

            List<Membership> membershipList = new ArrayList<>();

            Membership m1 = new Membership();
            m1.setMembershipNum(1);
            m1.setGymNum(gymId);
            m1.setType("1개월 이용권");
            m1.setTypeRep(1);   // 대표 여부 (1 = 대표라고 가정)
            m1.setPrice(120000);
            membershipList.add(m1);

            Membership m2 = new Membership();
            m2.setMembershipNum(2);
            m2.setGymNum(gymId);
            m2.setType("3개월 이용권");
            m2.setTypeRep(0);
            m2.setPrice(300000);
            membershipList.add(m2);

            Membership m3 = new Membership();
            m3.setMembershipNum(3);
            m3.setGymNum(gymId);
            m3.setType("PT 10회");
            m3.setTypeRep(0);
            m3.setPrice(500000);
            membershipList.add(m3);

            Schedule schedule = new Schedule();
            schedule.setAvailableWeekdayStart("06:00");
            schedule.setAvailableWeekdayEnd("23:00");
            schedule.setAvailableWeekendStart("09:00");
            schedule.setAvailableWeekendEnd("20:00");

            List<GymTrainerView> trainerList = new ArrayList<>();

            GymTrainerView t1 = new GymTrainerView();
            t1.setId(1);
            t1.setName("김트레이너");
            t1.setProfileImg("trainer1.jpg"); // 이미지 경로 (나중에 /img/... 붙여도 됨)
            t1.setMemberCount(25);

            List<String> advList1 = new ArrayList<>();
            advList1.add("체형교정");
            advList1.add("다이어트");
            t1.setAdvList(advList1);

            t1.setMainSpecial("체형교정 전문");
            trainerList.add(t1);


            GymTrainerView t2 = new GymTrainerView();
            t2.setId(2);
            t2.setName("이트레이너");
            t2.setProfileImg("trainer2.jpg");
            t2.setMemberCount(18);

            List<String> advList2 = new ArrayList<>();
            advList2.add("근력증가");
            advList2.add("바디프로필");
            t2.setAdvList(advList2);

            t2.setMainSpecial("바디프로필 전문");
            trainerList.add(t2);

           
            // =========================
            // DB 대신 더미 데이터 끝
            // =========================
			
//			Gym gym = service.getGymMainInfo(gymId);
//			List<GymNotice> noticeList = service.getNoticeList(gymId);
//			List<Review> reviewList = service.getReviewList(gymId);
//			List<Membership> membershipList = service.getMembershipList(gymId);
//			Schedule schedule = service.getSchedule(gymId);
//			List<GymTrainerView> trainerList = service.getGymTrainerViewList(gymId);
			
			request.setAttribute("gym", gym);
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("membershipList", membershipList);
			request.setAttribute("schedule", schedule);
			request.setAttribute("trainerList", trainerList);
			request.setAttribute("trainerCount", trainerList.size());
			
			request.getRequestDispatcher("/gym/common/gym_main.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException("메인페이지 오류", e);
		}
		
	}

}
