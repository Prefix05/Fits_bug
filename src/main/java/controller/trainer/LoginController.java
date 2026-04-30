package controller.trainer;

import dao.trainer.TrainerDAOImpl;
import dto.trainer.TrainerDTO;
import at.favre.lib.crypto.bcrypt.BCrypt;
import service.trainer.LoginService;
import service.trainer.LoginServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/trainer/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/trainer/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginService service = new LoginServiceImpl();

        try {
            TrainerDTO trainer = service.loginTrainer(email, password);

            if (trainer != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loginTrainer", trainer);
                response.sendRedirect(request.getContextPath() + "/trainer/dashboard");
            } else {
                // 🔒 unified error (security best practice)
                request.setAttribute("error", "이메일 또는 비밀번호가 올바르지 않습니다.");
                request.getRequestDispatcher("/trainer/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", "서버 오류가 발생했습니다.");
            request.getRequestDispatcher("/trainer/login.jsp").forward(request, response);
        }
    }
}