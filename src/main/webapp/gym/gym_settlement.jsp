<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/sidebar.jsp"></jsp:include>

<!-- Main Content Canvas -->
<main class="flex-1 ml-0 md:ml-64 p-8 bg-surface">
<header class="mb-10 flex flex-col md:flex-row md:items-end justify-between gap-4">
<div>
<h1 class="text-display-md font-bold tracking-tight text-on-surface leading-tight">정산 관리</h1>
<p class="text-on-surface-variant mt-1 text-body-md">2024년 5월 트레이너 정산 및 급여 지불 현황을 관리합니다.</p>
</div>

</header>
<!-- Stats Overview - Bento Grid Style -->
<div class="grid grid-cols-1 gap-6 mb-10 md:grid-cols-2">
<div class="md:col-span-1 p-6 bg-surface-container-lowest rounded-xl shadow-sm border border-outline-variant/10">
<p class="text-label-sm font-bold uppercase tracking-wider text-on-surface-variant mb-4">전체 정산 금액</p>
<h3 class="text-headline-sm font-bold text-on-surface">₩124,500,000</h3>
<div class="mt-4 flex items-center gap-1 text-primary">
<span class="material-symbols-outlined text-[16px]">trending_up</span>
<span class="text-label-sm font-bold">+12% vs 지난달</span>
</div>
</div>
<div class="md:col-span-1 p-6 bg-surface-container-lowest rounded-xl shadow-sm border border-outline-variant/10">
<p class="text-label-sm font-bold uppercase tracking-wider text-on-surface-variant mb-4">정산 대기 건수</p>
<h3 class="text-headline-sm font-bold text-tertiary">14건</h3>
<div class="mt-4 flex items-center gap-2">
<div class="h-1.5 flex-1 bg-surface-container-high rounded-full overflow-hidden">
<div class="h-full bg-tertiary w-1/3"></div>
</div>
</div>
</div>
</div>

<!-- Settlement Table -->
<div class="mb-6 flex flex-col lg:flex-row lg:items-center justify-between gap-4">
<div class="flex flex-col md:flex-row items-center gap-3 flex-1">
<div class="relative w-full md:w-80">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-[20px]">search</span>
<input class="w-full pl-10 pr-4 py-2.5 bg-surface-container-lowest border border-outline-variant/30 rounded-lg text-body-md focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all placeholder:text-outline" placeholder="트레이너 이름 검색" type="text"/>
</div>
<div class="relative w-full md:w-48">
<select class="w-full appearance-none pl-4 pr-10 py-2.5 bg-surface-container-lowest border border-outline-variant/30 rounded-lg text-body-md focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all">
<option disabled="" selected="">정산월 선택</option>
<option>2024년 5월</option>
<option>2024년 4월</option>
<option>2024년 3월</option>
</select>
<span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-on-surface-variant">keyboard_arrow_down</span>
</div>
</div>
<div class="flex items-center bg-surface-container-low p-1 rounded-lg">
<button class="px-4 py-1.5 rounded-md text-label-sm font-bold bg-surface-container-lowest text-primary shadow-sm">전체</button>
<button class="px-4 py-1.5 rounded-md text-label-sm font-bold text-on-surface-variant hover:bg-surface-container-high transition-colors">정산 대기</button>
<button class="px-4 py-1.5 rounded-md text-label-sm font-bold text-on-surface-variant hover:bg-surface-container-high transition-colors">정산 완료</button>
</div>
</div><div class="bg-surface-container-lowest rounded-xl shadow-sm overflow-hidden border border-outline-variant/10">
<div class="overflow-x-auto">
<table class="w-full text-left border-collapse">
<thead>
<tr class="bg-surface-container-low/50">
<th class="px-6 py-4 text-label-sm font-bold uppercase tracking-wider text-on-surface-variant">트레이너</th>
<th class="px-6 py-4 text-label-sm font-bold uppercase tracking-wider text-on-surface-variant">정산월 / 마감일</th>
<th class="px-6 py-4 text-label-sm font-bold uppercase tracking-wider text-on-surface-variant">총 매출</th>
<th class="px-6 py-4 text-label-sm font-bold uppercase tracking-wider text-on-surface-variant">수수료</th>
<th class="px-6 py-4 text-label-sm font-bold uppercase tracking-wider text-on-surface-variant">순 이익</th>
<th class="px-6 py-4 text-label-sm font-bold uppercase tracking-wider text-on-surface-variant">결제 정보</th>
<th class="px-6 py-4 text-label-sm font-bold uppercase tracking-wider text-on-surface-variant">현황</th>
<th class="px-6 py-4 text-label-sm font-bold uppercase tracking-wider text-on-surface-variant">완료일 / 메모</th>
</tr>
</thead>

<tbody class="divide-y divide-surface-container-low">

