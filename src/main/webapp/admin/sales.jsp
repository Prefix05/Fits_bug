<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>정산 및 매출관리 - 핏츠버그 Fitness Admin</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "surface-container-lowest": "#ffffff",
                        "surface-container-highest": "#e1e2e4",
                        "surface-container": "#edeef0",
                        "on-primary": "#ffffff",
                        "on-error-container": "#93000a",
                        "background": "#f8f9fb",
                        "error": "#ba1a1a",
                        "outline": "#727785",
                        "secondary-container": "#dce2f3",
                        "on-secondary-fixed-variant": "#404754",
                        "tertiary": "#924700",
                        "tertiary-fixed-dim": "#ffb786",
                        "on-tertiary-fixed": "#311400",
                        "surface-variant": "#e1e2e4",
                        "primary-container": "#2170e4",
                        "on-surface-variant": "#424754",
                        "error-container": "#ffdad6",
                        "surface-container-low": "#f3f4f6",
                        "on-tertiary-fixed-variant": "#723600",
                        "secondary-fixed-dim": "#c0c7d6",
                        "outline-variant": "#c2c6d6",
                        "tertiary-container": "#b75b00",
                        "on-primary-fixed-variant": "#004395",
                        "on-error": "#ffffff",
                        "inverse-surface": "#2e3132",
                        "on-tertiary-container": "#fffbff",
                        "on-secondary": "#ffffff",
                        "tertiary-fixed": "#ffdcc6",
                        "inverse-primary": "#adc6ff",
                        "on-secondary-fixed": "#151c27",
                        "inverse-on-surface": "#f0f1f3",
                        "on-tertiary": "#ffffff",
                        "surface-container-high": "#e7e8ea",
                        "primary-fixed": "#d8e2ff",
                        "surface": "#f8f9fb",
                        "secondary": "#585f6c",
                        "on-primary-fixed": "#001a42",
                        "surface-tint": "#3B82F6",
                        "surface-bright": "#f8f9fb",
                        "secondary-fixed": "#dce2f3",
                        "on-surface": "#191c1e",
                        "surface-dim": "#d9dadc",
                        "on-background": "#191c1e",
                        "primary-fixed-dim": "#adc6ff",
                        "on-secondary-container": "#5e6572",
                        "on-primary-container": "#fefcff",
                        "primary": "#3B82F6"
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
        body { font-family: 'Inter', sans-serif; }
        .nowrap { white-space: nowrap; }
    </style>
</head>
<body class="bg-background text-on-surface">
<!-- SideNavBar Shell -->
<div class="flex">
<jsp:include page="../member/sidebar.jsp"></jsp:include>
</div>
<!-- Main Content -->
<main class="ml-64 pt-16 p-6 lg:p-10 min-h-screen">
<div class="max-w-7xl mx-auto space-y-10">
<!-- Headline -->
<div class="flex flex-col sm:flex-row justify-between items-start sm:items-end gap-4 pt-10">
<div>
<h2 class="text-[1.5rem] font-semibold tracking-tight text-on-surface nowrap">정산 및 매출 관리</h2>
<p class="text-on-surface-variant text-sm mt-1 nowrap">피트니스 센터의 수익 현황과 강사 정산 내역을 한눈에 확인하세요.</p>
</div>
<div class="flex gap-3">
<button onclick="refreshAllData()" class="px-4 py-2 text-sm font-medium text-on-primary bg-gradient-to-br from-primary to-primary-container rounded-md shadow-sm nowrap">
    실시간 데이터 갱신
</button>
</div>
</div>
<!-- Date Range Picker Section -->
<form action="${pageContext.request.contextPath}/admin/sales" method="get" id="searchForm">
    <div class="flex items-center gap-3 bg-surface p-4 rounded-lg shadow-sm">
        <input type="date" name="startDate" id="startDate" value="${startDate}" class="border rounded-md px-2 py-1">
        <span>~</span>
        <input type="date" name="endDate" id="endDate" value="${endDate}" class="border rounded-md px-2 py-1">
        
        <input type="text" name="searchKeyword" value="${param.searchKeyword}" placeholder="ID 검색..." class="border rounded-md px-2 py-1">
        
        <button type="submit" class="bg-primary text-white px-4 py-2 rounded-md">조회</button>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/sales'" class="bg-gray-500 text-white px-4 py-2 rounded-md">실시간 데이터 갱신</button>
    </div>
    <input type="hidden" name="status" value="${status}">
</form>

