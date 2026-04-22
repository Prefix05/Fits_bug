package controller;

import dto.MemberDTO;
import service.MemberService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/main")
public class MemberController {
    private MemberService memberService;

    // 1. main.jsp에서 "로그인" 버튼 클릭 시 -> login.jsp 폼을 띄워주는 역할
    protected String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	return "login"; //WEB-INF/views/login.jsp 로 이동 (ViewResolver 설정에 따라 다름)
	}

    // 2. login.jsp에서 폼 정보를 입력하고 "로그인" 버튼 클릭 시 -> 로그인 처리 역할
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userId = request.getParameter("userId");
        String password = request.getParameter("password");	
        
//        User user = service.login(userId, password);
        MemberDTO memberDTO = null;
		MemberDTO loginUser = memberService.login(memberDTO);

        if (loginUser != null) {
            // 로그인 성공: 세션에 사용자 정보 저장 후 메인 페이지로 리다이렉트
        	HttpSession session = request.getSession();
        	session.setAttribute("loginUser", loginUser);
            response.sendRedirect("main.jsp");
        } else {
        	request.setAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            // 로그인 실패: 에러 메시지와 함께 다시 로그인 페이지로 리다이렉트 
        }
    }
}