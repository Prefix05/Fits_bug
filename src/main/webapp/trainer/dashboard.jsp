<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/22/26
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Fitzberg - Trainer Dashboard</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&amp;display=swap" rel="stylesheet"/>
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        surface: "#f9f9fe",
                        "inverse-primary": "#adc6ff",
                        outline: "#717786",
                        "on-secondary-container": "#2d4c83",
                        "on-primary-container": "#fefcff",
                        "surface-bright": "#f9f9fe",
                        "on-secondary-fixed": "#001a41",
                        "on-secondary": "#ffffff",
                        "error-container": "#ffdad6",
                        "on-primary": "#ffffff",
                        "surface-container": "#ededf2",
                        "surface-tint": "#005bc1",
                        "secondary-fixed-dim": "#adc6ff",
                        "surface-dim": "#d9dade",
                        "inverse-surface": "#2e3034",
                        "on-background": "#1a1c1f",
                        error: "#ba1a1a",
                        "primary-fixed-dim": "#adc6ff",
                        secondary: "#405e96",
                        "on-tertiary-fixed-variant": "#7c2e00",
                        "on-primary-fixed-variant": "#004493",
                        "on-surface-variant": "#414755",
                        "tertiary-fixed": "#ffdbcc",
                        "secondary-fixed": "#d8e2ff",
                        "outline-variant": "#c1c6d7",
                        "inverse-on-surface": "#f0f0f5",
                        tertiary: "#9e3d00",
                        "on-tertiary": "#ffffff",
                        "on-surface": "#1a1c1f",
                        "on-error": "#ffffff",
                        "secondary-container": "#a1befd",
                        background: "#f9f9fe",
                        "primary-container": "#0070eb",
                        "tertiary-container": "#c64f00",
                        "primary-fixed": "#d8e2ff",
                        "tertiary-fixed-dim": "#ffb595",
                        primary: "#0058bc",
                        "on-secondary-fixed-variant": "#26467d",
                        "on-tertiary-fixed": "#351000",
                        "surface-container-highest": "#e2e2e7",
                        "surface-container-lowest": "#ffffff",
                        "surface-container-high": "#e8e8ed",
                        "on-error-container": "#93000a",
                        "on-primary-fixed": "#001a41",
                        "surface-variant": "#e2e2e7",
                        "surface-container-low": "#f3f3f8",
                        "on-tertiary-container": "#fffbff"
                    },
                    borderRadius: {
                        DEFAULT: "0.125rem",
                        lg: "0.25rem",
                        xl: "0.5rem",
                        full: "0.75rem"
                    },
                    fontFamily: {
                        headline: ["Inter"],
                        body: ["Inter"],
                        label: ["Inter"],
                        display: "Inter"
                    }
                }
            }
        };
    </script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .signature-gradient {
            background: linear-gradient(135deg, #0058bc 0%, #0070eb 100%);
        }

        .glass-header {
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
        }

        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }

        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        .schedule-scrollbar::-webkit-scrollbar {
            width: 5px;
        }

        .schedule-scrollbar::-webkit-scrollbar-track {
            background: transparent;
        }

        .schedule-scrollbar::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 10px;
        }

        .schedule-scrollbar::-webkit-scrollbar-thumb:hover {
            background: #94a3b8;
        }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased">

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
            <img alt="${sessionScope.loginTrainer.name}" class="w-8 h-8 rounded-full object-cover"
                 src="${not empty sessionScope.loginUser.profileImg ? pageContext.request.contextPath.concat('/uploads/').concat(sessionScope.loginUser.profileImg) : pageContext.request.contextPath.concat('/img/profile_img.jpg')}"/>
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
    <a href="" class="flex flex-col items-center gap-1 px-3 py-1 text-blue-700 transition-colors">
            <span class="material-symbols-outlined text-[22px]"
                  style='font-variation-settings: "FILL" 1;'>dashboard</span>
        <span class="text-[10px] font-bold text-blue-700">대시보드</span>
    </a>
    <a href="${pageContext.request.contextPath}/trainer/clients"
       class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400 hover:text-primary transition-colors">
        <span class="material-symbols-outlined text-[22px]">group</span>
        <span class="text-[10px] font-medium">회원관리</span>
    </a>
    <a href="${pageContext.request.contextPath}/trainer/calendar"
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