<hr class="my-6">
<!-- Summary Cards -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
    <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
        <p class="text-sm font-medium text-gray-500">총 매출액</p>
        <p class="text-2xl font-bold text-gray-900 mt-1">
            <fmt:formatNumber value="${data.summary.totalSales}" type="currency" currencySymbol="₩" />
        </p>
    </div>
    <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
        <p class="text-sm font-medium text-gray-500">정산 수수료</p>
        <p class="text-2xl font-bold text-red-600 mt-1">
            <fmt:formatNumber value="${data.summary.totalFee}" type="currency" currencySymbol="₩" />
        </p>
    </div>
    <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
        <p class="text-sm font-medium text-gray-500">순수익</p>
        <p class="text-2xl font-bold text-blue-600 mt-1">
            <fmt:formatNumber value="${data.summary.netProfit}" type="currency" currencySymbol="₩" />
        </p>
    </div>
</div>
<!-- Combined Chart Section -->
<div class="lg:col-span-2 bg-white p-6 rounded-xl shadow-sm border border-gray-100">
            <h3 class="text-sm font-bold text-gray-700 mb-4">매출 및 수익 분석</h3>
            <canvas id="salesChart" height="150"></canvas>
</div>
<!-- Settlement Detail Table Section -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
        <form id="listForm" action="${pageContext.request.contextPath}/admin/sales" method="get">
            <!-- 폼 유지를 위한 히든 필드 -->
            <input type="hidden" name="startDate" value="${startDate}">
            <input type="hidden" name="endDate" value="${endDate}">
            <input type="hidden" name="status" id="currentStatus" value="${status}">
            <input type="hidden" name="offset" id="currentOffset" value="${param.offset != null ? param.offset : 0}">

            <!-- 테이블 헤더 및 필터 영역 -->
            <div class="p-4 border-b border-gray-100 flex flex-col md:flex-row justify-between items-center gap-4">
                <div class="flex gap-2">
                    <button type="button" onclick="changeStatus('정산대기')" class="px-4 py-2 rounded-lg text-sm font-medium ${status == '정산대기' ? 'bg-primary text-white' : 'bg-gray-100 text-gray-600'}">정산대기</button>
                    <button type="button" onclick="changeStatus('정산완료')" class="px-4 py-2 rounded-lg text-sm font-medium ${status == '정산완료' ? 'bg-primary text-white' : 'bg-gray-100 text-gray-600'}">정산완료</button>
                </div>
                
                <div class="flex items-center gap-3 w-full md:w-auto">
                    <!-- 정렬 필터 -->
                    <select name="orderBy" onchange="this.form.submit()" class="border rounded-lg px-3 py-2 text-sm bg-gray-50">
                        <option value="deadline" ${param.orderBy == 'deadline' ? 'selected' : ''}>기한 임박순</option>
                        <option value="amountDesc" ${param.orderBy == 'amountDesc' ? 'selected' : ''}>금액 큰 순</option>
                    </select>
                    <!-- 섹션 내 검색창 -->
                    <div class="relative flex-grow">
                        <input type="text" name="searchKeyword" value="${param.searchKeyword}" placeholder="대상 ID 검색..." class="w-full border rounded-lg pl-4 pr-10 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-primary/20">
                        <button type="submit" class="absolute right-3 top-2.5 text-gray-400">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                        </button>
                    </div>
                </div>
            </div>
        </form>

        <div class="overflow-x-auto">
            <table class="w-full text-left">
                <thead class="bg-gray-50 border-b border-gray-100 text-xs uppercase text-gray-500 font-semibold">
                    <tr>
                        <th class="px-6 py-4">정산 번호</th>
                        <th class="px-6 py-4">대상(ID/유형)</th>
                        <th class="px-6 py-4">정산 기한</th>
                        <th class="px-6 py-4 text-right">총 매출</th>
                        <th class="px-6 py-4 text-right">정산 금액</th>
                        <th class="px-6 py-4 text-center">상태</th>
                        <th class="px-6 py-4 text-center">액션</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-50 text-sm">
                    <c:forEach var="item" items="${data.settlementList}">
                        <tr class="hover:bg-blue-50/30 transition-colors">
                            <td class="px-6 py-4">#${item.settlementNum}</td>
                            <td class="px-6 py-4">
                                <div class="font-medium text-gray-900">${item.targetNum}</div>
                                <div class="text-xs text-gray-400">${item.targetType}</div>
                            </td>
                            <td class="px-6 py-4 text-gray-600">${item.settlementDeadline}</td>
                            <td class="px-6 py-4 text-right font-medium">
                                <fmt:formatNumber value="${item.totalSales}" type="number"/>
                            </td>
                            <td class="px-6 py-4 text-right font-bold text-blue-600">
                                <fmt:formatNumber value="${item.netAmount}" type="number"/>
                            </td>
                            <td class="px-6 py-4 text-center">
                                <span class="inline-flex px-2 py-1 rounded-md text-xs font-semibold ${item.settlementStatus == '정산완료' ? 'bg-green-100 text-green-700' : 'bg-orange-100 text-orange-700'}">
                                    ${item.settlementStatus}
                                </span>
                            </td>
                            <td class="px-6 py-4 text-center">
                                <c:if test="${item.settlementStatus == '정산대기'}">
                                    <button onclick="processSettlement(${item.settlementNum})" class="bg-gray-900 text-white px-3 py-1.5 rounded-lg text-xs hover:bg-black transition-colors">승인</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 페이징 영역 -->
        <div class="p-4 border-t border-gray-100 flex justify-center gap-2">
            <c:set var="limit" value="10"/>
            <c:set var="offset" value="${param.offset != null ? param.offset : 0}"/>
            <button onclick="movePage(${offset - limit})" class="p-2 border rounded-md hover:bg-gray-50 ${offset <= 0 ? 'invisible' : ''}">이전</button>
            <button onclick="movePage(${offset + limit})" class="p-2 border rounded-md hover:bg-gray-50">다음</button>
        </div>
    </div>
