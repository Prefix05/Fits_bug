<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "surface-dim": "#d9dadc",
              "secondary": "#585f6c",
              "on-surface": "#191c1e",
              "tertiary": "#924700",
              "background": "#f8f9fb",
              "primary-fixed": "#d8e2ff",
              "surface-bright": "#f8f9fb",
              "on-secondary-container": "#5e6572",
              "tertiary-fixed": "#ffdcc6",
              "primary": "#3B82F6",
              "on-tertiary-fixed": "#311400",
              "secondary-fixed": "#dce2f3",
              "surface-tint": "#3B82F6",
              "on-primary-fixed": "#001a42",
              "on-tertiary-fixed-variant": "#723600",
              "primary-fixed-dim": "#adc6ff",
              "primary-container": "#2170e4",
              "on-secondary-fixed": "#151c27",
              "surface-container": "#edeef0",
              "surface-container-highest": "#e1e2e4",
              "on-error": "#ffffff",
              "on-primary": "#ffffff",
              "error-container": "#ffdad6",
              "on-surface-variant": "#424754",
              "tertiary-fixed-dim": "#ffb786",
              "surface-variant": "#e1e2e4",
              "inverse-primary": "#adc6ff",
              "surface": "#f8f9fb",
              "surface-container-low": "#f3f4f6",
              "surface-container-low-80": "rgba(243, 244, 246, 0.8)",
              "surface-container-lowest": "#ffffff",
              "surface-container-high": "#e7e8ea",
              "error": "#ba1a1a",
              "on-secondary": "#ffffff",
              "on-primary-fixed-variant": "#004395",
              "on-tertiary": "#ffffff",
              "outline": "#727785",
              "secondary-fixed-dim": "#c0c7d6",
              "on-primary-container": "#fefcff",
              "on-tertiary-container": "#fffbff",
              "outline-variant": "#c2c6d6",
              "secondary-container": "#dce2f3",
              "inverse-on-surface": "#f0f1f3",
              "on-background": "#191c1e",
              "tertiary-container": "#b75b00",
              "inverse-surface": "#2e3132",
              "on-error-container": "#93000a",
              "on-secondary-fixed-variant": "#404754"
            },
            fontFamily: {
              "headline": ["Inter"],
              "body": ["Inter"],
              "label": ["Inter"]
            },
            borderRadius: {"DEFAULT": "0.5rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
          },
        },
      }
    </script>
