package controller.gym;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GymSchedule
 */
@WebServlet("/gym/schedule")
public class GymSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymSchedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		GymScheduleService service = new GymScheduleServiceImpl();
		
		try {
//            HttpSession session = request.getSession();

//            Integer gymId = (Integer) session.getAttribute("gymId");
//
//            if (gymId == null) {
//                response.sendRedirect(request.getContextPath() + "/login.jsp");
//                return;
//            }


//
//            request.setAttribute("trainerList", data.get("trainerList"));
//            request.setAttribute("dayList", data.get("dayList"));
//            request.setAttribute("hourList", data.get("hourList"));
//            request.setAttribute("scheduleMap", data.get("scheduleMap"));
//            request.setAttribute("weekRangeText", data.get("weekRangeText"));
			
			String weekOffsetStr = request.getParameter("weekOffset");

            int weekOffset = 0;
            if (weekOffsetStr != null) {
                weekOffset = Integer.parseInt(weekOffsetStr);
            }

            LocalDate today = LocalDate.now().plusWeeks(weekOffset);

            LocalDate weekStart = today.with(DayOfWeek.MONDAY);
            LocalDate weekEnd = weekStart.plusDays(7);
            
//          Map<String, Object> data = service.getSchedulePageData(gymId, weekOffset);
            
            //더미 데이터
            List<dto.gym.TrainerChoose> trainerList = new java.util.ArrayList<>();
            trainerList.add(new dto.gym.TrainerChoose(1, "김민수"));
            trainerList.add(new dto.gym.TrainerChoose(2, "이현우"));

            List<dto.gym.ScheduleDay> dayList = new java.util.ArrayList<>();
            String[] dayNames = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};

            for (int i = 0; i < 7; i++) {
                LocalDate date = weekStart.plusDays(i);

                dayList.add(new dto.gym.ScheduleDay(
                    date.getDayOfWeek().getValue(),
                    dayNames[i],
                    date.getMonthValue() + "/" + date.getDayOfMonth()
                ));
            }

            List<Integer> hourList = new java.util.ArrayList<>();
            for (int i = 13; i <= 18; i++) hourList.add(i);

            Map<Integer, Map<Integer, java.util.List<dto.gym.PtSessionView>>> scheduleMap = new java.util.HashMap<>();

            for (Integer hour : hourList) {
                Map<Integer, java.util.List<dto.gym.PtSessionView>> dayMap = new java.util.HashMap<>();
                for (dto.gym.ScheduleDay d : dayList) {
                    dayMap.put(d.getValue(), new java.util.ArrayList<>());
                }
                scheduleMap.put(hour, dayMap);
            }

            // 샘플 예약 하나
            dto.gym.PtSessionView s = new dto.gym.PtSessionView();
            s.setTrainerId(1);
            s.setTrainerName("김민수");
            s.setClientName("홍길동");
            s.setStartTime("14:00");
            s.setSpecialization("식단");
            s.setStartHour(14);
            s.setDayOfWeek(1);

            scheduleMap.get(14).get(1).add(s);

            request.setAttribute("trainerList", trainerList);
            request.setAttribute("dayList", dayList);
            request.setAttribute("hourList", hourList);
            request.setAttribute("scheduleMap", scheduleMap);
            request.setAttribute("weekOffset", weekOffset);
            
            LocalDate weekLastDay = weekStart.plusDays(6);

            String weekRangeText =
                weekStart.getYear() + "년 " + weekStart.getMonthValue() + "월 " + weekStart.getDayOfMonth() + "일 - "
              + weekLastDay.getYear() + "년 " + weekLastDay.getMonthValue() + "월 " + weekLastDay.getDayOfMonth() + "일";

            request.setAttribute("weekRangeText", weekRangeText);

            // 🟢 더미 데이터 끝

            request.getRequestDispatcher("/gym/gym_schedule.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        } 
	}

}
