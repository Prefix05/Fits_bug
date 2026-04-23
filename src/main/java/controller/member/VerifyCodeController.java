package controller.member;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/verifyCode")
public class VerifyCodeController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		    throws IOException {
		
				String inputCode = req.getParameter("code");
				String sessionCode = (String) req.getSession().getAttribute("authCode");

				if(inputCode != null && inputCode.equals(sessionCode)){
					resp.getWriter().write("success");
				} else {
					resp.getWriter().write("fail");
		}
	}
}