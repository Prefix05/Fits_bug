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
 * Servlet implementation class MemberClient
 */
@WebServlet("/admin/memberClient")
public class MemberClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberClient() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clientName = request.getParameter("clientName");
		
		if(clientName != null) {
			if(clientName.trim().isEmpty()) {
				clientName = null;
			}
			PageInfo pageInfo = new PageInfo(1);
			
			try {
				MemberService service = new MemberServiceImpl();
				List<Member> list = service.clientList(pageInfo, clientName);
				
				response.setContentType("application/json;charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				StringBuilder json = new StringBuilder();
				json.append("[");
				for (int i = 0; i < list.size(); i++) {
	                Member m = list.get(i);
	                json.append("{");
	                json.append("\"clientName\":\"" + m.getClientName() + "\",");
	                json.append("\"clientTel\":\"" + m.getClientTel() + "\",");
	                json.append("\"regDate\":\"" + m.getRegDate() + "\",");
	                json.append("\"ptTrainer\":" + m.getPtTrainer() + ",");
	                json.append("\"payment\":" + m.getPayment());
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
		if(page!=null) {
			reqPage = Integer.parseInt(page);
		}
		PageInfo pageInfo = new PageInfo(reqPage);
		
		try {
			MemberService service = new MemberServiceImpl();
			List<Member> clientList = service.clientList(pageInfo, null);
			int totalCount = service.totalCnt();
			int gymCount = service.gymCnt();
			int trainerCount = service.trainerCnt();
			int clientCount = service.clientCnt();
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("clientList", clientList);
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("gymCount", gymCount);
			request.setAttribute("trainerCount", trainerCount);
			request.setAttribute("clientCount", clientCount);
			request.getRequestDispatcher("/admin/memberClient.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "오류가 발생했습니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}