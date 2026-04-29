package controller.member;

import dto.member.MemberDTO;
import service.member.MemberService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.MemberDAO;
import dao.member.MemberDAOImpl;

@WebServlet("/checkEmail")
public class CheckEmailController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		    throws IOException {

		        String email = req.getParameter("email");

		        MemberDAO dao = new MemberDAOImpl();
		        boolean exists = dao.isEmailExists(email);

		        resp.setContentType("application/json; charset=UTF-8");

		        String json = "{\"exists\":" + exists + "}";

		        resp.getWriter().write(json);
		}
	}