<!-- Row 1: Pending -->
<tr class="hover:bg-surface-container-low/30 transition-colors">
<td class="px-6 py-6">
<div class="flex items-center gap-3">
<div class="h-10 w-10 rounded-full bg-secondary-fixed-dim flex items-center justify-center font-bold text-on-secondary-fixed text-sm">김</div>
<div>
<p class="text-body-md font-bold text-on-surface">김태우</p>
<p class="text-[10px] text-on-surface-variant font-label uppercase">Elite Senior Trainer</p>
</div>
</div>
</td>
<td class="px-6 py-6">
<p class="text-body-md font-medium text-on-surface">2024년 5월</p>
<p class="text-label-sm text-on-surface-variant mt-1">마감: 2024.05.31</p>
</td>
<td class="px-6 py-6 font-bold text-on-surface">₩5,000,000</td>
<td class="px-6 py-6 text-error">₩500,000</td>
<td class="px-6 py-6 font-bold text-primary">₩4,500,000</td>
<td class="px-6 py-6">
<p class="text-body-md font-medium text-on-surface">신한은행</p>
<p class="text-label-sm text-on-surface-variant mt-1">110-456-789012</p>
</td>
<td class="px-6 py-6">
<button class="bg-gradient-to-r from-primary to-primary-container text-on-primary px-4 py-2 rounded-lg text-label-sm font-bold flex items-center gap-2 hover:opacity-90 active:scale-95 transition-all shadow-md shadow-primary/10">
                                        정산하기
                                        <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</button>
</td>
<td class="px-6 py-6">
<p class="text-body-md text-outline-variant">-</p>
<p class="text-label-sm text-on-surface-variant mt-1 truncate max-w-[120px]">-</p>
</td>
</tr>

<!-- Row 2: Settled -->
<tr class="hover:bg-surface-container-low/30 transition-colors">
<td class="px-6 py-6">
<div class="flex items-center gap-3">
<div class="h-10 w-10 rounded-full bg-tertiary-fixed-dim flex items-center justify-center font-bold text-on-tertiary-fixed text-sm">이</div>
<div>
<p class="text-body-md font-bold text-on-surface">이지민</p>
<p class="text-[10px] text-on-surface-variant font-label uppercase">Pilates Specialist</p>
</div>
</div>
</td>
<td class="px-6 py-6">
<p class="text-body-md font-medium text-on-surface">2024년 5월</p>
<p class="text-label-sm text-on-surface-variant mt-1">마감: 2024.05.31</p>
</td>
<td class="px-6 py-6 font-bold text-on-surface">₩3,000,000</td>
<td class="px-6 py-6 text-error">₩300,000</td>
<td class="px-6 py-6 font-bold text-primary">₩2,700,000</td>
<td class="px-6 py-6">
<p class="text-body-md font-medium text-on-surface">국민은행</p>
<p class="text-label-sm text-on-surface-variant mt-1">223402-04-123456</p>
</td>
<td class="px-6 py-6">
<span class="inline-flex items-center gap-1.5 px-3 py-1 bg-surface-container-high text-on-surface-variant rounded-full text-label-sm font-bold border border-outline-variant/15">
<span class="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
                                        정산완료
                                    </span>
</td>
<td class="px-6 py-6">
<p class="text-body-md font-medium text-on-surface">2024.06.01</p>
<p class="text-label-sm text-on-surface-variant mt-1 truncate max-w-[120px]">조기 정산 완료</p>
</td>
</tr>

<!-- Row 3: Pending -->
<tr class="hover:bg-surface-container-low/30 transition-colors">
<td class="px-6 py-6">
<div class="flex items-center gap-3">
<div class="h-10 w-10 rounded-full bg-secondary-container flex items-center justify-center font-bold text-on-secondary-container text-sm">박</div>
<div>
<p class="text-body-md font-bold text-on-surface">박준석</p>
<p class="text-[10px] text-on-surface-variant font-label uppercase">Master Coach</p>
</div>
</div>
</td>
<td class="px-6 py-6">
<p class="text-body-md font-medium text-on-surface">2024년 5월</p>
<p class="text-label-sm text-on-surface-variant mt-1">마감: 2024.05.31</p>
</td>
<td class="px-6 py-6 font-bold text-on-surface">₩7,200,000</td>
<td class="px-6 py-6 text-error">₩1,080,000</td>
<td class="px-6 py-6 font-bold text-primary">₩6,120,000</td>
<td class="px-6 py-6">
<p class="text-body-md font-medium text-on-surface">우리은행</p>
<p class="text-label-sm text-on-surface-variant mt-1">1002-123-456789</p>
</td>
<td class="px-6 py-6">
<button class="bg-gradient-to-r from-primary to-primary-container text-on-primary px-4 py-2 rounded-lg text-label-sm font-bold flex items-center gap-2 hover:opacity-90 transition-all shadow-md shadow-primary/10">
                                        정산하기
                                        <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</button>
</td>
<td class="px-6 py-6">
<p class="text-body-md text-outline-variant">-</p>
<p class="text-label-sm text-on-surface-variant mt-1 truncate max-w-[120px]">-</p>
</td>
</tr>
</tbody>
</table>
</div>

<!-- Pagination -->
<div class="px-6 py-4 bg-surface-container-lowest flex items-center justify-between border-t border-outline-variant/10">
<p class="text-label-sm text-on-surface-variant">Showing 1-10 of 42 entries</p>
<div class="flex items-center gap-2">
<button class="p-1.5 rounded-lg hover:bg-surface-container-high transition-all text-on-surface-variant">
<span class="material-symbols-outlined">chevron_left</span>
</button>
<button class="w-8 h-8 rounded-lg bg-primary text-on-primary text-label-sm font-bold">1</button>
<button class="w-8 h-8 rounded-lg hover:bg-surface-container-high text-on-surface-variant text-label-sm">2</button>
<button class="w-8 h-8 rounded-lg hover:bg-surface-container-high text-on-surface-variant text-label-sm">3</button>
<button class="p-1.5 rounded-lg hover:bg-surface-container-high transition-all text-on-surface-variant">
<span class="material-symbols-outlined">chevron_right</span>
</button>
</div>
</div>
</div>
</body>
</html>