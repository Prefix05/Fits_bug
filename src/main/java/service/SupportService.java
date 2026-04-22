package service;

import dto.SupportDTO;
import java.util.List;

public interface SupportService {
    void write(SupportDTO dto);
    List<SupportDTO> getList(String email);
}