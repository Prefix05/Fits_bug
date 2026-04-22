package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.admin.Member;
import service.admin.MemberService;
import service.admin.MemberServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class Member
 */
@WebServlet("/memberGym")
public class MemberGym extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberGym() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		Integer reqPage = 1;
		//페이지를 누르면, 해당 페이지로 바뀌도록 하는 함수
		if(page!=null) { // 첫 접속시 
			reqPage = Integer.parseInt(page);
		}
		PageInfo pageInfo = new PageInfo(reqPage);
		
		try {
			MemberService service = new MemberServiceImpl();
			List<Member> gymList = service.gymList(pageInfo);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("gymList", gymList); //여기의 gymList와 JSP의 gymList 이름이 같아야함.
			request.getRequestDispatcher("/adminMember/memberGym.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시글 목록 조회에 오류가 발생했습니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
//		try {
//			MemberService service = new MemberServiceImpl();
//			List<Member> list = service.getGymlist();
//			request.setAttribute("list", list);
//			request.getRequestDispatcher("/adminMember/memberGym.jsp").forward(request, response);
//		}catch(Exception e) {
//			e.printStackTrace();
//			request.setAttribute("err", "오류가 발생했습니다.");
//			request.getRequestDispatcher("error.jsp").forward(request, response);
//		}
		
	}
}