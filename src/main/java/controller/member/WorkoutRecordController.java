package controller.member;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dto.member.UserDTO;
import dto.member.WorkoutLogDTO;
import service.member.WorkoutLogService;
import service.member.WorkoutLogServiceImpl;

@WebServlet("/member/records")
public class WorkoutRecordController extends HttpServlet {

    private WorkoutLogService service = new WorkoutLogServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");
        if (user == null) { response.setStatus(401); return; }

        List<WorkoutLogDTO> list = service.getListByEmail(user.getEmail());

        response.setContentType("application/json;charset=UTF-8");
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < list.size(); i++) {
            WorkoutLogDTO r = list.get(i);
            json.append("{")
                .append("\"date\":\"").append(r.getDate()).append("\",")
                .append("\"startTime\":\"").append(r.getStartTime()).append("\",")
                .append("\"endTime\":\"").append(r.getEndTime()).append("\"")
                .append("}");
            if (i != list.size() - 1) json.append(",");
        }
        json.append("]");
        response.getWriter().write(json.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");
        if (user == null) { response.setStatus(401); return; }

        dao.member.MemberDAO memberDao = new dao.member.MemberDAOImpl();
        int memberId = memberDao.findMemberIdByEmail(user.getEmail());

        WorkoutLogDTO dto = new WorkoutLogDTO();
        dto.setMemberId(memberId);

        // ✅ LocalDate/LocalTime 타입에 맞게 파싱
        String dateStr = request.getParameter("date");
        if (dateStr != null && !dateStr.isEmpty()) {
            dto.setDate(LocalDate.parse(dateStr));
        } else {
            dto.setDate(LocalDate.now());
        }

        String startStr = request.getParameter("startTime");
        if (startStr != null && !startStr.isEmpty()) {
            dto.setStartTime(LocalTime.parse(startStr));
        }

        String endStr = request.getParameter("endTime");
        if (endStr != null && !endStr.isEmpty()) {
            dto.setEndTime(LocalTime.parse(endStr));
        }

        String gymIdStr = request.getParameter("gymId");
        if (gymIdStr != null && !gymIdStr.isEmpty()) {
            dto.setGymId(Integer.parseInt(gymIdStr));
        }

        service.save(dto);
        response.getWriter().write("success");
    }
}
