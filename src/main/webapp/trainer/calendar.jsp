<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/28/26
  Time: 1:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Fitzberg - Trainer Calendar</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;1000;600;700;800&amp;display=swap"
          rel="stylesheet" />
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet" />
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet" />
    <script
            id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "inverse-surface": "#2e3034", "surface-dim": "#d9dade", outline: "#717786", error: "#ba1a1a", "tertiary-fixed": "#ffdbcc", "inverse-on-surface": "#f0f0f5", "surface-bright": "#f9f9fe", "primary-fixed": "#d8e2ff", "on-surface-variant": "#414755", "on-secondary-fixed": "#001a41", "surface-container-highest": "#e2e2e7", primary: "#0058bc", "on-secondary": "#ffffff", "primary-container": "#0070eb", secondary: "#405e96", "on-tertiary-fixed": "#351000", "on-primary": "#ffffff", "on-surface": "#1a1c1f", "inverse-primary": "#adc6ff", "on-tertiary-container": "#fffbff", "tertiary-fixed-dim": "#ffb595", "surface-container": "#ededf2", "on-primary-container": "#fefcff", "on-primary-fixed": "#001a41", "on-error-container": "#93000a", "surface-container-lowest": "#ffffff", "on-tertiary": "#ffffff", "error-container": "#ffdad6", "surface-container-low": "#f3f3f8", background: "#f9f9fe", "tertiary-container": "#c64f00", "secondary-fixed-dim": "#adc6ff", "on-secondary-container": "#2d4c83", "on-error": "#ffffff", "primary-fixed-dim": "#adc6ff", "on-secondary-fixed-variant": "#26467d", tertiary: "#9e3d00", "surface-container-high": "#e8e8ed", "outline-variant": "#c1c6d7", "on-background": "#1a1c1f", "secondary-fixed": "#d8e2ff", "on-tertiary-fixed-variant": "#7c2e00", "surface-variant": "#e2e2e7", "secondary-container": "#a1befd", "surface-tint": "#005bc1", "on-primary-fixed-variant": "#004493", surface: "#f9f9fe" }, borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" }, fontFamily: { headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter" } } } };</script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .calendar-grid {
            display: grid;
            grid-template-columns: 80px repeat(7, 1fr);
        }

        .desktop-calendar-scroll {
            scrollbar-gutter: stable;
        }

        .desktop-grid-header {
            padding-right: var(--desktop-scrollbar-width, 0px);
        }

        .time-row {
            height: 80px;
        }

        .scrollbar-hide::-webkit-scrollbar {
            display: none;
        }
    </style>
</head>

<body class="bg-background text-on-surface antialiased overflow-hidden">

<!-- Mobile Top Bar (mobile only) -->
<header
        class="md:hidden fixed top-0 left-0 right-0 z-30 bg-slate-50 border-b border-slate-200 px-4 py-3 flex items-center justify-between">
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
                 src="${not empty sessionScope.loginUser.profileImg ? pageContext.request.contextPath.concat('/trainer/profile-img/').concat(sessionScope.loginUser.profileImg) : pageContext.request.contextPath.concat('/img/profile_img.jpg')}" />
        </a>
    </div>
</header>

<!-- Mobile Bottom Nav -->
<nav
        class="lg:hidden fixed bottom-0 left-0 right-0 z-30 bg-white border-t border-slate-200 px-2 py-2 flex items-center justify-around">
    <a href="#"
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">distance</span>
        <span class="text-[10px] font-medium">내주변</span>
    </a>
    <a href="/dashboard.html" class="flex flex-col items-center gap-1 px-3 py-1 text-blue-700 transition-colors">
            <span class="material-symbols-outlined text-[22px]"
                  style='font-variation-settings: "FILL" 1;'>dashboard</span>
        <span class="text-[10px] font-bold text-blue-700">대시보드</span>
    </a>
    <a href="${pageContext.request.contextPath}/trainer/clients"
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">group</span>
        <span class="text-[10px] font-medium">회원관리</span>
    </a>
    <a href="/calendar.html"
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">calendar_today</span>
        <span class="text-[10px] font-medium">일정</span>
    </a>
    <a href="/messages.html"
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">chat</span>
        <span class="text-[10px] font-medium">메시지</span>
    </a>
    <a href="/earnings.html"
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">payments</span>
        <span class="text-[10px] font-medium">수익</span>
    </a>
