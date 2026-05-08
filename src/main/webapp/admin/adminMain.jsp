<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>핏츠버그 Admin Dashboard</title>
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
                        "surface-tint": "#005ac2",
                        "surface-bright": "#f8f9fb",
                        "secondary-fixed": "#dce2f3",
                        "on-surface": "#191c1e",
                        "surface-dim": "#d9dadc",
                        "on-background": "#191c1e",
                        "primary-fixed-dim": "#adc6ff",
                        "on-secondary-container": "#5e6572",
                        "on-primary-container": "#fefcff",
                        "primary": "#0058be"
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function refresh(){
		$.ajax({
			url: '/admin/mainRefresh',
			type: 'get',
			data: 'json', // 서버로 보내는 데이터
			success: function(result){
				$("#totMember").text(result.totMember.toLocalString());
				$("#newMember").text(result.newMember.toLocalString());
				$("#totTrainer").text(result.totTrainer.toLocalString());
				$("#sales").text(result.sales.toLocalString());
				$("#expenses").text(result.expenses.toLocalString());
				$("#profit").text(result.profit.toLocalString());
				$("#member_auth").text(result.member_auth.toLocalString());
				$("#reportList").text(result.reportList.toLocalString());
				$("#calculateList").text(result.calculateList.toLocalString());
				}, error:function(){
					alert('데이터를 가져오는데 실패했습니다.');
				}
			}
		})
	}
