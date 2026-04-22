<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, dto.SupportDTO" %>

<%
    List<SupportDTO> list = (List<SupportDTO>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Fitsburgh - 고객센터</title>

<script src="https://cdn.tailwindcss.com"></script>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800" rel="stylesheet"/>

<style>
body { font-family: 'Inter', sans-serif; }
</style>
</head>

<body class="bg-gray-50 flex">

<!-- ✅ 사이드바 -->
<jsp:include page="sidebar.jsp" />

<!-- ✅ 우측 상단 아이콘 (community.jsp 그대로 적용) -->
<div class="fixed top-4 right-6 flex items-center gap-4 z-50">

    <!-- 알림 -->
    <button class="relative p-2 rounded-full bg-white shadow hover:bg-gray-100">
        <span class="material-symbols-outlined">notifications</span>
        <span class="absolute -top-1 -right-1 w-4 h-4 bg-red-500 text-white text-[10px] flex items-center justify-center rounded-full">
            3
        </span>
    </button>

    <!-- 메시지 -->
    <button class="relative p-2 rounded-full bg-white shadow hover:bg-gray-100">
        <span class="material-symbols-outlined">mail</span>
        <span class="absolute -top-1 -right-1 w-4 h-4 bg-blue-500 text-white text-[10px] flex items-center justify-center rounded-full">
            5
        </span>
    </button>

</div>

<!-- ✅ 메인 구조 (community.jsp 구조 그대로) -->
<main class="flex-1 ml-0 md:ml-72 p-8 flex gap-8">

<!-- ================= LEFT ================= -->
<div class="flex-1 max-w-4xl mx-auto flex flex-col gap-6">

    <!-- 🔥 헤더 -->
    <div>
        <h2 class="text-3xl font-bold">고객센터</h2>
        <p class="text-gray-500 mt-1">무엇을 도와드릴까요?</p>
    </div>

    <!-- 🔥 문의하기 -->
    <form action="support" method="post" class="bg-white p-6 rounded-xl shadow">

        <h3 class="text-xl font-bold mb-4">문의하기</h3>

        <select name="type" class="w-full p-3 border mb-3 rounded">
            <option value="문의">계정 문의</option>
            <option value="문의">결제 문의</option>
            <option value="문의">서비스 오류</option>
            <option value="신고">신고</option>
        </select>

        <input name="title" placeholder="제목"
               class="w-full p-3 border mb-3 rounded">

        <textarea name="content" placeholder="내용"
                  class="w-full p-3 border mb-3 rounded"></textarea>

        <button class="bg-blue-600 text-white px-6 py-2 rounded-lg">
            제출하기
        </button>
    </form>

    <!-- 🔥 문의/신고 내역 -->
    <div class="bg-white p-6 rounded-xl shadow">

        <h3 class="text-xl font-bold mb-4">문의 / 신고 내역</h3>

        <%
            if(list != null && !list.isEmpty()){
                for(SupportDTO s : list){
        %>

        <div class="border-b py-4 flex justify-between items-center">

            <!-- 좌측 -->
            <div>

                <!-- 배지 -->
                <div class="flex items-center gap-2 mb-1">

                    <% if("신고".equals(s.getType())){ %>
                        <span class="px-2 py-1 text-xs font-bold bg-orange-200 text-red-600 rounded">
                            신고
                        </span>
                    <% } else { %>
                        <span class="px-2 py-1 text-xs font-bold bg-blue-500 text-white rounded">
                            문의
                        </span>
                    <% } %>

                    <!-- 문의 종류 -->
                    <span class="text-sm text-gray-500">
                        <%= s.getType() %>
                    </span>

                </div>

                <!-- 제목 -->
                <div class="font-semibold text-lg">
                    <%= s.getTitle() %>
                </div>

                <!-- 날짜 -->
                <div class="text-sm text-gray-400">
                    <%= s.getCreatedAt() %>
                </div>

            </div>

            <!-- 상태 -->
            <div>
                <span class="px-3 py-1 text-sm bg-gray-200 rounded-full">
                    <%= s.getStatus() %>
                </span>
            </div>

        </div>

        <%
                }
            } else {
        %>

        <div class="text-gray-400 text-center py-10">
            문의/신고 내역이 없습니다.
        </div>

        <%
            }
        %>

    </div>

</div>

<!-- ================= RIGHT (옵션 영역) ================= -->
<aside class="w-80 flex flex-col gap-4">

    <div class="bg-white p-5 rounded-xl shadow">
        <h3 class="font-bold text-lg mb-2">📌 고객센터 안내</h3>
        <p class="text-sm text-gray-500">
            문의는 보통 24시간 이내 답변됩니다.
        </p>
    </div>

    <div class="bg-white p-5 rounded-xl shadow">
        <h3 class="font-bold text-lg mb-2">💡 TIP</h3>
        <p class="text-sm text-gray-500">
            상세하게 작성할수록 빠른 처리가 가능합니다.
        </p>
    </div>

</aside>
</main>

</body>
</html>