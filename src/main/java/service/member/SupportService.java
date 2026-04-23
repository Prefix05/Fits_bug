package service.member;

import java.util.List;

import dto.member.SupportDTO;

public interface SupportService {
    void write(SupportDTO dto);
    List<SupportDTO> getList(String email);
}