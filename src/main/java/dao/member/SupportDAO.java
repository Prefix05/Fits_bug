package dao.member;

import dto.member.SupportDTO;
import java.util.List;

public interface SupportDAO {
    void insertSupport(SupportDTO dto);
    List<SupportDTO> selectByEmail(String email);
}