<!-- SideNavBar Shell -->
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

        <!-- 대시보드 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-blue-700 border-r-4 border-blue-700 bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="${pageContext.request.contextPath}/trainer/dashboard" style=""><span class="material-symbols-outlined" data-icon="" style="">dashboard</span>
            대시보드</a>

        <!-- 회원관리 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200"
           href="${pageContext.request.contextPath}/trainer/clients" style=""><span class="material-symbols-outlined" data-icon="" style="">group</span>
            회원
            관리</a>

        <!-- 일정 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="${pageContext.request.contextPath}/trainer/calendar" style=""><span class="material-symbols-outlined" data-icon="" style="">calendar_today</span>
            일정</a>

        <!-- 메시지 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="" style=""><span class="material-symbols-outlined" data-icon="" style="">chat</span> 메시지</a>

        <!-- 수익 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="" style=""><span class="material-symbols-outlined" data-icon="" style="">payments</span>
            수익</a>
    </nav>

    <!--설정, 고객 지원-->
    <div class="mt-auto pt-6 border-slate-200 dark:border-slate-800 space-y-1">
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">settings</span>
            설정</a>
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">help</span> 고객
            지원</a>
        <div class="border-t border-slate-200 dark:border-slate-800 my-2"></div>
    </div>

    <!-- 마이프로필 -->
    <a href="${pageContext.request.contextPath}/trainer/profile"
       class=" flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg">
        <img alt="profile image" class="w-10 h-10 rounded-full object-cover shrink-0"
             src="${not empty sessionScope.loginUser.profileImg ? pageContext.request.contextPath.concat('/uploads/').concat(sessionScope.loginUser.profileImg) : pageContext.request.contextPath.concat('/img/profile_img.jpg')}"
             style=""/>
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-on-surface truncate" style="">${sessionScope.loginTrainer.name}</p>
            <p class="text-xs text-slate-500 truncate" style="">마이프로필</p>
        </div>
    </a>
</aside>

