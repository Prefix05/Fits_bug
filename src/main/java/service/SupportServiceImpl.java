package service;

import dao.SupportDAO;
import dao.SupportDAOImpl;
import dto.SupportDTO;
import java.util.List;

public class SupportServiceImpl implements SupportService {

    private SupportDAO dao = new SupportDAOImpl();

    @Override
    public void write(SupportDTO dto) {
        dao.insertSupport(dto);
    }

    @Override
    public List<SupportDTO> getList(String email) {
        return dao.selectByEmail(email);
    }
}