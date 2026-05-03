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
    <title>Fitzberg - Signup</title>
</head>
<body>
    <h2>트레이너 회원가입</h2>
    <p style="color:red">${error}</p>
    <form action="${pageContext.request.contextPath}/trainer/signup" method="post">
        <input type="text" name="name" placeholder="이름" required/><br/>
        <input type="email" name="email" placeholder="이메일" required/><br/>
        <input type="password" name="password" placeholder="비밀번호" required/><br/>
        <input type="tel" name="tel" placeholder="전화번호" required/><br/>
        <input type="text" name="nickname" placeholder="닉네임" required/><br/>
<%--        <input type="file" name="profileImage" accept="image/*">--%>
        <input type="hidden" name="role" value="TRAINER"/>
        <button type="submit">다음</button>
    </form>
    <a href="${pageContext.request.contextPath}/trainer/login">로그인하기</a>
</body>
</html>
