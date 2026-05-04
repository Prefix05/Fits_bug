package controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.TrainerDTO;
import service.member.TrainerService;
import service.member.TrainerServiceImpl;

@WebServlet("/member/trainerDetail")
public class TrainerDetailController extends HttpServlet {
    private TrainerService service = new TrainerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

		/*
		 * int trainerId = Integer.parseInt(req.getParameter("trainerId"));
		 * 
		 * TrainerDTO dto = service.getTrainerDetail(trainerId);
		 * 
		 * req.setAttribute("trainer", dto);
		 * 
		 * RequestDispatcher rd = req.getRequestDispatcher("/trainerDetail.jsp");
		 * 
		 * rd.forward(req, resp);
		 */
    	String trainerId = req.getParameter("trainerId");

        // 🔥 더미 데이터 (DB 없이 테스트)
        TrainerDTO dto = new TrainerDTO();

        if ("1".equals(trainerId)) {
            dto.setTrainerId(1);
            dto.setName("김트레이너");
            dto.setSpecialty("근력 강화");
            dto.setCareer("스포애니 7년");
            dto.setRating(4.9);
            dto.setProfileImg("https://api.dicebear.com/7.x/avataaars/svg?seed=trainer1");
            dto.setPrice1(40000);
            dto.setPrice10(300000);
        }

        else if ("2".equals(trainerId)) {
            dto.setTrainerId(2);
            dto.setName("이코치");
            dto.setSpecialty("다이어트");
            dto.setCareer("커브스 5년");
            dto.setRating(4.7);
            dto.setProfileImg("https://api.dicebear.com/7.x/avataaars/svg?seed=trainer2");
            dto.setPrice1(35000);
            dto.setPrice10(280000);
        }

        else {
            dto.setTrainerId(0);
            dto.setName("기본 트레이너");
            dto.setSpecialty("운동");
            dto.setCareer("경력 없음");
            dto.setRating(4.5);
        }

        req.setAttribute("trainer", dto);

        RequestDispatcher rd =
                req.getRequestDispatcher("/member/trainerDetail.jsp");
        rd.forward(req, resp);
    }
}