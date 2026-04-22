package service;

import java.util.List;
import dto.PostDTO;

public interface PostService {
    int writePost(PostDTO dto);
    List<PostDTO> getPosts();
}