package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.member.CompleteDAO;
import dao.member.CompleteDAOImpl;
import dto.member.PostDTO;
import dto.member.UserDTO;
import service.member.PostReactionService;
import service.member.PostReactionServiceImpl;
import service.member.PostService;
import service.member.PostServiceImpl;

@WebServlet("/member/post")
@MultipartConfig
public class PostController extends HttpServlet {

    PostService service = new PostServiceImpl();
    CompleteDAO completeDAO = new CompleteDAOImpl();
    PostReactionService rs = new PostReactionServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        // ✅ String → UserDTO로 수정 (loginUser는 UserDTO 객체)
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        String userId = (loginUser != null) ? loginUser.getEmail() : null;

        List<PostDTO> list = service.getPosts();

        // 점수 기준 정렬
        list.sort((a, b) ->
            (b.getLikeCount() + b.getGoodCount() + b.getMuscleCount()) -
            (a.getLikeCount() + a.getGoodCount() + a.getMuscleCount())
        );

        request.setAttribute("postList", list);

        // 스트릭 데이터 (null 방어)
        if (userId != null) {
            request.setAttribute("weekLog", completeDAO.getWeekLog(userId));
            request.setAttribute("streak",  completeDAO.getStreak(userId));
            request.setAttribute("best",    completeDAO.getBestStreak(userId));
        }

        request.getRequestDispatcher("/member/community.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        // ✅ String → UserDTO로 수정
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        String userId = (loginUser != null) ? loginUser.getEmail() : null;

        String category = request.getParameter("category");
        String title    = request.getParameter("title");
        String content  = request.getParameter("content");
        String hashtags = request.getParameter("hashtags");

        Part filePart = request.getPart("image");
        String fileName = filePart != null ? filePart.getSubmittedFileName() : "";

        String dbPath = "";
        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = request.getServletContext().getRealPath("/upload");
            java.io.File dir = new java.io.File(uploadPath);
            if (!dir.exists()) dir.mkdir();
            filePart.write(uploadPath + "/" + fileName);
            dbPath = "upload/" + fileName;
        }

        PostDTO dto = new PostDTO();
        dto.setUserId(userId);
        dto.setCategory(category);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setImage(dbPath);
        dto.setHashtags(hashtags);

        service.writePost(dto);

        response.sendRedirect("post");
    }
}
