package service.admin;

import java.util.HashMap;
import java.util.Map;

import dao.admin.SalesDAO;
import dao.admin.SalesDAOImpl;

public class SalesServiceImpl implements SalesService {
	
	private SalesDAO salesDAO;
	public SalesServiceImpl() {
		salesDAO = new SalesDAOImpl();
	}

	@Override
	public Map<String, Object> getDashboardData(Map<String, Object> paramMap) throws Exception {
		Map<String, Object> data = new HashMap<>();
		
		data.put("summary", salesDAO.getSalesSummary(paramMap));
        data.put("settlementList", salesDAO.selectSettlementList(paramMap));
        data.put("salesList", salesDAO.selectSalesList(paramMap));
        data.put("paymentHistory", salesDAO.selectPaymentHistory(paramMap));
        
        return data;
	}

	@Override
	public boolean processSettlement(Integer id) throws Exception {
		// 매퍼의 updateSettlementStatus 호출 (status='정산완료', completed_at=NOW() 반영)
        return salesDAO.updateSettlementStatus(id) > 0;
	}
}