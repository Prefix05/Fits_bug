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
import service.member.PostService;
import service.member.PostServiceImpl;

@WebServlet("/member/post")
@MultipartConfig
public class PostController extends HttpServlet {

    private PostService  service     = new PostServiceImpl();
    private CompleteDAO  completeDAO = new CompleteDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session   = request.getSession();
        UserDTO     loginUser = (UserDTO) session.getAttribute("loginUser");

        List<PostDTO> list = service.getPosts();
        request.setAttribute("postList", list);

        if (loginUser != null) {
            String email = loginUser.getEmail();
            request.setAttribute("weekLog", completeDAO.getWeekLog(email));
            request.setAttribute("streak",  completeDAO.getStreak(email));
            request.setAttribute("best",    completeDAO.getBestStreak(email));
        }

        request.getRequestDispatcher("/member/community.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session   = request.getSession();
        UserDTO     loginUser = (UserDTO) session.getAttribute("loginUser");


        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/member/login");
            return;
        }


        int    userId = loginUser.getId();
        String email  = loginUser.getEmail();   // 오운완 기록용

        String category = request.getParameter("category");
        String postType = "owun".equals(category) ? "exerciseComplete" : "free";

        String title    = request.getParameter("title");
        String body     = request.getParameter("body");
        String hashtags = request.getParameter("hashtags");

        String dbPath = "";
        try {
            Part filePart = request.getPart("image");
            if (filePart != null) {
                String fileName = filePart.getSubmittedFileName();
                if (fileName != null && !fileName.isEmpty()) {
                    String uploadPath = request.getServletContext().getRealPath("/upload");
                    java.io.File dir = new java.io.File(uploadPath);
                    if (!dir.exists()) dir.mkdirs();
                    filePart.write(uploadPath + "/" + fileName);
                    dbPath = "upload/" + fileName;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        PostDTO dto = new PostDTO();
        dto.setUserId(userId);      
        dto.setPostType(postType);  
        dto.setTitle(title);
        dto.setBody(body);
        dto.setImage(dbPath);
        dto.setHashtags(hashtags);

        service.writePost(dto, email);

        response.sendRedirect("post");
    }
}