<!-- Main Content Shell -->
<main class="lg:ml-64 min-h-screen flex flex-col pt-20 lg:pt-8 pb-20 lg:pb-0">
    <!-- Dashboard Canvas -->
    <div class="p-4 md:p-8 max-w-6xl mx-auto flex-1 flex flex-col space-y-8 w-full">
        <!-- 1. Lesson Info Card-->
        <section class="flex-shrink-0">
            <div class="relative overflow-hidden rounded-2xl p-6 md:p-8 bg-slate-900 text-white shadow-2xl shadow-blue-900/20">
                <div class="absolute -right-20 -top-20 w-64 h-64 bg-blue-600/20 rounded-full blur-3xl"></div>
                <div class="relative flex flex-col gap-4">

                    <!-- Session Info -->
                    <div class="space-y-2">
                        <c:choose>
                            <c:when test="${hasSelectedLesson}">
                                <div class="flex items-center gap-2 flex-wrap">
                                    <c:choose>
                                        <c:when test="${selectedLesson.status eq 'Now'}">
                                            <span id="lesson-status-badge" class="whitespace-nowrap px-2.5 py-0.5 bg-primary/20 text-green-300 text-xs font-bold rounded-full border border-green-400/30 tracking-wider">${selectedLesson.status}</span>
                                        </c:when>
                                        <c:when test="${selectedLesson.status eq 'Up Next'}">
                                            <span id="lesson-status-badge" class="whitespace-nowrap px-2.5 py-0.5 bg-primary/20 text-blue-300 text-xs font-bold rounded-full border border-blue-500/30 tracking-wider">${selectedLesson.status}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span id="lesson-status-badge" class="whitespace-nowrap px-2.5 py-0.5 bg-primary/20 text-slate-300 text-xs font-bold rounded-full border border-slate-400/30 tracking-wider">${selectedLesson.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <span id="lesson-time-range" class="whitespace-nowrap flex items-center gap-1 text-blue-200 text-xs font-medium">
                                    <span class="material-symbols-outlined text-xs">schedule</span>
                                        ${selectedLesson.startTime} - ${selectedLesson.endTime}
                                    </span>
                                </div>
                                <div>
                                    <h2 id="lesson-member-name" class="text-2xl md:text-3xl font-bold tracking-tight whitespace-nowrap">${selectedLesson.memberName}</h2>
                                    <div class="flex items-center gap-2">
                                        <p id="lesson-name" class="whitespace-nowrap text-blue-100/70 text-sm md:text-lg">${selectedLesson.goal}</p>
                                        <span class="h-1 w-1 rounded-full bg-blue-100/30 shrink-0"></span>
                                        <p id="lesson-duration" class="whitespace-nowrap text-blue-100/50 text-xs md:text-sm font-medium">
                                            <c:choose>
                                                <c:when test="${client != null}">${client.lessonCount}회 남음</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                                <!-- Actions Row -->
                                <div class="flex items-center gap-2">
                                    <!-- Mobile: icon buttons -->
                                    <button
                                            class="flex items-center justify-center md:hidden p-2.5 bg-white/10 hover:bg-white/20 text-white rounded-xl backdrop-blur-md transition-colors active:scale-95">
                                        <span class="material-symbols-outlined text-[20px]">person</span>
                                    </button>
                                    <button
                                            class="flex items-center justify-center md:hidden p-2.5 bg-white/10 hover:bg-white/20 text-white rounded-xl backdrop-blur-md transition-colors active:scale-95">
                                        <span class="material-symbols-outlined text-[20px]">fitness_center</span>
                                    </button>
                                    <button
                                            class="flex items-center justify-center md:hidden p-2.5 bg-white/10 hover:bg-white/20 text-white rounded-xl backdrop-blur-md transition-colors active:scale-95">
                                        <span class="material-symbols-outlined text-[20px]">chat_bubble</span>
                                    </button>

                                    <!-- Desktop: full buttons -->
                                    <div class="hidden md:flex flex-wrap gap-3">
                                        <button
                                                class="px-8 py-3 bg-white text-slate-900 rounded-xl font-bold hover:bg-blue-50 transition-colors active:scale-95">
                                            프로필
                                            보기
                                        </button>
                                        <button
                                                class="px-6 py-3 bg-white/10 hover:bg-white/20 text-white rounded-xl font-semibold backdrop-blur-md transition-colors active:scale-95">
                                            +
                                            운동 추가
                                        </button>
                                        <button
                                                class="p-3 bg-white/10 hover:bg-white/20 text-white rounded-xl backdrop-blur-md transition-colors">
                                            <span class="material-symbols-outlined">chat_bubble</span>
                                        </button>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="flex flex-col gap-2">
                                    <div class="flex items-center gap-2">
            <span class="whitespace-nowrap px-2.5 py-0.5 bg-white/10 text-blue-200
                         text-xs font-bold rounded-full border border-white/20 tracking-wider">
                오늘 일정 없음
            </span>
                                    </div>
                                    <div class="flex flex-col gap-1">
                                        <h2 class="text-2xl md:text-3xl font-bold tracking-tight">
                                            수업이 없습니다
                                        </h2>
                                        <p class="text-blue-100/70 text-sm md:text-lg">
                                            내일 일정을 확인해 주세요
                                        </p>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </section>
        <!-- Grid Layout for Tools & Stats -->
        <div class="grid grid-cols-1 xl:grid-cols-3 gap-8 flex-1 min-h-0 items-start w-full">
            <!-- 2. Today's Schedule (2/3 width) -->
            <div class="lg:col-span-2 flex flex-col">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-xl font-semibold text-on-surface">오늘의 일정</h3>
                    <a class="text-xs font-bold text-primary hover:underline" href="#">캘린더 보기</a>
                </div>
                <div class="space-y-3 overflow-y-auto schedule-scrollbar h-[250px] md:h-[280px] lg:h-[320px] xl:h-[535px]">
                    <c:choose>
                        <%-- 수업이 없을 때 빈 상태 표시 --%>
                        <c:when test="${empty todayLessons}">
                            <div class="bg-surface-container-low rounded-2xl overflow-hidden shadow-sm">
                                <div class="flex flex-col items-center justify-center gap-3 text-center h-[200px] px-4">
                                    <span class="material-symbols-outlined text-4xl text-slate-300">event_busy</span>
                                    <p class="text-sm font-semibold text-on-surface">오늘 예정된 수업이 없습니다</p>
                                    <p class="text-xs text-slate-400">새로운 수업을 추가하거나 내일 일정을 확인해보세요.</p>
                                </div>
                            </div>
                        </c:when>
                        <%-- 수업이 있을 때 목록 표시 --%>
                        <c:otherwise>
                            <c:forEach var="lesson" items="${todayLessons}">
                                <a href="dashboard?lessonId=${lesson.lessonId}" class="block lesson-item" data-lesson-id="${lesson.lessonId}">
                                    <div class="lesson-item-card flex items-center justify-between p-4 mx-0.5 rounded-xl border-2 transition-all ${hasSelectedLesson and selectedLesson.lessonId eq lesson.lessonId ? 'bg-blue-50 border-blue-200 hover:bg-blue-100' : 'bg-surface-container-low border-transparent hover:bg-surface-container-high'}">
                                        <div class="flex items-center gap-4">
                                            <div class="w-12 text-center">
                                                <p class="text-sm font-bold text-on-surface">${lesson.startTime}</p>
                                                <p class="text-[10px] font-medium text-on-surface-variant">${lesson.durationMinutes}m</p>
                                            </div>
                                            <div class="h-10 w-[2px] bg-slate-300"></div>
                                            <div>
                                                <p class="text-lg text-on-surface font-semibold">${lesson.memberName}</p>
                                                <div class="flex items-center gap-2">
                                                    <span class="text-[10px] font-bold text-slate-500 uppercase">${lesson.goal}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <c:choose>
                                            <c:when test="${lesson.status eq 'Now'}">
                                                <span class="px-2.5 py-0.5 bg-green-100 text-green-700 text-[10px] font-bold rounded-full">${lesson.status}</span>
                                            </c:when>
                                            <c:when test="${lesson.status eq 'Up Next'}">
                                                <span class="px-2.5 py-0.5 bg-blue-100 text-blue-700 text-[10px] font-bold rounded-full">${lesson.status}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="px-2.5 py-0.5 bg-slate-100 text-slate-500 text-[10px] font-bold rounded-full">${lesson.status}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </a>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <!-- 3. Sidebar Tools & Notifications (1/3 width) -->
            <div class="flex flex-col space-y-8">
                <!-- Notifications Panel -->
                <section class="flex flex-col flex-1 min-h-0 w-full">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-semibold text-on-surface">알림</h3>
                        <button id="notifications-mark-all" class="text-xs font-bold text-primary hover:underline">모두 읽음으로 표시</button>
                    </div>
                    <div
                            class="bg-surface-container-low rounded-2xl overflow-hidden flex flex-col shadow-sm max-h-[540px]">
                        <div id="notifications-list" class="overflow-y-auto schedule-scrollbar">
                            <c:choose>
                                <c:when test="${empty notifications}">
                                    <div class="flex flex-col items-center justify-center gap-3 text-center h-[200px] px-4">
                                        <span class="material-symbols-outlined text-4xl text-slate-300">notifications_off</span>
                                        <p class="text-sm font-semibold text-on-surface">알림이 없습니다</p>
                                        <p class="text-xs text-slate-400">새로운 알림이 오면 여기에 표시됩니다.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="notification" items="${notifications}">
                                        <div class="notification-item relative p-4 pr-12 border-b border-slate-200/60 hover:bg-surface-container-high transition-colors cursor-pointer ${notification.read ? '' : 'group'}"
                                             data-notification-id="${notification.notificationId}"
                                             data-target-url="${notification.targetUrl}">
                                            <div class="flex items-start gap-3">
                                                <c:choose>
                                                    <c:when test="${notification.type eq 'SCHEDULE'}">
                                                        <div class="w-9 h-9 rounded-full bg-blue-100 flex items-center justify-center text-primary flex-shrink-0">
                                                            <span class="material-symbols-outlined text-[18px]" data-icon="event_note">event_note</span>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${notification.type eq 'DIET'}">
                                                        <div class="w-9 h-9 rounded-full bg-green-100 flex items-center justify-center text-green-600 flex-shrink-0">
                                                            <span class="material-symbols-outlined text-[18px]" data-icon="restaurant">restaurant</span>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="w-9 h-9 rounded-full bg-purple-100 flex items-center justify-center text-purple-600 flex-shrink-0">
                                                            <span class="material-symbols-outlined text-[18px]" data-icon="task_alt">task_alt</span>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div>
                                                    <p class="text-xs font-bold text-on-surface">${notification.title}</p>
                                                    <p class="text-[11px] text-on-surface-variant mt-0.5">${notification.message}</p>
                                                </div>
                                            </div>
                                            <div class="absolute right-4 top-4 flex flex-col items-end gap-1.5">
                                                <span class="text-[10px] text-slate-400">${notification.createdAtLabel}</span>
                                                <c:if test="${not notification.read}">
                                                    <div class="notification-unread-dot w-2 h-2 bg-primary rounded-full"></div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="p-3 bg-slate-50 text-center border-t border-slate-200/60">
                                        <button class="text-[11px] font-bold text-slate-500 hover:text-on-surface transition-colors">
                                            모든 알림 보기
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</main>
</body>
</html>
