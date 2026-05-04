package service.gym;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.gym.GymSalesDao;
import dao.gym.GymSalesDaoImpl;
import dto.gym.Sales;
import dto.gym.SalesChart;
import dto.gym.SalesSummary;
import dto.gym.SalesTopTrainer;
import dto.gym.TrainerChoose;

public class GymSalesServiceImpl implements GymSalesService {
	private GymSalesDao dao = new GymSalesDaoImpl();
	
	@Override
	public List<Sales> getSalesList(Map<String, Object> param) throws Exception {
		List<Sales> list = dao.selectSalesList(param);

	    for (Sales s : list) {
	    	s.setNetPrice(s.getPaymentPrice().subtract(s.getPaymentFee()));
	    }

	    return list;
	}

	@Override
	public int getSalesCount(Map<String, Object> param) throws Exception {
		return dao.selectSalesCount(param);
	}

	@Override
	public SalesSummary getSalesSummary(Map<String, Object> param) throws Exception {
		SalesSummary current = dao.selectSalesSummary(param);

		if (current == null) {
			current = new SalesSummary();
		}

		String startDateStr = (String) param.get("startDate");
		String endDateStr = (String) param.get("endDate");

		if (startDateStr == null || startDateStr.isBlank()
				|| endDateStr == null || endDateStr.isBlank()) {
			current.setGrowthRate(0.0);
			return current;
		}

		LocalDate startDate = LocalDate.parse(startDateStr);
		LocalDate endDate = LocalDate.parse(endDateStr);

		Map<String, Object> prevParam = new HashMap<>(param);
		prevParam.put("startDate", startDate.minusMonths(1).toString());
		prevParam.put("endDate", endDate.minusMonths(1).toString());

		SalesSummary prev = dao.selectSalesSummary(prevParam);

		BigDecimal currentSales = current.getTotalSales() == null ? BigDecimal.ZERO : current.getTotalSales();
		BigDecimal prevSales = (prev == null || prev.getTotalSales() == null)
		        ? BigDecimal.ZERO
		        : prev.getTotalSales();

		double growthRate = 0.0;

		if (prevSales.compareTo(BigDecimal.ZERO) > 0) {
		    growthRate = currentSales
		            .subtract(prevSales)
		            .divide(prevSales, 4, RoundingMode.HALF_UP)
		            .multiply(BigDecimal.valueOf(100))
		            .doubleValue();

		    growthRate = Math.round(growthRate * 10) / 10.0;
		}

		current.setGrowthRate(growthRate);

		return current;
	}

	@Override
	public List<SalesChart> getSalesChartList(Map<String, Object> param) throws Exception {
		List<SalesChart> raw = dao.selectSalesChartList(param);

		BigDecimal[] buckets = {
			    BigDecimal.ZERO,
			    BigDecimal.ZERO,
			    BigDecimal.ZERO,
			    BigDecimal.ZERO,
			    BigDecimal.ZERO
			};

			for (SalesChart c : raw) {
			    int day = Integer.parseInt(c.getLabel().split("/")[1]);

			    int index;
			    if (day <= 1) index = 0;
			    else if (day <= 7) index = 1;
			    else if (day <= 14) index = 2;
			    else if (day <= 21) index = 3;
			    else index = 4;

			    BigDecimal sales = c.getSales() == null ? BigDecimal.ZERO : c.getSales();
			    buckets[index] = buckets[index].add(sales);
			}

	    String startDateStr = (String) param.get("startDate");

	    if (startDateStr == null || startDateStr.isBlank()) {
	        startDateStr = LocalDate.now().withDayOfMonth(1).toString();
	    }

	    int month = Integer.parseInt(startDateStr.split("-")[1]);

	    String[] labels = {
	        month + "/1",
	        month + "/7",
	        month + "/14",
	        month + "/21",
	        month + "/28"
	    };

	    List<SalesChart> result = new ArrayList<>();

	    for (int i = 0; i < 5; i++) {
	        SalesChart sc = new SalesChart();
	        sc.setLabel(labels[i]);
	        sc.setSales(buckets[i]);
	        result.add(sc);
	    }

	    return result;
	}

	@Override
	public List<SalesTopTrainer> getTopTrainerList(Map<String, Object> param) throws Exception {
		return dao.selectTopTrainerList(param);
	}

	@Override
	public List<TrainerChoose> getTrainerList(int gymNum) throws Exception {
		return dao.selectTrainerList(gymNum);
	}

}
