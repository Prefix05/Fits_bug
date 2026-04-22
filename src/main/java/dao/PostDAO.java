package dao;

import java.util.List;
import dto.PostDTO;

public interface PostDAO {
    int insert(PostDTO dto);
    List<PostDTO> getList();
}