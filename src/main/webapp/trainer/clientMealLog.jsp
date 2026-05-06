<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/28/26
  Time: 1:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0, viewport-fit=cover" name="viewport"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&amp;display=swap" rel="stylesheet"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script
            id="tailwind-config">tailwind.config = {
        darkMode: "class", theme: {
            extend: {
                colors: {
                    "surface-container": "#ededf2",
                    "surface-dim": "#d9dade",
                    "on-tertiary-fixed": "#351000",
                    "on-error": "#ffffff",
                    "on-surface-variant": "#414755",
                    "inverse-surface": "#2e3034",
                    error: "#ba1a1a",
                    "secondary-fixed": "#d8e2ff",
                    "on-tertiary-container": "#fffbff",
                    "on-primary-fixed-variant": "#004493",
                    "surface-container-low": "#f3f3f8",
                    "outline-variant": "#c1c6d7",
                    "tertiary-fixed": "#ffdbcc",
                    "primary-fixed-dim": "#adc6ff",
                    "on-secondary": "#ffffff",
                    "surface-tint": "#005bc1",
                    "error-container": "#ffdad6",
                    outline: "#717786",
                    "on-primary": "#ffffff",
                    "secondary-container": "#a1befd",
                    "on-secondary-container": "#2d4c83",
                    "tertiary-fixed-dim": "#ffb595",
                    "on-error-container": "#93000a",
                    background: "#f9f9fe",
                    "primary-container": "#0070eb",
                    "on-surface": "#1a1c1f",
                    secondary: "#405e96",
                    tertiary: "#9e3d00",
                    "surface-container-lowest": "#ffffff",
                    "on-primary-fixed": "#001a41",
                    "on-secondary-fixed": "#001a41",
                    "surface-bright": "#f9f9fe",
                    "on-primary-container": "#fefcff",
                    "on-tertiary": "#ffffff",
                    "inverse-on-surface": "#f0f0f5",
                    "on-tertiary-fixed-variant": "#7c2e00",
                    "secondary-fixed-dim": "#adc6ff",
                    "surface-container-high": "#e8e8ed",
                    surface: "#f9f9fe",
                    "surface-container-highest": "#e2e2e7",
                    "tertiary-container": "#c64f00",
                    "inverse-primary": "#adc6ff",
                    "primary-fixed": "#d8e2ff",
                    "on-secondary-fixed-variant": "#26467d",
                    primary: "#0058bc",
                    "on-background": "#1a1c1f",
                    "surface-variant": "#e2e2e7"
                },
                fontFamily: {headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter"},
                borderRadius: {DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem"}
            }
        }
    };</script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            display: inline-block;
            line-height: 1;
            text-transform: none;
            letter-spacing: normal;
            word-wrap: normal;
            white-space: nowrap;
            direction: ltr;
        }

        body {
            font-family: 'Inter', sans-serif;
            -webkit-font-smoothing: antialiased;
        }

        .glass-nav {
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
        }

        .hide-scrollbar::-webkit-scrollbar {
            display: none;
        }

        .hide-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
    </style>
</head>

<body class="bg-surface text-on-surface">
<input type="hidden" id="clientId" value="${clientId}">
<!-- Mobile Top Bar -->
<header
        class="lg:hidden fixed top-0 left-0 right-0 z-30 bg-slate-50 border-b border-slate-200 px-4 py-3 flex items-center justify-between">
    <div class="flex items-center gap-2">
        <div class="w-8 h-8 bg-[#007AFF] rounded-lg flex items-center justify-center">
            <span class="material-symbols-outlined text-white text-lg">exercise</span>
        </div>
        <h1 class="text-lg font-bold text-on-surface">Fitsbug</h1>
    </div>
    <div class="flex items-center gap-1">
        <button class="p-2 rounded-lg hover:bg-slate-200">
            <span class="material-symbols-outlined">notifications</span>
        </button>
        <a href="${pageContext.request.contextPath}/trainer/profile" class="p-1 rounded-full hover:ring-2 hover:ring-primary/30 transition-all">
            <img alt="연진호" class="w-8 h-8 rounded-full object-cover"
                 src="${not empty sessionScope.loginUser.profileImg ? pageContext.request.contextPath.concat('/uploads/').concat(sessionScope.loginUser.profileImg) : pageContext.request.contextPath.concat('/img/profile_img.jpg')}"/>
        </a>
    </div>
</header>

<!-- Mobile Bottom Nav -->
<nav
        class="lg:hidden fixed bottom-0 left-0 right-0 z-30 bg-white border-t border-slate-200 px-2 py-2 flex items-center justify-around">
    <a href="#" class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">distance</span>
        <span class="text-[10px] font-medium">내주변</span>
    </a>
    <a href="${pageContext.request.contextPath}/dashboard"
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]" style='font-variation-settings: "FILL" 1;'>dashboard</span>
        <span class="text-[10px] font-medium">대시보드</span>
    </a>
    <a href=""
       class="flex flex-col items-center gap-1 px-3 py-1 text-blue-700 transition-colors">
        <span class="material-symbols-outlined text-[22px]">group</span>
        <span class="text-[10px] font-bold text-blue-700">화원관리</span>
    </a>
    <a href=""
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">calendar_today</span>
        <span class="text-[10px] font-medium">일정</span>
    </a>
    <a href=""
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">chat</span>
        <span class="text-[10px] font-medium">메시지</span>
    </a>
    <a href=""
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">payments</span>
        <span class="text-[10px] font-medium">수익</span>
    </a>
