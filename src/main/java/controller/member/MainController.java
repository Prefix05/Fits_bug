package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.WorkoutPlanDAO;
import dao.member.WorkoutPlanDAOImpl;
import dto.member.WorkoutPlanDTO;
import dto.trainer.UserDTO;

@WebServlet("/member/main")
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");

        // 로그인 안 되어 있으면 로그인 페이지로
        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/member/login");
            return;
        }

        // 운동 계획이 세션에 없으면 DB에서 조회해 세팅
        if (session.getAttribute("plan") == null) {
            WorkoutPlanDAO planDao = new WorkoutPlanDAOImpl();
            WorkoutPlanDTO plan = planDao.getPlan(loginUser.getEmail());
            if (plan != null) {
                session.setAttribute("plan", plan);
            }
        }

        // main.jsp로 포워드 (URL은 /main 유지)
        request.getRequestDispatcher("/main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
