<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/28/26
  Time: 1:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&amp;display=swap" rel="stylesheet" />
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet" />
    <script
            id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "surface-container-lowest": "#ffffff", "on-primary": "#ffffff", "secondary-fixed": "#d8e2ff", "tertiary-container": "#c64f00", "on-secondary": "#ffffff", "on-tertiary": "#ffffff", background: "#f9f9fe", secondary: "#405e96", "on-background": "#1a1c1f", "surface-dim": "#d9dade", "secondary-container": "#a1befd", "primary-fixed": "#d8e2ff", tertiary: "#9e3d00", "on-tertiary-container": "#fffbff", "primary-fixed-dim": "#adc6ff", "surface-container-high": "#e8e8ed", "on-secondary-fixed-variant": "#26467d", "surface-container-low": "#f3f3f8", "on-surface-variant": "#414755", "secondary-fixed-dim": "#adc6ff", "tertiary-fixed-dim": "#ffb595", "on-primary-container": "#fefcff", "error-container": "#ffdad6", "inverse-on-surface": "#f0f0f5", "on-secondary-container": "#2d4c83", "surface-container-highest": "#e2e2e7", "surface-bright": "#f9f9fe", surface: "#f9f9fe", "on-surface": "#1a1c1f", primary: "#0058bc", "on-tertiary-fixed-variant": "#7c2e00", "outline-variant": "#c1c6d7", "primary-container": "#0070eb", outline: "#717786", "on-error-container": "#93000a", "inverse-surface": "#2e3034", "surface-tint": "#005bc1", "on-primary-fixed-variant": "#004493", "surface-container": "#ededf2", "on-error": "#ffffff", "inverse-primary": "#adc6ff", error: "#ba1a1a", "on-tertiary-fixed": "#351000", "surface-variant": "#e2e2e7", "tertiary-fixed": "#ffdbcc", "on-secondary-fixed": "#001a41", "on-primary-fixed": "#001a41" }, fontFamily: { headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter" }, borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" } } } };</script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }

        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        body {
            min-height: 100vh;
        }
    </style>
</head>
<body class="bg-background text-on-background font-body antialiased" data-mode="connect">
<!-- Persistent Sidebar Navigation (Desktop) -->
<aside
        class="fixed left-0 top-0 h-full w-64 bg-slate-50 dark:bg-slate-900 transition-colors duration-200 z-20 flex flex-col p-6">
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
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-blue-700 border-r-4 border-blue-700 bg-slate-200/50 transition-colors duration-200"
           href="/clients.html" style=""><span class="material-symbols-outlined" data-icon="" style="">group</span>
            회원
            관리</a>

        <!-- 일정 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/calendar.html" style=""><span class="material-symbols-outlined" data-icon=""
                                                style="">calendar_today</span> 일정</a>

        <!-- 메시지 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">chat</span> 메시지</a>

        <!-- 수익 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">payments</span>
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

