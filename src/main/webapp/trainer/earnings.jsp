<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/28/26
  Time: 1:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Fitzberg - Trainer Earnings</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&amp;display=swap" rel="stylesheet" />
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet" />
    <script
            id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "inverse-surface": "#2e3034", "surface-bright": "#f9f9fe", "surface-container-lowest": "#ffffff", "on-tertiary-fixed": "#351000", "tertiary-fixed": "#ffdbcc", "surface-container-low": "#f3f3f8", "on-error-container": "#93000a", secondary: "#405e96", "primary-fixed": "#d8e2ff", "inverse-on-surface": "#f0f0f5", "surface-variant": "#e2e2e7", "secondary-fixed-dim": "#adc6ff", "inverse-primary": "#adc6ff", "surface-tint": "#005bc1", "surface-dim": "#d9dade", "secondary-fixed": "#d8e2ff", "on-surface-variant": "#414755", "on-tertiary-fixed-variant": "#7c2e00", "surface-container-highest": "#e2e2e7", "primary-fixed-dim": "#adc6ff", "on-secondary": "#ffffff", "on-background": "#1a1c1f", "on-error": "#ffffff", primary: "#0058bc", "on-primary-fixed-variant": "#004493", "error-container": "#ffdad6", "on-tertiary-container": "#fffbff", "tertiary-fixed-dim": "#ffb595", "on-primary": "#ffffff", tertiary: "#9e3d00", "on-surface": "#1a1c1f", "on-secondary-container": "#2d4c83", "on-primary-fixed": "#001a41", outline: "#717786", "tertiary-container": "#c64f00", "secondary-container": "#a1befd", "on-primary-container": "#fefcff", surface: "#f9f9fe", "on-secondary-fixed": "#001a41", "primary-container": "#0070eb", "on-tertiary": "#ffffff", error: "#ba1a1a", "surface-container-high": "#e8e8ed", "outline-variant": "#c1c6d7", "surface-container": "#ededf2", "on-secondary-fixed-variant": "#26467d", background: "#f9f9fe" }, fontFamily: { headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter" }, borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" } } } };</script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            -webkit-font-smoothing: antialiased;
            background-color: #f9f9fe;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .glass-nav {
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
        }

        .kinetic-gradient {
            background: linear-gradient(135deg, #0058bc 0%, #0070eb 100%);
        }

        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }

        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        body {
            min-height: max(884px, 100dvh);
        }

        .signature-gradient {
            background: linear-gradient(135deg, #0058bc 0%, #0070eb 100%);
        }
    </style>
</head>
<body class="text-on-surface select-none">
<!-- Sidebar Navigation (Desktop) - Updated to match SCREEN_71 -->
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
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50  transition-colors duration-200 rounded-lg"
           href="/dashboard.html" style=""><span class="material-symbols-outlined" data-icon="" style="">dashboard</span>
            대시보드</a>

        <!-- 회원관리 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200"
           href="${pageContext.request.contextPath}/trainer/clients" style=""><span class="material-symbols-outlined" data-icon="" style="">group</span>
            회원
            관리</a>

        <!-- 일정 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/calendar.html" style=""><span class="material-symbols-outlined" data-icon=""
                                                style="">calendar_today</span>
            일정</a>

        <!-- 메시지 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/messages.html" style=""><span class="material-symbols-outlined" data-icon="" style="">chat</span>
            메시지</a>

        <!-- 수익 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-blue-700 border-r-4 border-blue-700 bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="earnings.html" style=""><span class="material-symbols-outlined" data-icon="" style="">payments</span>
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
             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBmLhyuu6rdbT8CspzqySgGADnPxyIZWQ8JzIVzEVHSPkB3UoDOAnZJJhZ7cPpcvRt9El0mEpCGTPo-ipH8tmcW9-1VJX9uPfKjuW6-wnQk8l60TyYJuHFUx-ER7gH9tCPui0ZcXDuvH0okvDCPmNyngCwbTzX130D_1k-cU7r_UYLYwjc9G4FkGvBrwYIPVBudS3XRg5OfUza5BbOyu2mmJQa8uPxFR30YuJ6RWgfoV5POhIwmfRnsUouAZZYhCreQjA-1_7aGakeQ"
             style="" />
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-on-surface truncate" style="">연진호</p>
            <p class="text-xs text-slate-500 truncate" style="">마이프로필</p>
        </div>
    </a>
</aside>

<div class="md:ml-64">
    <main class="pt-20 pb-32 px-4 max-w-md mx-auto space-y-6 md:max-w-4xl md:px-8">
        <!-- Filter Chips -->
        <div class="flex gap-2 overflow-x-auto no-scrollbar py-2">
            <button
                    class="px-5 py-2 rounded-full bg-primary text-white text-sm font-medium transition-all shadow-sm shrink-0">This
                Month</button>
            <button
                    class="px-5 py-2 rounded-full bg-surface-container-highest text-on-surface-variant text-sm font-medium hover:bg-[#f3f3f8] transition-colors shrink-0">This
                Week</button>
            <button
                    class="px-5 py-2 rounded-full bg-surface-container-highest text-on-surface-variant text-sm font-medium hover:bg-[#f3f3f8] transition-colors shrink-0">Last
                Month</button>
            <button
                    class="px-5 py-2 rounded-full bg-surface-container-highest text-on-surface-variant text-sm font-medium hover:bg-[#f3f3f8] transition-colors flex items-center gap-1 shrink-0">
                <span>Custom Range</span>
                <span class="material-symbols-outlined text-sm">calendar_month</span>
            </button>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 items-stretch">
            <!-- Earnings Overview Hero -->
            <section class="space-y-4">
                <div
                        class="kinetic-gradient rounded-[2rem] p-8 text-white shadow-[0px_12px_32px_rgba(0,88,188,0.12)] relative overflow-hidden h-full flex flex-col justify-center">
                    <div class="relative z-10">
                        <p class="text-white/70 text-xs font-medium uppercase tracking-widest mb-1">Total Balance
                        </p>
                        <div class="flex items-baseline gap-2 mb-6">
                            <h2 class="text-3xl sm:text-4xl lg:text-5xl font-bold tracking-tight">₩2,400,000</h2>
                            <span class="text-sm font-semibold bg-white/20 px-2 py-0.5 rounded-lg">+12%</span>
                        </div>
                        <div class="grid grid-cols-2 gap-4 pt-6 border-t border-white/10">
                            <div>
                                <p class="text-white/60 text-[10px] uppercase tracking-wider mb-1">Sessions</p>
                                <p class="text-lg font-semibold">42 <span
                                        class="text-xs font-normal opacity-70">pts</span> <span
                                        class="ml-1 text-[10px] text-green-300 font-bold">(+12%)</span></p>
                            </div>
                            <div>
                                <p class="text-white/60 text-[10px] uppercase tracking-wider mb-1">Avg / Session</p>
                                <p class="text-lg font-semibold">₩57,000 <span
                                        class="ml-1 text-[10px] text-red-300 font-bold">(-5%)</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="absolute -right-12 -top-12 w-48 h-48 bg-white/5 rounded-full blur-3xl"></div>
                    <div class="absolute -left-12 -bottom-12 w-48 h-48 bg-black/5 rounded-full blur-3xl"></div>
                </div>
            </section>
            <!-- Payouts Section -->
            <section class="bg-surface-container-low rounded-[2rem] p-6 space-y-6 flex flex-col justify-between">
                <div>
                    <div class="flex justify-between items-center mb-4">
                        <div>
                            <p class="text-on-surface-variant text-xs font-medium uppercase tracking-wider mb-1">
                                Available for withdrawal</p>
                            <p class="text-3xl font-bold text-primary">₩800,000</p>
                        </div>
                        <div class="text-right">
                            <p class="text-on-surface-variant text-xs font-medium uppercase tracking-wider mb-1">
                                Next Payout</p>
                            <p class="text-sm font-bold text-on-surface">Apr 5, 2024</p>
                        </div>
                    </div>
                    <button
                            class="w-full kinetic-gradient text-white font-bold py-4 rounded-2xl shadow-lg active:scale-[0.98] transition-all">View
                        Earnings History</button>
                    <p class="text-center text-[11px] text-on-surface-variant mt-3">
                        Last payout: May 5 · <span class="font-semibold">₩1,200,000</span>
                    </p>
                </div>
                <div class="pt-4 border-t border-outline-variant/20 flex justify-between items-center">
                    <span class="text-sm text-on-surface-variant">Estimated Monthly Total</span>
                    <span class="text-sm font-bold text-on-surface">₩3,200,000</span>
                </div>
            </section>
        </div>
        <!-- Insights Card -->
        <section class="bg-surface-container-lowest p-6 rounded-[2rem] border border-outline-variant/20 shadow-sm">
            <div class="flex items-center gap-2 mb-4">
                <span class="material-symbols-outlined text-primary text-xl">auto_awesome</span>
                <h3 class="text-lg font-bold">Insights</h3>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="flex items-start gap-3 p-3 rounded-2xl bg-green-50/50">
                    <span class="material-symbols-outlined text-green-600 text-sm mt-0.5">trending_up</span>
                    <p class="text-sm text-on-surface font-medium">Revenue increased <span
                            class="text-green-600 font-bold">+12%</span> vs last month</p>
                </div>
                <div class="flex items-start gap-3 p-3 rounded-2xl bg-blue-50/50">
                    <span class="material-symbols-outlined text-blue-600 text-sm mt-0.5">analytics</span>
                    <p class="text-sm text-on-surface font-medium"><span class="text-blue-600 font-bold">1:1
                                PT</span> generates 62% of total income</p>
                </div>
                <div class="flex items-start gap-3 p-3 rounded-2xl bg-orange-50/50">
                    <span class="material-symbols-outlined text-orange-600 text-sm mt-0.5">trending_down</span>
                    <p class="text-sm text-on-surface font-medium">Package revenue decreased by <span
                            class="text-orange-600 font-bold">5%</span></p>
                </div>
            </div>
        </section>
        <!-- Earnings Breakdown -->
        <section class="space-y-4">
            <h3 class="text-lg font-bold px-1">Source Breakdown</h3>
            <div class="bg-surface-container-lowest rounded-[2rem] p-6 border border-outline-variant/10 shadow-sm">
                <div class="flex flex-col md:flex-row items-center gap-8">
                    <!-- Donut Chart -->
                    <div class="relative w-40 h-40 shrink-0">
                        <svg class="w-full h-full transform -rotate-90" viewbox="0 0 36 36">
                            <circle cx="18" cy="18" fill="transparent" r="15.915" stroke="#f3f3f8"
                                    stroke-width="4.5"></circle>
                            <circle cx="18" cy="18" fill="transparent" r="15.915" stroke="#ffb595"
                                    stroke-dasharray="12.5 87.5" stroke-dashoffset="0" stroke-width="4.5"></circle>
                            <circle cx="18" cy="18" fill="transparent" r="15.915" stroke="#a1befd"
                                    stroke-dasharray="25 75" stroke-dashoffset="-12.5" stroke-width="4.5"></circle>
                            <circle cx="18" cy="18" fill="transparent" r="15.915" stroke="#0058bc"
                                    stroke-dasharray="62.5 37.5" stroke-dashoffset="-37.5" stroke-linecap="round"
                                    stroke-width="5"></circle>
                        </svg>
                        <div class="absolute inset-0 flex flex-col items-center justify-center">
                                <span
                                        class="text-[10px] uppercase tracking-widest text-on-surface-variant font-bold">Total</span>
                            <span class="text-xl font-black text-on-surface">₩2.4M</span>
                        </div>
                    </div>
                    <!-- Categorized Cards -->
                    <div class="flex-1 grid grid-cols-1 sm:grid-cols-3 gap-3 w-full">
                        <div
                                class="p-4 rounded-2xl border-l-4 border-primary bg-surface-container-low flex flex-col justify-center">
                            <p class="text-[10px] text-on-surface-variant uppercase font-bold tracking-wider mb-1">
                                1:1 PT (62.5%)</p>
                            <p class="text-lg font-bold">₩1,500,000</p>
                        </div>
                        <div
                                class="p-4 rounded-2xl border-l-4 border-secondary-container bg-surface-container-low flex flex-col justify-center">
                            <p class="text-[10px] text-on-surface-variant uppercase font-bold tracking-wider mb-1">
                                Group PT (25%)</p>
                            <p class="text-lg font-bold">₩600,000</p>
                        </div>
                        <div
                                class="p-4 rounded-2xl border-l-4 border-tertiary-fixed-dim bg-surface-container-low flex flex-col justify-center">
                            <p class="text-[10px] text-on-surface-variant uppercase font-bold tracking-wider mb-1">
                                Packages (12.5%)</p>
                            <p class="text-lg font-bold">₩300,000</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Revenue Trends Section -->
        <section class="space-y-4">
            <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center px-1 gap-4">
                <h3 class="text-lg font-bold">Revenue Trends</h3>
                <div class="flex items-center gap-1 bg-surface-container-high p-1 rounded-xl">
                    <button
                            class="px-3 py-1.5 rounded-lg text-xs font-bold transition-all bg-surface-container-lowest text-on-surface shadow-sm">Monthly</button>
                    <button
                            class="px-3 py-1.5 rounded-lg text-xs font-bold transition-all text-on-surface-variant hover:bg-surface-container-lowest/50">Weekly</button>
                    <button
                            class="px-3 py-1.5 rounded-lg text-xs font-bold transition-all text-on-surface-variant hover:bg-surface-container-lowest/50">Yearly</button>
                </div>
            </div>
            <div class="bg-surface-container-lowest p-6 rounded-[2rem] shadow-sm border border-outline-variant/10">
                <div class="flex h-64">
                    <!-- Y-Axis Labels -->
                    <div
                            class="flex flex-col justify-between text-[10px] font-bold text-on-surface-variant pr-4 py-3 border-r border-outline-variant/10">
                        <span>₩3.0M</span>
                        <span>₩2.0M</span>
                        <span>₩1.0M</span>
                        <span>0</span>
                    </div>
                    <div class="flex-1 flex items-end justify-between gap-2 px-4 relative">
                        <svg class="absolute inset-0 w-full h-full pointer-events-none z-20 px-4"
                             preserveaspectratio="none" viewbox="0 0 600 200" xmlns="http://www.w3.org/2000/svg">
                            <defs>
                                <filter height="140%" id="glow" width="140%" x="-20%" y="-20%">
                                    <fegaussianblur result="blur" stddeviation="3"></fegaussianblur>
                                    <fecomposite in="SourceGraphic" in2="blur" operator="over"></fecomposite>
                                </filter>
                            </defs>
                            <path
                                    d="M 50 130 C 100 130, 100 110, 150 110 C 200 110, 200 80, 250 80 C 300 80, 300 120, 350 120 C 400 120, 400 90, 450 90 C 500 90, 500 60, 550 60"
                                    fill="none" filter="url(#glow)" stroke="#007AFF" stroke-linecap="round"
                                    stroke-width="4"></path>
                            <circle cx="250" cy="80" fill="#007AFF" r="5" stroke="white" stroke-width="2"></circle>
                            <circle cx="550" cy="60" fill="#007AFF" r="5" stroke="white" stroke-width="2"></circle>
                            <!-- Peak Annotation -->
                            <g transform="translate(250, 75)">
                                <rect fill="#1a1c1f" height="25" rx="6" width="80" x="-40" y="-35"></rect>
                                <text fill="white" font-size="10" font-weight="bold" text-anchor="middle" x="0"
                                      y="-18">Highest: ₩2.5M</text>
                                <path d="M -5 -10 L 0 -5 L 5 -10" fill="#1a1c1f"></path>
                            </g>
                        </svg>
                        <!-- Months -->
                        <div class="flex-1 flex flex-col items-center gap-3">
                            <div class="w-full bg-[#007AFF]/5 rounded-t-xl h-[65%]"></div>
                            <span
                                    class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">Oct</span>
                        </div>
                        <div class="flex-1 flex flex-col items-center gap-3">
                            <div class="w-full bg-[#007AFF]/5 rounded-t-xl h-[75%]"></div>
                            <span
                                    class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">Nov</span>
                        </div>
                        <div class="flex-1 flex flex-col items-center gap-3">
                            <div class="w-full bg-[#007AFF]/10 rounded-t-xl h-[90%]"></div>
                            <span
                                    class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">Dec</span>
                        </div>
                        <div class="flex-1 flex flex-col items-center gap-3">
                            <div class="w-full bg-[#007AFF]/5 rounded-t-xl h-[70%]"></div>
                            <span
                                    class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">Jan</span>
                        </div>
                        <div class="flex-1 flex flex-col items-center gap-3">
                            <div class="w-full bg-[#007AFF]/5 rounded-t-xl h-[85%]"></div>
                            <span
                                    class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">Feb</span>
                        </div>
                        <div class="flex-1 flex flex-col items-center gap-3">
                            <div
                                    class="w-full bg-primary/20 rounded-t-xl h-[100%] shadow-[0px_4px_12px_rgba(0,122,255,0.1)] border-t-2 border-primary">
                            </div>
                            <span class="text-[10px] font-bold text-primary uppercase tracking-wider">Mar</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Transaction History -->
        <section class="space-y-4">
            <div class="flex justify-between items-center px-1">
                <h3 class="text-lg font-bold">Recent Transactions</h3>
                <button class="text-primary text-sm font-bold">View All</button>
            </div>
            <!-- Transactions Utility Bar -->
            <div
                    class="flex flex-col sm:flex-row gap-3 bg-surface-container-low p-2 rounded-2xl border border-outline-variant/10">
                <div class="relative flex-1">
                        <span
                                class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-lg">search</span>
                    <input
                            class="w-full pl-10 pr-4 py-2 bg-surface-container-lowest border-none rounded-xl text-sm focus:ring-2 focus:ring-primary/20"
                            placeholder="Search transactions..." type="text" />
                </div>
                <div class="flex gap-2">
                    <select
                            class="bg-surface-container-lowest border-none rounded-xl text-xs font-bold py-2 pl-3 pr-8 focus:ring-2 focus:ring-primary/20">
                        <option>All Status</option>
                        <option>Completed</option>
                        <option>Pending</option>
                    </select>
                    <select
                            class="bg-surface-container-lowest border-none rounded-xl text-xs font-bold py-2 pl-3 pr-8 focus:ring-2 focus:ring-primary/20">
                        <option>Newest</option>
                        <option>Highest</option>
                        <option>Lowest</option>
                    </select>
                </div>
            </div>
            <div class="space-y-3">
                <!-- Transaction Item 1 -->
                <div
                        class="bg-surface-container-lowest p-4 rounded-[1.5rem] flex items-center justify-between transition-all hover:shadow-md border border-outline-variant/5">
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 rounded-full overflow-hidden bg-surface-container-low">
                            <img class="w-full h-full object-cover"
                                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuB2GzaZa_TTb9A5YfpPr9GP_NsDIK3qVGcuD3go2WO8nCCeYD_mscVa0T5qxIldm8zHjLKbBERt9h6M2V3CYTPuoimdXikd41NdVfS8BSQGMHo5YeBNb3H55fSLvRS2X_PbAGtwdMykp3sldAYYAR3bHBuKXFzddZ9A1PE4brOg3_jXaHnzyZIi_aMmX_LnFbZO-yFIZNkAemJ1CiQtbbaY49J3TO4ljIIp9P6Et0id8AJp3Q4HuM2I3uYqj9b1XycwJIPtiE4dR05Z" />
                        </div>
                        <div>
                            <div class="flex items-center gap-2 mb-0.5">
                                <p class="font-bold text-on-surface">김민수</p>
                                <span
                                        class="px-2 py-0.5 bg-primary/10 text-primary text-[9px] font-black rounded-full uppercase">1:1
                                        PT</span>
                            </div>
                            <p class="text-xs text-on-surface-variant">Mar 28 · <span
                                    class="font-medium text-green-600 flex items-center inline-flex gap-0.5"><span
                                    class="material-symbols-outlined text-xs">check_circle</span>Completed</span>
                            </p>
                        </div>
                    </div>
                    <div class="text-right">
                        <p class="font-bold text-on-surface text-lg">+₩60,000</p>
                    </div>
                </div>
                <!-- Transaction Item 2 -->
                <div
                        class="bg-surface-container-lowest p-4 rounded-[1.5rem] flex items-center justify-between transition-all hover:shadow-md border border-outline-variant/5">
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 rounded-full overflow-hidden bg-surface-container-low">
                            <img class="w-full h-full object-cover"
                                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuDXUX3ql8KqYXeNJRNqXFsVEsig9I7Mhm4zXlmJVS2yTnBwxpCe7x7O6O5X_b71uwGm5nIZBu-VYs-fI9YI8A38Kl3Bw42LGliLCS5OI-XXmJuyWqhgmGeTmtOYVDovDhtoETPYlwkdVMYF59XyPbTawmxJIAIMPVuJNMio_eiNNP3OFuNLWHbcG7tgRsAShMQfCiUkccsk_7-LLEaDa2WEkAqrHZtxqsUXoCXnGz2mBUMLoHjZXs3ZCffOWw4bTZYuc9nxO2V9TfNB" />
                        </div>
                        <div>
                            <div class="flex items-center gap-2 mb-0.5">
                                <p class="font-bold text-on-surface">이서연</p>
                                <span
                                        class="px-2 py-0.5 bg-orange-100 text-orange-800 text-[9px] font-black rounded-full uppercase">Package</span>
                            </div>
                            <p class="text-xs text-on-surface-variant">Mar 27 · <span
                                    class="font-medium text-green-600 flex items-center inline-flex gap-0.5"><span
                                    class="material-symbols-outlined text-xs">check_circle</span>Completed</span>
                            </p>
                        </div>
                    </div>
                    <div class="text-right">
                        <p class="font-bold text-on-surface text-lg">+₩300,000</p>
                    </div>
                </div>
                <!-- Transaction Item 3 -->
                <div
                        class="bg-surface-container-lowest p-4 rounded-[1.5rem] flex items-center justify-between transition-all hover:shadow-md border border-outline-variant/5">
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 rounded-full overflow-hidden bg-surface-container-low">
                            <img class="w-full h-full object-cover"
                                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuCmL4Ju61uvQQWw8qytRwh4n9_9ZbA0rGFeBtUgthTWtY5gjgngrdVTLyhwCqaCwhj-y1EGzG0rEMM91fdkyLQOooXNUN6SXprPG6Y7KotydxOtf9j6mBP6Oyyd-_XYLnMQ67BRxi7iUq_gPMQNdsyPmteeNlGnziosvEMR3C0NmjPLN3GyxETAaGVOAwFkf-IGheh0m71zu-jweGQmfqnMj4o-ncFg9G0jPrR2CV-o4EYypQ7_XE0jnctfIA69jpBCT01Oibv5_2eu" />
                        </div>
                        <div>
                            <div class="flex items-center gap-2 mb-0.5">
                                <p class="font-bold text-on-surface">박지훈</p>
                                <span
                                        class="px-2 py-0.5 bg-blue-100 text-blue-800 text-[9px] font-black rounded-full uppercase">Group</span>
                            </div>
                            <p class="text-xs text-on-surface-variant">Mar 26 · <span
                                    class="font-medium text-orange-600 flex items-center inline-flex gap-0.5"><span
                                    class="material-symbols-outlined text-xs">schedule</span>Pending</span></p>
                        </div>
                    </div>
                    <div class="text-right">
                        <p class="font-bold text-on-surface text-lg">+₩45,000</p>
                    </div>
                </div>
                <!-- Transaction Item 4 -->
                <div
                        class="bg-surface-container-lowest p-4 rounded-[1.5rem] flex items-center justify-between transition-all hover:shadow-md border border-outline-variant/5">
                    <div class="flex items-center gap-4">
                        <div class="w-12 h-12 rounded-full overflow-hidden bg-surface-container-low">
                            <img class="w-full h-full object-cover"
                                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuBbNpvRkOfpGSNRqQC9qWJR7ZcDh9h1U_PfkGKL9vNoH5ZBn3AdifyrO1cD0TkpAceJqg1BxwnI28BUE_H4QYvdkrAn0lBhlGjqpPnQpz36UUHG2NZBdtTWFkgjDHdbTD4r-LEz-fNldELCvwhRdzYAnoBIU8GdY0VImaJSq3iT6CaV7LZcehUO7JJAkF0c8rCI6jiBXhbO0-zCG3OVHIoR3KfFLUouexguXpBpOl60l5SpQ--dHGQe60nkWgS-hjsofiW8rCtvy8AF" />
                        </div>
                        <div>
                            <div class="flex items-center gap-2 mb-0.5">
                                <p class="font-bold text-on-surface">최수아</p>
                                <span
                                        class="px-2 py-0.5 bg-primary/10 text-primary text-[9px] font-black rounded-full uppercase">1:1
                                        PT</span>
                            </div>
                            <p class="text-xs text-on-surface-variant">Mar 25 · <span
                                    class="font-medium text-green-600 flex items-center inline-flex gap-0.5"><span
                                    class="material-symbols-outlined text-xs">check_circle</span>Completed</span>
                            </p>
                        </div>
                    </div>
                    <div class="text-right">
                        <p class="font-bold text-on-surface text-lg">+₩60,000</p>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

<!-- BottomNavBar (Mobile) -->
<nav
        class="fixed bottom-0 left-0 w-full z-50 bg-[#f9f9fe]/90 backdrop-blur-2xl rounded-t-3xl shadow-[0px_-12px_32px_rgba(0,88,188,0.08)] md:hidden">
    <div class="flex justify-around items-center px-4 py-3 pb-8">
        <a class="flex flex-col items-center justify-center text-[#414755] opacity-60 transition-all hover:text-[#0058bc]"
           href="#">
            <span class="material-symbols-outlined">dashboard</span>
            <span class="font-['Inter'] text-[10px] font-medium tracking-wide uppercase mt-1">Dashboard</span>
        </a>
        <a class="flex flex-col items-center justify-center text-[#414755] opacity-60 transition-all hover:text-[#0058bc]"
           href="#">
            <span class="material-symbols-outlined">group</span>
            <span class="font-['Inter'] text-[10px] font-medium tracking-wide uppercase mt-1">Clients</span>
        </a>
        <a class="flex flex-col items-center justify-center text-[#414755] opacity-60 transition-all hover:text-[#0058bc]"
           href="#">
            <span class="material-symbols-outlined">calendar_today</span>
            <span class="font-['Inter'] text-[10px] font-medium tracking-wide uppercase mt-1">Schedule</span>
        </a>
        <a class="flex flex-col items-center justify-center text-[#0058bc] scale-110 transition-all" href="#">
            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">payments</span>
            <span class="font-['Inter'] text-[10px] font-bold tracking-wide uppercase mt-1">Earnings</span>
        </a>
    </div>
</nav>
</body>
</html>
