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

<c:set var="currentViewType" value="${empty param.viewType ? 'all' : param.viewType}" />
<c:set var="currentStatus" value="${empty param.status ? '전체' : param.status}" />

<body class="bg-background text-on-surface">
<!-- SideNavBar Shell -->
<div class="flex">
<jsp:include page="sidebar.jsp"></jsp:include>
</div>
<!-- Main Content -->
<main class="ml-64 min-h-screen">
    <div class="pt-10 px-10 pb-10">
        
        <!-- Headline -->
        <div class="flex justify-between items-end mb-8">
            <div>
                <h2 class="text-2xl font-bold tracking-tight">매출 및 결제 관리</h2>
                <p class="text-gray-500 text-sm mt-1">플랫폼 전체의 매출내역과 결제내역을 세부적으로 확인합니다.</p>
            </div>
        </div>

        <!-- Search & Filter Form -->
        <form id="searchForm" action="${pageContext.request.contextPath}/admin/sales" method="get" class="bg-white p-5 rounded-xl shadow-sm border border-gray-100 flex flex-wrap items-center gap-4 mb-8">
    <div class="flex items-center gap-2">
        <input type="date" name="startDate" value="${startDate}" class="border-gray-200 rounded-lg text-sm focus:ring-primary">
        <span class="text-gray-400">~</span>
        <input type="date" name="endDate" value="${endDate}" class="border-gray-200 rounded-lg text-sm focus:ring-primary">
    </div>
    <div class="relative flex-1 min-w-[200px]">
        <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-lg">search</span>
        <input type="text" name="searchKeyword" value="${param.searchKeyword}" placeholder="회원명, 헬스장 검색..." 
               class="w-full pl-10 pr-4 py-2 border-gray-200 rounded-lg text-sm focus:ring-primary">
    </div>
    <button type="submit" class="bg-primary text-white px-6 py-2 rounded-lg font-medium hover:bg-blue-600 transition-colors">조회</button>
    <button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/sales'" 
            class="bg-gray-100 text-gray-600 px-4 py-2 rounded-lg font-medium hover:bg-gray-200 transition-colors">초기화</button>
    
    <!-- 필터 상태 유지를 위한 Hidden 필드들 -->
    <input type="hidden" name="status" value="${status}">
	<input type="hidden" name="viewType" value="${param.viewType}">
</form>

        <!-- Summary Cards (정산 테이블 상단 디자인 적용) -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
                <p class="text-sm font-medium text-gray-500">총 매출액</p>
                <p class="text-2xl font-bold text-gray-900 mt-2">
                    ₩<fmt:formatNumber value="${data.summary.totalSales}" pattern="#,###"/>
                </p>
            </div>
            <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
                <p class="text-sm font-medium text-gray-500">플랫폼 수수료</p>
                <p class="text-2xl font-bold text-red-500 mt-2">
                    ₩<fmt:formatNumber value="${data.summary.totalFee}" pattern="#,###"/>
                </p>
            </div>
            <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
                <p class="text-sm font-medium text-gray-500">순수익</p>
                <p class="text-2xl font-bold text-blue-600 mt-2">
                    ₩<fmt:formatNumber value="${data.summary.netProfit}" pattern="#,###"/>
                </p>
            </div>
        </div>