<style>
      .material-symbols-outlined {
        font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
      }
      .glass-header {
        backdrop-filter: blur(24px);
        background-color: rgba(255, 255, 255, 0.8);
      }
      .primary-gradient {
        background: linear-gradient(135deg, #3B82F6 0%, #2563EB 100%);
      }
    </style>
</head>
<body class="bg-surface font-body text-on-surface antialiased">
<%
    String contextPath = request.getContextPath();
%>
<div class="flex">
	<jsp:include page="../sidebar.jsp"></jsp:include>
</div>
<!-- Main Content Area -->
<main class="ml-64 min-h-screen">
<!-- Page Canvas -->
<div class="pt-24 px-10 pb-10">
<!-- Header Section -->
<div class="flex justify-between items-end mb-8">
<div>
<h2 class="text-2xl font-semibold font-headline tracking-tight text-on-surface">회원리스트</h2>
<p class="text-on-surface-variant mt-1">서비스 전체 회원의 활동 내역과 승인 상태를 관리합니다.</p>
</div>
</div>
<!-- Main Tabs -->
<div class="flex gap-8 mb-8 border-b border-outline-variant/20">
<a href="<%= request.getContextPath() %>/memberAuth"
class="pb-4 text-sm font-medium text-on-surface-variant hover:text-primary transition-colors relative">자격승인</a>
<a href="<%= request.getContextPath() %>/memberGym"
class="pb-4 text-sm font-bold text-primary border-b-2 border-primary relative">회원리스트</a>
</div>
<!-- Bento Filter Section -->
<div class="grid grid-cols-12 gap-6 mb-8">
<div class="col-span-12 lg:col-span-4 bg-surface-container-lowest p-1 rounded-xl flex shadow-sm border border-outline-variant/10">
<a href="<%= contextPath %>/memberGym"
class="flex-1 py-2 text-sm font-semibold rounded-lg transition-all text-on-surface-variant hover:bg-surface-container flex items-center justify-center">
헬스장
</a>
<a href="<%= contextPath %>/memberTrainer"
class="flex-1 py-2 text-sm font-semibold rounded-lg transition-all bg-primary text-white shadow-md flex items-center justify-center">
트레이너
</a>
<a href="<%= contextPath %>/memberClient"
class="flex-1 py-2 text-sm font-semibold rounded-lg transition-all text-on-.surface-variant hover:bg-surface-container flex items-center justify-center">
회원
</a>
</div>
<div class="col-span-12 lg:col-span-8 flex justify-end items-center gap-4">
<div class="flex items-center gap-2 px-4 py-2 bg-surface-container-lowest rounded-lg border border-outline-variant/20 shadow-sm">
<span class="text-xs font-label text-on-surface-variant">기간 설정</span>
<select class="text-sm border-none bg-transparent focus:ring-0 cursor-pointer text-on-surface font-medium">
<option>전체 기간</option>
<option>최근 1개월</option>
<option>최근 3개월</option>
</select>
</div>
</div>
</div>
<!-- Table Section -->
<div class="bg-surface-container-lowest rounded-xl shadow-sm overflow-hidden border border-outline-variant/10">
<div class="px-6 py-4 border-b border-outline-variant/10">
<div class="relative w-72">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-lg" data-icon="search">search</span>
<input class="w-full pl-10 pr-4 py-2 bg-surface-container-low border-none rounded-lg text-sm focus:ring-2 focus:ring-primary/20 outline-none transition-all" placeholder="트레이너 이름 또는 전화번호 검색" type="text"/>
</div>
</div>
<table class="w-full text-left border-collapse">
<thead>
<tr class="bg-surface-container-low/50 text-on-surface-variant text-xs font-label uppercase tracking-wider">
<th class="px-6 py-4 font-semibold">트레이너정보</th>
<th class="px-6 py-4 font-semibold">가입일자</th>
<th class="px-6 py-4 font-semibold">담당회원 수</th>
<th class="px-6 py-4 font-semibold">정산내역</th>
<th class="px-6 py-4 font-semibold text-right">상세보기</th>
</tr>
</thead>
<tbody class="divide-y divide-outline-variant/10">
<!-- Row 1 -->
<tr class="hover:bg-surface-container-low transition-colors group">
<td class="px-6 py-4">
<div class="flex items-center gap-4">
<img alt="Trainer" class="w-10 h-10 rounded-full object-cover bg-surface-container-high ring-2 ring-white shadow-sm" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBbdHMSism2OALhybjISTJkkOs4q8cWXO-xWzC8HFb2oQWPUMltEwc5odouydVh5-oB5BKvnWhrBKaSM02qqBMoZckigdiOjxXQyUyV8R9QU393cg3GFz_K2xVEeT3jLrqpbnSc1PLWZ8xM6eYO9meNRXDb3zLedEkYorqYa_0qW7IBkiMbq9bY7hbc4ItwA4t-MqCYFC-FZAH6Y9tfOBoRhyKdGH5PJ0Dahn-LzjWEiWscPEM0tiHK8ePZfXU863cjaYaTwZojSGw"/>
<div>
<div class="flex items-center gap-1.5">
<p class="text-sm font-bold text-on-surface">김철수</p>
<span class="material-symbols-outlined text-primary text-[18px]" data-icon="verified" style="font-variation-settings: 'FILL' 1;">verified</span>
</div>
<p class="text-xs text-on-surface-variant">010-1234-5678</p>
</div>
</div>
</td>
<td class="px-6 py-4 text-sm text-on-surface-variant">2023.11.15</td>
<td class="px-6 py-4 text-sm font-medium">24명</td>
<td class="px-6 py-4 text-sm font-medium text-on-surface">₩2,450,000</td>
<td class="px-6 py-4 text-right">
<button class="text-primary hover:bg-primary/10 p-2 rounded-full transition-colors">
<span class="material-symbols-outlined">chevron_right</span>
</button>
</td>
</tr>
<!-- Row 2 -->
<tr class="hover:bg-surface-container-low transition-colors group">
<td class="px-6 py-4">
<div class="flex items-center gap-4">
<img alt="Trainer" class="w-10 h-10 rounded-full object-cover bg-surface-container-high ring-2 ring-white shadow-sm" src="https://lh3.googleusercontent.com/aida-public/AB6AXuARAwfBDow1KyWT8fbgA-mgNUz0nWZ-Ng9vTK2urUdWKNRizNPv-SEmQtX7QHouqoZ4kF8PHbyyeUtKLtMwjNaKN3x-_QyzAi7zKn4RU5GQgEHuLvRpbst-uy__6jj2BbRlEgghhELxxjoJ9GPnZiBKms4ipZlng5euLo-0qw_cPDBlhAFDzNrZLaV_J5XyLNVRTrVY79mmTbDkWs_GMHTxlrW_xGZsy9LMiQhy29Ji2EsCr1WzGwhYP6TdlW_ajXXbZu2draNWChE"/>
<div>
<div class="flex items-center gap-1.5">
<p class="text-sm font-bold text-on-surface">박민지</p>
<span class="material-symbols-outlined text-primary text-[18px]" data-icon="verified" style="font-variation-settings: 'FILL' 1;">verified</span>
</div>
<p class="text-xs text-on-surface-variant">010-9876-5432</p>
</div>
</div>
</td>
<td class="px-6 py-4 text-sm text-on-surface-variant">2023.09.28</td>
<td class="px-6 py-4 text-sm font-medium">42명</td>
<td class="px-6 py-4 text-sm font-medium text-on-surface">₩4,820,000</td>
<td class="px-6 py-4 text-right">
<button class="text-primary hover:bg-primary/10 p-2 rounded-full transition-colors">
<span class="material-symbols-outlined">chevron_right</span>
</button>
</td>
</tr>
<!-- Row 3 -->
<tr class="hover:bg-surface-container-low transition-colors group">
<td class="px-6 py-4">
<div class="flex items-center gap-4">
<img alt="Trainer" class="w-10 h-10 rounded-full object-cover bg-surface-container-high ring-2 ring-white shadow-sm" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAwQyouU30gTuS_r9tnlKqs--XNSuJeDpSHxr1iAQtPzdgKhDkTrCeCwFT2mtcDLYOnadO4yQ66OwW6Llon3BMaC8eqqDOQ2Ah9yQKIoE5lYJKgEwu14Jgx0ZxA7oYqAcIHWIZnDIU1e-CyUCnr4R0WIVVUmGA0NwqhIFNaCXmx3x9-asQTaGg0c-bZGLUdRdKEbTOWJwihoKu7S5XoiYW2hmU_q8yzui73YaRV7xuRzwX0bGrl088b71h3vimUluWMGw7cKpymGaA"/>
<div>
<p class="text-sm font-bold text-on-surface">이태원</p>
<p class="text-xs text-on-surface-variant">010-1111-2222</p>
</div>
</div>
</td>
<td class="px-6 py-4 text-sm text-on-surface-variant">2023.10.05</td>
<td class="px-6 py-4 text-sm font-medium">15명</td>
<td class="px-6 py-4 text-sm font-medium text-on-surface">₩1,120,000</td>
<td class="px-6 py-4 text-right">
<button class="text-primary hover:bg-primary/10 p-2 rounded-full transition-colors">
<span class="material-symbols-outlined">chevron_right</span>
</button>
</td>
</tr>
<!-- Row 4 -->
<tr class="hover:bg-surface-container-low transition-colors group">
<td class="px-6 py-4">
<div class="flex items-center gap-4">
<img alt="Trainer" class="w-10 h-10 rounded-full object-cover bg-surface-container-high ring-2 ring-white shadow-sm" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA-gBcP1f7z2P4haxxf5bFWbfGOrcQp-No01Br2ljTX4hXi4SClsdZy_an-K6u85RSeyC4VQ42eVJqEJJ8LcaKcOQImFuYE4biYU59vqwx3iEGmsFKnTK16wPcpuj0vR6MPW3TtSarcMZSIfOluhVZs04RPsz1Z7WqwyiBzYh8zqMV_-W2uiL0BRLDgvInW6x_oAlvBXhMQi_Afx7lnA36ODqRIGROx1D8OBkjlwNzf8wrltzCrQ9QA5svXsq-NrFm8QRY2vx85F4Y"/>
<div>
<div class="flex items-center gap-1.5">
<p class="text-sm font-bold text-on-surface">정수정</p>
<span class="material-symbols-outlined text-primary text-[18px]" data-icon="verified" style="font-variation-settings: 'FILL' 1;">verified</span>
</div>
<p class="text-xs text-on-surface-variant">010-3333-4444</p>
</div>
</div>
</td>
<td class="px-6 py-4 text-sm text-on-surface-variant">2023.08.12</td>
<td class="px-6 py-4 text-sm font-medium">31명</td>
<td class="px-6 py-4 text-sm font-medium text-on-surface">₩3,100,000</td>
<td class="px-6 py-4 text-right">
<button class="text-primary hover:bg-primary/10 p-2 rounded-full transition-colors">
<span class="material-symbols-outlined">chevron_right</span>
</button>
</td>
</tr>
</tbody>
</table>
<!-- Pagination -->
<div class="px-6 py-4 flex items-center justify-between bg-surface-container-low/30 border-t border-outline-variant/10">
<p class="text-xs text-on-surface-variant">전체 48명 중 1-4 표시 중</p>
<div class="flex items-center gap-1">
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container transition-colors">
<span class="material-symbols-outlined text-lg" data-icon="chevron_left">chevron_left</span>
</button>
<button class="w-8 h-8 flex items-center justify-center rounded bg-primary text-white font-bold text-xs shadow-sm">1</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container text-xs font-medium">2</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container text-xs font-medium">3</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container text-xs font-medium">...</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container text-xs font-medium">9</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container transition-colors">
<span class="material-symbols-outlined text-lg" data-icon="chevron_right">chevron_right</span>
</button>
</div>
</div>
</div>
<!-- Summary Section Metrics: Row of 4 equally sized cards -->
<div class="grid grid-cols-1 md:grid-cols-4 gap-6 mt-10">
<!-- Card 1: 전체회원 -->
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/10">
<div class="flex items-center justify-between mb-4">
<div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary">
<span class="material-symbols-outlined" data-icon="people">people</span>
</div>
</div>
<p class="text-xs font-label text-on-surface-variant uppercase mb-1">전체회원</p>
<h3 class="text-2xl font-bold text-on-surface">2,842명</h3>
</div>
<!-- Card 2: 회원 -->
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/10">
<div class="flex items-center justify-between mb-4">
<div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary">
<span class="material-symbols-outlined" data-icon="person">person</span>
</div>
</div>
<p class="text-xs font-label text-on-surface-variant uppercase mb-1">회원</p>
<h3 class="text-2xl font-bold text-on-surface">1,520명</h3>
</div>
<!-- Card 3: 헬스장 -->
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/10">
<div class="flex items-center justify-between mb-4">
<div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary">
<span class="material-symbols-outlined" data-icon="fitness_center">fitness_center</span>
</div>
</div>
<p class="text-xs font-label text-on-surface-variant uppercase mb-1">헬스장</p>
<h3 class="text-2xl font-bold text-on-surface">128개</h3>
</div>
<!-- Card 4: 트레이너 -->
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/10">
<div class="flex items-center justify-between mb-4">
<div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary">
<span class="material-symbols-outlined" data-icon="badge">badge</span>
</div>
</div>
<p class="text-xs font-label text-on-surface-variant uppercase mb-1">트레이너</p>
<h3 class="text-2xl font-bold text-on-surface">48명</h3>
</div>
</div>
</div>
</main>
</body></html>