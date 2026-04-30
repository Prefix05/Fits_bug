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
<button class="px-4 py-2 text-sm font-medium text-on-primary bg-gradient-to-br from-primary to-primary-container rounded-md shadow-sm nowrap">실시간 데이터 갱신</button>
</div>
</div>
<!-- Date Range Picker Section -->
<div class="flex items-center gap-3 bg-surface-container-low p-3 rounded-xl border border-outline-variant/10 w-fit">
<span class="material-symbols-outlined text-on-surface-variant text-sm">calendar_today</span>
<div class="flex items-center gap-2">
<input class="bg-transparent border-none focus:ring-0 text-sm text-on-surface font-medium" type="date" value="2024-01-01"/>
<span class="text-on-surface-variant font-medium">~</span>
<input class="bg-transparent border-none focus:ring-0 text-sm text-on-surface font-medium" type="date" value="2024-06-30"/>
</div>
<button class="ml-2 px-3 py-1.5 bg-white border border-outline-variant/20 rounded-md text-xs font-bold hover:bg-surface-container-highest transition-colors">조회</button>
</div>
<!-- Summary Cards -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
<div class="bg-primary p-6 rounded-lg text-white shadow-lg transition-transform hover:scale-[1.02]">
<div class="flex justify-between items-start mb-4">
<span class="material-symbols-outlined bg-white/20 p-2 rounded-lg">account_balance_wallet</span>
<span class="text-xs font-bold bg-white/20 px-2 py-1 rounded nowrap">+12.5%</span>
</div>
<h3 class="text-xs font-medium opacity-80 uppercase tracking-wider nowrap">총매출 <span class="text-[10px] opacity-70">(최근 1달)</span></h3>
<p class="text-2xl font-bold mt-1 nowrap text-right">₩ 124,500,000</p>
</div>
<div class="bg-surface-container-lowest p-6 rounded-lg border border-outline-variant/10 shadow-sm transition-transform hover:scale-[1.02]">
<div class="flex justify-between items-start mb-4">
<span class="material-symbols-outlined text-tertiary bg-tertiary-fixed p-2 rounded-lg">payments</span>
<span class="text-xs font-bold text-error bg-error-container px-2 py-1 rounded nowrap">+4.1%</span>
</div>
<h3 class="text-xs font-medium text-on-surface-variant uppercase tracking-wider nowrap">정산금 <span class="text-[10px] opacity-60">(최근 1달)</span></h3>
<p class="text-2xl font-bold text-on-surface mt-1 nowrap text-right">₩ 42,300,000</p>
</div>
<div class="bg-surface-container-lowest p-6 rounded-lg border border-outline-variant/10 shadow-sm transition-transform hover:scale-[1.02]">
<div class="flex justify-between items-start mb-4">
<span class="material-symbols-outlined text-primary bg-primary-fixed p-2 rounded-lg">savings</span>
<span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-1 rounded nowrap">+8.2%</span>
</div>
<h3 class="text-xs font-medium text-on-surface-variant uppercase tracking-wider nowrap">수익(수수료) <span class="text-[10px] opacity-60">(최근 1달)</span></h3>
<p class="text-2xl font-bold text-on-surface mt-1 nowrap text-right">₩ 82,200,000</p>
</div>
</div>
<!-- Combined Chart Section -->
<div class="space-y-4">
<h4 class="text-sm font-semibold nowrap">매출 및 수익 추이</h4>
<div class="bg-surface-container-lowest p-6 lg:p-8 rounded-lg border border-outline-variant/10 shadow-sm flex flex-col">
<div class="flex justify-between items-center mb-8">
<h5 class="text-xs font-bold uppercase tracking-widest text-on-surface-variant">월별 통합 지표 (1월 - 6월)</h5>
<div class="flex gap-4">
<div class="flex items-center gap-1.5"><div class="w-3 h-3 rounded-sm bg-primary"></div><span class="text-[10px] font-medium text-on-surface-variant">총매출</span></div>
<div class="flex items-center gap-1.5"><div class="w-3 h-3 rounded-sm bg-error-container"></div><span class="text-[10px] font-medium text-on-surface-variant">정산금</span></div>
<div class="flex items-center gap-1.5"><div class="w-3 h-3 rounded-sm bg-emerald-500"></div><span class="text-[10px] font-medium text-on-surface-variant">수익</span></div>
</div>
</div>
<div class="flex-1 flex items-end justify-between h-64 gap-4 px-2">
<!-- Jan -->
<div class="flex-1 flex flex-col items-center gap-2 group h-full justify-end">
<div class="flex items-end gap-1 w-full justify-center">
<div class="w-4 bg-primary rounded-t shadow-sm" style="height: 60%"></div>
<div class="w-4 bg-error-container rounded-t shadow-sm" style="height: 40%"></div>
<div class="w-4 bg-emerald-500 rounded-t shadow-sm" style="height: 20%"></div>
</div>
<span class="text-[10px] font-bold text-on-surface-variant">1월</span>
</div>
<!-- Feb -->
<div class="flex-1 flex flex-col items-center gap-2 group h-full justify-end">
<div class="flex items-end gap-1 w-full justify-center">
<div class="w-4 bg-primary rounded-t shadow-sm" style="height: 50%"></div>
<div class="w-4 bg-error-container rounded-t shadow-sm" style="height: 35%"></div>
<div class="w-4 bg-emerald-500 rounded-t shadow-sm" style="height: 15%"></div>
</div>
<span class="text-[10px] font-bold text-on-surface-variant">2월</span>
</div>
<!-- Mar -->
<div class="flex-1 flex flex-col items-center gap-2 group h-full justify-end">
<div class="flex items-end gap-1 w-full justify-center">
<div class="w-4 bg-primary rounded-t shadow-sm" style="height: 85%"></div>
<div class="w-4 bg-error-container rounded-t shadow-sm" style="height: 55%"></div>
<div class="w-4 bg-emerald-500 rounded-t shadow-sm" style="height: 30%"></div>
</div>
<span class="text-[10px] font-bold text-on-surface-variant">3월</span>
</div>
<!-- Apr -->
<div class="flex-1 flex flex-col items-center gap-2 group h-full justify-end">
<div class="flex items-end gap-1 w-full justify-center">
<div class="w-4 bg-primary rounded-t shadow-sm" style="height: 75%"></div>
<div class="w-4 bg-error-container rounded-t shadow-sm" style="height: 50%"></div>
<div class="w-4 bg-emerald-500 rounded-t shadow-sm" style="height: 25%"></div>
</div>
<span class="text-[10px] font-bold text-on-surface-variant">4월</span>
</div>
<!-- May -->
<div class="flex-1 flex flex-col items-center gap-2 group h-full justify-end">
<div class="flex items-end gap-1 w-full justify-center">
<div class="w-4 bg-primary rounded-t shadow-sm" style="height: 65%"></div>
<div class="w-4 bg-error-container rounded-t shadow-sm" style="height: 42%"></div>
<div class="w-4 bg-emerald-500 rounded-t shadow-sm" style="height: 23%"></div>
</div>
<span class="text-[10px] font-bold text-on-surface-variant">5월</span>
</div>
<!-- Jun -->
<div class="flex-1 flex flex-col items-center gap-2 group h-full justify-end">
<div class="flex items-end gap-1 w-full justify-center">
<div class="w-4 bg-primary rounded-t shadow-sm" style="height: 90%"></div>
<div class="w-4 bg-error-container rounded-t shadow-sm" style="height: 60%"></div>
<div class="w-4 bg-emerald-500 rounded-t shadow-sm" style="height: 30%"></div>
</div>
<span class="text-[10px] font-bold text-on-surface-variant">6월</span>
</div>
</div>
</div>
</div>
<!-- Settlement Detail Table Section -->
<div class="bg-white rounded-xl shadow-sm border border-outline-variant/10 overflow-hidden">
<div class="px-4 lg:px-8 py-6 flex flex-col md:flex-row justify-between items-start md:items-center gap-4 border-b border-surface-container-low">
<h3 class="text-lg font-semibold nowrap">정산 상세 내역</h3>
<div class="flex gap-2">
<button class="flex items-center gap-1 px-3 py-1.5 bg-surface-container-low hover:bg-surface-container rounded-lg text-xs font-semibold text-on-surface-variant transition-colors nowrap">
<span class="material-symbols-outlined text-sm">schedule</span>
                기한임박순
            </button>
