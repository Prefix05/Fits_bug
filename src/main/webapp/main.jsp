<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.MemberDTO"%>

<%
MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

if(loginUser == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 메인페이지</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap" rel="stylesheet">
<style>
body { font-family: 'Inter', sans-serif; }
</style>
</head>

<body class="bg-gray-100 flex">

<h1><%= loginUser.getNickname() %>님 환영합니다 👋</h1>

<!-- 사이드바 -->
<div class="w-64 bg-white h-screen p-6 shadow-lg">

    <h1 class="text-2xl font-black mb-6">핏츠버그</h1>

    <!-- 프로필 카드 -->
    <div class="bg-gray-100 p-4 rounded-xl mb-6">
        <div class="flex items-center gap-3">
            <img class="w-12 h-12 rounded-full"
                 src="<%= loginUser.getProfileImage() == null ? "https://randomuser.me/api/portraits/men/10.jpg" : loginUser.getProfileImage() %>">

            <div>
                <p class="font-bold"><%= loginUser.getNickname() %></p>
                <p class="text-sm text-gray-500"><%= loginUser.getEmail() %></p>
            </div>
        </div>
    </div>

    <!-- 메뉴 -->
    <ul class="space-y-3">
        <li><a href="main.jsp" class="text-blue-500 font-bold">홈</a></li>
        <li><a href="#">운동 가이드</a></li>
        <li><a href="#">트레이너</a></li>
        <li><a href="#">헬스장</a></li>
        <li><a href="#">커뮤니티</a></li>
        <li><a href="mypage">마이페이지</a></li>
    </ul>

    <div class="mt-10">
        <a href="logout" class="text-red-500">로그아웃</a>
    </div>

</div>

<!-- 메인 콘텐츠 -->
<div class="flex-1 p-8">

    <!-- 상단 -->
    <div class="flex justify-end mb-6">
        <span class="mr-4">🔔</span>
        <span>📩</span>
    </div>

    <!-- 1RM -->
    <div class="bg-white p-6 rounded-xl shadow mb-6">
        <h2 class="font-bold mb-4">나의 1RM 변화</h2>
        <div class="h-40 bg-gray-200 flex items-end gap-2 p-4">
            <div class="bg-blue-300 w-6 h-10"></div>
            <div class="bg-blue-400 w-6 h-20"></div>
            <div class="bg-blue-500 w-6 h-16"></div>
            <div class="bg-blue-600 w-6 h-28"></div>
        </div>
    </div>

    <!-- 3개 카드 -->
    <div class="grid grid-cols-3 gap-6 mb-6">

        <!-- 운동 -->
        <div class="bg-white p-4 rounded-xl shadow">
            <h3 class="font-bold mb-3">운동 기록</h3>
            <p>벤치프레스 95kg</p>
            <p>스쿼트 100kg</p>
        </div>

        <!-- 식단 -->
        <div class="bg-white p-4 rounded-xl shadow">
            <h3 class="font-bold mb-3">식단 기록</h3>
            <p>닭가슴살 + 고구마</p>
        </div>

        <!-- 인바디 -->
        <div class="bg-white p-4 rounded-xl shadow">
            <h3 class="font-bold mb-3">인바디</h3>
            <p>체중: 75kg</p>
            <p>체지방: 15%</p>
        </div>

    </div>

    <!-- PT 일정 -->
    <div class="bg-white p-6 rounded-xl shadow mb-6">
        <h2 class="font-bold mb-4">나의 PT 일정</h2>
        <p>4월 9일 12:00 김태훈 트레이너</p>
    </div>

    <!-- 활동 -->
    <div class="bg-white p-6 rounded-xl shadow">
        <h2 class="font-bold mb-4">나의 활동</h2>
        <p>오늘 오운완 💪</p>
    </div>

</div>

</body>
</html>