</nav>

<!-- Sidebar Shell -->
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
           href="/dashboard.html" style=""><span class="material-symbols-outlined" data-icon=""
                                                 style="">dashboard</span>
            대시보드</a>

        <!-- 회원관리 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200"
           href="${pageContext.request.contextPath}/trainer/clients" style=""><span class="material-symbols-outlined" data-icon="" style="">group</span>
            회원
            관리</a>

        <!-- 일정 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-blue-700 border-r-4 border-blue-700 bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">calendar_today</span>
            일정</a>

        <!-- 메시지 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/messages.html" style=""><span class="material-symbols-outlined" data-icon="" style="">chat</span>
            메시지</a>

        <!-- 수익 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/earnings.html" style=""><span class="material-symbols-outlined" data-icon=""
                                                style="">payments</span>
            수익</a>
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
             src="${not empty sessionScope.loginUser.profileImg ? pageContext.request.contextPath.concat('/trainer/profile-img/').concat(sessionScope.loginUser.profileImg) : pageContext.request.contextPath.concat('/img/profile_img.jpg')}"
             style="" />
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-on-surface truncate" style="">연진호</p>
            <p class="text-xs text-slate-500 truncate" style="">마이프로필</p>
        </div>
    </a>
</aside>

<!-- Main Content Canvas -->
<main class="lg:ml-64 flex flex-col h-screen bg-white">
    <!-- MOBILE CALENDAR (hidden on md+) -->
    <div class="md:hidden flex-1 overflow-y-auto bg-white pb-20">
        <div style="padding:16px 16px 8px">
            <div class="md:hidden flex-1 overflow-y-auto bg-white pb-20" id="mobile-calendar">
                <div style="padding:16px 16px 8px; font-family:'Inter',sans-serif;">

                    <!-- Month Header -->
                    <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:12px">
                        <button onclick="changeMonth(-1)"
                                style="background:none;border:none;cursor:pointer;padding:4px 8px;color:#0058bc;font-size:20px;line-height:1;">‹</button>
                        <span id="month-label" style="font-size:16px;font-weight:600;color:#1a1c1f;"></span>
                        <button onclick="changeMonth(1)"
                                style="background:none;border:none;cursor:pointer;padding:4px 8px;color:#0058bc;font-size:20px;line-height:1;">›</button>
                    </div>

                    <!-- Day of Week Headers -->
                    <div
                            style="display:grid;grid-template-columns:repeat(7,1fr);text-align:center;margin-bottom:6px;">
                        <div style="font-size:11px;color:#717786;padding:2px 0;">일</div>
                        <div style="font-size:11px;color:#717786;padding:2px 0;">월</div>
                        <div style="font-size:11px;color:#717786;padding:2px 0;">화</div>
                        <div style="font-size:11px;color:#717786;padding:2px 0;">수</div>
                        <div style="font-size:11px;color:#717786;padding:2px 0;">목</div>
                        <div style="font-size:11px;color:#717786;padding:2px 0;">금</div>
                        <div style="font-size:11px;color:#717786;padding:2px 0;">토</div>
                    </div>

                    <!-- Calendar Grid -->
                    <div id="cal-grid"
                         style="display:grid;grid-template-columns:repeat(7,1fr);text-align:center;gap:2px;"></div>
                </div>

                <!-- Day Schedule -->
                <div style="border-top:1px solid #e2e2e7;padding:12px 16px 16px;">
                    <div id="day-label" style="font-size:13px;font-weight:600;color:#717786;margin-bottom:10px;">
                    </div>
                    <div id="events-list" style="display:flex;flex-direction:column;gap:8px;"></div>
                </div>
            </div>

            <script>
                const sessions = {
                    "2026-04-18": [
                        { time: "09:00", name: "김민수", type: "컨디셔닝", color: "#0058bc", light: "#dbeafe" },
                        { time: "11:00", name: "박지수", type: "다이어트", color: "#0f6e56", light: "#d1fae5" },
                        { time: "15:00", name: "이강호", type: "근력", color: "#534ab7", light: "#ede9fe" },
                    ],
                    "2026-04-19": [
                        { time: "10:00", name: "홍길동", type: "요가", color: "#993c1d", light: "#ffedd5" },
                        { time: "14:00", name: "송민아", type: "파워리프팅", color: "#0058bc", light: "#dbeafe" },
                    ],
                    "2026-04-21": [
                        { time: "08:00", name: "허준호", type: "유산소", color: "#0f6e56", light: "#d1fae5" },
                        { time: "16:00", name: "정수빈", type: "요가 테라피", color: "#534ab7", light: "#ede9fe" },
                        { time: "18:00", name: "강동원", type: "필라테스", color: "#993c1d", light: "#ffedd5" },
                    ],
                    "2026-04-22": [
                        { time: "13:00", name: "김영희", type: "근력", color: "#0058bc", light: "#dbeafe" },
                    ],
                    "2026-04-24": [
                        { time: "09:00", name: "이동건", type: "컨디셔닝", color: "#0f6e56", light: "#d1fae5" },
                        { time: "11:30", name: "박준호", type: "다이어트", color: "#534ab7", light: "#ede9fe" },
                    ],
                    "2026-04-25": [
                        { time: "15:00", name: "최민준", type: "근력", color: "#0058bc", light: "#dbeafe" },
                    ],
                };

                let currentYear = 2026;
                let currentMonth = 3;
                let selectedDay = 18;

                const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
                const today = { y: 2026, m: 3, d: 18 };
                const dayNames = ["일", "월", "화", "수", "목", "금", "토"];

                function pad(n) { return n < 10 ? '0' + n : n; }
                function dateKey(y, m, d) { return y + '-' + pad(m + 1) + '-' + pad(d); }

                function changeMonth(dir) {
                    currentMonth += dir;
                    if (currentMonth > 11) { currentMonth = 0; currentYear++; }
                    if (currentMonth < 0) { currentMonth = 11; currentYear--; }
                    selectedDay = 1;
                    renderCalendar();
                }

                function selectDay(d) {
                    selectedDay = d;
                    renderCalendar();
                }

                function renderCalendar() {
                    document.getElementById('month-label').textContent = currentYear + '년 ' + monthNames[currentMonth];

                    const firstDay = new Date(currentYear, currentMonth, 1).getDay();
                    const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();
                    const grid = document.getElementById('cal-grid');
                    grid.innerHTML = '';

                    for (let i = 0; i < firstDay; i++) {
                        const empty = document.createElement('div');
                        empty.style.height = '36px';
                        grid.appendChild(empty);
                    }

                    for (let d = 1; d <= daysInMonth; d++) {
                        const key = dateKey(currentYear, currentMonth, d);
                        const hasSessions = sessions[key] && sessions[key].length > 0;
                        const isToday = currentYear === today.y && currentMonth === today.m && d === today.d;
                        const isSelected = d === selectedDay;

                        const cell = document.createElement('div');
                        cell.style.cssText = 'height:36px;display:flex;flex-direction:column;align-items:center;justify-content:center;cursor:pointer;';

                        const num = document.createElement('span');
                        num.textContent = d;
                        num.style.cssText = 'font-size:14px;width:30px;height:30px;display:flex;align-items:center;justify-content:center;border-radius:50%;';

                        if (isSelected && isToday) {
                            num.style.background = '#0058bc';
                            num.style.color = '#ffffff';
                            num.style.fontWeight = '600';
                        } else if (isSelected) {
                            num.style.background = '#ededf2';
                            num.style.color = '#1a1c1f';
                            num.style.fontWeight = '600';
                        } else if (isToday) {
                            num.style.color = '#0058bc';
                            num.style.fontWeight = '600';
                        } else {
                            num.style.color = '#1a1c1f';
                        }

                        cell.appendChild(num);

                        if (hasSessions) {
                            const dot = document.createElement('div');
                            dot.style.cssText = 'width:4px;height:4px;border-radius:50%;background:#0058bc;margin-top:1px;';
                            cell.appendChild(dot);
                        }

                        cell.onclick = () => selectDay(d);
                        grid.appendChild(cell);
                    }

                    // Render day events
                    const key = dateKey(currentYear, currentMonth, selectedDay);
                    const dayEvents = sessions[key] || [];
                    const dow = new Date(currentYear, currentMonth, selectedDay).getDay();
                    document.getElementById('day-label').textContent = (currentMonth + 1) + '월 ' + selectedDay + '일 ' + dayNames[dow] + '요일';

                    const el = document.getElementById('events-list');
                    el.innerHTML = '';

                    if (dayEvents.length === 0) {
                        el.innerHTML = '<div style="text-align:center;padding:32px 0;color:#717786;font-size:13px;">예약된 세션이 없습니다</div>';
                        return;
                    }

                    dayEvents.forEach(ev => {
                        const card = document.createElement('div');
                        card.style.cssText = 'display:flex;align-items:center;gap:10px;padding:12px;border-radius:12px;background:' + ev.light + ';cursor:pointer;';

                        const bar = document.createElement('div');
                        bar.style.cssText = 'width:3px;height:40px;border-radius:2px;background:' + ev.color + ';flex-shrink:0;';

                        const info = document.createElement('div');
                        info.style.cssText = 'flex:1;';
                        info.innerHTML = '<div style="font-size:14px;font-weight:600;color:' + ev.color + ';">' + ev.name + '</div>' +
                            '<div style="font-size:12px;color:' + ev.color + ';opacity:0.75;margin-top:2px;">' + ev.type + '</div>';

                        const time = document.createElement('div');
                        time.style.cssText = 'font-size:13px;font-weight:600;color:' + ev.color + ';flex-shrink:0;';
                        time.textContent = ev.time;

                        card.appendChild(bar);
                        card.appendChild(info);
                        card.appendChild(time);
                        el.appendChild(card);
                    });
                }

                renderCalendar();
            </script>
        </div>
    </div>

    <!-- DESKTOP CALENDAR (shown on md+) -->
    <div class="hidden md:flex md:flex-col md:flex-1 md:overflow-hidden">
        <!-- DESKTOP CALENDAR HEADER -->
        <header class="sticky top-0 z-40 flex items-center h-16 px-8 bg-white border-b border-gray-200">
            <!-- Left -->
            <div class="flex items-center gap-2 flex-1">
                <div class="hidden sm:flex items-center bg-surface-container-low rounded-lg p-1">
                    <button
                            class="px-3 py-1.5 text-xs font-medium text-outline hover:text-on-surface transition-colors">Day</button>
                    <button
                            class="px-3 py-1.5 text-xs font-semibold bg-white shadow-sm rounded-md text-primary">Week</button>
                    <button
                            class="px-3 py-1.5 text-xs font-medium text-outline hover:text-on-surface transition-colors">Month</button>
                </div>
            </div>
            <!-- Center -->
            <div class="flex items-center gap-1">
                <button class="p-1 hover:bg-surface-container-low rounded-full transition-colors">
                    <span class="material-symbols-outlined text-xl">chevron_left</span>
                </button>
                <span class="text-sm font-bold text-on-surface w-28 text-center">Oct 23 – Oct 29</span>
                <button class="p-1 hover:bg-surface-container-low rounded-full transition-colors">
                    <span class="material-symbols-outlined text-xl">chevron_right</span>
                </button>
            </div>
            <!-- Right -->
            <div class="flex items-center gap-2 flex-1 justify-end">
                <button
                        class="text-xs font-bold text-primary hover:bg-primary-fixed/30 px-3 py-1.5 rounded transition-colors">Today</button>
            </div>
        </header>

        <!-- Sticky Grid Header -->
        <div class="desktop-grid-header sticky top-16 z-30 bg-white/95 backdrop-blur-sm border-b border-gray-150">
            <div class="calendar-grid">
                <div class="h-14 border-r border-gray-150"></div> <!-- Top left corner spacer -->
                <div class="h-14 flex flex-col items-center justify-center">
                    <span class="text-[10px] font-bold text-outline uppercase tracking-wider">Mon</span>
                    <span class="text-lg font-semibold">23</span>
                </div>
                <div class="h-14 flex flex-col items-center justify-center border-l border-gray-150">
                    <span class="text-[10px] font-bold text-outline uppercase tracking-wider">Tue</span>
                    <span class="text-lg font-semibold text-outline">24</span>
                </div>
                <!-- Highlight Today -->
                <div class="h-14 flex flex-col items-center justify-center border-l border-gray-150 bg-blue-100/40">
                    <span class="text-[10px] font-bold text-primary uppercase tracking-wider">Wed</span>
                    <span class="text-lg font-bold text-primary">25</span>
                </div>
                <div class="h-14 flex flex-col items-center justify-center border-l border-gray-150">
                    <span class="text-[10px] font-bold text-outline uppercase tracking-wider">Thu</span>
                    <span class="text-lg font-semibold">26</span>
                </div>
                <div class="h-14 flex flex-col items-center justify-center border-l border-gray-150">
                    <span class="text-[10px] font-bold text-outline uppercase tracking-wider">Fri</span>
                    <span class="text-lg font-semibold">27</span>
                </div>
                <div class="h-14 flex flex-col items-center justify-center border-l border-gray-150 bg-gray-150/30">
                    <span class="text-[10px] font-bold text-outline uppercase tracking-wider">Sat</span>
                    <span class="text-lg font-semibold">28</span>
                </div>
                <div class="h-14 flex flex-col items-center justify-center border-l border-gray-150 bg-gray-150/30">
                    <span class="text-[10px] font-bold text-outline uppercase tracking-wider">Sun</span>
                    <span class="text-lg font-semibold text-outline">29</span>
                </div>
            </div>
        </div>
        <div class="desktop-calendar-scroll flex-1 overflow-y-auto scrollbar-hide relative bg-white"
             id="desktop-calendar-scroll">
            <!-- CURRENT TIME INDICATOR (Blue Horizontal Line) -->
            <div class="absolute top-[280px] left-0 w-full z-20 pointer-events-none flex items-center">
                <div class="w-20 pr-2 text-right">
                    <span class="text-[10px] font-bold text-primary bg-white px-1">10:45</span>
                </div>
                <div class="flex-1 relative flex items-center">
                    <div class="w-2.5 h-2.5 bg-primary rounded-full absolute -left-1.5 shadow-sm"></div>
                    <div class="w-full h-[2px] bg-primary/40"></div>
                </div>
            </div>

            <!-- Calendar Time Slots Grid -->
            <div class="calendar-grid relative">
                <!-- Grid Horizontal Lines -->
                <div class="absolute inset-0 pointer-events-none col-span-full">
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                    <div class="h-20 border-b border-gray-150"></div>
                </div>

                <!-- Time Column -->
                <div class="border-r border-gray-150">
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">12:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">01:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">02:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">03:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">04:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">05:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">06:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">07:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">09:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">10:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">11:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">12:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">13:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">14:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">15:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">16:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">17:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">18:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">19:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">20:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">21:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">22:00</span></div>
                    <div class="time-row flex justify-center pt-2"><span
                            class="text-[11px] font-medium text-outline">23:00</span></div>

                </div>
                <!-- Columns Wrapper (7 days) -->
                <!-- Mon 23 -->
                <div class="relative">
                    <!-- Morning Availability -->
                    <div
                            class="absolute top-[80px] left-2 right-2 h-[80px] border-2 border-dashed border-gray-200 rounded-lg flex items-center justify-center bg-gray-150/10">
                            <span class="text-[10px] font-semibold text-outline text-center px-2">Clients can
                                book</span>
                    </div>
                    <div
                            class="absolute top-[240px] left-1 right-1 h-[120px] bg-secondary-container text-on-secondary-container p-3 rounded-lg shadow-sm">
                        <div class="text-[11px] font-bold leading-tight">Sarah Jenkins</div>
                        <div class="text-[10px] opacity-80">Full Body HIIT</div>
                    </div>
                </div>
                <!-- Tue 24 (Past - Faded) -->
                <div class="relative border-l border-gray-150 bg-gray-150/10">
                    <div
                            class="absolute top-[160px] left-1 right-1 h-[80px] bg-gray-200 text-gray-1500 p-3 rounded-lg opacity-60">
                        <div class="text-[11px] font-bold leading-tight">Mark Owens</div>
                        <div class="text-[10px]">Mobility Drills</div>
                    </div>
                </div>
                <!-- Wed 25 (Today - Highlighted) -->
                <div class="relative border-l border-gray-150 bg-blue-100/20">
                    <!-- Live Session Card -->
                    <div
                            class="absolute top-[160px] left-1 right-1 h-[120px] bg-primary text-white p-3 rounded-xl shadow-lg ring-4 ring-blue-100 z-10">
                        <div class="flex items-center gap-1.5 mb-2">
                                <span
                                        class="bg-white/20 px-1.5 py-0.5 rounded text-[8px] font-extrabold tracking-tighter">LIVE
                                    NOW</span>
                            <span class="w-1.5 h-1.5 bg-white rounded-full animate-pulse"></span>
                        </div>
                        <div class="text-sm font-bold leading-tight">Marcus Thorne</div>
                        <div class="text-[11px] opacity-80">Advanced Strength</div>
                        <div class="mt-4 flex items-center gap-1">
                            <span class="material-symbols-outlined text-sm" data-icon="videocam">videocam</span>
                            <span class="text-[10px] font-medium">Join Zoom Room</span>
                        </div>
                    </div>
                    <!-- Availability -->
                    <div
                            class="absolute top-[480px] left-2 right-2 h-[160px] border-2 border-dashed border-gray-200 rounded-lg flex items-center justify-center">
                            <span class="text-[10px] font-semibold text-outline text-center px-2">Clients can
                                book</span>
                    </div>
                </div>
                <!-- Thu 26 -->
                <div class="relative border-l border-gray-150">
                    <div
                            class="absolute top-[320px] left-1 right-1 h-[80px] bg-secondary-container text-on-secondary-container p-3 rounded-lg shadow-sm">
                        <div class="text-[11px] font-bold leading-tight">Elena Ruiz</div>
                        <div class="text-[10px]">Core Stability</div>
                    </div>
                    <div
                            class="absolute top-[560px] left-1 right-1 h-[80px] bg-secondary-container text-on-secondary-container p-3 rounded-lg shadow-sm">
                        <div class="text-[11px] font-bold leading-tight">Jason Kidd</div>
                        <div class="text-[10px]">Endurance Run</div>
                    </div>
                </div>
                <!-- Fri 27 -->
                <div class="relative border-l border-gray-150">
                    <div
                            class="absolute top-[80px] left-2 right-2 h-[80px] border-2 border-dashed border-gray-200 rounded-lg flex items-center justify-center">
                            <span class="text-[10px] font-semibold text-outline text-center px-2">Clients can
                                book</span>
                    </div>
                    <div
                            class="absolute top-[240px] left-1 right-1 h-[160px] bg-secondary-container text-on-secondary-container p-3 rounded-lg shadow-sm">
                        <div class="text-[11px] font-bold leading-tight">Personal Workout</div>
                        <div class="text-[10px] opacity-80">Trainer Focus</div>
                    </div>
                </div>
                <!-- Sat 28 -->
                <div class="relative border-l border-gray-150 bg-gray-150/20">
                    <div
                            class="absolute top-[160px] left-1 right-1 h-[120px] bg-secondary-container text-on-secondary-container p-3 rounded-lg shadow-sm">
                        <div class="text-[11px] font-bold leading-tight">Weekend Yoga</div>
                        <div class="text-[10px] opacity-80">Group Session (12)</div>
                    </div>
                </div>
                <!-- Sun 29 -->
                <div class="relative border-l border-gray-150 bg-gray-150/20">
                </div>
            </div>
            <!-- Floating Action Button -->
            <button
                    class="fixed md:bottom-24 lg:bottom-8 right-8 flex items-center gap-2 bg-primary text-white px-6 py-4 rounded-full shadow-2xl hover:scale-105 transition-transform active:scale-95 group z-100">
                <span class="material-symbols-outlined font-bold" data-icon="add">add</span>
                <span class="font-bold tracking-tight">+ Manage Availability</span>
            </button>
        </div>

        <!-- Tablet Bottom Nav -->
        <nav
                class="lg:hidden fixed bottom-0 left-0 right-0 z-30 bg-white border-t border-slate-200 px-2 py-2 flex items-center justify-around">
            <a href=""
               class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
                <span class="material-symbols-outlined text-[22px]">distance</span>
                <span class="text-[10px] font-medium">내주변</span>
            </a>

            <a href="/dashboard.html"
               class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
                    <span class="material-symbols-outlined text-[22px]">dashboard
                    </span>
                <span class="text-[10px] font-medium">대시보드</span>
            </a>
            <a href="${pageContext.request.contextPath}/trainer/clients"
               class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
                <span class="material-symbols-outlined text-[22px]">group</span>
                <span class="text-[10px] font-medium">회원관리</span>
            </a>
            <a href="/calendar.html"
               class="flex flex-col items-center gap-1 px-3 py-1 text-blue-700 transition-colors">
                    <span class="material-symbols-outlined text-[22px]"
                          style='font-variation-settings: "FILL" 1;'>calendar_today</span>
                <span class="text-[10px] font-bold text-blue-700">일정</span>
            </a>
            <a href="/messages.html"
               class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
                <span class="material-symbols-outlined text-[22px]">chat</span>
                <span class="text-[10px] font-medium">메시지</span>
            </a>
        </nav>
    </div>
</main>

</body>
</html>
