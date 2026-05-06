<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Fitsbug - ${client.name} InBody</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        surface: "#f9f9fe", "surface-bright": "#f9f9fe",
                        "surface-container": "#ededf2", "surface-container-low": "#f3f3f8",
                        "surface-container-high": "#e8e8ed", "surface-container-highest": "#e2e2e7",
                        "surface-container-lowest": "#ffffff", "surface-dim": "#d9dade",
                        "on-surface": "#1a1c1f", "on-surface-variant": "#414755",
                        "outline-variant": "#c1c6d7", outline: "#717786",
                        primary: "#0058bc", "primary-container": "#0070eb",
                        "on-primary": "#ffffff", "on-primary-container": "#fefcff",
                        secondary: "#405e96", "secondary-container": "#a1befd",
                        "on-secondary-container": "#2d4c83",
                        tertiary: "#9e3d00", "tertiary-container": "#c64f00",
                        background: "#f9f9fe", "on-background": "#1a1c1f",
                    },
                    fontFamily: { headline: ["Inter"], body: ["Inter"], label: ["Inter"] },
                    borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" }
                }
            }
        };
    </script>
    <style>
        body { font-family: 'Inter', sans-serif; -webkit-font-smoothing: antialiased; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        .no-scrollbar::-webkit-scrollbar { display: none; }
        .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
    </style>
</head>
<body class="bg-surface text-on-surface min-h-screen">

<!-- Mobile Top Bar -->
<header class="lg:hidden fixed top-0 left-0 right-0 z-30 bg-slate-50 border-b border-slate-200 px-4 py-3 flex items-center justify-between">
    <div class="flex items-center gap-2">
        <div class="w-8 h-8 bg-[#007AFF] rounded-lg flex items-center justify-center">
            <span class="material-symbols-outlined text-white text-lg">exercise</span>
        </div>
        <h1 class="text-lg font-bold text-on-surface">Fitsbug</h1>
    </div>
    <a href="${pageContext.request.contextPath}/trainer/profile" class="p-1 rounded-full">
        <img alt="profile" class="w-8 h-8 rounded-full object-cover"
             src="${not empty sessionScope.loginUser.profileImg ? pageContext.request.contextPath.concat('/uploads/').concat(sessionScope.loginUser.profileImg) : pageContext.request.contextPath.concat('/img/profile_img.jpg')}"/>
    </a>
</header>

<!-- Mobile Bottom Nav -->
<nav class="lg:hidden fixed bottom-0 left-0 right-0 z-30 bg-white border-t border-slate-200 px-2 py-2 flex items-center justify-around">
    <a href="${pageContext.request.contextPath}/trainer/dashboard" class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400">
        <span class="material-symbols-outlined text-[22px]">dashboard</span>
        <span class="text-[10px] font-medium">대시보드</span>
    </a>
    <a href="${pageContext.request.contextPath}/trainer/clients" class="flex flex-col items-center gap-1 px-3 py-1 text-blue-700">
        <span class="material-symbols-outlined text-[22px]" style='font-variation-settings:"FILL" 1;'>group</span>
        <span class="text-[10px] font-bold text-blue-700">회원관리</span>
    </a>
    <a href="${pageContext.request.contextPath}/trainer/calendar" class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400">
        <span class="material-symbols-outlined text-[22px]">calendar_today</span>
        <span class="text-[10px] font-medium">일정</span>
    </a>
    <a href="${pageContext.request.contextPath}/trainer/earnings" class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400">
        <span class="material-symbols-outlined text-[22px]">payments</span>
        <span class="text-[10px] font-medium">수익</span>
    </a>
</nav>

<!-- Sidebar -->
<c:set var="activePage" value="clients" scope="request"/>
<jsp:include page="/trainer/sideNav.jsp"/>

<div class="lg:ml-64 min-h-screen flex flex-col pt-14 pb-20 lg:pt-0 lg:pb-0">

    <!-- Page header with back button -->
    <header class="sticky top-0 w-full z-20 bg-white/90 backdrop-blur border-b border-outline-variant/20 flex items-center px-6 h-14 gap-4">
        <a href="${pageContext.request.contextPath}/trainer/clientDetail?clientId=${client.clientId}"
           class="p-1.5 rounded-lg hover:bg-surface-container transition-colors text-on-surface-variant">
            <span class="material-symbols-outlined text-xl">arrow_back</span>
        </a>
        <h1 class="text-base font-bold text-on-surface">${client.name} — InBody 기록</h1>
    </header>

    <main class="flex-1 p-4 md:p-6 lg:p-8 max-w-5xl mx-auto w-full space-y-6">

        <!-- Client summary strip -->
        <section class="bg-surface-container-lowest rounded-2xl border border-outline-variant/10 shadow-sm p-5 flex items-center gap-5">
            <div class="w-14 h-14 rounded-2xl bg-primary/10 flex items-center justify-center flex-shrink-0">
                <span class="material-symbols-outlined text-primary text-2xl">person</span>
            </div>
            <div class="flex-1">
                <p class="text-lg font-bold text-on-surface">${client.name}</p>
                <p class="text-sm text-on-surface-variant">
                    <c:if test="${client.age > 0}">만 ${client.age}세 &bull; </c:if>
                    <c:if test="${client.height > 0}">${client.height}cm &bull; </c:if>
                    ${recordCount}개 기록
                </p>
            </div>
            <!-- Tab nav -->
            <nav class="hidden md:flex gap-1 p-1.5 bg-surface-container-low rounded-2xl no-scrollbar">
                <a href="${pageContext.request.contextPath}/trainer/clientDetail?clientId=${client.clientId}"
                   class="px-5 py-2 text-xs font-medium text-on-surface-variant hover:text-on-surface rounded-xl transition-colors">Overview</a>
                <a href="${pageContext.request.contextPath}/trainer/meals?clientId=${client.clientId}"
                   class="px-5 py-2 text-xs font-medium text-on-surface-variant hover:text-on-surface rounded-xl transition-colors">Meals</a>
                <span class="px-5 py-2 text-xs font-semibold text-primary bg-surface-container-lowest rounded-xl shadow-sm">InBody</span>
            </nav>
        </section>

        <c:choose>
            <c:when test="${empty inbodyRows}">
                <!-- Empty state -->
                <div class="bg-surface-container-lowest rounded-2xl border border-outline-variant/10 p-16 flex flex-col items-center gap-3 text-center">
                    <span class="material-symbols-outlined text-5xl text-slate-300">monitor_weight</span>
                    <p class="text-base font-bold text-on-surface">InBody 기록이 없습니다</p>
                    <p class="text-sm text-on-surface-variant">회원이 InBody를 측정하면 여기에 표시됩니다.</p>
                </div>
            </c:when>
            <c:otherwise>

                <!-- Summary cards (latest record) -->
                <c:set var="latest" value="${inbodyRows[0]}"/>
                <div class="grid grid-cols-2 md:grid-cols-4 gap-3">

                    <!-- Weight -->
                    <div class="bg-surface-container-lowest rounded-2xl border border-outline-variant/10 p-4 shadow-sm">
                        <p class="text-[10px] font-bold text-primary uppercase tracking-widest mb-1">체중</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-2xl font-bold text-on-surface">${latest.weight}</span>
                            <span class="text-xs text-on-surface-variant">kg</span>
                        </div>
                        <c:if test="${latest.weightDelta != null}">
                            <p class="text-xs mt-1 font-semibold
                               ${latest.weightDelta < 0 ? 'text-blue-600' : (latest.weightDelta > 0 ? 'text-red-500' : 'text-slate-400')}">
                                <c:choose>
                                    <c:when test="${latest.weightDelta < 0}">&#9660; ${latest.weightDelta}kg</c:when>
                                    <c:when test="${latest.weightDelta > 0}">&#9650; +${latest.weightDelta}kg</c:when>
                                    <c:otherwise>&mdash;</c:otherwise>
                                </c:choose>
                            </p>
                        </c:if>
                    </div>

                    <!-- Muscle -->
                    <div class="bg-surface-container-lowest rounded-2xl border border-outline-variant/10 p-4 shadow-sm">
                        <p class="text-[10px] font-bold text-green-700 uppercase tracking-widest mb-1">골격근량</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-2xl font-bold text-on-surface">${latest.muscleMass}</span>
                            <span class="text-xs text-on-surface-variant">kg</span>
                        </div>
                        <c:if test="${latest.muscleDelta != null}">
                            <p class="text-xs mt-1 font-semibold
                               ${latest.muscleDelta > 0 ? 'text-green-600' : (latest.muscleDelta < 0 ? 'text-red-500' : 'text-slate-400')}">
                                <c:choose>
                                    <c:when test="${latest.muscleDelta > 0}">&#9650; +${latest.muscleDelta}kg</c:when>
                                    <c:when test="${latest.muscleDelta < 0}">&#9660; ${latest.muscleDelta}kg</c:when>
                                    <c:otherwise>&mdash;</c:otherwise>
                                </c:choose>
                            </p>
                        </c:if>
                    </div>

                    <!-- Body fat -->
                    <div class="bg-surface-container-lowest rounded-2xl border border-outline-variant/10 p-4 shadow-sm">
                        <p class="text-[10px] font-bold text-orange-600 uppercase tracking-widest mb-1">체지방량</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-2xl font-bold text-on-surface">${latest.bodyFat}</span>
                            <span class="text-xs text-on-surface-variant">kg</span>
                        </div>
                        <c:if test="${latest.fatDelta != null}">
                            <p class="text-xs mt-1 font-semibold
                               ${latest.fatDelta < 0 ? 'text-green-600' : (latest.fatDelta > 0 ? 'text-red-500' : 'text-slate-400')}">
                                <c:choose>
                                    <c:when test="${latest.fatDelta < 0}">&#9660; ${latest.fatDelta}kg</c:when>
                                    <c:when test="${latest.fatDelta > 0}">&#9650; +${latest.fatDelta}kg</c:when>
                                    <c:otherwise>&mdash;</c:otherwise>
                                </c:choose>
                            </p>
                        </c:if>
                    </div>

                    <!-- Body fat % -->
                    <div class="bg-surface-container-lowest rounded-2xl border border-outline-variant/10 p-4 shadow-sm">
                        <p class="text-[10px] font-bold text-slate-500 uppercase tracking-widest mb-1">체지방률</p>
                        <div class="flex items-baseline gap-1">
                            <span class="text-2xl font-bold text-on-surface">${latest.fatPct}</span>
                            <span class="text-xs text-on-surface-variant">%</span>
                        </div>
                        <c:if test="${latest.fatPctDelta != null}">
                            <p class="text-xs mt-1 font-semibold
                               ${latest.fatPctDelta < 0 ? 'text-green-600' : (latest.fatPctDelta > 0 ? 'text-red-500' : 'text-slate-400')}">
                                <c:choose>
                                    <c:when test="${latest.fatPctDelta < 0}">&#9660; ${latest.fatPctDelta}%</c:when>
                                    <c:when test="${latest.fatPctDelta > 0}">&#9650; +${latest.fatPctDelta}%</c:when>
                                    <c:otherwise>&mdash;</c:otherwise>
                                </c:choose>
                            </p>
                        </c:if>
                    </div>
                </div>

                <!-- Trend chart -->
                <c:if test="${recordCount >= 2}">
                <section class="bg-surface-container-lowest rounded-2xl border border-outline-variant/10 shadow-sm p-5">
                    <h3 class="text-sm font-bold text-on-surface mb-4">체성분 변화 추이</h3>
                    <canvas id="inbodyChart" height="80"></canvas>
                </section>
                </c:if>

                <!-- Detail table -->
                <section class="bg-surface-container-lowest rounded-2xl border border-outline-variant/10 shadow-sm overflow-hidden">
                    <div class="px-5 py-4 border-b border-outline-variant/10 flex items-center justify-between">
                        <h3 class="text-sm font-bold text-on-surface">전체 기록</h3>
                        <span class="text-xs text-on-surface-variant">${recordCount}건</span>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm">
                            <thead class="bg-surface-container-low text-on-surface-variant text-xs font-bold uppercase tracking-wider">
                                <tr>
                                    <th class="text-left px-5 py-3">측정일</th>
                                    <th class="text-right px-5 py-3">체중 (kg)</th>
                                    <th class="text-right px-5 py-3">골격근량 (kg)</th>
                                    <th class="text-right px-5 py-3">체지방량 (kg)</th>
                                    <th class="text-right px-5 py-3">체지방률 (%)</th>
                                    <th class="text-center px-5 py-3">이미지</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-outline-variant/10">
                                <c:forEach var="row" items="${inbodyRows}" varStatus="st">
                                    <tr class="hover:bg-surface-container-low transition-colors">

                                        <!-- Date -->
                                        <td class="px-5 py-4 font-semibold text-on-surface whitespace-nowrap">
                                            ${row.recordDate}
                                            <c:if test="${st.first}">
                                                <span class="ml-1.5 px-1.5 py-0.5 bg-primary/10 text-primary text-[9px] font-bold rounded">최신</span>
                                            </c:if>
                                        </td>

                                        <!-- Weight -->
                                        <td class="px-5 py-4 text-right whitespace-nowrap">
                                            <span class="font-semibold text-on-surface">${row.weight}</span>
                                            <c:if test="${row.weightDelta != null}">
                                                <span class="ml-1 text-[10px] font-bold
                                                    ${row.weightDelta < 0 ? 'text-blue-600' : (row.weightDelta > 0 ? 'text-red-500' : 'text-slate-400')}">
                                                    <c:choose>
                                                        <c:when test="${row.weightDelta < 0}">&#9660;${row.weightDelta}</c:when>
                                                        <c:when test="${row.weightDelta > 0}">&#9650;+${row.weightDelta}</c:when>
                                                    </c:choose>
                                                </span>
                                            </c:if>
                                        </td>

                                        <!-- Muscle mass -->
                                        <td class="px-5 py-4 text-right whitespace-nowrap">
                                            <span class="font-semibold text-on-surface">${row.muscleMass}</span>
                                            <c:if test="${row.muscleDelta != null}">
                                                <span class="ml-1 text-[10px] font-bold
                                                    ${row.muscleDelta > 0 ? 'text-green-600' : (row.muscleDelta < 0 ? 'text-red-500' : 'text-slate-400')}">
                                                    <c:choose>
                                                        <c:when test="${row.muscleDelta > 0}">&#9650;+${row.muscleDelta}</c:when>
                                                        <c:when test="${row.muscleDelta < 0}">&#9660;${row.muscleDelta}</c:when>
                                                    </c:choose>
                                                </span>
                                            </c:if>
                                        </td>

                                        <!-- Body fat -->
                                        <td class="px-5 py-4 text-right whitespace-nowrap">
                                            <span class="font-semibold text-on-surface">${row.bodyFat}</span>
                                            <c:if test="${row.fatDelta != null}">
                                                <span class="ml-1 text-[10px] font-bold
                                                    ${row.fatDelta < 0 ? 'text-green-600' : (row.fatDelta > 0 ? 'text-red-500' : 'text-slate-400')}">
                                                    <c:choose>
                                                        <c:when test="${row.fatDelta < 0}">&#9660;${row.fatDelta}</c:when>
                                                        <c:when test="${row.fatDelta > 0}">&#9650;+${row.fatDelta}</c:when>
                                                    </c:choose>
                                                </span>
                                            </c:if>
                                        </td>

                                        <!-- Body fat % -->
                                        <td class="px-5 py-4 text-right whitespace-nowrap">
                                            <span class="font-semibold text-on-surface">${row.fatPct}</span>
                                            <c:if test="${row.fatPctDelta != null}">
                                                <span class="ml-1 text-[10px] font-bold
                                                    ${row.fatPctDelta < 0 ? 'text-green-600' : (row.fatPctDelta > 0 ? 'text-red-500' : 'text-slate-400')}">
                                                    <c:choose>
                                                        <c:when test="${row.fatPctDelta < 0}">&#9660;${row.fatPctDelta}%</c:when>
                                                        <c:when test="${row.fatPctDelta > 0}">&#9650;+${row.fatPctDelta}%</c:when>
                                                    </c:choose>
                                                </span>
                                            </c:if>
                                        </td>

                                        <!-- Image thumbnail -->
                                        <td class="px-5 py-4 text-center whitespace-nowrap">
                                            <c:choose>
                                                <c:when test="${not empty row.img}">
                                                    <a href="${pageContext.request.contextPath}/uploads/${row.img}"
                                                       target="_blank"
                                                       class="inline-flex items-center gap-1 text-xs text-primary font-semibold hover:underline">
                                                        <span class="material-symbols-outlined text-sm">image</span>
                                                        보기
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-xs text-slate-300">—</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>

            </c:otherwise>
        </c:choose>

    </main>
</div>

<script>
<c:if test="${recordCount >= 2}">
// Build chart data from rows (rows are newest-first → reverse for chronological order)
const chartLabels  = [];
const weightData   = [];
const muscleData   = [];
const fatData      = [];

const rows = [
    <c:forEach var="row" items="${inbodyRows}" varStatus="st">
    { date: '${row.recordDate}', weight: ${row.weight}, muscle: ${row.muscleMass}, fat: ${row.bodyFat} }<c:if test="${!st.last}">,</c:if>
    </c:forEach>
];

// Reverse so oldest is on the left
rows.reverse().forEach(r => {
    chartLabels.push(r.date);
    weightData.push(r.weight);
    muscleData.push(r.muscle);
    fatData.push(r.fat);
});

new Chart(document.getElementById('inbodyChart'), {
    type: 'line',
    data: {
        labels: chartLabels,
        datasets: [
            {
                label: '체중 (kg)',
                data: weightData,
                borderColor: '#0058bc',
                backgroundColor: 'rgba(0,88,188,0.08)',
                tension: 0.3,
                pointRadius: 4,
                pointHoverRadius: 6,
                fill: false
            },
            {
                label: '골격근량 (kg)',
                data: muscleData,
                borderColor: '#16a34a',
                backgroundColor: 'rgba(22,163,74,0.08)',
                tension: 0.3,
                pointRadius: 4,
                pointHoverRadius: 6,
                fill: false
            },
            {
                label: '체지방량 (kg)',
                data: fatData,
                borderColor: '#ea580c',
                backgroundColor: 'rgba(234,88,12,0.08)',
                tension: 0.3,
                pointRadius: 4,
                pointHoverRadius: 6,
                fill: false
            }
        ]
    },
    options: {
        responsive: true,
        interaction: { mode: 'index', intersect: false },
        plugins: {
            legend: { position: 'bottom', labels: { font: { size: 11 }, usePointStyle: true, boxWidth: 8 } }
        },
        scales: {
            x: { ticks: { font: { size: 11 } }, grid: { color: '#f0f0f5' } },
            y: {
                beginAtZero: false,
                ticks: { font: { size: 11 }, callback: v => v + ' kg' },
                grid: { color: '#f0f0f5' }
            }
        }
    }
});
</c:if>
</script>

</body>
</html>
