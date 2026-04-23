package service.member;

import java.util.List;

import dto.member.PostDTO;

public interface PostService {
    int writePost(PostDTO dto);
    List<PostDTO> getPosts();
}