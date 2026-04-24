package service.member;

import java.util.List;

import dto.member.InbodyRecordDTO;

public interface InbodyRecordService {
    int save(InbodyRecordDTO dto);
    List<InbodyRecordDTO> getList(String email);
}