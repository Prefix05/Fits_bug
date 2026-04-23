package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/admin/memberGym")
public class MemberGym extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberGym() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gymName = request.getParameter("gymName");
		
		if(gymName != null) {
			if(gymName.trim().isEmpty()) {
				gymName = null;
			}
			PageInfo pageInfo = new PageInfo(1);
			
			try {
				MemberService service = new MemberServiceImpl();
				List<Member> list = service.gymList(pageInfo, gymName);
				
				response.setContentType("application/json;charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				StringBuilder json = new StringBuilder();
				json.append("[");
				for (int i = 0; i < list.size(); i++) {
	                Member m = list.get(i);
	                json.append("{");
	                json.append("\"gymName\":\"" + m.getGymName() + "\",");
	                json.append("\"gymTel\":\"" + m.getGymTel() + "\",");
	                json.append("\"regDate\":\"" + m.getRegDate() + "\",");
	                json.append("\"gymClientCount\":" + m.getGymClientCount() + ",");
	                json.append("\"gymCal\":" + m.getGymCal());
	                json.append("}");
	                if (i < list.size() - 1) json.append(",");
	            }
	            json.append("]");

	            out.print(json.toString());
	            out.flush();
	            return; // 비동기 응답 후 종료
	        } catch (Exception e) {
	            e.printStackTrace();
			}
		}
			
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
			List<Member> gymList = service.gymList(pageInfo, null);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("gymList", gymList); //여기의 gymList와 JSP의 gymList 이름이 같아야함.
			request.getRequestDispatcher("/admin/memberGym.jsp").forward(request, response);
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