<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/29/26
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>트레이너 회원가입</h2>
    <p style="color:red">${error}</p>
    <form action="${pageContext.request.contextPath}/trainer/signup" method="post">
        <input type="text" name="name" placeholder="이름" required/><br/>
        <input type="email" name="email" placeholder="이메일" required/><br/>
        <input type="password" name="password" placeholder="비밀번호" required/><br/>
        <button type="submit">회원가입</button>
    </form>
    <a href="${pageContext.request.contextPath}/trainer/login">로그인하기</a>
</body>
</html>
