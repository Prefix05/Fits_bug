package controller;

import dto.MemberDTO;
import service.MemberService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

@WebServlet("/checkEmail")
public class CheckEmailController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		    throws IOException {

		        String email = req.getParameter("email");

		        MemberDAO dao = new MemberDAO();
		        boolean exists = dao.isEmailExists(email);

		        if(exists){
		            resp.getWriter().write("duplicate");
		        } else {
		            resp.getWriter().write("ok");
		        }
		}
	}