package controller.trainer;

import dao.trainer.MealDAO;
import dao.trainer.MealDAOImpl;
import dto.trainer.MealDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/trainer/MealApiServlet")
public class MealApiServlet extends HttpServlet {

    private MealDAO mealDAO = new MealDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<MealDTO> meals =
                    mealDAO.selectMealsByDay(1, "2026-04-28");

            request.setAttribute("meals", meals);
            request.getRequestDispatcher("/trainer/clientMealLog.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}