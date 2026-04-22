package service;

import java.util.List;

import dao.PostDAO;
import dao.PostDAOImpl;
import dao.CompleteDAO;
import dao.CompleteDAOImpl;
import dto.PostDTO;

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