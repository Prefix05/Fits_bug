package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.MemberDTO;
import dto.member.WorkoutDetailDTO;
import dto.member.WorkoutLogDTO;
import service.member.WorkoutRecordService;
import service.member.WorkoutRecordServiceImpl;

@WebServlet("/member/records")
public class WorkoutRecordController extends HttpServlet {

    private WorkoutRecordService service = new WorkoutRecordServiceImpl();

    // =========================
    // 조회 (JSON)
    // =========================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MemberDTO user = (MemberDTO) request.getSession().getAttribute("loginUser");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        List<WorkoutLogDTO> list = service.getRecords(user.getEmail());

        response.setContentType("application/json;charset=UTF-8");

        StringBuilder json = new StringBuilder();
        json.append("[");

        for (int i = 0; i < list.size(); i++) {

            WorkoutLogDTO log = list.get(i);

            json.append("{");
            json.append("\"date\":\"").append(log.getDate()).append("\",");
            json.append("\"startTime\":\"").append(log.getStartTime()).append("\",");
            json.append("\"endTime\":\"").append(log.getEndTime()).append("\",");

            json.append("\"details\":[");

            List<WorkoutDetailDTO> details = log.getDetails();

            if (details != null) {
                for (int j = 0; j < details.size(); j++) {

                    WorkoutDetailDTO d = details.get(j);

                    json.append("{");
                    json.append("\"title\":\"").append(d.getTitle()).append("\",");
                    json.append("\"set\":").append(d.getSet()).append(",");
                    json.append("\"rep\":").append(d.getRep()).append(",");
                    json.append("\"weight\":").append(d.getWeight());
                    json.append("}");

                    if (j != details.size() - 1) {
                        json.append(",");
                    }
                }
            }

            json.append("]}");

            if (i != list.size() - 1) {
                json.append(",");
            }
        }

        json.append("]");

        response.getWriter().write(json.toString());
    }

    // =========================
    // 저장
    // =========================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MemberDTO user = (MemberDTO) request.getSession().getAttribute("loginUser");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        // ===== WorkoutLog 생성 =====
        WorkoutLogDTO log = new WorkoutLogDTO();

        log.setMemberId(user.getId()); // email ❌ → id 사용 (정석)
        log.setGymId(0); // 필요 시 세션/폼에서 받아오기
        log.setSessionId(0);

        // ===== Detail 생성 =====
        WorkoutDetailDTO detail = new WorkoutDetailDTO();
        detail.setTitle(request.getParameter("name"));
        detail.setSet(parseIntSafe(request.getParameter("sets")));
        detail.setRep(parseIntSafe(request.getParameter("reps")));
        detail.setWeight(parseDoubleSafe(request.getParameter("weight")));

        log.setDetails(List.of(detail));

        // ===== 저장 =====
        service.insertRecord(log);

        response.setContentType("text/plain;charset=UTF-8");
        response.getWriter().write("success");
    }

    // =========================
    // 안전 파싱 (예외 방지)
    // =========================
    private int parseIntSafe(String value) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return 0;
        }
    }

    private double parseDoubleSafe(String value) {
        try {
            return Double.parseDouble(value);
        } catch (Exception e) {
            return 0.0;
        }
    }
}