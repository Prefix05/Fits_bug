package dao;

import dto.SupportDTO;
import java.util.List;

public interface SupportDAO {
    void insertSupport(SupportDTO dto);
    List<SupportDTO> selectByEmail(String email);
}