package controller.gym;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.gym.Sales;
import dto.gym.SalesChart;
import dto.gym.SalesSummary;
import dto.gym.SalesTopTrainer;
import dto.gym.TrainerChoose;

/**
 * Servlet implementation class GymSales
 */
@WebServlet("/gym/sales")
public class GymSales extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GymSales() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		GymSalesService service = new GymSalesServiceImpl();
		
		try {
//            HttpSession session = request.getSession(false);
//
//            if (session == null || session.getAttribute("gymId") == null) {
//                response.sendRedirect(request.getContextPath() + "/login.jsp");
//                return;
//            }
//            
//            int gymNum = (int) session.getAttribute("gymId");
			int gymNum = 1;// 더미 데이터

            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String membershipType = request.getParameter("membershipType");
            String trainerId = request.getParameter("trainerId");
            String status = request.getParameter("status");
            String keyword = request.getParameter("keyword");
            
            if (startDate == null || startDate.isBlank()) {
                startDate = LocalDate.now().withDayOfMonth(1).toString();
            }

            if (endDate == null || endDate.isBlank()) {
                endDate = LocalDate.now().toString();
            }
            
            int page = 1;
            int pageSize = 10;

            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isBlank()) {
                page = Integer.parseInt(pageParam);
            }

            if (page < 1) {
                page = 1;
            }

            int startRow = (page - 1) * pageSize;
            
//            Map<String, Object> param = new HashMap<>();
//            param.put("gymNum", gymNum);
//            param.put("startDate", startDate);
//            param.put("endDate", endDate);
//            param.put("membershipType", membershipType);
//            param.put("trainerId", trainerId);
//            param.put("status", status);
//            param.put("keyword", keyword);
//            param.put("startRow", startRow);
//            param.put("pageSize", pageSize);
            
            
         // ===== 더미 데이터 시작 =====
            
            List<Sales> salesList = new ArrayList<>();

            Sales s1 = new Sales();
            s1.setMemberName("홍길동");
            s1.setMembershipType("pt");
            s1.setTypeRep(20);
            s1.setTrainerName("강민호");
            s1.setPaymentDate(new Date());
            s1.setStatus("PAID");
            s1.setPaymentPrice(1200000);
            s1.setPaymentFee(30000);
            s1.setNetPrice(1170000);
            salesList.add(s1);

            Sales s2 = new Sales();
            s2.setMemberName("이지영");
            s2.setMembershipType("month");
            s2.setTypeRep(6);
            s2.setTrainerName(null);
            s2.setPaymentDate(new Date());
            s2.setStatus("PAID");
            s2.setPaymentPrice(480000);
            s2.setPaymentFee(10000);
            s2.setNetPrice(470000);
            salesList.add(s2);

            SalesSummary salesSummary = new SalesSummary();
            salesSummary.setTotalSales(1680000);
            salesSummary.setGymSales(480000);
            salesSummary.setPtSales(1200000);
            salesSummary.setTotalFee(40000);
            salesSummary.setNetSales(1640000);
            salesSummary.setGrowthRate(12.5);

            List<SalesChart> salesChartList = new ArrayList<>();

            SalesChart c1 = new SalesChart();
            c1.setLabel("04/01");
            c1.setSales(300000);
            c1.setPercent(25);
            salesChartList.add(c1);

            SalesChart c2 = new SalesChart();
            c2.setLabel("04/08");
            c2.setSales(700000);
            c2.setPercent(60);
            salesChartList.add(c2);

            SalesChart c3 = new SalesChart();
            c3.setLabel("04/15");
            c3.setSales(1200000);
            c3.setPercent(100);
            salesChartList.add(c3);

            List<SalesTopTrainer> topTrainerList = new ArrayList<>();

            SalesTopTrainer t1 = new SalesTopTrainer();
            t1.setTrainerId(1);
            t1.setTrainerName("강민호");
            t1.setProfileImg(null);
            t1.setTotalSales(1200000);
            t1.setSessionCount(20);
            topTrainerList.add(t1);

            SalesTopTrainer t2 = new SalesTopTrainer();
            t2.setTrainerId(2);
            t2.setTrainerName("이서연");
            t2.setProfileImg(null);
            t2.setTotalSales(850000);
            t2.setSessionCount(14);
            topTrainerList.add(t2);

            List<TrainerChoose> trainerList = new ArrayList<>();

            TrainerChoose tr1 = new TrainerChoose();
            tr1.setTrainerId(1);
            tr1.setTrainerName("강민호");
            trainerList.add(tr1);

            TrainerChoose tr2 = new TrainerChoose();
            tr2.setTrainerId(2);
            tr2.setTrainerName("이서연");
            trainerList.add(tr2);

            int totalCount = salesList.size();
            int totalPage = 1;

            // JSP로 전달
            request.setAttribute("salesList", salesList);
            request.setAttribute("salesSummary", salesSummary);
            request.setAttribute("salesChartList", salesChartList);
            request.setAttribute("topTrainerList", topTrainerList);
            request.setAttribute("trainerList", trainerList);

            request.setAttribute("totalCount", totalCount);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("currentPage", page);

            // ===== 더미 데이터 끝 =====
            
//            int totalCount = service.getSalesCount(param);
//            int totalPage = (int) Math.ceil((double) totalCount / pageSize);
//            
//            request.setAttribute("salesList", service.getSalesList(param));
//            request.setAttribute("salesSummary", service.getSalesSummary(param));
//            request.setAttribute("salesChartList", service.getSalesChartList(param));
//            request.setAttribute("topTrainerList", service.getTopTrainerList(param));
//            request.setAttribute("trainerList", service.getTrainerList(gymNum));

            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            request.setAttribute("membershipType", membershipType);
            request.setAttribute("trainerId", trainerId);
            request.setAttribute("status", status);
            request.setAttribute("keyword", keyword);

//            request.setAttribute("totalCount", totalCount);
//            request.setAttribute("totalPage", totalPage);
//            request.setAttribute("currentPage", page);
            
            request.getRequestDispatcher("/gym/gym_sales.jsp").forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}
