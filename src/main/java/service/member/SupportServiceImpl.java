package service.member;

import java.util.List;

import dao.member.SupportDAO;
import dao.member.SupportDAOImpl;
import dto.member.SupportDTO;

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