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
import dto.gym.GymPeakTime;
import dto.gym.Membership;
import dto.gym.Schedule;
import service.gym.GymInfoEditService;
import service.gym.GymInfoEditServiceImpl;

/**
 * Servlet implementation class GymInfoEdit
 */
@WebServlet("/gym/infoEdit")
public class GymInfoEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymInfoEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		GymInfoEditService service = new GymInfoEditServiceImpl();
//		
//		HttpSession session = request.getSession();
//		int gymId = (int) session.getAttribute("gymId");
		
//		 Gym gym = service.selectGymMypage(gymId);
//	     Schedule schedule = service.selectSchedule(gymId);
//	     List<Membership> membershipList = service.selectMembershipList(gymId);
//	     List<GymPeakTime> peakTimeList = service.selectPeakTimeList(gymId);
		//더미 데이터
		int gymId = 1;
		Gym gym = new Gym();
		gym.setId(1);
		gym.setUserId(1);
		gym.setName("핏불 헬스장");
		gym.setPhoneNum("010-1234-5678");
		gym.setDescription("최신 시설과 최고의 트레이너가 함께하는 헬스장입니다.");
		gym.setAddress("서울시 강남구 테헤란로 123");
		gym.setAddressDetail("5층");
		gym.setPostcode("06234");
		gym.setLatitude(37.123);
		gym.setLongitude(127.123);
		gym.setFacility("주차장,샤워실,락커룸");
		gym.setFile("g1.jpg,g2.jpg,g3.jpg");
		gym.setBackgroundImg("bg.jpg");
		gym.setBrFile("biz.jpg");

		// USER 정보
		gym.setEmailId("test@test.com");
		gym.setUserName("홍길동");
		gym.setTel("010-9999-8888");
		gym.setProfileImg("profile.jpg");

		// 운영시간
		Schedule schedule = new Schedule();
		schedule.setGymNum(1);
		schedule.setAvailableWeekdayStart("06:00");
		schedule.setAvailableWeekdayEnd("23:00");
		schedule.setAvailableWeekendStart("09:00");
		schedule.setAvailableWeekendEnd("20:00");

		// 이용권 리스트
		List<Membership> membershipList = new java.util.ArrayList<>();

		Membership m1 = new Membership();
		m1.setMembershipNum(1);
		m1.setGymNum(1);
		m1.setType("1개월");
		m1.setTypeRep(30);
		m1.setPrice(70000);

		Membership m2 = new Membership();
		m2.setMembershipNum(2);
		m2.setGymNum(1);
		m2.setType("3개월");
		m2.setTypeRep(90);
		m2.setPrice(180000);

		membershipList.add(m1);
		membershipList.add(m2);

		// 혼잡 시간대
		List<GymPeakTime> peakTimeList = new java.util.ArrayList<>();

		GymPeakTime p1 = new GymPeakTime();
		p1.setGymId(1);
		p1.setDayOfWeek("월");
		p1.setStartTime("18:00");
		p1.setEndTime("21:00");

		GymPeakTime p2 = new GymPeakTime();
		p2.setGymId(1);
		p2.setDayOfWeek("수");
		p2.setStartTime("19:00");
		p2.setEndTime("22:00");

		peakTimeList.add(p1);
		peakTimeList.add(p2);
		//더미 데이터

	     request.setAttribute("gym", gym);
	     request.setAttribute("schedule", schedule);
	     request.setAttribute("membershipList", membershipList);
	     request.setAttribute("peakTimeList", peakTimeList);

	     request.getRequestDispatcher("/gym/gym_infoEdit.jsp").forward(request, response);
	}

}