<button class="flex items-center gap-1 px-3 py-1.5 bg-surface-container-low hover:bg-surface-container rounded-lg text-xs font-semibold text-on-surface-variant transition-colors nowrap">
<span class="material-symbols-outlined text-sm">payments</span>
                금액 큰 순
            </button>
</div>
</div>
<div class="px-4 lg:px-8 bg-white flex flex-col md:flex-row items-center justify-between gap-4">
<div class="flex gap-8 border-b-0">
<button class="py-4 text-sm font-medium text-on-surface-variant hover:text-on-surface transition-colors nowrap">정산대기</button>
<button class="py-4 text-sm font-bold text-primary border-b-2 border-primary nowrap">정산완료</button>
</div>
<div class="relative flex-1 md:max-w-xs py-2">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-sm">search</span>
<input class="w-full pl-9 pr-4 py-1.5 bg-surface-container-low border-none rounded-lg text-sm focus:ring-1 focus:ring-primary/20" placeholder="강사명 또는 지점명 검색" type="text"/>
</div>
</div>
<div class="overflow-x-auto">
<table class="w-full text-left border-collapse min-w-[800px]">
<thead>
<tr class="bg-surface-container-low/50 text-on-surface-variant text-xs font-bold uppercase tracking-wider nowrap">
<th class="px-4 lg:px-8 py-4">강사/지점명</th>
<th class="px-4 py-4">정산대상 기간</th>
<th class="px-4 py-4">정산 기한</th>
<th class="px-4 py-4 text-right">정산금액</th>
<th class="px-4 py-4">상태</th>
<th class="px-4 lg:px-8 py-4 text-right">처리하기</th>
</tr>
</thead>
<tbody class="divide-y divide-outline-variant/10">
<tr class="hover:bg-surface/50 transition-colors nowrap">
<td class="px-4 lg:px-8 py-5">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-full bg-surface-container flex items-center justify-center font-bold text-primary shadow-sm shrink-0">H</div>
<div>
<p class="font-semibold text-sm">홍길동 강사</p>
<p class="text-xs text-on-surface-variant">강남 본점</p>
</div>
</div>
</td>
<td class="px-4 py-5 text-sm">2023.09.01 - 2023.09.30</td>
<td class="px-4 py-5 text-sm font-medium">2023.10.05</td>
<td class="px-4 py-5 text-sm font-bold text-right">₩ 4,500,000</td>
<td class="px-4 py-5">
<span class="bg-secondary-container text-on-secondary-container px-3 py-1 rounded-full text-[11px] font-bold shadow-sm">정산완료</span>
</td>
<td class="px-4 lg:px-8 py-5 text-right">
<button class="text-on-surface-variant text-xs font-medium px-4 py-2 rounded-md border border-outline-variant/30 hover:bg-surface-container transition-all nowrap">내역보기</button>
</td>
</tr>
<tr class="hover:bg-surface/50 transition-colors nowrap">
<td class="px-4 lg:px-8 py-5">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-lg bg-surface-container flex items-center justify-center shrink-0">
<span class="material-symbols-outlined text-primary text-lg">store</span>
</div>
<div>
<p class="font-semibold text-sm">청담 지점</p>
<p class="text-xs text-on-surface-variant">지점 매출 정산</p>
</div>
</div>
</td>
<td class="px-4 py-5 text-sm">2023.09.01 - 2023.09.30</td>
<td class="px-4 py-5 text-sm font-medium">2023.10.05</td>
<td class="px-4 py-5 text-sm font-bold text-right">₩ 15,200,000</td>
<td class="px-4 py-5">
<span class="bg-secondary-container text-on-secondary-container px-3 py-1 rounded-full text-[11px] font-bold shadow-sm">정산완료</span>
</td>
<td class="px-4 lg:px-8 py-5 text-right">
<button class="text-on-surface-variant text-xs font-medium px-4 py-2 rounded-md border border-outline-variant/30 hover:bg-surface-container transition-all nowrap">내역보기</button>
</td>
</tr>
<tr class="hover:bg-surface/50 transition-colors nowrap">
<td class="px-4 lg:px-8 py-5">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-full bg-surface-container flex items-center justify-center font-bold text-primary shadow-sm shrink-0">C</div>
<div>
<p class="font-semibold text-sm">최수지 강사</p>
<p class="text-xs text-on-surface-variant">서초 지점</p>
</div>
</div>
</td>
<td class="px-4 py-5 text-sm">2023.09.01 - 2023.09.30</td>
<td class="px-4 py-5 text-sm font-medium">2023.10.05</td>
<td class="px-4 py-5 text-sm font-bold text-right">₩ 2,800,000</td>
<td class="px-4 py-5">
<span class="bg-secondary-container text-on-secondary-container px-3 py-1 rounded-full text-[11px] font-bold shadow-sm">정산완료</span>
</td>
<td class="px-4 lg:px-8 py-5 text-right">
<button class="text-on-surface-variant text-xs font-medium px-4 py-2 rounded-md border border-outline-variant/30 hover:bg-surface-container transition-all nowrap">내역보기</button>
</td>
</tr>
</tbody>
</table>
</div>
<div class="px-4 lg:px-8 py-5 flex items-center justify-between border-t border-surface-container-low bg-surface-container-lowest nowrap">
<span class="text-[11px] text-on-surface-variant font-medium">총 85건 중 1-10건 표시 중</span>
<div class="flex space-x-1">
<button class="p-1.5 hover:bg-surface-container rounded-md transition-colors"><span class="material-symbols-outlined text-sm">chevron_left</span></button>
<button class="px-3 py-1 bg-primary text-white text-xs font-bold rounded-md">1</button>
<button class="px-3 py-1 text-xs font-medium hover:bg-surface-container rounded-md">2</button>
<button class="px-3 py-1 text-xs font-medium hover:bg-surface-container rounded-md">3</button>
<button class="p-1.5 hover:bg-surface-container rounded-md transition-colors"><span class="material-symbols-outlined text-sm">chevron_right</span></button>
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
</div>
</main>
</body></html>