package service.member;

import java.util.List;

import dto.member.CommunityDTO;

public interface CommunityService {
    List<CommunityDTO> getPostList() throws Exception;

    CommunityDTO getPost(int id) throws Exception;
}