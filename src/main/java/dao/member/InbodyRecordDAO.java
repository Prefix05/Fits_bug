package dao.member;

import java.util.List;

import dto.member.InbodyRecordDTO;

public interface InbodyRecordDAO {
    int insert(InbodyRecordDTO dto);
    List<InbodyRecordDTO> findByEmail(String email);
    List<InbodyRecordDTO> getRecords(String email);
}