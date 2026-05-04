package controller.trainer;

import dto.trainer.AvailabilityDTO;
import dto.trainer.PricingDTO;
import dto.trainer.TrainerDTO;
import dto.trainer.UserDTO;
import service.trainer.TrainerService;
import service.trainer.TrainerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/trainer/pricing")
public class PricingController extends HttpServlet {

    private static final String[] ALL_DAYS = {"MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"};

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/trainer/login");
            return;
        }

        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        TrainerService trainerService = new TrainerServiceImpl();
        TrainerDTO trainer = trainerService.getTrainerByUserId(loginUser.getId());

        request.setAttribute("pricingList",      trainerService.getPricingByTrainerId(trainer.getTrainerId()));
        request.setAttribute("availabilityList", trainerService.getAvailabilityByTrainerId(trainer.getTrainerId()));
        request.getRequestDispatcher("/trainer/pricing.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/trainer/login");
            return;
        }

        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        TrainerService trainerService = new TrainerServiceImpl();
        TrainerDTO trainer = trainerService.getTrainerByUserId(loginUser.getId());
        int trainerId = trainer.getTrainerId();

        // ── Parse pricing rows ─────────────────────────────────────────────
        String[] labels      = request.getParameterValues("pricingLabel");
        String[] counts      = request.getParameterValues("sessionCount");
        String[] prices      = request.getParameterValues("price");
        String[] popularRows = request.getParameterValues("popularRow"); // values are row indices

        Set<String> popularSet = new HashSet<>();
        if (popularRows != null) {
            for (String r : popularRows) popularSet.add(r);
        }

        List<PricingDTO> pricingList = new ArrayList<>();
        if (labels != null) {
            for (int i = 0; i < labels.length; i++) {
                if (labels[i] == null || labels[i].trim().isEmpty()) continue;
                PricingDTO p = new PricingDTO();
                p.setLabel(labels[i].trim());
                p.setSessionCount(parseInt(counts, i, 1));
                p.setPrice(parseInt(prices, i, 0));
                p.setPopular(popularSet.contains(String.valueOf(i)));
                pricingList.add(p);
            }
        }

        // ── Parse availability rows ────────────────────────────────────────
        // Each day has its own named checkbox (availEnabled_MON) + time inputs
        List<AvailabilityDTO> availabilityList = new ArrayList<>();
        for (String day : ALL_DAYS) {
            if (request.getParameter("availEnabled_" + day) != null) {
                AvailabilityDTO a = new AvailabilityDTO();
                a.setDayOfWeek(day);
                String start = request.getParameter("startTime_" + day);
                String end   = request.getParameter("endTime_" + day);
                a.setStartTime(start != null && !start.isEmpty() ? start : "09:00");
                a.setEndTime(end   != null && !end.isEmpty()   ? end   : "18:00");
                availabilityList.add(a);
            }
        }

        try {
            trainerService.savePricingAndAvailability(trainerId, pricingList, availabilityList);
            response.sendRedirect(request.getContextPath() + "/trainer/pricing?saved=1");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "저장에 실패했습니다.");
            request.setAttribute("pricingList",      pricingList);
            request.setAttribute("availabilityList", availabilityList);
            request.getRequestDispatcher("/trainer/pricing.jsp").forward(request, response);
        }
    }

    private int parseInt(String[] arr, int i, int defaultVal) {
        if (arr == null || i >= arr.length || arr[i] == null || arr[i].isEmpty()) return defaultVal;
        try { return Integer.parseInt(arr[i]); } catch (NumberFormatException e) { return defaultVal; }
    }
}
