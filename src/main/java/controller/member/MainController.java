package controller.member;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;
import dto.member.MemberDTO;
import dto.member.TrainerDTO;
import dto.member.UserDTO;
import dto.trainer.AvailabilityDTO;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import util.MybatisSqlSessionFactory;

@WebServlet("/member/main")
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");

        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/member/login");
            return;
        }

        MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");
        if (memberInfo == null) {
            MemberDAO memberDao = new MemberDAOImpl();
            memberInfo = memberDao.findByEmail(loginUser.getEmail());
            if (memberInfo != null) {
                session.setAttribute("memberInfo", memberInfo);
            }
        }

        // Load trainer availability for schedule widget (fresh every request)
        if (memberInfo != null && memberInfo.getTrainerId() != null && memberInfo.getTrainerId() > 0) {
            try (SqlSession sql = MybatisSqlSessionFactory.getSqlSessionFactory().openSession()) {
                List<AvailabilityDTO> availList = sql.selectList(
                    "pricingAvailability.findAvailabilityByTrainerId", memberInfo.getTrainerId());

                JSONArray arr = new JSONArray();
                for (AvailabilityDTO a : availList) {
                    JSONObject obj = new JSONObject();
                    obj.put("dayOfWeek", a.getDayOfWeek());
                    obj.put("startTime", a.getStartTime());
                    obj.put("endTime", a.getEndTime());
                    arr.put(obj);
                }
                request.setAttribute("availabilityJson", arr.toString());

                TrainerDTO trainer = sql.selectOne("mapper.TrainerMapper.findById", memberInfo.getTrainerId());
                if (trainer != null) {
                    request.setAttribute("scheduleTrainerName", trainer.getName());
                }
            } catch (Exception e) {
                request.setAttribute("availabilityJson", "[]");
            }
        } else {
            request.setAttribute("availabilityJson", "[]");
        }

        request.getRequestDispatcher("/member/main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
