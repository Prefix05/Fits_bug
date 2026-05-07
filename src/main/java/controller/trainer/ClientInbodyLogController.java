package controller.trainer;

import dao.trainer.ClientDAO;
import dao.trainer.ClientDAOImpl;
import dto.trainer.ClientDTO;
import dto.trainer.TrainerDTO;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/trainer/clientInbodyLog")
public class ClientInbodyLogController extends HttpServlet {

    private final ClientDAO clientDAO = new ClientDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginTrainer") == null) {
            response.sendRedirect(request.getContextPath() + "/trainer/login");
            return;
        }

        TrainerDTO trainer = (TrainerDTO) session.getAttribute("loginTrainer");
        int trainerId = trainer.getTrainerId();

        String idParam = request.getParameter("clientId");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/trainer/clients");
            return;
        }

        try {
            int clientId = Integer.parseInt(idParam);

            try (SqlSession sql = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {

                // Ownership check
                ClientDTO client = clientDAO.selectClientById(sql, clientId);
                if (client == null || client.getTrainerId() != trainerId) {
                    response.sendRedirect(request.getContextPath() + "/trainer/clients");
                    return;
                }

                // Fetch inbody logs ordered newest → oldest
                List<Map<String, Object>> rawLogs =
                        sql.selectList("mapper.InbodyRecordMapper.findByMemberId", clientId);
                if (rawLogs == null) rawLogs = new ArrayList<>();

                // Enrich each row with body fat % and deltas vs. the previous record
                List<Map<String, Object>> rows = new ArrayList<>();
                for (int i = 0; i < rawLogs.size(); i++) {
                    Map<String, Object> cur  = rawLogs.get(i);
                    Map<String, Object> prev = (i + 1 < rawLogs.size()) ? rawLogs.get(i + 1) : null;

                    Map<String, Object> row = new HashMap<>(cur);

                    double weight = toDouble(cur.get("weight"));
                    double muscle = toDouble(cur.get("muscleMass"));
                    double fat    = toDouble(cur.get("bodyFat"));
                    double fatPct = weight > 0 ? round1(fat / weight * 100) : 0.0;
                    row.put("fatPct", fatPct);

                    if (prev != null) {
                        double pw = toDouble(prev.get("weight"));
                        double pm = toDouble(prev.get("muscleMass"));
                        double pf = toDouble(prev.get("bodyFat"));
                        double pFatPct = pw > 0 ? round1(pf / pw * 100) : 0.0;

                        row.put("weightDelta",  round1(weight - pw));
                        row.put("muscleDelta",  round1(muscle - pm));
                        row.put("fatDelta",     round1(fat    - pf));
                        row.put("fatPctDelta",  round1(fatPct - pFatPct));
                    } else {
                        row.put("weightDelta",  null);
                        row.put("muscleDelta",  null);
                        row.put("fatDelta",     null);
                        row.put("fatPctDelta",  null);
                    }

                    rows.add(row);
                }

                request.setAttribute("client",      client);
                request.setAttribute("inbodyRows",   rows);
                request.setAttribute("recordCount",  rawLogs.size());
            }

            request.getRequestDispatcher("/trainer/clientInbodyLog.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Client ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private double toDouble(Object val) {
        if (val == null) return 0.0;
        if (val instanceof Number) return ((Number) val).doubleValue();
        try { return Double.parseDouble(val.toString()); } catch (Exception e) { return 0.0; }
    }

    private double round1(double v) {
        return Math.round(v * 10.0) / 10.0;
    }
}
