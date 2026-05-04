package service.admin;

import java.util.Map;

public interface SalesService {
	public Map<String, Object> getDashboardData(Map<String, Object> paramMap) throws Exception;
	
	public boolean processSettlement(Integer id) throws Exception;
}
