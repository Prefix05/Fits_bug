package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.LoginDAO;
import dao.member.LoginDAOImpl;
import dao.member.WorkoutPlanDAO;
import dao.member.WorkoutPlanDAOImpl;
import dto.member.LoginDTO;
import dto.member.WorkoutPlanDTO;

@WebServlet("/step3")
public class Step3Controller extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	HttpSession session = request.getSession();

        // 🔥 기존 step1 데이터
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String nickname = (String) session.getAttribute("nickname");
        String name = (String) session.getAttribute("name");
        String phone = (String) session.getAttribute("phone");
        String role = (String) session.getAttribute("role");

        // 🔥 step2 데이터
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        String diet = request.getParameter("diet");

        // 🔥 DB 저장
        LoginDTO user = new LoginDTO();
        user.setEmail(username);
        user.setPassword(password);
        user.setNickname(nickname);
        user.setname(name);
        user.setPhone(phone);
        
        WorkoutPlanDTO plan = new WorkoutPlanDTO();
        plan.setEmail(username);
        plan.setHeight(Integer.parseInt(height));
        plan.setWeight(Integer.parseInt(weight));
        plan.setDiet(diet);
        
        LoginDAO memberDao = new LoginDAOImpl();
        memberDao.insertMember(user); // 👉 DB 저장
        
        WorkoutPlanDAO planDao = new WorkoutPlanDAOImpl();
        planDao.savePlan(plan);

        // 🔥 ⭐ 로그인 처리 (핵심)
        session.setAttribute("loginUser", user);

        // 🔥 main으로 이동
        response.sendRedirect("main.jsp");
    }
}