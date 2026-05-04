<%@ page import="dto.gym.User" %>
<%
User user = new User();
user.setId(1);
user.setName("테스트회원");

session.setAttribute("loginUser", user);
session.setAttribute("gymId", 1);
session.setAttribute("memberId", 1);
session.setAttribute("userName", "테스트회원");

response.sendRedirect(request.getContextPath() + "/gym/main");
return;
%>