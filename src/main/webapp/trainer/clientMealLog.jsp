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
        <a href="./profile.html" class="p-1 rounded-full hover:ring-2 hover:ring-primary/30 transition-all">
            <img alt="연진호" class="w-8 h-8 rounded-full object-cover"
                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuBmLhyuu6rdbT8CspzqySgGADnPxyIZWQ8JzIVzEVHSPkB3UoDOAnZJJhZ7cPpcvRt9El0mEpCGTPo-ipH8tmcW9-1VJX9uPfKjuW6-wnQk8l60TyYJuHFUx-ER7gH9tCPui0ZcXDuvH0okvDCPmNyngCwbTzX130D_1k-cU7r_UYLYwjc9G4FkGvBrwYIPVBudS3XRg5OfUza5BbOyu2mmJQa8uPxFR30YuJ6RWgfoV5POhIwmfRnsUouAZZYhCreQjA-1_7aGakeQ"/>
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
<aside
        class="fixed left-0 top-0 h-full w-64 bg-slate-50 dark:bg-slate-900 transition-colors duration-200 z-20 flex-col p-6 hidden lg:flex">
    <a href="" class="flex items-center gap-3 mb-10">
        <div class="w-10 h-10 bg-[#007AFF] rounded-xl flex items-center justify-center shrink-0">
            <span class="material-symbols-outlined text-white text-2xl" data-icon="" style="">exercise</span>
        </div>
        <h1 class="text-2xl font-bold tracking-tight text-on-surface" style="">Fitsbug</h1>
    </a>
    <nav class="flex-1 space-y-1" id="main-nav">

        <!-- 공통 nav item -->

        <!-- 내주변 -->
        <div class="relative">
            <!-- Parent toggle -->
            <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg cursor-pointer select-none"
               onclick="
                            this.parentElement.querySelector('.dropdown').classList.toggle('hidden');
                            this.querySelector('.chevron').classList.toggle('rotate-180');
                        " href="#">
                <span class="material-symbols-outlined">distance</span>
                내주변
                <span class="material-symbols-outlined ml-auto transition-transform duration-200 chevron"
                      style="font-size:18px">expand_more</span>
            </a>

            <!-- Dropdown children -->
            <div class="dropdown hidden flex-col pl-4">
                <!-- 헬스장 -->
                <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
                   href="#">
                    <span class="material-symbols-outlined" data-icon="">fitness_center</span>
                    헬스장
                </a>
                <!-- 트레이너 -->
                <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
                   href="#">
                    <span class="material-symbols-outlined" data-icon="">person</span>
                    트레이너
                </a>
            </div>
        </div>

        <!-- 트레이너  nav item-->

        <!-- 대시보드 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="${pageContext.request.contextPath}/dashboard" style="">
            <span class="material-symbols-outlined" data-icon="" style="">dashboard</span>
            대시보드
        </a>

        <!-- 회원관리 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-blue-700 border-r-4 border-blue-700 bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="" style="">
            <span class="material-symbols-outlined" data-icon="" style="">group</span>
            회원관리
        </a>

        <!-- 일정 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/calendar.html" style="">
            <span class="material-symbols-outlined" data-icon="" style="">calendar_today</span>
            일정
        </a>

        <!-- 메시지 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/messages.html" style="">
            <span class="material-symbols-outlined" data-icon="" style="">chat</span>
            메시지
        </a>

        <!-- 수익 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="earnings.html" style="">
            <span class="material-symbols-outlined" data-icon="" style="">payments</span>
            수익
        </a>
    </nav>

    <!-- 공통 nav item -->
    <div class="mt-auto pt-6 border-slate-200 dark:border-slate-800 space-y-1">
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">settings</span>
            설정</a>
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">help</span> 고객
            지원</a>
        <div class="border-t border-slate-200 dark:border-slate-800 my-2"></div>
    </div>


    <!-- 마이프로필 nav item -->
    <a href="./profile.html"
       class=" flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg">
        <img alt="Alex Fischer" class="w-10 h-10 rounded-full object-cover shrink-0"
             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBmLhyuu6rdbT8CspzqySgGADnPxyIZWQ8JzIVzEVHSPkB3UoDOAnZJJhZ7cPpcvRt9El0mEpCGTPo-ipH8tmcW9-1VJX9uPfKjuW6-wnQk8l60TyYJuHFUx-ER7gH9tCPui0ZcXDuvH0okvDCPmNyngCwbTzX130D_1k-cU7r_UYLYwjc9G4FkGvBrwYIPVBudS3XRg5OfUza5BbOyu2mmJQa8uPxFR30YuJ6RWgfoV5POhIwmfRnsUouAZZYhCreQjA-1_7aGakeQ"
             style=""/>
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-on-surface truncate" style="">연진호</p>
            <p class="text-xs text-slate-500 truncate" style="">마이프로필</p>
        </div>
    </a>
