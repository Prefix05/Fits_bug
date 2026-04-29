package controller.member;

import dto.member.ReservationDTO;
import service.member.ReservationService;
import service.member.ReservationServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/nextClass")
public class ReservationController extends HttpServlet {

    private ReservationService service = new ReservationServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String trainerEmail = request.getParameter("trainerEmail");

        ReservationDTO dto = service.getNextReservation(email, trainerEmail);

        response.setContentType("application/json;charset=UTF-8");

        if (dto == null) {
            response.getWriter().write("{}");
            return;
        }

        String json = "{"
                + "\"time\":\"" + dto.getClassTime() + "\""
                + "}";

        response.getWriter().write(json);
    }
}