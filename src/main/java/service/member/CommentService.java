package service.member;

import dto.member.CommentDTO;
import java.util.List;

public interface CommentService {
    void write(CommentDTO dto);

    List<CommentDTO> getComments(int postId);
}