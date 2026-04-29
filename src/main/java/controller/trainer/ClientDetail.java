package controller.trainer;

import dao.trainer.ClientDAO;
import dao.trainer.ClientDAOImpl;
import dto.trainer.ClientDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/trainer/clientDetail")
public class ClientDetail extends HttpServlet {

    // Initialize the DAO
    private final ClientDAO clientDAO = new ClientDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Get the clientId from the URL parameter (e.g., /trainer/clientDetail?clientId=1)
        String idParam = request.getParameter("clientId");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int clientId = Integer.parseInt(idParam);

                // 2. Fetch client details using your DAO
                // This calls the selectClientById query in your XML
                ClientDTO client = clientDAO.getClientDetail(clientId);

                if (client != null) {
                    // 3. Set the client object as a request attribute
                    // This allows the JSP to use ${client.name}, ${client.age}, etc.
                    request.setAttribute("client", client);

                    // 4. Forward the request to your JSP file
                    request.getRequestDispatcher("/trainer/clientDetail.jsp").forward(request, response);
                } else {
                    // Handle case where client ID doesn't exist in DB
                    response.sendRedirect(request.getContextPath() + "/clients");
                }
            } catch (NumberFormatException e) {
                // Handle invalid ID format
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Client ID");
            }
        } else {
            // Missing clientId parameter
            response.sendRedirect(request.getContextPath() + "/clients");
        }
    }
}