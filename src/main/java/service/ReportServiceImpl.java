package service;

import dao.ReportDAO;
import dao.ReportDAOImpl;
import dto.ReportDTO;

public class ReportServiceImpl implements ReportService {

    private ReportDAO dao = new ReportDAOImpl();

    public void insertReport(ReportDTO dto) {
        dao.insert(dto);
    }
}