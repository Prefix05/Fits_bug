<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.member.MemberDTO"%>
<%
    String contextPath = request.getContextPath();
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
%>

<!-- 🔹 사이드바 -->
<aside class="h-full w-64 fixed left-0 top-0 bg-slate-50 dark:bg-slate-950 flex flex-col p-5 z-50 border-r border-surface-container-highest">

    <!-- 🔹 상단 영역 -->
    <div class="flex flex-col">

        <!-- 로고 -->
        <div class="text-2xl font-black text-blue-600 dark:text-blue-500 italic mb-4 flex items-center gap-2">
            <img class="w-8 h-8 rounded-full" alt="Fitbull Logo" src="<%=contextPath%>/resources/images/logo.png"
                 onerror="this.src='https://lh3.googleusercontent.com/aida-public/AB6AXuCveWQWdmN7R9sHZYJtczW7JlQkSJksW17FyrAjX0sIqVNoO7rUvZ5aVmTxr--s6QdrpYaJkNs9Aj3Lm4Z9ICG1waBV-yEKtgQqf7a77X3bEMweDYmiRv_2wprNj_xs__Vqyh2f5bVQr3QkuYOxRdXb5jfED0ktJFxf9r0RpjFrb6By02eTD3KzReErGiYzzhFyCBXRSRYqsQM2VKkdk7mWWO2R5jjBRMjcPYzPyBozh6wbh3bLzhw8KrRNIyipW0rhClHJNWthxiM'"/>
            <span>핏츠버그</span>
        </div>

        <!-- ✅ 프로필 (로그인한 경우만 표시) -->
        <% if(loginUser != null){ %>
        <div class="bg-white p-4 rounded-xl shadow mb-6">
            <div class="flex gap-3">
                <img class="w-12 h-12 rounded-full"
                     src="<%= loginUser.getProfileImage() == null ? "https://randomuser.me/api/portraits/men/10.jpg" : loginUser.getProfileImage() %>">

                <div>
                    <p class="font-bold"><%= loginUser.getNickname() %></p>
                    <p class="text-sm text-gray-500"><%= loginUser.getEmail() %></p>
                    <p class="text-xs text-blue-500 mt-1">맞춤형 플랜 진행 중</p>
                </div>
            </div>
        </div>
        <% } %>

        <!-- 메뉴 -->
        <nav class="flex flex-col gap-2">

            <a href="<%=contextPath%>/main"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-blue-600 bg-white shadow-sm">
                <span class="material-symbols-outlined">home</span>
                <span class="text-sm font-semibold">홈</span>
            </a>

            <a href="<%=contextPath%>/guide"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">fitness_center</span>
                <span class="text-sm">운동가이드</span>
            </a>

            <a href="<%=contextPath%>/trainer"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">badge</span>
                <span class="text-sm">트레이너</span>
            </a>

            <a href="<%=contextPath%>/gym"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">store</span>
                <span class="text-sm">헬스장</span>
            </a>

            <a href="<%=contextPath%>/community.jsp"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">groups</span>
                <span class="text-sm">커뮤니티</span>
            </a>

            <a href="<%=contextPath%>/mypage"
               class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
                <span class="material-symbols-outlined">person</span>
                <span class="text-sm">마이페이지</span>
            </a>

        </nav>
    </div>

    <!-- 🔹 하단 영역 -->
    <div class="mt-auto flex flex-col gap-2 pt-4 border-t border-slate-200">

        <!-- 고객센터 -->
        <a href="<%=contextPath%>/support.jsp"
           class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
            <span class="material-symbols-outlined">support_agent</span>
            <span class="text-sm">고객센터</span>
        </a>

        <!-- ✅ 로그인 상태 분기 -->
        <% if(loginUser != null){ %>
            <!-- 로그아웃 -->
            <button onclick="location.href='<%=contextPath%>/logout'"
                    class="bg-blue-600 text-white py-2 rounded-xl text-sm font-bold">
                로그아웃
            </button>
        <% } else { %>
            <!-- 로그인 -->
            <button onclick="location.href='<%=contextPath%>/member/login.jsp'"
                    class="bg-blue-600 text-white py-2 rounded-xl text-sm font-bold">
                로그인
            </button>
        <% } %>

    </div>

</aside>

<!-- 🔹 우측 상단 아이콘 -->
<!-- <div class="fixed top-4 right-6 flex items-center gap-4 z-50">

    <button class="relative p-2 rounded-full bg-white shadow hover:bg-gray-100">
        <span class="material-symbols-outlined text-[22px]">notifications</span>
        <span class="absolute -top-1 -right-1 w-4 h-4 bg-red-500 text-white text-[10px] flex items-center justify-center rounded-full">3</span>
    </button>

    <button class="relative p-2 rounded-full bg-white shadow hover:bg-gray-100">
        <span class="material-symbols-outlined text-[22px]">mail</span>
        <span class="absolute -top-1 -right-1 w-4 h-4 bg-blue-500 text-white text-[10px] flex items-center justify-center rounded-full">5</span>
    </button>

</div> -->
<%-- <% if(loginUser != null){ %>
<div class="flex justify-end gap-4 mb-4">

    <div class="relative cursor-pointer">
        <span class="material-symbols-outlined text-2xl">notifications</span>
    </div>

    <div class="relative cursor-pointer">
        <span class="material-symbols-outlined text-2xl">mail</span>
    </div>

</div>
<% } %> --%>