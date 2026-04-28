package service.member;

import dao.member.PostDAO;
import dao.member.PostDAOImpl;
import dao.member.PostReactionDAO;
import dao.member.PostReactionDAOImpl;
import dto.member.NotificationDTO;

public class PostReactionServiceImpl implements PostReactionService {

    private PostReactionDAO dao = new PostReactionDAOImpl();

    // 🔥 게시글 작성자 찾기
    private PostDAO postDAO = new PostDAOImpl();

    // 🔥 알림
    private NotificationService notificationService = new NotificationServiceImpl();

    @Override
    public int addReaction(int postId, String userEmail, String type) {

        int result = dao.addReaction(postId, userEmail, type);

        // 🔥 좋아요일 때만 알림 생성
        if ("like".equals(type)) {

            // 1. 게시글 작성자 이메일
            String writerEmail = postDAO.getWriterEmail(postId);

            // 🔥 자기 글이면 알림 안보냄
            if (!writerEmail.equals(userEmail)) {

                NotificationDTO n = new NotificationDTO();
                n.setEmail(writerEmail);
                n.setType("like");
                n.setMessage("회원님의 게시글에 좋아요가 눌렸습니다");
                n.setUrl("communityDetail.jsp?id=" + postId);

                notificationService.create(n);
            }
        }

        return result;
    }

    @Override
    public int getReactionCount(int postId, String type) {
        return dao.getReactionCount(postId, type);
    }
}