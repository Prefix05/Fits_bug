package controller.trainer;

import dao.trainer.TrainerDAOImpl;
import dto.trainer.TrainerDTO;
import at.favre.lib.crypto.bcrypt.BCrypt;
import service.trainer.SignupService;
import service.trainer.SignupServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/trainer/signup")
public class SignupController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/trainer/signup.jsp").forward(request, response);
    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String name = request.getParameter("name");
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        String hashedPassword = BCrypt.withDefaults().hashToString(12, password.toCharArray());
//
//        TrainerDTO dto = new TrainerDTO();
//        dto.setName(name);
//        dto.setEmail(email);
//        dto.setPassword(hashedPassword);
//
//        TrainerDAOImpl dao = new TrainerDAOImpl();
//
//        try {
//            int result = dao.insertTrainer(dto);
//
//            if (result > 0) {
//                response.sendRedirect(request.getContextPath() + "/trainer/login");
//            } else {
//                request.setAttribute("error", "회원가입 실패");
//                request.getRequestDispatcher("/signup.jsp").forward(request, response);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace(); // for debugging
//
//            request.setAttribute("error", "서버 오류로 회원가입에 실패했습니다.");
//            request.getRequestDispatcher("/signup.jsp").forward(request, response);
//        }
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String hashedPassword = BCrypt.withDefaults().hashToString(12, password.toCharArray());

        TrainerDTO dto = new TrainerDTO();
        dto.setName(name);
        dto.setEmail(email);
        dto.setPassword(hashedPassword);

        SignupService service = new SignupServiceImpl();

        try {
            int result = service.signupTrainer(dto);

            if (result > 0) {
                response.sendRedirect(request.getContextPath() + "/trainer/login");
            } else {
                request.setAttribute("error", "회원가입 실패");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", "서버 오류로 회원가입에 실패했습니다.");
            request.getRequestDispatcher("/trainer/signup.jsp").forward(request, response);
        }
    }
}