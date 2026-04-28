package controller.gym;

import java.io.IOException;
import java.util.Arrays;
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
 * Servlet implementation class GymInfoUpdate
 */
@WebServlet("/gym/infoUpdate")
public class GymInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymInfoUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GymInfoEditService service = new GymInfoEditServiceImpl();
		
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		int gymId = (int) session.getAttribute("gymId");
		int userId = (int) session.getAttribute("userId");

        // 기존 gym 조회
        Gym gym = service.selectGymMypage(gymId);

        // USER + GYM 기본 정보
        gym.setId(gymId);
        gym.setUserId(userId);
        gym.setEmailId(request.getParameter("emailId"));
        gym.setUserName(request.getParameter("userName"));
        gym.setTel(request.getParameter("tel"));

        gym.setName(request.getParameter("gymName"));
        gym.setPhoneNum(request.getParameter("phoneNum"));
        gym.setDescription(request.getParameter("description"));
        gym.setAddress(request.getParameter("address"));
        gym.setAddressDetail(request.getParameter("addressDetail"));
        gym.setPostcode(request.getParameter("postcode"));

        // 편의시설
        String[] facilities = request.getParameterValues("facility");
        gym.setFacility(facilities == null ? "" : String.join(",", facilities));

        // 갤러리 삭제 요청 처리: DB 문자열에서만 제거
        String deleteGallery = request.getParameter("deleteGallery");
        if (deleteGallery != null && !deleteGallery.trim().isEmpty()) {
            List<String> currentFiles = new java.util.ArrayList<>();

            if (gym.getFile() != null && !gym.getFile().trim().isEmpty()) {
                currentFiles.addAll(Arrays.asList(gym.getFile().split(",")));
            }

            String[] deleteFiles = deleteGallery.split(",");
            for (String del : deleteFiles) {
                currentFiles.remove(del);
            }

            gym.setFile(String.join(",", currentFiles));
        }

        service.updateGym(gym);
        service.updateGymUser(gym);

        // 운영시간
        Schedule schedule = new Schedule();
        schedule.setGymNum(gymId);
        schedule.setAvailableWeekdayStart(request.getParameter("weekdayStart"));
        schedule.setAvailableWeekdayEnd(request.getParameter("weekdayEnd"));
        schedule.setAvailableWeekendStart(request.getParameter("weekendStart"));
        schedule.setAvailableWeekendEnd(request.getParameter("weekendEnd"));

        service.updateSchedule(schedule);

        // 혼잡 시간대: 전체 삭제 후 재등록
        service.deletePeakTimeByGymId(gymId);

        String[] peakDays = request.getParameterValues("peakDay");
        String[] peakStarts = request.getParameterValues("peakStart");
        String[] peakEnds = request.getParameterValues("peakEnd");

        if (peakDays != null) {
            for (int i = 0; i < peakDays.length; i++) {
                GymPeakTime peak = new GymPeakTime();
                peak.setGymId(gymId);
                peak.setDayOfWeek(peakDays[i]);
                peak.setStartTime(peakStarts[i]);
                peak.setEndTime(peakEnds[i]);

                service.insertPeakTime(peak);
            }
        }

        // 이용권 수정/추가
        String[] membershipIds = request.getParameterValues("membershipId");
        String[] membershipTypes = request.getParameterValues("membershipType");
        String[] membershipTypeReps = request.getParameterValues("membershipTypeRep");
        String[] membershipPrices = request.getParameterValues("membershipPrice");

        if (membershipIds != null) {
            for (int i = 0; i < membershipIds.length; i++) {
                Membership m = new Membership();
                m.setGymNum(gymId);
                m.setType(membershipTypes[i]);
                m.setTypeRep(Integer.parseInt(membershipTypeReps[i]));
                m.setPrice(Integer.parseInt(membershipPrices[i]));

                if ("new".equals(membershipIds[i])) {
                    service.insertMembership(m);
                } else {
                    m.setMembershipNum(Integer.parseInt(membershipIds[i]));
                    service.updateMembership(m);
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/gym/gym_infoEdit.jsp");
	}

}
