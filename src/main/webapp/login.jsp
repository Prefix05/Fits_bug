<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏츠버그 로그인</title>

<style>
body {
    margin: 0;
    font-family: 'Noto Sans KR', sans-serif;
    background: #f5f6f8;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* 카드 */
.login-box {
    width: 360px;
    background: #fff;
    border-radius: 16px;
    padding: 40px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    text-align: center;
}

/* 로고 */
.logo {
    font-size: 20px;
    font-weight: bold;
    color: #4a7bdc;
    margin-bottom: 10px;
}

.title {
    font-size: 28px;
    font-weight: bold;
    color: #4a7bdc;
}

.subtitle {
    font-size: 14px;
    color: #888;
    margin-bottom: 30px;
}

/* input */
.input-box {
    text-align: left;
    margin-bottom: 15px;
}

.input-box label {
    font-size: 13px;
    color: #666;
}

.input-box input {
    width: 100%;
    padding: 12px;
    margin-top: 5px;
    border-radius: 8px;
    border: 1px solid #ddd;
    outline: none;
}

/* 옵션 */
.options {
    display: flex;
    justify-content: space-between;
    font-size: 12px;
    margin-bottom: 20px;
}

/* 버튼 */
.login-btn {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 25px;
    background: linear-gradient(to right, #4a7bdc, #6aa9ff);
    color: white;
    font-weight: bold;
    cursor: pointer;
}

.divider {
    margin: 20px 0;
    color: #aaa;
}

/* 카카오 */
.kakao-btn {
    width: 100%;
    padding: 12px;
    border-radius: 25px;
    border: none;
    background: #FEE500;
    font-weight: bold;
    cursor: pointer;
}

.signup {
    margin-top: 15px;
    font-size: 13px;
}

.signup a {
    color: #4a7bdc;
    text-decoration: none;
}
</style>

</head>
<body>

<div class="container">
    <div class="login-box">
        <div class="logo">💙 핏츠버그</div>

        <div class="title">로그인</div>
        <div class="subtitle">오늘도 완벽한 운동을 시작하세요 💪</div>

        <form action="login" method="post">
            <div class="input-box">
                <label>아이디</label>
                <input type="text" name="userId" placeholder="아이디">
            </div>

            <div class="input-box">
                <label>비밀번호</label>
                <input type="password" name="password" placeholder="비밀번호">
            </div>

            <div class="options">
                <div><input type="checkbox"> 아이디 저장</div>
                <a href="#">비밀번호 찾기</a>
            </div>

            <button class="login-btn">로그인</button>
        </form>

        <div class="divider">또는</div>

        <!-- 카카오 로그인 -->
        <button class="kakao-btn"
            onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=YOUR_REST_API_KEY&redirect_uri=http://localhost:8080/kakaoLogin&response_type=code'">
            카카오로 로그인
        </button>

        <div class="signup">
            아직 회원이 아니신가요? <a href="#">회원가입</a>
        </div>
    </div>
</div>
<div class="guest">
	로그인 없이 둘러보기<a href="guest.jsp"></a>
</div>
</body>
</html>