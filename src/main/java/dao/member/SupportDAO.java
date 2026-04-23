package dao.member;

import java.util.List;

import dto.member.SupportDTO;

public interface SupportDAO {
    void insertSupport(SupportDTO dto);
    List<SupportDTO> selectByEmail(String email);
}