</nav>

<!-- SideNavBar -->
<c:set var="activePage" value="clients" scope="request"/>
<jsp:include page="/trainer/sideNav.jsp"/>


<div class="lg:ml-64">
    <!-- TopAppBar -->
    <%--    <header class="fixed top-0 w-full lg:w-[calc(100%-16rem)] z-50 bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl flex items-center justify-between px-6 h-16 border-b border-outline-variant/10">--%>
    <%--        <div class="flex items-center gap-4">--%>
    <%--            <button--%>
    <%--                    class="flex items-center gap-1 text-primary active:scale-95 transition-transform hover:opacity-80">--%>
    <%--                <span class="material-symbols-outlined" data-icon="arrow_back">arrow_back</span>--%>
    <%--                <span class="text-sm font-semibold">Back</span>--%>
    <%--            </button>--%>
    <%--            <h1--%>
    <%--                    class="text-on-surface font-headline text-lg font-bold tracking-tight border-l border-outline-variant/30 pl-4">--%>
    <%--                Diet Log</h1>--%>
    <%--        </div>--%>
    <%--        <button class="text-on-surface-variant hover:text-primary active:scale-95 transition-transform">--%>
    <%--            <span class="material-symbols-outlined" data-icon="tune">tune</span>--%>
    <%--        </button>--%>
    <%--    </header>--%>

    <header
            class="sticky top-0 w-full z-40 bg-white/80 backdrop-blur-xl border-b border-outline-variant/20 flex justify-between items-center px-8 h-16">
        <div class="flex items-center gap-4">
            <a href="${pageContext.request.contextPath}/trainer/clientDetail?clientId=${clientId}"
               class="hover:opacity-70 transition-opacity active:scale-95 duration-150 text-blue-700">
                <span class="material-symbols-outlined">arrow_back</span>
            </a>
            <h1 class="font-sans tracking-tight text-lg font-semibold text-on-surface">회원상세</h1>
        </div>
    </header>
    <main class="pt-4 pb-28 lg:pt-4 lg:pb-8 px-4 max-w-lg mx-auto space-y-6 md:max-w-4xl md:px-8">

        <!-- Summary Card: Bento Style -->
        <section class="bg-surface-container-lowest rounded-xl p-6 ...">
            <div class="flex items-end justify-between mb-2">
                <p id="perfLabel"
                   class="text-on-surface-variant font-label text-[10px] uppercase tracking-widest font-bold">
                    Weekly Performance
                </p>
                <span id="perfDate" class="text-[10px] text-on-surface-variant font-medium"></span>
            </div>
            <div class="grid gap-4 pt-2 grid-cols-2 md:grid-cols-4">
                <div class="space-y-1">
                    <span id="labelCal"
                          class="text-on-surface-variant font-label text-[10px] font-medium">Avg Calories</span>
                    <div class="flex items-baseline gap-1">
                        <span id="valCal" class="text-2xl font-bold text-on-surface tracking-tighter">${avgCal}</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">kcal</span>
                    </div>
                </div>
                <div class="space-y-1">
                    <span id="labelProt"
                          class="text-on-surface-variant font-label text-[10px] font-medium">Avg Protein</span>
                    <div class="flex items-baseline gap-1">
                        <span id="valProt" class="text-2xl font-bold text-on-surface tracking-tighter">${avgProt}</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">g</span>
                    </div>
                </div>
                <div class="space-y-1">
                    <span id="labelCarbs"
                          class="text-on-surface-variant font-label text-[10px] font-medium">Avg Carbs</span>
                    <div class="flex items-baseline gap-1">
                        <span id="valCarbs"
                              class="text-2xl font-bold text-on-surface tracking-tighter">${avgCarbs}</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">g</span>
                    </div>
                </div>
                <div class="space-y-1">
                    <span id="labelFat"
                          class="text-on-surface-variant font-label text-[10px] font-medium">Avg Fats</span>
                    <div class="flex items-baseline gap-1">
                        <span id="valFat" class="text-2xl font-bold text-on-surface tracking-tighter">${avgFat}</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">g</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- Trends Card (Bar Graph) -->
        <section class="bg-surface-container-lowest rounded-xl p-6 ...">
            <div class="flex items-center justify-between mb-6">
                <h3 class="text-on-surface font-semibold text-base">칼로리 섭취량</h3>
                <!-- week nav -->
                <div class="flex items-center gap-2">
                    <button onclick="changeWeek(-1)" class="p-1 rounded-lg hover:bg-slate-100 text-on-surface-variant">
                        <span class="material-symbols-outlined text-[18px]">chevron_left</span>
                    </button>
                    <span class="text-[11px] font-medium text-on-surface-variant" id="weekLabel"></span>
                    <button id="btnNext" onclick="changeWeek(1)" class="p-1 rounded-lg hover:bg-slate-100 text-on-surface-variant">
                        <span class="material-symbols-outlined text-[18px]">chevron_right</span>
                    </button>
                </div>
            </div>
            <div>
                <canvas id="myChart"></canvas>
            </div>
        </section>

        <!-- Meal Log Section -->
        <section id="mealList" class="space-y-6">
            <div class="flex items-center justify-between px-1">
                <h3 class="text-on-surface font-semibold text-base">Meals</h3>
                <span class="text-on-surface-variant text-[12px] font-medium">${selectedDate}</span>
            </div>

            <c:forEach var="meal" items="${meals}" varStatus="status">

                <%-- Meal type divider label --%>
                <c:if test="${status.index == 0}">
                    <div class="flex items-center gap-3">
                <span class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">
                    아침
                </span>
                        <div class="h-px bg-outline-variant/30 flex-1"></div>
                    </div>
                </c:if>
                <c:if test="${status.index == 1}">
                    <div class="flex items-center gap-3">
                <span class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">
                    점심
                </span>
                        <div class="h-px bg-outline-variant/30 flex-1"></div>
                    </div>
                </c:if>
                <c:if test="${status.index == 2}">
                    <div class="flex items-center gap-3">
                <span class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">
                    저녁
                </span>
                        <div class="h-px bg-outline-variant/30 flex-1"></div>
                    </div>
                </c:if>

                <%-- Meal Card --%>
                <div class="bg-surface-container-lowest rounded-2xl overflow-hidden flex shadow-[0_4px_24px_rgba(0,88,188,0.06)] border border-outline-variant/10 hover:shadow-[0_8px_32px_rgba(0,88,188,0.10)] transition-shadow">

                        <%-- Food image --%>
                    <div class="w-28 h-32 flex-shrink-0">
                        <img src="${meal.imageUrl}" alt="${meal.mealName}"
                             class="w-full h-full object-cover"/>
                    </div>

                        <%-- Content --%>
                    <div class="p-4 flex-grow flex flex-col justify-between min-w-0">

                            <%-- Top row: name + time --%>
                        <div>
                            <div class="flex justify-between items-start gap-2">
                                <h4 class="font-bold text-on-surface text-sm leading-snug truncate">${meal.mealName}</h4>
                                <span class="text-[10px] font-medium text-on-surface-variant whitespace-nowrap shrink-0">${meal.mealTime}</span>
                            </div>
                            <p class="text-[11px] text-on-surface-variant mt-1 line-clamp-1">${meal.mealType}</p>
                        </div>

                            <%-- Bottom row: macros --%>
                        <div class="flex flex-wrap gap-x-3 gap-y-1 mt-2">
                            <div class="flex items-center gap-1">
                                <span class="text-xs font-bold text-on-surface">${meal.calories}</span>
                                <span class="text-[10px] text-on-surface-variant">kcal</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-outline-variant/30 pl-3">
                                <span class="text-xs font-bold text-primary">${meal.protein}</span>
                                <span class="text-[10px] text-on-surface-variant">단백질</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-outline-variant/30 pl-3">
                                <span class="text-xs font-bold text-orange-500">${meal.carbs}</span>
                                <span class="text-[10px] text-on-surface-variant">탄수화물</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-outline-variant/30 pl-3">
                                <span class="text-xs font-bold text-amber-500">${meal.fat}</span>
                                <span class="text-[10px] text-on-surface-variant">지방</span>
                            </div>
                        </div>

                    </div>
                </div>

            </c:forEach>
        </section>

        <!-- Daily Trainer Comment Card -->
        <section
                class="bg-surface-container-lowest rounded-xl p-6 shadow-[0_4px_24px_rgba(0,88,188,0.04)] space-y-4">
            <div class="flex flex-col">
                <h3 class="text-on-surface font-semibold text-lg">Daily Trainer Comment</h3>
                <p class="text-sm text-on-surface-variant">May 24, Friday</p>
            </div>
            <div class="relative">
                    <textarea
                            class="w-full bg-surface-container-low border-none rounded-xl p-4 text-sm focus:ring-2 focus:ring-primary/20 min-h-[120px] resize-none"
                            placeholder="Write your feedback for the day..."></textarea>
            </div>
            <div class="flex justify-end">
                <button
                        class="bg-primary text-white px-6 py-2.5 rounded-full font-bold text-sm shadow-lg active:scale-95 transition-transform">
                    Post Comment
                </button>
            </div>
        </section>
    </main>
