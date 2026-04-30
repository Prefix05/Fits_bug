package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.member.TrainerDTO;
import service.member.TrainerService;
import service.member.TrainerServiceImpl;

@WebServlet("/trainerList")
public class TrainerController extends HttpServlet {
    private TrainerService service = new TrainerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword  = req.getParameter("keyword");
        String category = req.getParameter("category");
        String sort     = req.getParameter("sort");

        if (keyword == null) keyword = "";
        if (category == null) category = "전체";
        if (sort == null) sort = "recommend";

        List<TrainerDTO> list = service.getTrainerList(keyword, category, sort);

        req.setAttribute("trainerList", list);

        // AJAX 요청인지 판단
        String ajax = req.getParameter("ajax");

        if ("true".equals(ajax)) {
            req.getRequestDispatcher("/trainerListFragment.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/trainerList.jsp").forward(req, resp);
        }
    }
}