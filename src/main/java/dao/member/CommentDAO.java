package dao.member;

import dto.member.CommentDTO;
import java.util.List;

public interface CommentDAO {
    void insert(CommentDTO dto);

    List<CommentDTO> findByPostId(int postId);
}