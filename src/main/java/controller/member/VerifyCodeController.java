package controller.member;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/verifyCode")
public class VerifyCodeController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		    throws IOException {
		
				String inputCode = req.getParameter("code");
				
				HttpSession session = req.getSession();
		        String sessionCode = (String) session.getAttribute("authCode");
		        Long authTime = (Long) session.getAttribute("authTime");

		        long now = System.currentTimeMillis();

		        // 🔥 3분(180초) 체크
		        if (authTime == null || (now - authTime) > 180000) {
		            resp.getWriter().write("expired");
		            return;
		        }

		        if (inputCode != null && inputCode.equals(sessionCode)) {
		            resp.getWriter().write("success");
		        } else {
		            resp.getWriter().write("fail");
		}
	}
}