</div>

<%-- Load Chart.js first, then our external file --%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${pageContext.request.contextPath}/static/js/clientMealLog.js"></script>
<script>
    // Variables that need server-side values — JSP handles these
    let currentWeekOffset = ${weekOffset};
    let currentSelectedDate = '';
    const contextPath = '${pageContext.request.contextPath}';

    // Seed initial chart data from JSTL (avoids an extra AJAX call on first load)
    const initialMealData = {};
    <c:forEach var="meal" items="${weekMeals}">
    if (!initialMealData['${meal.mealDate}']) initialMealData['${meal.mealDate}'] = 0;
    initialMealData['${meal.mealDate}'] += ${meal.calories};
    </c:forEach>

    // Boot the chart
    const initialBarDates = buildWeekDates(currentWeekOffset);
    const initialCalData = initialBarDates.map(function(date) {
        return initialMealData[date] || 0;
    });

    updateWeekLabel(currentWeekOffset);

    const myChart = new Chart(document.getElementById('myChart'), {
        type: 'bar',
        data: {
            labels: buildLabels(initialBarDates),
            datasets: [{
                label: 'kcal',
                data: initialCalData,
                backgroundColor: 'rgba(0, 88, 188, 0.85)',
                borderWidth: 0,
                borderRadius: 4
            }]
        },
        options: {
            scales: {y: {beginAtZero: true}},
            onClick: function(event, elements) {
                if (elements.length === 0) {
                    loadData(currentWeekOffset, null);
                } else {
                    const clickedDate = myChart.data.datasets[0]._barDates[elements[0].index];
                    loadData(currentWeekOffset, clickedDate);
                }
            },
            onHover: function(event, elements) {
                event.native.target.style.cursor = elements.length > 0 ? 'pointer' : 'default';
            }
        }
    });

    myChart.data.datasets[0]._barDates = initialBarDates;
</script>