</div>
<!-- 매출 상세 내역 Section -->
<div class="bg-white rounded-xl shadow-sm border border-outline-variant/10 overflow-hidden pt-0">
<div class="px-4 lg:px-8 py-6 flex flex-col xl:flex-row items-start xl:items-center justify-between gap-4">
<div class="flex items-center gap-4 flex-1">
<h3 class="text-lg font-bold text-on-surface nowrap">매출 상세 내역</h3>
<div class="relative w-full max-w-xs">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-sm">search</span>
<input class="w-full pl-9 pr-4 py-1.5 bg-surface-container-low border-none rounded-lg text-sm focus:ring-1 focus:ring-primary/20" placeholder="번호, 헬스장, 트레이너 검색" type="text"/>
</div>
</div>
<div class="flex flex-wrap items-center gap-3 w-full xl:w-auto">
<div class="flex items-center gap-1 bg-surface-container-low p-1 rounded-lg">
<button class="px-3 py-1.5 text-xs font-bold bg-white text-primary rounded shadow-sm nowrap">전체 내역</button>
<button class="px-3 py-1.5 text-xs font-semibold text-on-surface-variant hover:text-on-surface transition-colors nowrap">헬스장별 합계보기</button>
<button class="px-3 py-1.5 text-xs font-semibold text-on-surface-variant hover:text-on-surface transition-colors nowrap">트레이너별 합계보기</button>
</div>
</div>
</div>
<div class="overflow-x-auto">
<table class="w-full text-sm text-left border-collapse min-w-[900px]">
<thead class="bg-surface-container-low text-on-surface-variant uppercase text-[11px] font-bold nowrap">
<tr>
<th class="px-4 lg:px-8 py-4">고유번호</th>
<th class="px-4 py-4">결제날짜</th>
<th class="px-4 py-4">헬스장</th>
<th class="px-4 py-4">트레이너</th>
<th class="px-4 py-4 text-right">매출액</th>
<th class="px-4 py-4 text-right">정산비용</th>
<th class="px-4 lg:px-8 py-4 text-right">수수료</th>
</tr>
</thead>
<tbody class="divide-y divide-outline-variant/5">
<tr class="hover:bg-surface/50 transition-colors nowrap">
<td class="px-4 lg:px-8 py-4 text-on-surface-variant font-mono text-[12px]">PF-2024-0012</td>
<td class="px-4 py-4">2024.06.12</td>
<td class="px-4 py-4 font-medium">핏츠버그 압구정본점</td>
<td class="px-4 py-4">김지훈</td>
<td class="px-4 py-4 text-right font-bold">₩ 800,000</td>
<td class="px-4 py-4 text-right text-error/80">₩ 680,000</td>
<td class="px-4 lg:px-8 py-4 text-right font-medium text-primary">₩ 120,000</td>
</tr>
<tr class="hover:bg-surface/50 transition-colors nowrap">
<td class="px-4 lg:px-8 py-4 text-on-surface-variant font-mono text-[12px]">PF-2024-0013</td>
<td class="px-4 py-4">2024.06.12</td>
<td class="px-4 py-4 font-medium">핏츠버그 청담점</td>
<td class="px-4 py-4">이지은</td>
<td class="px-4 py-4 text-right font-bold">₩ 300,000</td>
<td class="px-4 py-4 text-right text-error/80">₩ 255,000</td>
<td class="px-4 lg:px-8 py-4 text-right font-medium text-primary">₩ 45,000</td>
</tr>
</tbody>
<tfoot class="bg-surface-container-high/30 border-t border-outline-variant/20 nowrap">
<tr class="font-bold text-on-surface">
<td class="px-4 lg:px-8 py-5 text-right" colspan="4">합계</td>
<td class="px-4 py-5 text-right text-sm">₩ 1,100,000</td>
<td class="px-4 py-5 text-right text-sm text-error/80">₩ 935,000</td>
<td class="px-4 lg:px-8 py-5 text-right text-2xl text-primary">₩ 165,000</td>
</tr>
</tfoot>
</table>
</div>
</div>
<!-- Payment History Management Section -->
<div class="bg-white rounded-xl shadow-sm border border-outline-variant/10 overflow-hidden">
<div class="px-4 lg:px-8 py-6 flex flex-col xl:flex-row items-start xl:items-center justify-between gap-4">
<h3 class="text-lg font-bold text-on-surface nowrap">결제 내역</h3>
<div class="flex items-center gap-3">
<div class="flex items-center gap-1 bg-surface-container-low p-1 rounded-lg">
<button class="px-3 py-1.5 text-xs font-bold bg-white text-primary rounded shadow-sm nowrap">전체</button>
<button class="px-3 py-1.5 text-xs font-semibold text-on-surface-variant hover:text-on-surface transition-colors nowrap">결제완료</button>
<button class="px-3 py-1.5 text-xs font-semibold text-on-surface-variant hover:text-on-surface transition-colors nowrap">환불요청</button>
<button class="px-3 py-1.5 text-xs font-semibold text-on-surface-variant hover:text-on-surface transition-colors nowrap">환불완료</button>
<button class="px-3 py-1.5 text-xs font-semibold text-on-surface-variant hover:text-on-surface transition-colors nowrap">취소완료</button>
</div>
</div>
</div>
<div class="overflow-x-auto">
<table class="w-full text-sm text-left border-collapse min-w-[900px]">
<thead class="bg-surface-container-low text-on-surface-variant uppercase text-[11px] font-bold nowrap">
<tr>
<th class="px-4 lg:px-8 py-4">고유번호</th>
<th class="px-4 py-4">회원명</th>
<th class="px-4 py-4">결제날짜</th>
<th class="px-4 py-4 text-right">결제금액</th>
<th class="px-4 lg:px-8 py-4">상태</th>
</tr>
</thead>
<tbody class="divide-y divide-outline-variant/5">
<tr class="hover:bg-surface/50 transition-colors nowrap">
<td class="px-4 lg:px-8 py-4 text-on-surface-variant font-mono text-[12px]">PAY-2024-0542</td>
<td class="px-4 py-4">
<div class="flex items-center gap-2">
<div class="w-8 h-8 rounded-full bg-surface-container-high flex items-center justify-center text-[10px] font-bold">강</div>
<span class="font-medium">강하늘</span>
</div>
</td>
<td class="px-4 py-4">2024.06.13</td>
<td class="px-4 py-4 text-right font-bold">₩ 1,200,000</td>
<td class="px-4 lg:px-8 py-4">
<span class="bg-red-100 text-red-700 px-3 py-1 rounded-full text-[11px] font-bold shadow-sm">환불완료</span>
</td>
</tr>
<tr class="hover:bg-surface/50 transition-colors nowrap">
<td class="px-4 lg:px-8 py-4 text-on-surface-variant font-mono text-[12px]">PAY-2024-0540</td>
<td class="px-4 py-4">
<div class="flex items-center gap-2">
<div class="w-8 h-8 rounded-full bg-surface-container-high flex items-center justify-center text-[10px] font-bold">유</div>
<span class="font-medium">유재석</span>
</div>
</td>
<td class="px-4 py-4">2024.06.12</td>
<td class="px-4 py-4 text-right font-bold">₩ 300,000</td>
<td class="px-4 lg:px-8 py-4">
<span class="bg-slate-200 text-slate-700 px-3 py-1 rounded-full text-[11px] font-bold shadow-sm">취소완료</span>
</td>
</tr>
<tr class="hover:bg-surface/50 transition-colors nowrap">
<td class="px-4 lg:px-8 py-4 text-on-surface-variant font-mono text-[12px]">PAY-2024-0539</td>
<td class="px-4 py-4">
<div class="flex items-center gap-2">
<div class="w-8 h-8 rounded-full bg-surface-container-high flex items-center justify-center text-[10px] font-bold">박</div>
<span class="font-medium">박명수</span>
</div>
</td>
<td class="px-4 py-4">2024.06.12</td>
<td class="px-4 py-4 text-right font-bold">₩ 800,000</td>
<td class="px-4 lg:px-8 py-4">
<span class="bg-secondary-container text-on-secondary-container px-3 py-1 rounded-full text-[11px] font-bold">결제완료</span>
</td>
</tr>
<tr class="hover:bg-surface/50 transition-colors nowrap">
<td class="px-4 lg:px-8 py-4 text-on-surface-variant font-mono text-[12px]">PAY-2024-0538</td>
<td class="px-4 py-4">
<div class="flex items-center gap-2">
<div class="w-8 h-8 rounded-full bg-surface-container-high flex items-center justify-center text-[10px] font-bold">하</div>
<span class="font-medium">하동훈</span>
</div>
</td>
<td class="px-4 py-4">2024.06.11</td>
<td class="px-4 py-4 text-right font-bold">₩ 1,200,000</td>
<td class="px-4 lg:px-8 py-4">
<span class="bg-secondary-container text-on-secondary-container px-3 py-1 rounded-full text-[11px] font-bold">결제완료</span>
</td>
</tr>
</tbody>
</table>
</div>
<div class="p-6 border-t border-outline-variant/10 flex justify-center bg-white nowrap">
<div class="flex gap-2">
<button class="w-8 h-8 rounded-lg flex items-center justify-center text-slate-400 hover:bg-slate-100 transition-colors"><span class="material-symbols-outlined text-sm">chevron_left</span></button>
<button class="w-8 h-8 rounded-lg flex items-center justify-center bg-primary text-white text-xs font-bold shadow-sm">1</button>
<button class="w-8 h-8 rounded-lg flex items-center justify-center text-slate-600 text-xs hover:bg-slate-100 font-medium transition-colors">2</button>
<button class="w-8 h-8 rounded-lg flex items-center justify-center text-slate-400 hover:bg-slate-100 transition-colors"><span class="material-symbols-outlined text-sm">chevron_right</span></button>
</div>
</div>
</div>
<!-- Footer Meta -->
<div class="pt-10 border-t border-outline-variant/10 flex flex-col sm:flex-row justify-between items-center gap-4 text-[11px] text-outline nowrap">
<p>© 2024 핏츠버그 Fitness Admin. All rights reserved.</p>
<div class="flex gap-4">
<a class="hover:text-primary" href="#">개인정보처리방침</a>
<a class="hover:text-primary" href="#">이용약관</a>
<a class="hover:text-primary" href="#">시스템 상태</a>
</div>
</div>
</main>
<script>
function refreshAllData() {
    // 1. JSP에 있는 날짜 입력칸의 값들을 가져옴
    const start = document.getElementById('startDate').value; 
    const end = document.getElementById('endDate').value;
    const status = "${status}"; // 기존에 선택되어 있던 탭 상태

    // 2. 현재 서블릿 주소로 파라미터를 붙여서 이동 (새로고침 효과)
    //서블릿 주소가 /admin/sales 이므로:
    location.href = "/admin/sales?startDate=" + start + "&endDate=" + end + "&status=" + status;
}
const ctx = document.getElementById('salesChart').getContext('2d');
new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['총 매출액', '정산 수수료', '순수익'],
        datasets: [{
            label: '금액(원)',
            data: [${data.summary.totalSales}, ${data.summary.totalFee}, ${data.summary.netProfit}],
            backgroundColor: ['#4F46E5', '#EF4444', '#10B981'],
            borderRadius: 8
        }]
    },
    options: {
        responsive: true,
        plugins: { legend: { display: false } },
        scales: { y: { beginAtZero: true, grid: { display: false } } }
    }
});

// 2. 상태 변경 및 페이징 함수
function changeStatus(status) {
    document.getElementById('currentStatus').value = status;
    document.getElementById('currentOffset').value = 0; // 탭 변경 시 첫 페이지로
    document.getElementById('listForm').submit();
}

function movePage(newOffset) {
    document.getElementById('currentOffset').value = newOffset;
    document.getElementById('listForm').submit();
}

// 3. 정산 승인 (기존 doPost 연동)
function processSettlement(id) {
    if(!confirm("해당 건을 정산 완료 처리하시겠습니까?")) return;
    
    const params = new URLSearchParams();
    params.append('action', 'completeSettlement');
    params.append('id', id);

    fetch("${pageContext.request.contextPath}/admin/sales", {
        method: "POST",
        body: params
    })
    .then(res => res.text())
    .then(result => {
        if(result === "success") {
            alert("정산 처리가 완료되었습니다.");
            location.reload();
        } else {
            alert("오류 발생: " + result);
        }
    });
}

</script>
</body></html>