package service;

import dao.PostReactionDAO;
import dao.PostReactionDAOImpl;

public class PostReactionServiceImpl implements PostReactionService {

    PostReactionDAO dao = new PostReactionDAOImpl();

    @Override
    public int addReaction(int postId, String userId, String type) {
        return dao.addReaction(postId, userId, type);
    }

    @Override
    public int getReactionCount(int postId, String type) {
        return dao.getReactionCount(postId, type);
    }
}