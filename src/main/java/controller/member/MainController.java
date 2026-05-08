package controller.member;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.member.UserDTO;
import dto.trainer.AvailabilityDTO;
import service.member.MemberService;
import service.member.MemberServiceImpl;
import service.member.TrainerService;
import service.member.TrainerServiceImpl;

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

        MemberService service = new MemberServiceImpl();
        Map<String,Object> memberInfo = service.findByEmail(loginUser.getEmail());
        System.out.println(memberInfo);
        request.setAttribute("memberInfo", memberInfo);
        // Load trainer availability for schedule widget (fresh every request)
        if (memberInfo != null && memberInfo.get("trainer_id") != null) {
        	Integer trainerId = (Integer)memberInfo.get("trainer_id");
        	
        	//트레이너 일정
        	TrainerService trainerService = new TrainerServiceImpl();       			
        	List<AvailabilityDTO> availList = trainerService.getTrainerAvailabilityList(trainerId);
        	request.setAttribute("availList", availList);
        	System.out.println(availList);
        	//트레이너 이름
        	Map<String,Object> trainer = trainerService.getTrainerInfoByTrainerId(trainerId);
        	if(trainer!=null) request.setAttribute("scheduleTrainerName",trainer.get("name"));
        	System.out.println(trainer.get("name"));
            
        } 

        request.getRequestDispatcher("/member/main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
