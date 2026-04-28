package controller.trainer;

import dao.trainer.ClientDAOImpl;
import dto.trainer.ClientDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/clients")
public class Clients extends HttpServlet {

    private static final int DEFAULT_PAGE_SIZE = 5;
    private final ClientDAOImpl clientDAO = new ClientDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int currentPage = 1;

        try {
            // 1. page parameter
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                try {
                    currentPage = Integer.parseInt(pageParam);
                } catch (NumberFormatException e) {
                    currentPage = 1;
                }
            }

            // 2. filter parameter
            String filter = request.getParameter("filter");
            if (filter == null || filter.isEmpty()) filter = "all";

            // 3. DAO calls (this is the risky part)
            int totalClients = clientDAO.countClients(filter);
            int totalPages = (int) Math.ceil((double) totalClients / DEFAULT_PAGE_SIZE);

            if (currentPage < 1) currentPage = 1;
            if (totalPages > 0 && currentPage > totalPages) currentPage = totalPages;

            int offset = (currentPage - 1) * DEFAULT_PAGE_SIZE;
            List<ClientDTO> clients =
                    clientDAO.selectClients(offset, DEFAULT_PAGE_SIZE, filter);

            // 4. forward data to JSP
            request.setAttribute("clients", clients);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentFilter", filter);

            request.getRequestDispatcher("/trainer/clients.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            // LOG (don’t just print in real apps)
            e.printStackTrace();

            // user-friendly message
            request.setAttribute("err", "클라이언트 목록을 불러오는 중 오류가 발생했습니다.");

            request.getRequestDispatcher("/error.jsp")
                    .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}