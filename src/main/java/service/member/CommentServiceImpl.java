package service.member;

import dao.member.CommentDAO;
import dao.member.CommentDAOImpl;
import dto.member.CommentDTO;

import java.util.List;

public class CommentServiceImpl implements CommentService {
    private CommentDAO dao = new CommentDAOImpl();

    @Override
    public void write(CommentDTO dto) {
        dao.insert(dto);
    }

    @Override
    public List<CommentDTO> getComments(int postId) {
        return dao.findByPostId(postId);
    }
}