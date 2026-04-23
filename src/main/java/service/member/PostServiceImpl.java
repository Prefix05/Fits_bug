package service.member;

import java.util.List;

import dao.member.CompleteDAO;
import dao.member.CompleteDAOImpl;
import dao.member.PostDAO;
import dao.member.PostDAOImpl;
import dto.member.PostDTO;

public class PostServiceImpl implements PostService {

    PostDAO dao;
    CompleteDAO completeDAO;

    public PostServiceImpl() {
        dao = new PostDAOImpl();
        completeDAO = new CompleteDAOImpl();
    }

    @Override
    public int writePost(PostDTO dto) {

        int result = dao.insert(dto);

        // 🔥 오운완이면 기록 저장
        if(result > 0 && "owun".equals(dto.getCategory())){
            completeDAO.insertLog(dto.getUserId());
        }

        return result;
    }

    @Override
    public List<PostDTO> getPosts() {
        return dao.getList();
    }
}