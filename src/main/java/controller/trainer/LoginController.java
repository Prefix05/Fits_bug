package controller.trainer;

import dao.trainer.TrainerDAOImpl;
import dto.trainer.TrainerDTO;
import at.favre.lib.crypto.bcrypt.BCrypt;

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

        TrainerDAOImpl dao = new TrainerDAOImpl();
        TrainerDTO trainer = dao.getTrainerByEmail(email);

        if (trainer != null) {
            // BCrypt 비밀번호 검증
            BCrypt.Result result = BCrypt.verifyer().verify(
                    password.toCharArray(),
                    trainer.getPassword()
            );

            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("loginTrainer", trainer);
                response.sendRedirect(request.getContextPath() + "/trainer/dashboard");
            } else {
                request.setAttribute("error", "비밀번호가 틀렸습니다.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "존재하지 않는 이메일입니다.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}