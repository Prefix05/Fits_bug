package controller;

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

        // 1. page 파라미터
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try { currentPage = Integer.parseInt(pageParam); }
            catch (NumberFormatException e) { currentPage = 1; }
        }

// 2. filter 파라미터
        String filter = request.getParameter("filter");
        if (filter == null || filter.isEmpty()) filter = "all";

// 3. DAO 호출
        int totalClients = clientDAO.countClients(filter);
        int totalPages = (int) Math.ceil((double) totalClients / DEFAULT_PAGE_SIZE);

        if (currentPage < 1) currentPage = 1;
        if (totalPages > 0 && currentPage > totalPages) currentPage = totalPages;

        int offset = (currentPage - 1) * DEFAULT_PAGE_SIZE;
        List<ClientDTO> clients = clientDAO.selectClients(offset, DEFAULT_PAGE_SIZE, filter);

// 4. JSP에 전달
        request.setAttribute("clients", clients);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentFilter", filter);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/trainer/clients.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}