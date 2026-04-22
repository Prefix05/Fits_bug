<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>

<!-- 🔹 사이드바 -->
<aside class="h-full w-64 fixed left-0 top-0 bg-slate-50 dark:bg-slate-950 flex flex-col p-5 z-50 border-r border-surface-container-highest">

    <!-- 🔹 상단 영역 -->
    <div class="flex flex-col">

        <!-- 로고 -->
        <div class="text-2xl font-black text-blue-600 dark:text-blue-500 italic mb-4 flex items-center gap-2">
            <img class="w-8 h-8 rounded-full"
                 src="<%=contextPath%>/resources/images/logo.png"/>
            <span>핏츠버그</span>
        </div>

        <!-- 프로필 -->
        <div class="flex items-center gap-3 p-3 bg-white rounded-xl shadow-sm border mb-6">
            <div class="w-10 h-10 rounded-full bg-gray-300"></div>
            <div class="flex flex-col">
                <span class="text-sm font-semibold">사용자 이름</span>
                <span class="text-xs text-gray-500">회원</span>
            </div>
        </div>

        <!-- 메뉴 -->
        <nav class="flex flex-col gap-2">

            <a href="<%=contextPath%>/main.jsp"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-blue-600 bg-white shadow-sm">
                <span class="material-symbols-outlined">home</span>
                <span class="text-sm font-semibold">홈</span>
            </a>

            <a href="<%=contextPath%>/guide.jsp"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">fitness_center</span>
                <span class="text-sm">운동가이드</span>
            </a>

            <a href="<%=contextPath%>/trainer.jsp"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">badge</span>
                <span class="text-sm">트레이너</span>
            </a>

            <a href="<%=contextPath%>/gym.jsp"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">store</span>
                <span class="text-sm">헬스장</span>
            </a>

            <a href="<%=contextPath%>/community.jsp"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">groups</span>
                <span class="text-sm">커뮤니티</span>
            </a>

            <a href="<%=contextPath%>/mypage.jsp"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">person</span>
                <span class="text-sm">마이페이지</span>
            </a>

        </nav>
    </div>

    <!-- 🔹 하단 영역 -->
    <div class="mt-auto flex flex-col gap-2 pt-4 border-t border-slate-200">

        <!-- 고객센터 (하단 고정) -->
        <a href="<%=contextPath%>/support.jsp"
           class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
            <span class="material-symbols-outlined">support_agent</span>
            <span class="text-sm">고객센터</span>
        </a>

        <!-- 로그인 / 회원가입 -->
        <button onclick="location.href='<%=contextPath%>/login.jsp'"
                class="bg-blue-600 text-white py-2 rounded-xl text-sm font-bold">
            로그인
        </button>

        <button onclick="location.href='<%=contextPath%>/join.jsp'"
                class="border py-2 rounded-xl text-sm font-bold hover:bg-gray-100">
            회원가입
        </button>

    </div>

</aside>

<!-- 🔹 우측 상단 아이콘 -->
<div class="fixed top-4 right-6 flex items-center gap-4 z-50">

    <!-- 알림 -->
    <button class="relative p-2 rounded-full bg-white shadow hover:bg-gray-100">
        <span class="material-symbols-outlined text-[22px]">
            notifications
        </span>

        <span class="absolute -top-1 -right-1 w-4 h-4 bg-red-500 text-white text-[10px] flex items-center justify-center rounded-full">
            3
        </span>
    </button>

    <!-- 메시지 -->
    <button class="relative p-2 rounded-full bg-white shadow hover:bg-gray-100">
        <span class="material-symbols-outlined text-[22px]">
            mail
        </span>

        <span class="absolute -top-1 -right-1 w-4 h-4 bg-blue-500 text-white text-[10px] flex items-center justify-center rounded-full">
            5
        </span>
    </button>

</div>