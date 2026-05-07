package controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.trainer.LessonDTO;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import util.MybatisSqlSessionFactory;

@WebServlet("/member/trainerSchedule")
public class TrainerScheduleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json;charset=UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            resp.getWriter().write("[]");
            return;
        }

        String trainerIdStr = req.getParameter("trainerId");
        String startDate    = req.getParameter("startDate");
        String endDate      = req.getParameter("endDate");

        if (trainerIdStr == null || startDate == null || endDate == null) {
            resp.getWriter().write("[]");
            return;
        }

        try (SqlSession sql = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("trainerId", Integer.parseInt(trainerIdStr));
            params.put("startDate", startDate);
            params.put("endDate",   endDate);

            List<LessonDTO> lessons = sql.selectList("lesson.findLessonsByDateRange", params);

            JSONArray arr = new JSONArray();
            for (LessonDTO l : lessons) {
                JSONObject obj = new JSONObject();
                obj.put("lessonDate", l.getLessonDate());
                obj.put("startTime",  l.getStartTime());
                obj.put("endTime",    l.getEndTime());
                obj.put("status",     l.getStatus());
                arr.put(obj);
            }
            resp.getWriter().write(arr.toString());

        } catch (Exception e) {
            resp.getWriter().write("[]");
        }
    }
}