</script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-background text-on-surface">
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
<!-- Main Content -->
<main class="ml-64 pt-16 p-10 min-h-screen">
<div class="max-w-7xl mx-auto space-y-10">
<!-- Headline -->
<div class="flex justify-between items-end">
<div>
<h2 class="text-[1.5rem] font-semibold tracking-tight text-on-surface" style=""><div><br/></div>대시보드</h2>
<p class="text-on-surface-variant text-sm mt-1" style="">오늘의 핵심 비즈니스 지표를 한눈에 확인하세요.</p>
</div>
<div class="flex gap-3">
<button type="button" 
class="px-4 py-2 text-sm font-medium text-on-primary bg-gradient-to-br from-primary to-primary-container rounded-md shadow-sm"
id = "refreshBtn"
onclick="refresh()">
실시간 데이터 갱신</button>
</div>
</div>
<!-- 1. Summary Cards (Kept as is from source) -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
<div class="bg-surface-container-lowest p-8 rounded-lg transition-all border border-transparent hover:border-primary/10">
<div class="flex justify-between items-start">
<span class="material-symbols-outlined text-primary bg-primary-fixed p-3 rounded-lg" style="">
group</span>
<span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-1 rounded" style="">
+12%</span>
</div>
<h3 class="text-[0.75rem] text-on-surface-variant mt-6 uppercase tracking-wider font-medium" style="">
총 회원 수</h3>
<p class="text-[2.75rem] font-bold tracking-tighter text-on-surface mt-1" style=""
id="totMember">
24,582</p>
</div>
<div class="bg-surface-container-lowest p-8 rounded-lg transition-all border border-transparent hover:border-primary/10">
<div class="flex justify-between items-start">
<span class="material-symbols-outlined text-tertiary bg-tertiary-fixed p-3 rounded-lg" style="">
person_add</span>
<span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-1 rounded" style="">
+5.4%</span>
</div>
<h3 class="text-[0.75rem] text-on-surface-variant mt-6 uppercase tracking-wider font-medium" style="">
신규 회원 수(최근 1개월)</h3>
<p class="text-[2.75rem] font-bold tracking-tighter text-on-surface mt-1" style=""
id="newMember">
1,204</p>
</div>
<div class="bg-surface-container-lowest p-8 rounded-lg transition-all border border-transparent hover:border-primary/10">
<div class="flex justify-between items-start">
<span class="material-symbols-outlined text-blue-800 bg-secondary-fixed p-3 rounded-lg" style="">
fitness_center</span>
<span class="text-xs font-bold text-slate-400 bg-slate-50 px-2 py-1 rounded" style="">
Stabilized</span>
</div>
<h3 class="text-[0.75rem] text-on-surface-variant mt-6 uppercase tracking-wider font-medium" style="">
등록  트레이너 수</h3>
<p class="text-[2.75rem] font-bold tracking-tighter text-on-surface mt-1" style=""
id="totTrainer">
148</p>
</div>
</div>
<!-- 2. 수익 현황 분석 (Kept as is from source) -->
<div class="flex flex-col lg:flex-row gap-6">
<!-- Left Side: Key Metrics Labels -->
<div class="lg:w-1/4 flex flex-col justify-between py-2">
<h4 class="text-sm font-semibold mb-4" style="">
수익 현황 분석</h4>
<div class="space-y-6">
<div>
<p class="text-[11px] text-on-surface-variant uppercase tracking-wider font-medium" style="">
총 매출 (Gross Sales)</p>
<p class="text-2xl font-bold text-on-surface" style=""
id="Sales">
₩45,280,000</p>
</div>
<div>
<p class="text-[11px] text-on-surface-variant uppercase tracking-wider font-medium" style="">
운영 비용 (Expenses)</p>
<p class="text-2xl font-bold text-error" style=""
id="expenses">
₩12,400,000</p>
</div>
<div>
<p class="text-[11px] text-on-surface-variant uppercase tracking-wider font-medium" style="">
순이익 (Net Profit)</p>
<p class="text-2xl font-bold text-primary" style=""
id="profit">
₩32,880,000</p>
</div>
</div>
<div class="mt-4">
<span class="text-[10px] text-on-surface-variant" style="">
기준 기간: 최근 6개월</span>
</div>
</div>
<!-- Right Side: 3 Separate Smaller Chart Cards -->
<div class="lg:w-3/4 grid grid-cols-1 md:grid-cols-3 gap-4">
<!-- Card 1: 비용 (Expenses) bar chart -->
<div class="bg-surface-container-lowest p-5 rounded-lg border border-transparent hover:border-primary/10 shadow-sm flex flex-col">
<h5 class="text-xs font-semibold mb-6" style="">
비용 (Expenses)</h5>
<div class="flex-1 flex items-end gap-1.5 h-32 px-1">
<div class="w-full bg-surface-container-high rounded-t" style="height: 40%"></div>
<div class="w-full bg-surface-container-high rounded-t" style="height: 65%"></div>
<div class="w-full bg-error-container/60 rounded-t" style="height: 90%"></div>
<div class="w-full bg-surface-container-high rounded-t" style="height: 45%"></div>
<div class="w-full bg-surface-container-high rounded-t" style="height: 70%"></div>
<div class="w-full bg-surface-container-high rounded-t" style="height: 55%"></div>
</div>
<div class="mt-3 flex justify-between text-[9px] text-on-surface-variant font-medium">
<span class="" style="">1월</span><span class="" style="">2월</span><span class="" style="">3월</span><span class="" style="">4월</span><span class="" style="">5월</span><span class="" style="">6월</span>
</div>
</div>
<!-- Card 2: 수익 (Revenue) bar chart -->
<div class="bg-surface-container-lowest p-5 rounded-lg border border-transparent hover:border-primary/10 shadow-sm flex flex-col">
<h5 class="text-xs font-semibold mb-6" style="">수익 (Revenue)</h5>
<div class="flex-1 flex items-end gap-1.5 h-32 px-1">
<div class="w-full bg-surface-container-high rounded-t" style="height: 60%"></div>
<div class="w-full bg-surface-container-high rounded-t" style="height: 50%"></div>
<div class="w-full bg-primary-fixed rounded-t" style="height: 85%"></div>
<div class="w-full bg-surface-container-high rounded-t" style="height: 75%"></div>
<div class="w-full bg-surface-container-high rounded-t" style="height: 65%"></div>
<div class="w-full bg-surface-container-high rounded-t" style="height: 80%"></div>
</div>
<div class="mt-3 flex justify-between text-[9px] text-on-surface-variant font-medium">
<span class="" style="">1월</span><span class="" style="">2월</span><span class="" style="">3월</span><span class="" style="">4월</span><span class="" style="">5월</span><span class="" style="">6월</span>
</div>
</div>
<!-- Card 3: 총매출액 & 순이익 (Total Sales & Net Profit) combination chart -->
<div class="bg-surface-container-lowest p-5 rounded-lg border border-transparent hover:border-primary/10 shadow-sm flex flex-col relative overflow-hidden">
<div class="flex justify-between items-start mb-6">
<h5 class="text-xs font-semibold leading-tight" style="">총매출액 &amp;<br/>순이익</h5>
<div class="flex flex-col items-end gap-1">
<span class="flex items-center gap-1 text-[8px]" style=""><div class="w-1.5 h-1.5 rounded-full bg-surface-container-high"></div> 매출</span>
<span class="flex items-center gap-1 text-[8px]" style=""><div class="w-1.5 h-1.5 rounded-full bg-primary"></div> 이익</span>
</div>
</div>
<div class="flex-1 relative flex items-end gap-1.5 h-32 px-1">
<!-- Bar chart for Total Sales -->
<div class="w-full bg-surface-container rounded-t" style="height: 70%"></div>
<div class="w-full bg-surface-container rounded-t" style="height: 85%"></div>
<div class="w-full bg-surface-container rounded-t" style="height: 60%"></div>
<div class="w-full bg-surface-container rounded-t" style="height: 95%"></div>
<div class="w-full bg-surface-container rounded-t" style="height: 80%"></div>
<div class="w-full bg-surface-container rounded-t" style="height: 90%"></div>
<!-- Line Chart Overlay -->
<div class="absolute inset-0 flex items-center px-2">
<svg class="w-full h-full" preserveaspectratio="none" viewbox="0 0 100 100">
<path d="M0,80 L20,60 L40,75 L60,40 L80,55 L100,30" fill="none" stroke="#0058be" stroke-width="3"></path>
<circle cx="0" cy="80" fill="#ffffff" r="4" stroke="#0058be" stroke-width="2.5"></circle>
<circle cx="20" cy="60" fill="#ffffff" r="4" stroke="#0058be" stroke-width="2.5"></circle>
<circle cx="40" cy="75" fill="#ffffff" r="4" stroke="#0058be" stroke-width="2.5"></circle>
<circle cx="60" cy="40" fill="#ffffff" r="4" stroke="#0058be" stroke-width="2.5"></circle>
<circle cx="80" cy="55" fill="#ffffff" r="4" stroke="#0058be" stroke-width="2.5"></circle>
<circle cx="100" cy="30" fill="#ffffff" r="4" stroke="#0058be" stroke-width="2.5"></circle>
</svg>
</div>
</div>
<div class="mt-3 flex justify-between text-[9px] text-on-surface-variant font-medium">
<span class="" style="">1월</span><span class="" style="">2월</span><span class="" style="">3월</span><span class="" style="">4월</span><span class="" style="">5월</span><span class="" style="">6월</span>
</div>
</div>
</div>
</div>

