package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.member.CompleteDAO;
import dao.member.CompleteDAOImpl;
import dto.member.PostDTO;
import service.member.PostReactionService;
import service.member.PostReactionServiceImpl;
import service.member.PostService;
import service.member.PostServiceImpl;

@WebServlet("/post")
@MultipartConfig
public class PostController extends HttpServlet {

    PostService service = new PostServiceImpl();
    CompleteDAO completeDAO = new CompleteDAOImpl();
    PostReactionService rs = new PostReactionServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = (String) request.getSession().getAttribute("loginUser");

        // 게시글
        List<PostDTO> list = service.getPosts();
        
        // 🔥 점수 기준 정렬
        list.sort((a, b) -> 
            (b.getLikeCount()+b.getGoodCount()+b.getMuscleCount()) -
            (a.getLikeCount()+a.getGoodCount()+a.getMuscleCount())
        );

        request.setAttribute("postList", list);

        // ✅ 스트릭 데이터
        request.setAttribute("weekLog", completeDAO.getWeekLog(userId));
        request.setAttribute("streak", completeDAO.getStreak(userId));
        request.setAttribute("best", completeDAO.getBestStreak(userId));

        request.getRequestDispatcher("community.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String userId = (String) request.getSession().getAttribute("loginUser");
        String category = request.getParameter("category");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String hashtags = request.getParameter("hashtags");

        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        String uploadPath = request.getServletContext().getRealPath("/upload");

        java.io.File dir = new java.io.File(uploadPath);
        if(!dir.exists()) dir.mkdir();

        String filePath = uploadPath + "/" + fileName;
        filePart.write(filePath);

        String dbPath = "upload/" + fileName;

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