package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.gym.Gym;
import dto.trainer.UserDTO;
import service.gym.GymMainService;
import service.gym.GymMainServiceImpl;

@WebServlet("/member/gymJoin")
public class GymJoinController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gymName = request.getParameter("gymName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String ceo = request.getParameter("ceo");
        
        UserDTO user = new UserDTO();
        user.setEmail(email);
        user.setName(ceo);
        user.setPassword(password);
        
        Gym gym = new Gym();
        gym.setName(gymName);
        gym.setAddress(address);
        gym.setPhoneNum(phone);
 
        try {
        	GymMainService service = new GymMainServiceImpl();
        	service.joinGym(user, gym);
        	response.sendRedirect(request.getContextPath()+"/member/login");
        } catch(Exception e) {
        	e.printStackTrace();
        }
    }
}