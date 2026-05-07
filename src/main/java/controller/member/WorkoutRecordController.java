package controller.member;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dao.member.WorkoutLogDAO;
import dao.member.WorkoutLogDAOImpl;
import dto.member.UserDTO;
import dto.member.WorkoutDetailDTO;
import dto.member.WorkoutLogDTO;
import service.member.WorkoutLogService;
import service.member.WorkoutLogServiceImpl;

@WebServlet("/member/workout")
public class WorkoutRecordController extends HttpServlet {

    private WorkoutLogService service = new WorkoutLogServiceImpl();
    private WorkoutLogDAO     logDao  = new WorkoutLogDAOImpl();
    private MemberDAO         memberDao = new MemberDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");
        if (user == null) { response.setStatus(401); return; }

        int memberId = user.getOtherId();

        // ✅ 오늘 날짜 기록만 조회 (findTodayByMemberId)
        List<WorkoutLogDTO> list = logDao.findTodayByMemberId(memberId);
        if (list == null) list = new ArrayList<>();

        response.setContentType("application/json;charset=UTF-8");
        StringBuilder json = new StringBuilder("[");
        int idx = 0;
        for (WorkoutLogDTO log : list) {
            if (log.getDetails() == null) continue;
            for (WorkoutDetailDTO d : log.getDetails()) {
                if (idx > 0) json.append(",");
                json.append("{")
                    .append("\"title\":\"").append(esc(d.getTitle())).append("\",")
                    .append("\"weight\":").append(d.getWeight()).append(",")
                    .append("\"rep\":").append(d.getRep()).append(",")
                    .append("\"set\":").append(d.getSet())
                    .append("}");
                idx++;
            }
        }
        json.append("]");
        response.getWriter().write(json.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        request.setCharacterEncoding("UTF-8");

        UserDTO user = (UserDTO) request.getSession().getAttribute("loginUser");
        if (user == null) { response.setStatus(401); return; }

        int memberId = user.getOtherId();

        // ── WORKOUT_LOG 구성 ─────────────────────────────────
        WorkoutLogDTO dto = new WorkoutLogDTO();
        dto.setMemberId(memberId);
        dto.setDate(LocalDate.now());                         

        String startStr = request.getParameter("startTime");
        String endStr   = request.getParameter("endTime");
        if (startStr != null && !startStr.isEmpty())
            dto.setStartTime(LocalTime.parse(startStr));
        if (endStr   != null && !endStr.isEmpty())
            dto.setEndTime(LocalTime.parse(endStr));

        String title  = request.getParameter("name");    // 운동명
        String wtStr  = request.getParameter("weight");  // 무게
        String rpStr  = request.getParameter("reps");    // 횟수
        String setStr = request.getParameter("sets");    // 세트 (기본 1)

        double weight = 0;
        int    reps   = 0;
        int    sets   = 1;
        try { weight = Double.parseDouble(wtStr); }  catch (Exception ignored) {}
        try { reps   = Integer.parseInt(rpStr);   }  catch (Exception ignored) {}
        try { sets   = Integer.parseInt(setStr);  }  catch (Exception ignored) {}

        if (title != null && !title.trim().isEmpty()) {
            WorkoutDetailDTO detail = new WorkoutDetailDTO();
            detail.setTitle(title.trim());
            detail.setWeight(weight);
            detail.setRep(reps);
            detail.setSet(sets);

            List<WorkoutDetailDTO> details = new ArrayList<>();
            details.add(detail);
            dto.setDetails(details);
        }

        int result = service.save(dto);

        response.setContentType("application/json;charset=UTF-8");
        if (result > 0) {
            response.getWriter().write("{\"success\":true,\"workoutId\":" + dto.getId() + "}");
        } else {
            response.getWriter().write("{\"success\":false}");
        }
    }

    private String esc(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