<!-- 3. Summary Sections (Updated Layout & Style from SCREEN_14) -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
<!-- Member Summary (회원 관리 요약) -->
<div class="bg-surface-container-low p-6 rounded-lg">
<div class="flex justify-between items-center mb-6">
<h4 class="font-semibold text-sm" style="">회원 관리 요약</h4>
<a class="text-primary text-[11px] font-bold hover:underline" href="#" style="">전체보기</a>
</div>
<div class="bg-surface-container-lowest p-6 rounded-lg text-center shadow-sm">
<p class="text-xs text-on-surface-variant mb-1" style="">
승인 대기 회원</p>
<h3 class="text-4xl font-bold text-primary" style=""
id="authCount">
24</h3>
<button class="mt-4 w-full py-2 bg-primary/10 text-primary text-xs font-bold rounded-lg hover:bg-primary/20 transition-colors" style="">지금 승인하기</button>
</div>
</div>
<!-- Fitness Guide Summary (운동가이드 요약) -->
<div class="bg-surface-container-low p-6 rounded-lg lg:col-span-2">
<div class="flex justify-between items-center mb-6">
<div class="flex items-center gap-2">
<h4 class="font-semibold text-sm" style="">
운동가이드 요약</h4>
<span class="bg-primary text-white text-[10px] px-2 py-0.5 rounded-full" style=""
id="guideCount">
총 158개</span>
</div>
<a class="text-primary text-[11px] font-bold hover:underline" href="#" style="">
전체보기</a>
</div>
<div class="grid grid-cols-1 md:grid-cols-3 gap-4">
<!-- Guide Card 1 -->
<div class="bg-surface-container-lowest rounded-lg overflow-hidden border border-outline-variant/10 group cursor-pointer">
<div class="aspect-video relative overflow-hidden">
<img alt="기초 스쿼트 완벽 가이드" class="w-full h-full object-cover transition-transform group-hover:scale-105" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDQKBftimbOJvOwbvkm_8JmAmlscMzG46buMCaHQ-NRMK_F03S-Jw4875YrMmB6COX17E0_iXW-8JkBB8w0B94pc6Lak51Pgavcl-50N32CjDR2XhpwZskr5YWFSruVEvk39zhUfJZwd10cN1tIH6pZRMscscojIe-WQv55wGaHKu2E_TECstJCZhxRJM5BwdNtMShg-SHnBStIJrBHkXlbgKbNFDAWeK8nS8cPzZ1P6GLfQ8ZOsHsJxeFP7VLzUfa9EsLTKe7hOLk" style=""/>
<div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent flex items-end p-3">
<span class="text-white text-[10px] font-medium flex items-center gap-1" style="">
<span class="material-symbols-outlined text-xs" style="">
visibility</span> 
1.2k
</span>
</div>
</div>
<div class="p-3">
<p class="text-xs font-bold truncate" style="">기초 스쿼트 완벽 가이드</p>
<p class="text-[10px] text-on-surface-variant mt-0.5" style="">2시간 전 등록</p>
</div>
</div>
<!-- Guide Card 2 -->
<div class="bg-surface-container-lowest rounded-lg overflow-hidden border border-outline-variant/10 group cursor-pointer">
<div class="aspect-video relative overflow-hidden">
<img alt="모닝 요가 루틴 15분" class="w-full h-full object-cover transition-transform group-hover:scale-105" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCOg_BoIAu7Vm4oGiyYsQUxI0HWzmPWCvEYP5H4DCOEwyNaPDbHNcqheenJrFg9Y5WYWnrOHZsMyxZ19eYQLjjB6RTE9ijOeKcJ3X5EYzF5dApvaEK901lZoAjAdf9mXfLZkBHW9Ivv22QKMlqveEjZD9PToYbfBWAfuXbbITchf_TlSIaFTurb5Zp3eC357aikHCwzgTRx3OS1JhkN8cUDbfvS7QgO3BDlxC_ek3-HpG0OPPNb0ev6s6fvdDp020aaqJqx7SxwoGA" style=""/>
<div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent flex items-end p-3">
<span class="text-white text-[10px] font-medium flex items-center gap-1" style="">
<span class="material-symbols-outlined text-xs" style="">visibility</span> 856
</span>
</div>
</div>
<div class="p-3">
<p class="text-xs font-bold truncate" style="">모닝 요가 루틴 15분</p>
<p class="text-[10px] text-on-surface-variant mt-0.5" style="">5시간 전 등록</p>
</div>
</div>
<!-- Guide Card 3 -->
<div class="bg-surface-container-lowest rounded-lg overflow-hidden border border-outline-variant/10 group cursor-pointer">
<div class="aspect-video relative overflow-hidden">
<img alt="고강도 인터벌 트레이닝(HIIT)" class="w-full h-full object-cover transition-transform group-hover:scale-105" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBIcSDTQXcBQLfB2biV461g_8hSnIRqjubc4yCBUEjXavCePmSqolk9RTQz02EWuWzs7ACtnWEvOoHpaD6e1aF8C848hmO910RjA985UV2j_KIg4wXLv6Hz2fwX34DZFdy7kEIeoX9fQ41DbaxkYcMXgiM9q-6m6C4N7JgBA-SZo_TqyS8JK9VV4jy-HONsl9VxwUPie2EVLeNX3m43fWtxG-ify0hQyeZNCbDuW2hm_VjxdHgqoTX1AtbKW0uM-3oP6RhRtbM5OCs" style=""/>
<div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent flex items-end p-3">
<span class="text-white text-[10px] font-medium flex items-center gap-1" style="">
<span class="material-symbols-outlined text-xs" style="">visibility</span> 2.4k
</span>
</div>
</div>
<div class="p-3">
<p class="text-xs font-bold truncate" style="">고강도 인터벌 트레이닝(HIIT)</p>
<p class="text-[10px] text-on-surface-variant mt-0.5" style="">어제 등록</p>
</div>
</div>
</div>
</div>
<!-- Report & Inquiry Summary (신고 및 문의 요약) -->
<!-- Report & Inquiry Summary -->
<div class="bg-surface-container-low p-6 rounded-lg">
<div class="flex justify-between items-center mb-6">
<h4 class="font-semibold text-sm" style="">신고 및 문의 요약</h4>
<a class="text-primary text-[11px] font-bold hover:underline" href="#" style="">전체보기</a>
</div>
<div class="bg-surface-container-lowest p-6 rounded-lg text-center shadow-sm">
<p class="text-xs text-on-surface-variant mb-1" style="">
처리 대기</p>
<h3 class="text-4xl font-bold text-error" style=""
id="reportCount">
12건</h3>
<button class="mt-4 w-full py-2 bg-error/10 text-error text-xs font-bold rounded-lg hover:bg-error/20 transition-colors" style="">신고 내역 확인</button>
</div>
</div>
<!-- Settlement Management Summary -->
<div class="bg-surface-container-low p-6 rounded-lg">
<div class="flex justify-between items-center mb-6">
<h4 class="font-semibold text-sm" style="">정산 관리 요약</h4>
<a class="text-primary text-[11px] font-bold hover:underline" href="#" style="">전체보기</a>
</div>
<div class="bg-surface-container-lowest p-6 rounded-lg text-center shadow-sm">
<p class="text-xs text-on-surface-variant mb-1" style="">
정산 대기</p>
<h3 class="text-4xl font-bold text-primary" style=""
id="calculateCount">
12건</h3>
<button class="mt-4 w-full py-2 bg-primary/10 text-primary text-xs font-bold rounded-lg hover:bg-primary/20 transition-colors" style="">정산 처리하기</button>
</div>
</div>
</div>
<!-- Footer Meta -->
<div class="pt-10 border-t border-outline-variant/10 flex justify-between items-center text-[11px] text-outline">
<p class="" style="">© 2024 핏츠버그 Fitness Admin. All rights reserved.</p>
<div class="flex gap-4">
<a class="hover:text-primary" href="#" style="">개인정보처리방침</a>
<a class="hover:text-primary" href="#" style="">이용약관</a>
<a class="hover:text-primary" href="#" style="">시스템 상태</a>
</div>
</div>
</div>
</main>
</body></html>