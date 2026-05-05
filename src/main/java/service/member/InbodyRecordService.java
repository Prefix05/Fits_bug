package service.member;

import java.util.List;

import dto.member.InbodyLogDTO;

public interface InbodyRecordService {
    int save(InbodyLogDTO dto);
    List<InbodyLogDTO> getList(String email);
}