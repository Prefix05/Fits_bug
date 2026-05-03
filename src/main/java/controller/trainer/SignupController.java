package controller.trainer;

import dao.trainer.TrainerDAOImpl;
import dto.trainer.TrainerDTO;
import at.favre.lib.crypto.bcrypt.BCrypt;
import dto.trainer.UserDTO;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        if (email == null || email.isEmpty()) {
            email = request.getParameter("emailId");
        }
        String password = request.getParameter("password");
        String tel = request.getParameter("tel");
        String nickname = request.getParameter("nickname");
//        String profileImg = request.getParameter("profileImg");
        String provider = request.getParameter("provider");
        String providerId = request.getParameter("providerId");
        if (provider != null && provider.isEmpty()) {
            provider = null;
        }
        if (providerId != null && providerId.isEmpty()) {
            providerId = null;
        }

        String hashedPassword = BCrypt.withDefaults().hashToString(12, password.toCharArray());

        UserDTO dto = new UserDTO();
        dto.setName(name);
        dto.setEmail(email);
        dto.setPassword(hashedPassword);
        dto.setTel(tel);
        dto.setNickname(nickname);
//        dto.setProfileImg(profileImg);
        dto.setRole(UserDTO.UserRole.TRAINER);
        dto.setProvider(provider);
        dto.setProviderId(providerId);

        SignupService service = new SignupServiceImpl();

        try {
            int result = service.signupTrainer(dto);

            if (result > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("pendingTrainerUserId", dto.getId());
                response.sendRedirect(request.getContextPath() + "/trainer/signup/step2");
            } else {
                request.setAttribute("error", "회원가입 실패");
                request.getRequestDispatcher("/trainer/signup.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", "서버 오류로 회원가입에 실패했습니다.");
            request.getRequestDispatcher("/trainer/signup.jsp").forward(request, response);
        }
    }
}
