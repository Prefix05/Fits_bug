package controller.trainer;

import dao.trainer.ClientDAO;
import dao.trainer.ClientDAOImpl;
import dto.trainer.ClientDTO;
import dto.trainer.TrainerDTO;
import service.trainer.ClientService;
import service.trainer.ClientServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/trainer/clientDetail")
public class ClientDetail extends HttpServlet {

    // Initialize the DAO
    private final ClientService clientService = new ClientServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginTrainer") == null) {
            response.sendRedirect(request.getContextPath() + "/trainer/login");
            return;
        }

        TrainerDTO trainer = (TrainerDTO) session.getAttribute("loginTrainer");
        int trainerId = trainer.getTrainerId();

        // 2. Get clientId
        String idParam = request.getParameter("clientId");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/clients");
            return;
        }

        try {
            int clientId = Integer.parseInt(idParam);

            // 3. Use Service (NOT DAO)
            ClientDTO client = clientService.getClientDetail(clientId);

            // 🔐 4. Ownership check (VERY IMPORTANT)
            if (client == null || client.getTrainerId() != trainerId) {
                response.sendRedirect(request.getContextPath() + "/clients");
                return;
            }

            // 5. Forward to JSP
            request.setAttribute("client", client);
            request.getRequestDispatcher("/trainer/clientDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Client ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}