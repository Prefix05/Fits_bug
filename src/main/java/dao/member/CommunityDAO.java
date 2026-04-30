package dao.member;

import java.util.List;

import dto.member.CommunityDTO;

public interface CommunityDAO {
    // 게시글 전체 조회
    List<CommunityDTO> selectAll() throws Exception;

    // 게시글 1개 조회 (확장용)
    CommunityDTO selectById(int id) throws Exception;
}