</aside>

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
            <button class="hover:opacity-70 transition-opacity active:scale-95 duration-150 text-blue-700">
                <span class="material-symbols-outlined">arrow_back</span>
            </button>
            <h1 class="font-sans tracking-tight text-lg font-semibold text-on-surface">회원상세</h1>
        </div>
    </header>
    <main class="pt-4 pb-28 lg:pt-4 lg:pb-8 px-4 max-w-lg mx-auto space-y-6 md:max-w-4xl md:px-8">

        <!-- Summary Card: Bento Style -->
        <section class="bg-surface-container-lowest rounded-xl p-6 shadow-[0_4px_24px_rgba(0,88,188,0.04)]">
            <div class="flex items-end justify-between mb-2">
                <p class="text-on-surface-variant font-label text-[10px] uppercase tracking-widest font-bold">Weekly Performance</p>
            </div>
            <div class="grid gap-4 pt-2 grid-cols-2 md:grid-cols-4">
                <div class="space-y-1">
                    <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Calories</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-2xl font-bold text-on-surface tracking-tighter">${avgCal}</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">kcal</span>
                    </div>
                </div>
                <div class="space-y-1">
                    <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Protein</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-2xl font-bold text-on-surface tracking-tighter">${avgProt}</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">g</span>
                    </div>
                </div>
                <div class="space-y-1">
                    <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Carbs</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-2xl font-bold text-on-surface tracking-tighter">${avgCarbs}</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">g</span>
                    </div>
                </div>
                <div class="space-y-1">
                    <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Fats</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-2xl font-bold text-on-surface tracking-tighter">${avgFat}</span>
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
                    <a href="?weekOffset=${weekOffset - 1}"
                       class="p-1 rounded-lg hover:bg-slate-100 text-on-surface-variant">
                        <span class="material-symbols-outlined text-[18px]">chevron_left</span>
                    </a>
                    <span class="text-[11px] font-medium text-on-surface-variant" id="weekLabel"></span>
                    <a href="?weekOffset=${weekOffset + 1}"
                       class="p-1 rounded-lg hover:bg-slate-100 text-on-surface-variant
                      ${weekOffset >= 0 ? 'pointer-events-none opacity-30' : ''}">
                        <span class="material-symbols-outlined text-[18px]">chevron_right</span>
                    </a>
                </div>
            </div>
            <div>
                <canvas id="myChart"></canvas>
            </div>
        </section>

        <!-- Meal Log Section -->
        <section class="space-y-6">
            <div class="flex items-center justify-between px-1">
                <h3 class="text-on-surface font-semibold text-base">Today's Meals</h3>
                <span class="text-on-surface-variant text-[12px] font-medium">May 24, Friday</span>
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
                            <p class="text-[11px] text-on-surface-variant mt-1 line-clamp-1">${meal.description}</p>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Compute Mon–Sun labels from weekOffset passed by servlet
    const weekOffset = ${weekOffset};

    function getMondayOfWeek(date) {
        const d = new Date(date);
        const day = d.getDay();
        const diff = (day === 0 ? -6 : 1 - day);
        d.setDate(d.getDate() + diff);
        return d;
    }

    const today = new Date();
    today.setDate(today.getDate() + weekOffset * 7);
    const monday = getMondayOfWeek(today);
    const sunday = new Date(monday);
    sunday.setDate(sunday.getDate() + 6);

    // Display "Apr 28 – May 4" label
    const fmt = d => d.toLocaleDateString('ko-KR', { month: 'short', day: 'numeric' });
    document.getElementById('weekLabel').textContent = fmt(monday) + ' – ' + fmt(sunday);

    // Build x-axis labels: "월 4/28", "화 4/29" ...
    const dayNames = ['월', '화', '수', '목', '금', '토', '일'];
    const labels = Array.from({ length: 7 }, (_, i) => {
        const d = new Date(monday);
        d.setDate(d.getDate() + i);
        return dayNames[i] + ' ' + (d.getMonth()+1) + '/' + d.getDate();
    });

    // Pull real data from JSTL into JS
    // Each entry: { date: "2026-04-28", calories: 2100 }
    const mealData = {};
    <c:forEach var="meal" items="${meals}">
    if (!mealData['${meal.mealDate}']) mealData['${meal.mealDate}'] = 0;
    mealData['${meal.mealDate}'] += ${meal.calories};
    </c:forEach>

    // Map each day label to its calorie total (0 if no data)
    const calData = Array.from({ length: 7 }, (_, i) => {
        const d = new Date(monday);
        d.setDate(d.getDate() + i);
        const key = d.toISOString().slice(0, 10); // "2026-04-28"
        return mealData[key] || 0;
    });

    new Chart(document.getElementById('myChart'), {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{ label: 'kcal', data: calData, borderWidth: 1 }]
        },
        options: { scales: { y: { beginAtZero: true } } }
    });
</script>
</body>
</html>