<!-- 매출 상세 내역 (데이터 테이블) -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden mb-8">
    <div class="px-6 py-5 border-b border-gray-50 flex justify-between items-center">
        <h3 class="text-lg font-bold text-gray-800">매출 내역</h3>
        <div class="flex items-center gap-1 bg-gray-100 p-1 rounded-lg">
                    <%-- [변경 포인트 2] 선언된 변수(currentViewType)로 단순 비교 --%>
                    <button onclick="changeViewType('all')" class="px-4 py-1.5 text-xs font-bold ${currentViewType == 'all' ? 'bg-white shadow-sm text-primary' : 'text-gray-500'} rounded-md transition-all">전체 내역</button>
                    <button onclick="changeViewType('gym')" class="px-4 py-1.5 text-xs font-bold ${currentViewType == 'gym' ? 'bg-white shadow-sm text-primary' : 'text-gray-500'} rounded-md transition-all">헬스장별</button>
                    <button onclick="changeViewType('trainer')" class="px-4 py-1.5 text-xs font-bold ${currentViewType == 'trainer' ? 'bg-white shadow-sm text-primary' : 'text-gray-500'} rounded-md transition-all">트레이너별</button>
        </div>
    </div>
    <div class="overflow-x-auto">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 text-gray-500 uppercase text-[11px] font-bold">
                <tr>
                    <th class="px-6 py-4">거래번호</th>
                    <th class="px-6 py-4">날짜</th>
                    <th class="px-6 py-4">지점명</th>
                    <th class="px-6 py-4">담당 트레이너</th>
                    <th class="px-6 py-4 text-right">매출액</th>
                    <th class="px-6 py-4 text-right">정산금</th>
                    <th class="px-6 py-4 text-right">수수료</th>
                </tr>
            </thead>
            <tbody id="salesTableBody" class="divide-y divide-gray-50">
                <c:if test="${not empty data.details}">
                    <c:forEach var="item" items="${data.details}">
                    <tr class="hover:bg-gray-50/50 transition-colors">
                        <!-- viewType이 'all'일 때만 ID와 날짜 출력, 나머지는 '-' 표시 -->
                        <td class="px-6 py-4 font-mono text-xs text-gray-400">${not empty item.salesId ? item.salesId : '-'}</td>
                        <td class="px-6 py-4 text-gray-600">${not empty item.payDate ? item.payDate : '-'}</td>
                        <td class="px-6 py-4 font-medium text-gray-900">${item.gymName}</td>
                        <td class="px-6 py-4 text-gray-700">${not empty item.trainerName ? item.trainerName : '전체'}</td>
                        <td class="px-6 py-4 text-right font-bold text-gray-900">₩<fmt:formatNumber value="${item.payAmount}" pattern="#,###"/></td>
                        <td class="px-6 py-4 text-right text-red-400">₩<fmt:formatNumber value="${item.settlementAmount}" pattern="#,###"/></td>
                        <td class="px-6 py-4 text-right font-semibold text-primary">₩<fmt:formatNumber value="${item.fee}" pattern="#,###"/></td>
                    </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty data.details}">
                    <tr>
                        <td colspan="7" class="px-6 py-20 text-center text-gray-400">조회된 매출 내역이 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
            <!-- 합계 영역: data.summary 객체와 연결 -->
            <tfoot id="salesTableFoot" class="bg-white border-t-2 border-gray-50">
                <tr class="font-bold text-gray-900">
                    <td colspan="4" class="px-6 py-8 text-right text-lg">합계</td>
                    <td class="px-6 py-8 text-right text-lg">₩ <fmt:formatNumber value="${data.summary.totalSales}" pattern="#,###"/></td>
                    <td class="px-6 py-8 text-right text-lg text-red-400">₩ <fmt:formatNumber value="${data.summary.totalSettlement}" pattern="#,###"/></td>
                    <td class="px-6 py-8 text-right text-2xl text-primary">₩ <fmt:formatNumber value="${data.summary.totalFee}" pattern="#,###"/></td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>

