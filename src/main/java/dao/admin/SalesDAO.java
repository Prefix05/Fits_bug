package dao.admin;

import java.util.List;
import java.util.Map;

import dto.admin.SalesDTO;

public interface SalesDAO {
	public Map<String, Object> getSalesSummary(Map<String, Object> paramMap) throws Exception;
	
	public List<SalesDTO> selectSalesList(Map<String, Object> paramMap) throws Exception;
	
	public List<SalesDTO> selectPaymentHistory(Map<String, Object> paramMap) throws Exception;
	
	public int selectSalesCount(Map<String, Object> paramMap) throws Exception;
	
	public int selectPaymentCount(Map<String, Object> paramMap) throws Exception;
}
