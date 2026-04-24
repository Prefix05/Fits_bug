package service.member;

import java.util.List;

import dao.member.InbodyRecordDAO;
import dao.member.InbodyRecordDAOImpl;
import dto.member.InbodyRecordDTO;

public class InbodyRecordServiceImpl implements InbodyRecordService {
    private InbodyRecordDAO dao = new InbodyRecordDAOImpl();

    @Override
    public int save(InbodyRecordDTO dto) {
        return dao.insert(dto);
    }

    @Override
    public List<InbodyRecordDTO> getList(String email) {
        return dao.findByEmail(email);
    }
}