<!-- 결제 내역 (하단 섹션) -->
<div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
    <!-- 헤더: 제목 및 필터 버튼 -->
    <div class="px-6 py-5 border-b border-gray-50 flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <h3 class="text-lg font-bold text-gray-800">결제 내역</h3>
        <div class="flex items-center gap-1 bg-gray-100 p-1 rounded-lg">
                    <%-- [변경 포인트 3] 선언된 변수(currentStatus)로 단순 비교 --%>
                    <button onclick="changeStatus('전체')" class="px-4 py-1.5 text-xs font-bold ${currentStatus == '전체' ? 'bg-white shadow-sm text-primary' : 'text-gray-500'} rounded-md transition-all">전체</button>
                    <button onclick="changeStatus('결제완료')" class="px-4 py-1.5 text-xs font-bold ${currentStatus == '결제완료' ? 'bg-white shadow-sm text-primary' : 'text-gray-500'} rounded-md transition-all">결제완료</button>
                    <button onclick="changeStatus('환불요청')" class="px-4 py-1.5 text-xs font-bold ${currentStatus == '환불요청' ? 'bg-white shadow-sm text-primary' : 'text-gray-500'} rounded-md transition-all">환불요청</button>
                    <button onclick="changeStatus('환불완료')" class="px-4 py-1.5 text-xs font-bold ${currentStatus == '환불완료' ? 'bg-white shadow-sm text-primary' : 'text-gray-500'} rounded-md transition-all">환불완료</button>
        </div>
    </div>

  <!-- 테이블 영역 -->
    <div class="overflow-x-auto">
        <table class="w-full text-sm text-left border-collapse">
            <thead class="bg-gray-50/50 text-gray-400 uppercase text-[11px] font-bold">
                <tr>
                    <th class="px-8 py-4">고유번호</th>
                    <th class="px-6 py-4">회원명</th>
                    <th class="px-6 py-4 text-center">결제날짜</th>
                    <th class="px-6 py-4 text-right">결제금액</th>
                    <th class="px-8 py-4 text-center">상태</th>
                </tr>
            </thead>
            <tbody id="paymentTableBody" class="divide-y divide-gray-50">
                <c:if test="${not empty data.payments}">
                    <c:forEach var="pay" items="${data.payments}">
                    <tr class="hover:bg-gray-50/30 transition-colors">
                        <td class="px-8 py-5 font-mono text-[11px] text-gray-400">${pay.payId}</td>
                        <td class="px-6 py-5">
                            <div class="flex items-center gap-3">
                                <div class="w-8 h-8 rounded-full bg-blue-50 border border-blue-100 flex items-center justify-center text-[11px] font-bold text-primary">
                                    ${not empty pay.memberName ? pay.memberName.substring(0,1) : '?'}
                                </div>
                                <span class="font-semibold text-gray-700">${pay.memberName}</span>
                            </div>
                        </td>
                        <td class="px-6 py-5 text-center text-gray-600">${pay.payDate}</td>
                        <td class="px-6 py-5 text-right font-bold text-gray-900">
                            ₩ <fmt:formatNumber value="${pay.amount}" pattern="#,###"/>
                        </td>
                        <td class="px-8 py-5 text-center">
                            <!-- 상태별 색상 매핑 보정 -->
                            <c:choose>
                                <c:when test="${pay.status == '결제완료'}">
                                    <span class="bg-blue-50 text-blue-600 px-3 py-1 rounded-full text-[11px] font-bold border border-blue-100">결제완료</span>
                                </c:when>
                                <c:when test="${pay.status == '환불완료' || pay.status == '환불요청'}">
                                    <span class="bg-red-50 text-red-600 px-3 py-1 rounded-full text-[11px] font-bold border border-red-100">${pay.status}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="bg-gray-100 text-gray-500 px-3 py-1 rounded-full text-[11px] font-bold">${pay.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty data.payments}">
                    <tr>
                        <td colspan="5" class="px-6 py-20 text-center text-gray-400">조회된 결제 내역이 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

    <!-- 페이징 처리 (사진 하단과 동일하게) -->
    <div class="px-8 py-6 border-t border-gray-50 flex justify-center">
        <div class="flex items-center gap-2">
            <button class="w-8 h-8 rounded-lg flex items-center justify-center text-gray-400 hover:bg-gray-100 transition-colors">
                <span class="material-symbols-outlined text-sm">chevron_left</span>
            </button>
            <button class="w-8 h-8 rounded-lg flex items-center justify-center bg-primary text-white text-xs font-bold shadow-sm">1</button>
            <button class="w-8 h-8 rounded-lg flex items-center justify-center text-gray-500 text-xs font-medium hover:bg-gray-100 transition-colors">2</button>
            <button class="w-8 h-8 rounded-lg flex items-center justify-center text-gray-400 hover:bg-gray-100 transition-colors">
                <span class="material-symbols-outlined text-sm">chevron_right</span>
            </button>
        </div>
    </div>
