package controller.gym;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.gym.GymInfoEditService;
import service.gym.GymInfoEditServiceImpl;

@WebServlet("/gym/changePassword")
public class GymChangePassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GymChangePassword() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain; charset=UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.getWriter().write("login_required");
            return;
        }

        Integer userId = (Integer) session.getAttribute("userId");
        String password = request.getParameter("password");

        if (password == null || password.trim().isEmpty()) {
            response.getWriter().write("empty_password");
            return;
        }

        GymInfoEditService service = new GymInfoEditServiceImpl();

        Map<String, Object> param = new HashMap<>();
        param.put("userId", userId);
        param.put("password", password);

        int result = service.updatePassword(param);

        response.getWriter().write(result > 0 ? "success" : "fail");
    }
}