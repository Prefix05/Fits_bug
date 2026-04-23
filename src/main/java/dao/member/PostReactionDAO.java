package dao.member;

public interface PostReactionDAO {
    int addReaction(int postId, String userId, String type);
    int getReactionCount(int postId, String type);
}