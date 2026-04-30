package controller.gym;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.gym.Dashboard;
import service.gym.GymDashboardService;
import service.gym.GymDashboardServiceImpl;

/**
 * Servlet implementation class GymDashboard
 */
@WebServlet("/gym/dashboard")
public class GymDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GymDashboard() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		GymDashboardService service = new GymDashboardServiceImpl();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

//        HttpSession session = request.getSession(false);
//        
//        if (session == null || session.getAttribute("gymId") == null) {
//            response.sendRedirect(request.getContextPath() + "/login.jsp");
//            return;
//        }
		


		// 더미 데이터
		Dashboard dashboard = new Dashboard();

		// 1. 신규 회원 수
		dashboard.setNewMemberCount(15);

		// 2. 매출
		dashboard.setTotalRevenue(new java.math.BigDecimal("45200000"));
		dashboard.setMembershipRevenue(new java.math.BigDecimal("32000000"));
		dashboard.setPtRevenue(new java.math.BigDecimal("13200000"));

		// 3. 오늘 예약 리스트
		java.util.List<dto.gym.TodayPtSchedule> scheduleList = new java.util.ArrayList<>();

		dto.gym.TodayPtSchedule s1 = new dto.gym.TodayPtSchedule();
		s1.setStartTime("10:00");
		s1.setTrainerName("김트레이너");
		s1.setMemberName("이회원");
		s1.setMembershipName("3개월 이용권");
		s1.setStatus("예약완료");

		dto.gym.TodayPtSchedule s2 = new dto.gym.TodayPtSchedule();
		s2.setStartTime("14:00");
		s2.setTrainerName("박트레이너");
		s2.setMemberName("최회원");
		s2.setMembershipName("6개월 이용권");
		s2.setStatus("완료");

		dto.gym.TodayPtSchedule s3 = new dto.gym.TodayPtSchedule();
		s3.setStartTime("18:00");
		s3.setTrainerName("정트레이너");
		s3.setMemberName("홍회원");
		s3.setMembershipName("이용권 없음");
		s3.setStatus("취소");

		scheduleList.add(s1);
		scheduleList.add(s2);
		scheduleList.add(s3);

		dashboard.setTodayScheduleList(scheduleList);

		// 4. 주간 방문
		java.util.List<dto.gym.WeeklyVisitStat> visitList = new java.util.ArrayList<>();

		String[] days = { "MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN" };
		int[] counts = { 45, 60, 85, 70, 100, 55, 50 };
		String[] dateLabels = { "04/27", "04/28", "04/29", "04/30", "05/01", "05/02", "05/03" };

		for (int i = 0; i < days.length; i++) {
			dto.gym.WeeklyVisitStat v = new dto.gym.WeeklyVisitStat();
			v.setDayName(days[i]);
			v.setVisitCount(counts[i]);
			v.setHeightPercent(counts[i]); // 대충 비율처럼 보이게
			v.setDateLabel(dateLabels[i]);
			visitList.add(v);
		}

		dashboard.setWeeklyVisitList(visitList);

		// 5. 트레이너 매출
		java.util.List<dto.gym.TopTrainerRevenue> trainerList = new java.util.ArrayList<>();

		dto.gym.TopTrainerRevenue t1 = new dto.gym.TopTrainerRevenue();
		t1.setTrainerName("김트레이너");
		t1.setSessionCount(120);
		t1.setRevenue(new java.math.BigDecimal("12000000"));

		dto.gym.TopTrainerRevenue t2 = new dto.gym.TopTrainerRevenue();
		t2.setTrainerName("박트레이너");
		t2.setSessionCount(95);
		t2.setRevenue(new java.math.BigDecimal("9500000"));

		dto.gym.TopTrainerRevenue t3 = new dto.gym.TopTrainerRevenue();
		t3.setTrainerName("이트레이너");
		t3.setSessionCount(80);
		t3.setRevenue(new java.math.BigDecimal("8000000"));

		trainerList.add(t1);
		trainerList.add(t2);
		trainerList.add(t3);

		dashboard.setTopTrainerList(trainerList);
		
		dashboard.setNewMemberGrowthRate(12.5);
		dashboard.setTotalRevenueGrowthRate(8.2);
		dashboard.setMembershipGrowthRate(10.1);
		dashboard.setPtGrowthRate(6.7);
		
		java.util.List<dto.gym.MembershipDistribution> distList = new java.util.ArrayList<>();

		dto.gym.MembershipDistribution d1 = new dto.gym.MembershipDistribution();
		d1.setMonth(3);
		d1.setPercent(25);

		dto.gym.MembershipDistribution d2 = new dto.gym.MembershipDistribution();
		d2.setMonth(6);
		d2.setPercent(35);

		dto.gym.MembershipDistribution d3 = new dto.gym.MembershipDistribution();
		d3.setMonth(12);
		d3.setPercent(40);

		distList.add(d1);
		distList.add(d2);
		distList.add(d3);

		dashboard.setMembershipDistributionList(distList);
		
		java.util.List<dto.gym.RevenueTrend> trendList = new java.util.ArrayList<>();

		String[] months = {"5월","6월","7월","8월","9월","10월"};
		int[] total = {40, 55, 70, 60, 80, 65};
		int[] membership = {25, 30, 45, 35, 50, 40};

		for (int i = 0; i < months.length; i++) {
		    dto.gym.RevenueTrend r = new dto.gym.RevenueTrend();
		    r.setMonth(months[i]);
		    r.setTotalPercent(total[i]);
		    r.setMembershipPercent(membership[i]);
		    trendList.add(r);
		}

		dashboard.setRevenueTrendList(trendList);
		
		java.util.List<dto.gym.HotTime> hotTimeList = new java.util.ArrayList<>();

		int[] hours = {6, 9, 12, 15, 18, 21, 23};
		int[] hotCounts = {5, 12, 25, 18, 40, 30, 10};
		int[] hotPercents = {12, 30, 62, 45, 100, 75, 25};

		for (int i = 0; i < hours.length; i++) {
		    dto.gym.HotTime h = new dto.gym.HotTime();
		    h.setHour(hours[i]);
		    h.setVisitCount(hotCounts[i]);
		    h.setHeightPercent(hotPercents[i]);
		    hotTimeList.add(h);
		}

		dashboard.setHotTimeList(hotTimeList);
		// 더미 데이터

		String selectedDate = request.getParameter("selectedDate");

		java.time.LocalDate date;

		if (selectedDate == null || selectedDate.isEmpty()) {
		    date = java.time.LocalDate.now();
		} else {
		    date = java.time.LocalDate.parse(selectedDate);
		}

		// 🔥 추가 (이게 핵심)
		String selectedDay = date.getDayOfWeek().toString().substring(0, 3);
		request.setAttribute("selectedDay", selectedDay);

		// 날짜 세팅
		dashboard.setTodayDate(date.toString());
		
		try {

//            Integer gymId = (Integer) session.getAttribute("gymId");
//
//            Dashboard dashboard = service.getDashboard(gymId);
			
			String weekStart = request.getParameter("weekStart");
//			String selectedDate = request.getParameter("selectedDate");

			
//			Dashboard dashboard = service.getDashboard(gymId, weekStart, selectedDate);

			request.setAttribute("dashboard", dashboard);

			request.getRequestDispatcher("/gym/gym_dashboard.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "대시보드 조회 중 오류가 발생했습니다.");
			request.setAttribute("url", request.getContextPath() + "/gym/main");

			request.getRequestDispatcher("/common/alert.jsp").forward(request, response);
		}
	}

}