<div class="md:ml-64 min-h-screen flex flex-col">
    <!-- Top Navigation -->
    <header
            class="sticky top-0 w-full z-40 bg-white/80 backdrop-blur-xl border-b border-outline-variant/20 flex justify-between items-center px-8 h-16">
        <div class="flex items-center gap-4">
            <button class="hover:opacity-70 transition-opacity active:scale-95 duration-150 text-blue-700">
                <span class="material-symbols-outlined">arrow_back</span>
            </button>
            <h1 class="font-sans tracking-tight text-lg font-semibold text-on-surface">회원목록</h1>
        </div>
    </header>

    <main class="flex-1 p-8 max-w-6xl mx-auto w-full space-y-8">
        <!-- Client Overview Section -->
        <section class="bg-surface-container-lowest p-8 rounded-3xl shadow-sm border border-outline-variant/10">
            <div class="flex flex-col md:flex-row items-start md:items-center gap-8">
                <div class="relative">
                    <img alt="Profile of Kim Min-su" class="w-32 h-32 rounded-3xl object-cover shadow-lg"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuDRaM7aJPJccG2VqzuEQFnWzaty4vFhjpL-5fNEreSZkXZaMJ5w2gbFP2X82eqKZUp0SOMGtYAZojFrVr0Fign3C2EZQ-Ec48g_8roHzucGiFw1AckjjTTYJNp5qK9bmHgBJwxzMFtj-LYouo4jaW5KBk-O7YS7IA72oZGHvXpT1GY54kq_npmXyHJ9h_eHtm0lcLdvDeE_9iVYH5EgNO1uECszkkpo6Xp2mWrdBHkpWNljrH0kMSPmRZM5Ztg3yD7t-YfJnvIWXQw5" />
                </div>
                <div class="flex-1 space-y-2">
                    <h2 class="text-4xl font-bold tracking-tighter text-on-surface">김민수</h2>
                    <p class="text-on-surface-variant text-lg font-medium">Age 29 • 175cm / 78kg</p>
                    <div class="flex flex-wrap gap-3 mt-4">
                        <div
                                class="inline-flex items-center gap-2 px-4 py-1.5 bg-surface-container-low rounded-full border border-outline-variant/20">
                            <span class="material-symbols-outlined text-[16px] text-tertiary">track_changes</span>
                            <span class="text-xs font-semibold text-on-surface-variant">체지방 감량</span>
                        </div>
                    </div>
                </div>
                <div class="flex gap-4 w-full md:w-auto">
                    <div
                            class="bg-surface-container-low px-6 py-4 rounded-2xl flex-1 md:flex-initial text-center border border-outline-variant/10">
                        <p class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest mb-1">
                            Current Weight</p>
                        <div class="flex items-baseline justify-center gap-1">
                            <span class="text-3xl font-bold text-primary">78</span>
                            <span class="text-sm font-medium text-on-surface-variant">kg</span>
                        </div>
                    </div>
                    <div
                            class="bg-surface-container-low px-6 py-4 rounded-2xl flex-1 md:flex-initial text-center border border-outline-variant/10">
                        <p class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest mb-1">
                            Sessions</p>
                        <div>Remaining</div>
                        <p></p>
                        <div class="flex items-baseline justify-center gap-1">
                            <span class="text-3xl font-bold text-on-surface">12</span>
                            <span class="text-sm font-medium text-on-surface-variant">/ 20</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Main Layout Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            <!-- Left Column: Overview & Stats -->
            <div class="lg:col-span-8 space-y-8">
                <!-- Segmented Control -->
                <nav class="flex gap-1 p-1.5 bg-surface-container-low rounded-2xl w-max">
                    <button
                            class="px-8 py-2.5 text-sm font-semibold text-primary bg-surface-container-lowest rounded-xl shadow-sm transition-all">Overview</button>
                    <button
                            class="px-8 py-2.5 text-sm font-medium text-on-surface-variant hover:text-on-surface transition-colors">Diet</button>
                    <button
                            class="px-8 py-2.5 text-sm font-medium text-on-surface-variant hover:text-on-surface transition-colors">Workouts</button>
                    <button
                            class="px-8 py-2.5 text-sm font-medium text-on-surface-variant hover:text-on-surface transition-colors">InBody</button>
                </nav>
                <!-- Body Composition Trends -->
                <section class="space-y-4">
                    <div class="flex justify-between items-end">
                        <div class="space-y-1">
                            <h3 class="text-2xl font-bold tracking-tight">Body Composition Trends</h3>
                            <p class="text-sm text-on-surface-variant font-medium">Track weight, muscle mass, and
                                body fat over time</p>
                        </div>
                        <span
                                class="text-primary text-xs font-bold flex items-center gap-1 cursor-pointer hover:underline">VIEW
                                ALL <span class="material-symbols-outlined text-xs">arrow_forward</span></span>
                    </div>
                    <div
                            class="bg-surface-container-lowest p-8 rounded-3xl border border-outline-variant/10 space-y-8">
                        <!-- Summary Stats Cards -->
                        <div class="grid grid-cols-3 gap-4">
                            <div class="p-4 rounded-2xl bg-primary/5 border border-primary/10">
                                <p class="text-[10px] font-bold text-primary uppercase tracking-widest mb-1">Weight
                                </p>
                                <div class="flex items-baseline gap-2">
                                    <span class="text-2xl font-bold text-on-surface">78</span>
                                    <span class="text-xs font-medium text-on-surface-variant">kg</span>
                                    <span class="text-[11px] font-bold text-primary ml-auto flex items-center"><span
                                            class="material-symbols-outlined text-sm">arrow_downward</span>
                                            7.2kg</span>
                                </div>
                            </div>
                            <div class="p-4 rounded-2xl bg-green-50 border border-green-100">
                                <p class="text-[10px] font-bold text-green-700 uppercase tracking-widest mb-1">
                                    Muscle Mass</p>
                                <div class="flex items-baseline gap-2">
                                    <span class="text-2xl font-bold text-on-surface">34</span>
                                    <span class="text-xs font-medium text-on-surface-variant">kg</span>
                                    <span
                                            class="text-[11px] font-bold text-green-700 ml-auto flex items-center"><span
                                            class="material-symbols-outlined text-sm">arrow_upward</span>
                                            1.5kg</span>
                                </div>
                            </div>
                            <div class="p-4 rounded-2xl bg-orange-50 border border-orange-100">
                                <p class="text-[10px] font-bold text-tertiary uppercase tracking-widest mb-1">Body
                                    Fat</p>
                                <div class="flex items-baseline gap-2">
                                    <span class="text-2xl font-bold text-on-surface">18</span>
                                    <span class="text-xs font-medium text-on-surface-variant">%</span>
                                    <span
                                            class="text-[11px] font-bold text-tertiary ml-auto flex items-center"><span
                                            class="material-symbols-outlined text-sm">arrow_downward</span>
                                            4%</span>
                                </div>
                            </div>
                        </div>
                        <!-- Multi-Line Graph Area -->
                        <div class="space-y-4">
                            <!-- Legend -->
                            <div class="flex justify-center gap-6">
                                <div class="flex items-center gap-2">
                                    <span class="w-2 h-2 rounded-full bg-primary"></span>
                                    <span
                                            class="text-[11px] font-bold text-on-surface-variant uppercase tracking-wider">Weight</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <span class="w-2 h-2 rounded-full bg-green-600"></span>
                                    <span
                                            class="text-[11px] font-bold text-on-surface-variant uppercase tracking-wider">Muscle
                                            Mass</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <span class="w-2 h-2 rounded-full bg-orange-500"></span>
                                    <span
                                            class="text-[11px] font-bold text-on-surface-variant uppercase tracking-wider">Body
                                            Fat %</span>
                                </div>
                            </div>
                            <div class="h-64 w-full relative">
                                <svg class="w-full h-full" preserveaspectratio="none" viewbox="0 0 400 200">
                                    <!-- Weight Line (Primary Blue) -->
                                    <path d="M0,160 Q100,150 200,120 T400,80" fill="none" stroke="#0058bc"
                                          stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></path>
                                    <circle cx="0" cy="160" fill="#0058bc" r="3" stroke="white" stroke-width="1.5">
                                    </circle>
                                    <circle cx="200" cy="120" fill="#0058bc" r="3" stroke="white"
                                            stroke-width="1.5"></circle>
                                    <circle cx="400" cy="80" fill="#0058bc" r="3" stroke="white" stroke-width="1.5">
                                    </circle>
                                    <!-- Muscle Mass Line (Green Tone) -->
                                    <path d="M0,180 Q100,175 200,170 T400,160" fill="none" stroke="#16a34a"
                                          stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></path>
                                    <circle cx="0" cy="180" fill="#16a34a" r="3" stroke="white" stroke-width="1.5">
                                    </circle>
                                    <circle cx="200" cy="170" fill="#16a34a" r="3" stroke="white"
                                            stroke-width="1.5"></circle>
                                    <circle cx="400" cy="160" fill="#16a34a" r="3" stroke="white"
                                            stroke-width="1.5"></circle>
                                    <!-- Body Fat Line (Orange Tone) -->
                                    <path d="M0,100 Q100,110 200,130 T400,140" fill="none" stroke="#f97316"
                                          stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></path>
                                    <circle cx="0" cy="100" fill="#f97316" r="3" stroke="white" stroke-width="1.5">
                                    </circle>
                                    <circle cx="200" cy="130" fill="#f97316" r="3" stroke="white"
                                            stroke-width="1.5"></circle>
                                    <circle cx="400" cy="140" fill="#f97316" r="3" stroke="white"
                                            stroke-width="1.5"></circle>
                                    <!-- Grid Lines (Subtle) -->
                                    <line stroke="#e2e2e7" stroke-dasharray="4" stroke-width="1" x1="0" x2="400"
                                          y1="40" y2="40"></line>
                                    <line stroke="#e2e2e7" stroke-dasharray="4" stroke-width="1" x1="0" x2="400"
                                          y1="100" y2="100"></line>
                                    <line stroke="#e2e2e7" stroke-dasharray="4" stroke-width="1" x1="0" x2="400"
                                          y1="160" y2="160"></line>
                                </svg>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Recent Meal -->
                <section class="space-y-4">
                    <div class="flex justify-between items-end">
                        <h3 class="text-2xl font-bold tracking-tight">Recent Meal</h3>
                        <span class="text-on-surface-variant text-sm font-medium">Today 12:30 PM</span>
                    </div>
                    <div
                            class="bg-surface-container-lowest p-6 rounded-3xl border border-outline-variant/10 space-y-6">
                        <div class="flex gap-6 items-center">
                            <img alt="Healthy meal bowl" class="w-24 h-24 rounded-2xl object-cover shadow-sm"
                                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuDtRTiOLbN7PHNXM5m46FGSACydTKXN7WG79apaHKenSPf-udoC2aL1sO9ZC74iyl4sRBwwJNqKKYap4fRLJQ7j2p745sHXcEd55MdUBqB7dbdB-QtVpntZNDqK18rchXW7pq4j9qumUI3R1svaIy9D8Ofg7PwkJneIYKx-CkB_KbSNqvQjyVqHnXYMw4AKJV5We-xGPU88_MQpu4REWdyGynLoTh797ltu_1kXZd1SE8hFbJQdEepCuNz9d-9c-xGnZDh1zdsVbO0y" />
                            <div class="flex-1">
                                <p class="text-xl font-bold text-on-surface">Chicken Salad &amp; Avocado</p>
                                <p class="text-on-surface-variant font-medium">High Protein • 420 kcal</p>
                                <div class="mt-2 flex gap-2">
                                        <span
                                                class="px-2 py-0.5 bg-green-50 text-green-700 text-[10px] font-bold rounded uppercase">Breakfast</span>
                                    <span
                                            class="px-2 py-0.5 bg-blue-50 text-blue-700 text-[10px] font-bold rounded uppercase">Healthy</span>
                                </div>
                            </div>
                        </div>
                        <div
                                class="bg-surface-container-low p-6 rounded-2xl relative border border-outline-variant/10">
                            <div
                                    class="absolute -top-2 left-6 w-4 h-4 bg-surface-container-low border-l border-t border-outline-variant/10 rotate-45">
                            </div>
                            <div class="space-y-4">
                                <div class="flex items-center gap-2">
                                        <span
                                                class="material-symbols-outlined text-primary text-[18px]">edit_note</span>
                                    <p class="text-xs font-bold text-primary uppercase tracking-widest">Trainer
                                        Feedback</p>
                                </div>
                                <div class="relative">
                                        <textarea
                                                class="w-full bg-transparent border-none p-0 text-on-surface placeholder:text-on-surface-variant/50 focus:ring-0 resize-none min-h-[80px]"
                                                placeholder="Add your feedback here..."></textarea>
                                </div>
                                <div class="flex justify-end">
                                    <button
                                            class="px-8 py-2.5 bg-primary text-white text-xs font-bold rounded-full hover:opacity-90 active:scale-95 transition-all shadow-md">
                                        POST FEEDBACK
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Recent Workout Section -->
                <section class="space-y-4 mt-8">
                    <div class="flex justify-between items-end">
                        <h3 class="text-2xl font-bold tracking-tight">Recent Workout</h3>
                        <span class="text-on-surface-variant text-sm font-medium">Today 10:00 AM</span>
                    </div>
                    <div
                            class="bg-surface-container-lowest p-6 rounded-3xl border border-outline-variant/10 space-y-6">
                        <div class="space-y-4">
                            <div
                                    class="flex items-center gap-4 p-3 hover:bg-surface-container-low rounded-2xl transition-colors">
                                <div
                                        class="w-10 h-10 rounded-xl bg-primary/10 flex items-center justify-center text-primary">
                                    <span class="material-symbols-outlined text-[20px]">fitness_center</span>
                                </div>
                                <div class="flex-1">
                                    <p class="font-bold text-on-surface">Bench Press (Barbell)</p>
                                    <p class="text-xs text-on-surface-variant font-medium">4 Sets × 10 Reps • 60kg
                                    </p>
                                </div>
                            </div>
                            <div
                                    class="flex items-center gap-4 p-3 hover:bg-surface-container-low rounded-2xl transition-colors">
                                <div
                                        class="w-10 h-10 rounded-xl bg-primary/10 flex items-center justify-center text-primary">
                                    <span class="material-symbols-outlined text-[20px]">fitness_center</span>
                                </div>
                                <div class="flex-1">
                                    <p class="font-bold text-on-surface">Incline DB Press</p>
                                    <p class="text-xs text-on-surface-variant font-medium">3 Sets × 12 Reps • 20kg
                                    </p>
                                </div>
                            </div>
                            <div
                                    class="flex items-center gap-4 p-3 hover:bg-surface-container-low rounded-2xl transition-colors">
                                <div
                                        class="w-10 h-10 rounded-xl bg-primary/10 flex items-center justify-center text-primary">
                                    <span class="material-symbols-outlined text-[20px]">reorder</span>
                                </div>
                                <div class="flex-1">
                                    <p class="font-bold text-on-surface">Tricep Pushdown (Cables)</p>
                                    <p class="text-xs text-on-surface-variant font-medium">3 Sets × 15 Reps • 25kg
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div
                                class="bg-surface-container-low p-6 rounded-2xl relative border border-outline-variant/10">
                            <div
                                    class="absolute -top-2 left-6 w-4 h-4 bg-surface-container-low border-l border-t border-outline-variant/10 rotate-45">
                            </div>
                            <div class="space-y-4">
                                <div class="flex items-center gap-2">
                                        <span
                                                class="material-symbols-outlined text-primary text-[18px]">edit_note</span>
                                    <p class="text-xs font-bold text-primary uppercase tracking-widest">Trainer
                                        Feedback</p>
                                </div>
                                <div class="relative">
                                        <textarea
                                                class="w-full bg-transparent border-none p-0 text-on-surface placeholder:text-on-surface-variant/50 focus:ring-0 resize-none min-h-[80px]"
                                                placeholder="Add your workout feedback here..."></textarea>
                                </div>
                                <div class="flex justify-end">
                                    <button
                                            class="px-8 py-2.5 bg-primary text-white text-xs font-bold rounded-full hover:opacity-90 active:scale-95 transition-all shadow-md">
                                        POST FEEDBACK
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- Right Column: Sidebar content -->
            <div class="lg:col-span-4 space-y-8">
                <!-- Upcoming Sessions -->
                <section class="space-y-4">
                    <h3 class="text-2xl font-bold tracking-tight">Upcoming Sessions</h3>
                    <div
                            class="bg-surface-container-lowest p-5 rounded-3xl border border-outline-variant/10 flex items-center gap-5 hover:bg-surface-container-low transition-colors cursor-pointer group">
                        <div
                                class="w-16 h-16 bg-blue-50 rounded-2xl flex flex-col items-center justify-center border border-blue-100 shadow-sm">
                            <span class="text-[10px] font-bold text-primary uppercase tracking-tighter">Oct</span>
                            <span class="text-2xl font-bold text-primary leading-none">24</span>
                        </div>
                        <div class="flex-1">
                            <p class="font-bold text-lg text-on-surface">Lower Body Strength</p>
                            <p class="text-sm text-on-surface-variant font-medium">Thursday • 14:00 PM</p>
                        </div>
                        <span
                                class="material-symbols-outlined text-on-surface-variant group-hover:translate-x-1 transition-transform">chevron_right</span>
                    </div>
                </section>
            </div>
        </div>
    </main>
</div>
</body>
</html>
