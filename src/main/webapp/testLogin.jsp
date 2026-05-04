<%
session.setAttribute("userId", 1);
session.setAttribute("gymId", 1);
response.sendRedirect(request.getContextPath() + "/gym/main");
%>