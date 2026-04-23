package service.member;

public interface PostReactionService {
    int addReaction(int postId, String userId, String type);
    int getReactionCount(int postId, String type);
}