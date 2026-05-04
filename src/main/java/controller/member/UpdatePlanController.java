package controller.member;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.WorkoutPlanDAO;
import dao.member.WorkoutPlanDAOImpl;
import dto.member.MemberDTO;
import dto.member.WorkoutPlanDTO;

@WebServlet("/member/updatePlan")
public class UpdatePlanController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        MemberDTO user = (MemberDTO) session.getAttribute("loginUser");

        WorkoutPlanDTO dto = new WorkoutPlanDTO();

        dto.setEmail(user.getEmail());
        dto.setGoal(req.getParameter("goal"));
        dto.setLevel(req.getParameter("level"));
        dto.setHeight(Integer.parseInt(req.getParameter("height")));
        dto.setWeight(Integer.parseInt(req.getParameter("weight")));
        dto.setDiet(req.getParameter("diet"));

        WorkoutPlanDAO dao = new WorkoutPlanDAOImpl();

        boolean result = dao.update(dto);

        resp.getWriter().write(result ? "ok" : "fail");
    }
}