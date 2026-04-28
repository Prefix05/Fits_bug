<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/28/26
  Time: 1:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <p class="text-on-surface-variant font-label text-[10px] uppercase tracking-widest font-bold">Weekly
                    Performance</p>
            </div>
            <div class="grid gap-4 pt-2 grid-cols-2 md:grid-cols-4">
                <div class="space-y-1">
                    <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Calories</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-2xl font-bold text-on-surface tracking-tighter">2,100</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">kcal</span>
                    </div>
                </div>
                <div class="space-y-1">
                    <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Protein</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-2xl font-bold text-on-surface tracking-tighter">135</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">g</span>
                    </div>
                </div>
                <div class="space-y-1">
                    <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Carbs</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-2xl font-bold text-on-surface tracking-tighter">220</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">g</span>
                    </div>
                </div>
                <div class="space-y-1">
                    <span class="text-on-surface-variant font-label text-[10px] font-medium">Avg Fats</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-2xl font-bold text-on-surface tracking-tighter">70</span>
                        <span class="text-[10px] text-on-surface-variant font-medium">g</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- Trends Card -->
        <section
                class="bg-surface-container-lowest rounded-xl p-6 shadow-[0_4px_24px_rgba(0,88,188,0.04)] overflow-hidden">
            <div class="flex items-center justify-between mb-6">
                <h3 class="text-on-surface font-semibold text-base">칼로리 섭취량</h3>
                <div class="bg-surface-container-low p-1 rounded-lg flex gap-1">
                    <button
                            class="px-3 py-1 text-[10px] font-bold rounded-md bg-white shadow-sm text-primary">일
                    </button>
                    <button
                            class="px-3 py-1 text-[10px] font-bold rounded-md text-on-surface-variant">주
                    </button>
                </div>
            </div>
                <%-- chart --%>
                <div>
                    <canvas id="myChart"></canvas>
                </div>

        </section>
        <!-- Meal Log Section -->
        <section class="space-y-8">
            <div class="flex items-center justify-between px-2">
                <h3 class="text-on-surface font-semibold text-base">Today's Meals</h3>
                <span class="text-on-surface-variant text-[12px] font-medium">May 24, Friday</span>
            </div>
            <!-- Breakfast Section -->
            <div class="space-y-4">
                <div class="flex items-center gap-4">
                        <span
                                class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">Breakfast</span>
                    <div class="h-[1px] bg-outline-variant/30 w-full"></div>
                </div>
                <div
                        class="bg-surface-container-lowest rounded-xl overflow-hidden flex shadow-[0_4px_24px_rgba(0,88,188,0.04)]">
                    <div class="w-28 h-32 flex-shrink-0">
                        <img alt="Protein Shake with Berries" class="w-full h-full object-cover"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuD2yQxJQoJzJkpzua4HBJXZ4KUE-WLY5Mb0F4HY5UbbFUt7xET7CJDnLwJJXDW6_aBOataNPe045hqRHH9PMP1wNag-BrVJzfRLHTNur7ZK3T13nWqvXAk4LBrn7Nd33uXaqM7oG4uZPjPYLE7FCp1okg5Sok3uorOgkPZ2kNUJ6Qzc-vsWh7upQYgDztHTkMoAiP3JnYHYg25eIMvEc_AWYxSBBINM5bajQ6kS45s5AnstiegDzjNxEctBT1C45Tq_esjwkAbVR9SU"/>
                    </div>
                    <div class="p-4 flex-grow flex flex-col justify-between">
                        <div>
                            <div class="flex justify-between items-start">
                                <h4 class="font-bold text-on-surface text-sm">Protein Shake</h4>
                                <span class="text-[10px] font-medium text-on-surface-variant">08:00 AM</span>
                            </div>
                            <p class="text-[11px] text-on-surface-variant mt-1 line-clamp-1">"Post-workout
                                recovery."</p>
                        </div>
                        <div class="flex flex-wrap gap-x-3 gap-y-1">
                            <div class="flex items-center gap-1">
                                <span class="text-xs font-bold text-on-surface">180</span>
                                <span class="text-[10px] text-on-surface-variant">kcal</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                                <span class="text-xs font-bold text-primary">25</span>
                                <span class="text-[10px] text-on-surface-variant">Protein</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                                <span class="text-xs font-bold text-orange-600">12</span>
                                <span class="text-[10px] text-on-surface-variant">Carbs</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                                <span class="text-xs font-bold text-amber-600">4</span>
                                <span class="text-[10px] text-on-surface-variant">Fat</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Lunch Section -->
            <div class="space-y-4">
                <div class="flex items-center gap-4">
                        <span
                                class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">Lunch</span>
                    <div class="h-[1px] bg-outline-variant/30 w-full"></div>
                </div>
                <div
                        class="bg-surface-container-lowest rounded-xl overflow-hidden flex shadow-[0_4px_24px_rgba(0,88,188,0.04)]">
                    <div class="w-28 h-32 flex-shrink-0">
                        <img alt="Korean Kimchi Stew" class="w-full h-full object-cover"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuCbolKXgMoW1TTeT6TpRfa4o3zS1UGvhju0vsppFqWtZSxgR5K-P1K_L361JpQOaOwtWl9BLAopHyfncDlNC36NBfnp1vG6HJam--8zjdzQEX2WlfjcLmMx1BvHkaA21XsvjrYtN4Pocb57lwgiBVXDHyMIRnaqGHPPqwwkEg3hOmsinP19NcNASbVBNBI9bQWLqbDp6nNBQDQPhfvfbFm8Cpdmx4RMG3eS8IvrXqc8DMVm6v-CZP6eQN3V7LCG4kx-PFBeVQlcszKz"/>
                    </div>
                    <div class="p-4 flex-grow flex flex-col justify-between">
                        <div>
                            <div class="flex justify-between items-start">
                                <h4 class="font-bold text-on-surface text-sm">Kimchi Stew (김치찌개)</h4>
                                <span class="text-[10px] font-medium text-on-surface-variant">12:30 PM</span>
                            </div>
                            <p class="text-[11px] text-on-surface-variant mt-1 line-clamp-1">"Added extra tofu for
                                protein as requested."</p>
                        </div>
                        <div class="flex gap-4">
                            <div class="flex items-center gap-1">
                                <span class="text-xs font-bold text-on-surface">540</span>
                                <span class="text-[10px] text-on-surface-variant">kcal</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                                <span class="text-xs font-bold text-primary">28</span>
                                <span class="text-[10px] text-on-surface-variant">Protein</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                                <span class="text-xs font-bold text-orange-600">45</span>
                                <span class="text-[10px] text-on-surface-variant">Carbs</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                                <span class="text-xs font-bold text-amber-600">18</span>
                                <span class="text-[10px] text-on-surface-variant">Fat</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Dinner Section -->
            <div class="space-y-4">
                <div class="flex items-center gap-4">
                        <span
                                class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest whitespace-nowrap">Dinner</span>
                    <div class="h-[1px] bg-outline-variant/30 w-full"></div>
                </div>
                <div
                        class="bg-surface-container-lowest rounded-xl overflow-hidden flex shadow-[0_4px_24px_rgba(0,88,188,0.04)]">
                    <div class="w-28 h-32 flex-shrink-0">
                        <img alt="Healthy Bibimbap" class="w-full h-full object-cover"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuDiay_D27hQ57kyCu5OfuQjdJWzPknPLdxFdBAjwOAKlMgJ9vdGQ72m25mUuCCRjtR_FQ8qNhcAW5ignmypPncD84VEV5TK3MBo-LgJCCoyIGh5IBOzC5bHiDT2wTM9tQWhqzJ-xRyjLseRUkeF6TUxWKDbyP4FBRHFWzgiZnIxPL33WorKPAOaCeRz36W8XVICYmr7wbFvwKnrCR5WCYQd2zYlwu8qTYfCQFGMD9y7e3DMLdFkNlwbz4LKhmEDzRS_9TbjGP2b_Y3M"/>
                    </div>
                    <div class="p-4 flex-grow flex flex-col justify-between">
                        <div>
                            <div class="flex justify-between items-start">
                                <h4 class="font-bold text-on-surface text-sm">Bibimbap (비빔밥)</h4>
                                <span class="text-[10px] font-medium text-on-surface-variant">07:15 PM</span>
                            </div>
                            <p class="text-[11px] text-on-surface-variant mt-1 line-clamp-1">"Brown rice used, light
                                gochujang sauce."</p>
                        </div>
                        <div class="flex gap-4">
                            <div class="flex items-center gap-1">
                                <span class="text-xs font-bold text-on-surface">620</span>
                                <span class="text-[10px] text-on-surface-variant">kcal</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                                <span class="text-xs font-bold text-primary">34</span>
                                <span class="text-[10px] text-on-surface-variant">Protein</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                                <span class="text-xs font-bold text-orange-600">75</span>
                                <span class="text-[10px] text-on-surface-variant">Carbs</span>
                            </div>
                            <div class="flex items-center gap-1 border-l border-surface-container-highest pl-3">
                                <span class="text-xs font-bold text-amber-600">12</span>
                                <span class="text-[10px] text-on-surface-variant">Fat</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
<script>
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['월', '화', '수', '목', '금', '토', '일'],
            datasets: [{
                label: 'kcal',
                data: [2200, 1900, 2000, 1950, 1800, 2040, 2000],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>
