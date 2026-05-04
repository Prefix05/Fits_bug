package dao.member;

import java.util.List;

import dto.member.InbodyLogDTO;

public interface InbodyRecordDAO {
    int insert(InbodyLogDTO dto);
    List<InbodyLogDTO> findByEmail(String email);
    List<InbodyLogDTO> getRecords(String email);
}