</div>
</main>
<script>
//공통 데이터 요청 함수
async function refreshData() {
    const form = document.getElementById('searchForm');
    const formData = new FormData(form);
    const queryString = new URLSearchParams(formData).toString();
    
    try {
        // 서버에 비동기 요청 (현재 페이지 URL + 파라미터)
        const response = await fetch(`${form.action}?${queryString}`, {
            headers: { 'X-Requested-With': 'XMLHttpRequest' }
        });
        
        if (!response.ok) throw new Error('네트워크 응답 에러');
        
        const htmlText = await response.text();
        const parser = new DOMParser();
        const doc = parser.parseFromString(htmlText, 'text/html');

        // 1. 매출 내역 교체
        document.getElementById('salesTableBody').innerHTML = doc.getElementById('salesTableBody').innerHTML;
        document.getElementById('salesTableFoot').innerHTML = doc.getElementById('salesTableFoot').innerHTML;
        
        // 2. 결제 내역 교체
        document.getElementById('paymentTableBody').innerHTML = doc.getElementById('paymentTableBody').innerHTML;
        
        // 3. (필요 시) 상단 요약 카드 데이터도 교체 가능
        // document.querySelector('.grid-cols-3').innerHTML = doc.querySelector('.grid-cols-3').innerHTML;

        // 4. URL 업데이트 (새로고침 시 현재 필터 유지용, 실제 페이지 이동은 없음)
        history.pushState(null, '', `?${queryString}`);
        
        // 5. 버튼 활성화 스타일 업데이트
        updateButtonStyles(queryString);

    } catch (error) {
        console.error('데이터 로드 실패:', error);
        alert('데이터를 불러오는 중 오류가 발생했습니다.');
    }
}

// 매출 필터 변경
function changeViewType(type) {
    let viewInput = document.querySelector('input[name="viewType"]');
    viewInput.value = type;
    refreshData(); // 비동기 요청 호출
}

// 결제 상태 변경
function changeStatus(status) {
    let statusInput = document.querySelector('input[name="status"]');
    statusInput.value = status;
    refreshData(); // 비동기 요청 호출
}

// 버튼 스타일 업데이트 (선택된 버튼 강조)
function updateButtonStyles(queryString) {
    const params = new URLSearchParams(queryString);
    const viewType = params.get('viewType') || 'all';
    const status = params.get('status') || '전체';

    // 매출 필터 버튼 스타일 변경
    const viewButtons = document.querySelectorAll('button[onclick^="changeViewType"]');
    viewButtons.forEach(btn => {
        if (btn.getAttribute('onclick').includes(viewType)) {
            btn.className = "px-4 py-1.5 text-xs font-bold bg-white shadow-sm text-primary rounded-md transition-all";
        } else {
            btn.className = "px-4 py-1.5 text-xs font-bold text-gray-500 rounded-md transition-all";
        }
    });

    // 결제 상태 버튼 스타일 변경
    const statusButtons = document.querySelectorAll('button[onclick^="changeStatus"]');
    statusButtons.forEach(btn => {
        if (btn.getAttribute('onclick').includes(status)) {
            btn.className = "px-4 py-1.5 text-xs font-bold bg-white shadow-sm text-primary rounded-md transition-all";
        } else {
            btn.className = "px-4 py-1.5 text-xs font-bold text-gray-500 rounded-md transition-all";
        }
    });
}

// "조회" 버튼 클릭 시 기본 제출 막고 비동기 처리
document.getElementById('searchForm').addEventListener('submit', function(e) {
    e.preventDefault();
    refreshData();
});

function movePage(newOffset) {
    document.getElementById('currentOffset').value = newOffset;
    document.getElementById('listForm').submit();
}


</script>
</body></html>