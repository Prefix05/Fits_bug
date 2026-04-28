<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/28/26
  Time: 1:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Fitzberg - Trainer Profile</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap"
          rel="stylesheet" />
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet" />
    <script
            id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "tertiary-container": "#c64f00", "error-container": "#ffdad6", "primary-fixed": "#d8e2ff", "on-primary-fixed-variant": "#004493", surface: "#f9f9fe", "secondary-fixed-dim": "#adc6ff", "secondary-fixed": "#d8e2ff", "on-background": "#1a1c1f", "surface-container-high": "#e8e8ed", "surface-container-lowest": "#ffffff", "surface-variant": "#e2e2e7", "surface-dim": "#d9dade", "on-error": "#ffffff", "surface-tint": "#005bc1", "on-surface": "#1a1c1f", "inverse-on-surface": "#f0f0f5", tertiary: "#9e3d00", primary: "#0058bc", "on-tertiary-container": "#fffbff", "on-tertiary": "#ffffff", "on-error-container": "#93000a", error: "#ba1a1a", "surface-container-highest": "#e2e2e7", "primary-container": "#0070eb", "on-secondary-container": "#2d4c83", "on-tertiary-fixed": "#351000", "on-primary": "#ffffff", "surface-container-low": "#f3f3f8", "outline-variant": "#c1c6d7", "on-secondary-fixed": "#001a41", "on-primary-container": "#fefcff", "on-primary-fixed": "#001a41", secondary: "#405e96", "on-surface-variant": "#414755", "tertiary-fixed": "#ffdbcc", "surface-container": "#ededf2", "tertiary-fixed-dim": "#ffb595", "primary-fixed-dim": "#adc6ff", outline: "#717786", "on-tertiary-fixed-variant": "#7c2e00", "surface-bright": "#f9f9fe", "secondary-container": "#a1befd", "on-secondary": "#ffffff", "inverse-surface": "#2e3034", "on-secondary-fixed-variant": "#26467d", "inverse-primary": "#adc6ff", background: "#f9f9fe" }, borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" }, fontFamily: { headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter" } } } };</script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .glass-nav {
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
        }

        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }

        .primary-gradient {
            background: linear-gradient(135deg, #0058bc 0%, #0070eb 100%);
        }
    </style>
</head>

<body class="bg-surface text-on-surface min-h-screen">
<!-- SideNavBar -->
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
           href="/dashboard.html" style=""><span class="material-symbols-outlined" data-icon="" style="">dashboard</span>
            대시보드</a>

        <!-- 회원관리 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/clients.html"><span class="material-symbols-outlined">group</span> 회원 관리</a>

        <!-- 일정 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">calendar_today</span> 일정</a>

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
       class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-blue-700 border-r-4 border-blue-700 bg-slate-200/50 transition-colors duration-200">
        <img alt="연진호" class="w-10 h-10 rounded-full object-cover shrink-0"
             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBmLhyuu6rdbT8CspzqySgGADnPxyIZWQ8JzIVzEVHSPkB3UoDOAnZJJhZ7cPpcvRt9El0mEpCGTPo-ipH8tmcW9-1VJX9uPfKjuW6-wnQk8l60TyYJuHFUx-ER7gH9tCPui0ZcXDuvH0okvDCPmNyngCwbTzX130D_1k-cU7r_UYLYwjc9G4FkGvBrwYIPVBudS3XRg5OfUza5BbOyu2mmJQa8uPxFR30YuJ6RWgfoV5POhIwmfRnsUouAZZYhCreQjA-1_7aGakeQ" />
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-blue-700 truncate">연진호</p>
            <p class="text-xs text-blue-500 truncate">마이프로필</p>
        </div>
    </a>
    </div>
</aside>
<!-- Main Canvas -->
<main class="lg:pl-64 min-h-screen">
    <div class="max-w-4xl mx-auto p-6 md:p-8">
        <!-- Page Header Actions -->
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
            <div>
                <h1 class="text-3xl font-bold tracking-tight text-on-surface" style="">내 프로필</h1>
                <p class="text-on-surface-variant" style="">공개 프로필 및 코칭 환경설정을 관리하세요.</p>
            </div>
            <button
                    class="px-5 py-2.5 rounded-xl bg-surface-container-high hover:bg-surface-variant text-on-surface font-semibold text-sm transition-all active:scale-95 border border-outline-variant/30"
                    onclick="window.location.href='./profileEdit.html'">
                수정하기
            </button>
        </div>
        <div class="space-y-6">
            <!-- New Banner Profile Identity -->
            <section
                    class="bg-surface-container-lowest rounded-[2rem] overflow-hidden border border-surface-variant/30 shadow-sm transition-all">
                <!-- Full-width Banner Image -->
                <div class="relative h-64 md:h-72 w-full overflow-hidden">
                    <img alt="Alex Fischer Physique" class="w-full h-full object-cover"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuDczhdCB-EUg-iAawPR07VChuOli3ozK146HuqqZPhbf3QXpHVq9ax_sjciFZ0HqHkZbZRw1xDcjaEX0vZhOQAgqpYeWx_f5YOcpERwi83YQhgOZ_-jNx7_SYqc1kxFHeVo7qxKaD2f0u1_a9u0LHm5YZNokgV5diFX0tqCC55Y0-HpeoO_dWx4onz4657w69botzN5uefXyXKWZy8HXiWz8b45F0aJj6zwwJs36AR32VJ3SgxnfLjCUB8s7eRFx_Tq6utZaGZbFCFt"
                         style="" />
                    <div class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent">
                    </div>
                </div>
                <!-- Content area under banner with overlapping avatar -->
                <div class="pt-8 pb-6 md:pt-10">
                    <div class="relative flex flex-col md:flex-row md:items-end justify-between gap-4 md:gap-8">
                        <div class="flex flex-col md:flex-row md:items-end gap-5 md:gap-8 px-8">
                            <!-- Circular Avatar -->
                            <div class="relative -mt-16 md:-mt-20 rounded-full">
                                <img alt="Alex Profile"
                                     class="w-32 h-32 rounded-full object-cover ring-6 ring-surface-container-lowest shadow-2xl aspect-square"
                                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuD9BYF7XyfJ5L8WloQLKnV0qWpWrjoSs6O6CP1yiSuQoQy9wrmxXkjpltx49ikOXVLV39MRVqA9xtPLcrmPXbmkpUR_wvVIm7yaAie5iTieYgeXV8gjG1J6DNJgnlMUZuXz6el3GVE0PBagfP7ZT5sL2jVFDMuFvx-1BnZAa1K6srLSfB6e_MJT6Dl6KuFSxN2A5-apdRDRaGYDKSWCOdt2o-bd6qSzM3DY5-wexvcRD7UEixszPaCPDOJSZgMLJ2ACe0CBSTbNYA-n"
                                     style="" />
                            </div>
                            <div class="pt-2 md:pt-2 space-y-3">
                                <div class="flex items-center flex-wrap gap-3 mb-1">
                                    <h2 class="text-3xl font-extrabold text-on-surface tracking-tight" style="">알렉스
                                        피셔</h2>
                                    <span
                                            class="flex items-center gap-1 px-3 py-0.5 rounded-full bg-blue-50 text-blue-600 text-[10px] font-bold uppercase tracking-wider border border-blue-100"
                                            style=""><span class="material-symbols-outlined text-xs"
                                                           style='font-variation-settings: "FILL" 1;'>verified</span>인증됨</span>
                                </div>
                                <!-- Trust indicators and social badges integrated -->
                                <div class="flex flex-wrap items-center gap-y-1.5 gap-x-5">
                                    <!-- Rating/Reviews -->
                                    <div class="flex items-center gap-2">
                                        <div
                                                class="flex items-center gap-1 bg-amber-50 px-2 py-0.5 rounded-lg border border-amber-100">
                                                <span class="material-symbols-outlined text-[16px] text-amber-500"
                                                      style='font-variation-settings: "FILL" 1;'>star</span>
                                            <span class="text-xs font-bold text-amber-900" style="">4.9</span>
                                        </div>
                                        <span class="text-xs text-on-surface-variant font-medium"
                                              style="">(150+)</span>
                                    </div>
                                    <!-- Total Clients -->
                                    <!-- Location -->
                                    <div class="flex items-center gap-2 text-on-surface-variant">
                                            <span class="material-symbols-outlined text-base text-primary/70"
                                                  style="">location_on</span>
                                        <span class="text-xs" style="">피츠버그 엘리트 센터</span>
                                    </div>
                                </div>
                                <!-- Social Badges -->
                                <div class="flex items-center gap-2 pt-1">
                                    <a class="flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-low text-on-surface-variant hover:bg-surface-container-high transition-colors border border-outline-variant/30"
                                       href="#" style="">
                                        <svg class="w-3.5 h-3.5 fill-current" viewbox="0 0 24 24">
                                            <path
                                                    d="M12 2.163c3.204 0 3.584.012 4.85.07 1.366.062 2.633.332 3.608 1.308.975.975 1.245 2.242 1.308 3.608.058 1.266.07 1.646.07 4.85s-.012 3.584-.07 4.85c-.062 1.366-.332 2.633-1.308 3.608-.975.975-2.242 1.245-3.608 1.308-1.266.058-1.646.07-4.85.07s-3.584-.012-4.85-.07c-1.366-.062-2.633-.332-3.608-1.308-.975-.975-1.245-2.242-1.308-3.608-.058-1.266-.07-1.646-.07-4.85s.012-3.584.07-4.85c.062-1.366.332-2.633 1.308-3.608.975-.975 2.242-1.245 3.608-1.308 1.266-.058 1.646-.07 4.85-.07zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.162 6.162 6.162 6.162-2.759 6.162-6.162-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.791-4-4s1.791-4 4-4 4 1.791 4 4-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z">
                                            </path>
                                        </svg>
                                        <span class="text-[10px] font-bold" style="">@alexfischer_fit</span>
                                    </a>
                                    <a class="flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-low text-on-surface-variant hover:bg-surface-container-high transition-colors border border-outline-variant/30"
                                       href="#" style="">
                                        <svg class="w-3.5 h-3.5 fill-current" viewbox="0 0 24 24">
                                            <path
                                                    d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z">
                                            </path>
                                        </svg>
                                        <span class="text-[10px] font-bold" style="">alexfischer</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Media Gallery -->
            <section
                    class="bg-surface-container-lowest p-6 md:p-8 rounded-[1.5rem] space-y-4 border border-surface-variant/30 shadow-sm overflow-hidden">
                <div class="flex items-center justify-between">
                    <h3 class="text-lg font-bold text-on-surface" style="">갤러리</h3>
                </div>
                <div class="flex overflow-x-auto gap-4 no-scrollbar -mx-6 md:-mx-8 px-6 md:px-8 pb-1">
                    <div class="min-w-[220px] md:min-w-[260px] transition-shadow">
                        <img alt="Gym setting" class="aspect-[4/5] object-cover rounded-xl w-full"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuAV3RJFvWiSbRxyPnsLDBbo68hmKdThmCrkojJUjeV_qwsHPBAaioEzJtXI0lgZYX9zguy0G73fAj7d5zrbOKcHNL4H6-quKrAurJnNWE01F9fgsjBsc7OKIAkIMauj5V8lf_7kA_hm3X9sIy_vRwwLOBA_UU3pxNjo5hFboKb-HNwohtDHUSHTlcUApMiKNo4yXh4I2J3CPPaD7xCsF8uZ9IHpWJyNzA57JR4TQmEGZtSJS6tmHD_JFK3prLrfPo6QAfPe8JIDKOzV"
                             style="" />
                    </div>
                    <div class="min-w-[220px] md:min-w-[260px] transition-shadow">
                        <img alt="Workout session" class="aspect-[4/5] object-cover rounded-xl w-full"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBDT39m5KZZGUk16HXjuf4E4kNtlixIKfuzkfuzkfzu5kzjOHsIoWQyG60wT-50yZu4jMixWqmj5eGQ7QOBVLfQUXdw4ID4-bFCQAJjHaq9Ia7hLVtapey1-ynfSzngVZoO_NK_JJElYlVfKnzBzjFCFk0D_j0LsGcPJstaUxHjdqlijUpglDOG6Rd4efMyy5v58JvPYUIPdvbv9rhhgBX5dsvjeavMdhEH_VPwRD-nA7DciWk_KZUSHsNPHKw195josQkkg-0fOOj4MLar"
                             style="" />
                    </div>
                    <div class="min-w-[220px] md:min-w-[260px] transition-shadow relative">
                        <img alt="Training equipment"
                             class="aspect-[4/5] object-cover rounded-xl w-full brightness-[0.8]"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuA0L295c_6UG_6DzUXOnLZKgM-w9d84DG-cOyxUXoGW_Rjh5C_YDDcbYxaG5j8y-0cmuDPugJa6YNoJyj5Xu93syzgwxvebNQ9Tx6T30ZP8cacq1OxKSraH80emwO7yASh6gVE9QY-Ug9R20oOMNGl4taRHrhe183452IpRRdm2iG1XXISGA-ZAcOHbLSjLnIILPcQsHgKlhNRyaA6EuzIjk-MqebU2aL-W9U56628CX3isZqY-7t7ACMdRhtmxs97RHLRWIkkoH_W"
                             style="" />
                        <div class="absolute inset-0 flex items-center justify-center">
                                <span class="material-symbols-outlined text-white text-4xl opacity-90"
                                      style="">play_circle</span>
                        </div>
                    </div>
                    <div class="min-w-[220px] md:min-w-[260px] transition-shadow">
                        <img alt="Fitness portrait" class="aspect-[4/5] object-cover rounded-xl w-full"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuAVAmTs6CQ4iN5IuBE1AwKj6vdZ0td1_TqM3WdvXO0YqxhLVAn-8DnrDxAtKf0Hn7EsNxlpY6JsopB44bJ6CTVocf5zotETEoagrLOXFS0YmWCcr5xj0xgqPwLqIu0HfzQ_su3zGnFtVuVRFWIZvrC0wUIuTUAHFFyuct4Wqv4tE-dl4Lh0eXiOxHBluShEr8XMWsPLHijmRtXz5-3KN7-o21SclIUKOKf2ZeJlepQT5MCQPUeGUZrL92MsOti0iKPgzfp6ctZ0GcEJ"
                             style="" />
                    </div>
                    <div class="min-w-[220px] md:min-w-[260px] transition-shadow relative cursor-pointer">
                        <img alt="Personal training"
                             class="aspect-[4/5] object-cover rounded-xl w-full blur-[2px] brightness-[0.6]"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBFKM0PdYot6fLzVh6-gFTbh1Mv3XgizbNqRzeTSsw5DW52Hg0E6CCwVRmshzmLsla22Q3_HWoGvPfPUeuFD3CBtllHgGic35VHynANAtVtOzhdLcjCXwahxhnz7P_yIhTWge42O-je1gOCP3YYciYbk8oEdHxutsxb2qG-9vUYoHyY4s69oxHkTLahrhgI9IGuoR8R_rzkbpvkAQBTmqLfo0rnhcUXlJYDhRSn5eeJYOGJUW9PWZq0MPUz7uXDQ05cvXlWs_gECu-i"
                             style="" />
                        <div class="absolute inset-0 flex items-center justify-center">
                            <span class="text-white font-bold text-base tracking-wide" style="">View more</span>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Bio Section -->
            <section
                    class="bg-surface-container-lowest p-6 md:p-8 rounded-[1.5rem] space-y-6 border border-surface-variant/30 shadow-sm">
                <div class="space-y-3">
                    <h3 class="text-lg font-bold text-on-surface" style="">소개</h3>
                    <div class="flex flex-wrap gap-2 pt-1">
                            <span
                                    class="px-3 py-1.5 rounded-full bg-surface-container-low text-[11px] font-bold border border-outline-variant/30 text-on-surface-variant"
                                    style="">체중 감량</span>
                        <span
                                class="px-3 py-1.5 rounded-full bg-surface-container-low text-[11px] font-bold border border-outline-variant/30 text-on-surface-variant"
                                style="">근비대</span>
                        <span
                                class="px-3 py-1.5 rounded-full bg-surface-container-low text-[11px] font-bold border border-outline-variant/30 text-on-surface-variant"
                                style="">재활</span>
                        <span
                                class="px-3 py-1.5 rounded-full bg-surface-container-low text-[11px] font-bold border border-outline-variant/30 text-on-surface-variant"
                                style="">영양 코칭</span>
                    </div>
                    <div class="prose prose-slate max-w-none">
                        <p class="text-on-surface-variant leading-relaxed text-base" style="">
                            Dedicated to transforming lives through science-backed training and sustainable
                            nutrition. With over a decade of experience training athletes and corporate
                            professionals in London, I specialize in metabolic conditioning and hypertrophy. My
                            approach isn't just about the sweat—it's about the strategy.... <span
                                class="text-[#007AFF] font-bold cursor-pointer" style="">더 보기</span>
                        </p>
                    </div>
                </div>
                <!-- Verified Certifications -->
                <div class="pt-6 border-t border-surface-variant/30">
                    <h4 class="text-[11px] font-bold text-on-surface-variant uppercase tracking-widest mb-4"
                        style="">인증된 자격증</h4>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                        <div
                                class="flex items-center gap-3 p-3 rounded-2xl bg-surface-container-low/50 border border-outline-variant/20">
                            <div
                                    class="w-10 h-10 rounded-xl bg-white shadow-sm flex items-center justify-center text-primary">
                                <span class="material-symbols-outlined text-2xl" style="">workspace_premium</span>
                            </div>
                            <div>
                                <p class="font-bold text-sm text-on-surface" style="">CPR/AED 심폐소생술 인증</p>
                                <p class="text-[10px] text-on-surface-variant font-medium" style="">National Academy
                                    of Sports Medicine</p>
                            </div>
                        </div>
                        <div
                                class="flex items-center gap-3 p-3 rounded-2xl bg-surface-container-low/50 border border-outline-variant/20">
                            <div
                                    class="w-10 h-10 rounded-xl bg-white shadow-sm flex items-center justify-center text-primary">
                                <span class="material-symbols-outlined text-2xl" style="">medical_services</span>
                            </div>
                            <div>
                                <p class="font-bold text-sm text-on-surface" style="">CPR/AED 심폐소생술 인증</p>
                                <p class="text-[10px] text-on-surface-variant font-medium" style="">American Red
                                    Cross</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Pricing & Availability -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <!-- Pricing -->
                <div
                        class="bg-surface-container-lowest p-6 rounded-[1.5rem] space-y-4 border border-surface-variant/30 shadow-sm">
                    <div class="flex items-center gap-2">
                        <span class="material-symbols-outlined text-primary text-xl" style="">payments</span>
                        <h3 class="font-bold text-sm text-on-surface" style="">1:1 트레이닝 비용</h3>
                    </div>
                    <div class="space-y-2">
                        <div class="flex justify-between items-center p-3 rounded-xl bg-surface-container-low">
                            <span class="text-xs font-medium" style="">1회 세션</span>
                            <span class="font-bold text-on-surface text-base" style="">₩60,000</span>
                        </div>
                        <div
                                class="flex justify-between items-center p-3 rounded-xl bg-primary/5 border border-primary/20">
                            <div class="flex flex-col">
                                <span class="text-xs font-bold text-primary" style="">10회 세션 패키지</span>
                                <span class="text-[9px] text-primary/70 font-bold uppercase tracking-wider"
                                      style="">가장 인기</span>
                            </div>
                            <span class="font-bold text-primary text-base" style="">10회 세션 패키지</span>
                        </div>
                    </div>
                </div>
                <!-- Availability -->
                <div
                        class="bg-surface-container-lowest p-6 rounded-[1.5rem] space-y-4 border border-surface-variant/30 shadow-sm">
                    <div class="flex items-center gap-2">
                        <span class="material-symbols-outlined text-primary text-xl" style="">calendar_month</span>
                        <h3 class="font-bold text-sm text-on-surface" style="">일정</h3>
                    </div>
                    <div class="space-y-3">
                        <div class="p-3 rounded-xl bg-surface-container-low border border-outline-variant/10">
                            <p class="text-xs font-bold" style="">월 - 금</p>
                            <p class="text-[10px] text-on-surface-variant mt-0.5" style="">07:00 AM - 08:00 PM</p>
                        </div>
                        <div class="px-1 flex items-center justify-between">
                            <button class="text-[11px] font-bold text-primary hover:underline" style="">캘린더
                                보기</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Client Reviews Section -->
            <section
                    class="bg-surface-container-lowest p-6 md:p-8 rounded-[1.5rem] space-y-6 border border-surface-variant/30 shadow-sm overflow-hidden relative">
                <div class="flex items-center justify-between">
                    <div class="space-y-0.5">
                        <h3 class="text-lg font-bold text-on-surface" style="">회원 후기</h3>
                        <div class="flex items-center gap-2">
                            <div class="flex items-center text-amber-500">
                                    <span class="material-symbols-outlined text-base"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                <span class="text-xs font-bold text-on-surface ml-1" style="">4.9</span>
                            </div>
                            <span class="text-[10px] text-on-surface-variant font-medium" style="">/ 5 (150+
                                    reviews)</span>
                        </div>
                    </div>
                    <button
                            class="w-9 h-9 rounded-full bg-surface-container-low hover:bg-surface-variant flex items-center justify-center transition-all active:scale-95 border border-outline-variant/20 shadow-sm group"
                            style="">
                            <span
                                    class="material-symbols-outlined text-on-surface text-base transition-transform group-hover:translate-x-0.5"
                                    style="">arrow_forward_ios</span>
                    </button>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <!-- Review Card 1 -->
                    <div
                            class="bg-surface-container-low/40 p-5 rounded-2xl border border-surface-variant/20 shadow-sm space-y-3 flex flex-col justify-between hover:shadow-md transition-shadow">
                        <div class="space-y-2">
                            <div class="flex items-center justify-between">
                                <div class="flex text-amber-500">
                                        <span class="material-symbols-outlined text-[14px]"
                                              style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                </div>
                                <span
                                        class="text-[9px] font-bold text-on-surface-variant/60 uppercase tracking-tight"
                                        style="">2주 전</span>
                            </div>
                            <p class="text-xs text-on-surface-variant leading-relaxed" style="">"Coach Alex
                                completely transformed my approach to fitness. The personalized plan is incredible!"
                            </p>
                        </div>
                        <div class="flex items-center gap-2 pt-3 border-t border-surface-variant/10">
                            <div class="w-7 h-7 rounded-full bg-primary/10 flex items-center justify-center text-primary text-[10px] font-bold"
                                 style="">JC</div>
                            <span class="text-xs font-bold text-on-surface" style="">James C.</span>
                        </div>
                    </div>
                    <!-- Review Card 2 -->
                    <div
                            class="bg-surface-container-low/40 p-5 rounded-2xl border border-surface-variant/20 shadow-sm space-y-3 flex flex-col justify-between hover:shadow-md transition-shadow">
                        <div class="space-y-2">
                            <div class="flex items-center justify-between">
                                <div class="flex text-amber-500">
                                        <span class="material-symbols-outlined text-[14px]"
                                              style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                </div>
                                <span
                                        class="text-[9px] font-bold text-on-surface-variant/60 uppercase tracking-tight"
                                        style="">1개월 전</span>
                            </div>
                            <p class="text-xs text-on-surface-variant leading-relaxed" style="">"The technical
                                knowledge Alex brings to each session is unmatched. Overcame a long plateau."</p>
                        </div>
                        <div class="flex items-center gap-2 pt-3 border-t border-surface-variant/10">
                            <div class="w-7 h-7 rounded-full bg-secondary/10 flex items-center justify-center text-secondary text-[10px] font-bold"
                                 style="">SM</div>
                            <span class="text-xs font-bold text-on-surface" style="">Sarah M.</span>
                        </div>
                    </div>
                    <!-- Review Card 3 -->
                    <div
                            class="bg-surface-container-low/40 p-5 rounded-2xl border border-surface-variant/20 shadow-sm space-y-3 flex flex-col justify-between hover:shadow-md transition-shadow">
                        <div class="space-y-2">
                            <div class="flex items-center justify-between">
                                <div class="flex text-amber-500">
                                        <span class="material-symbols-outlined text-[14px]"
                                              style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                    <span class="material-symbols-outlined text-[14px]"
                                          style='font-variation-settings: "FILL" 1;'>star</span>
                                </div>
                                <span
                                        class="text-[9px] font-bold text-on-surface-variant/60 uppercase tracking-tight"
                                        style="">3주 전</span>
                            </div>
                            <p class="text-xs text-on-surface-variant leading-relaxed" style="">"Professional,
                                motivating, and highly effective. Rehab exercises fixed my lower back pain."</p>
                        </div>
                        <div class="flex items-center gap-2 pt-3 border-t border-surface-variant/10">
                            <div class="w-7 h-7 rounded-full bg-tertiary/10 flex items-center justify-center text-tertiary text-[10px] font-bold"
                                 style="">DL</div>
                            <span class="text-xs font-bold text-on-surface" style="">David L.</span>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Location Section -->
            <section
                    class="bg-surface-container-lowest p-6 md:p-8 rounded-[1.5rem] space-y-4 border border-surface-variant/30 shadow-sm">
                <div class="space-y-1">
                    <h3 class="text-lg font-bold text-on-surface" style="">위치</h3>
                    <p class="text-on-surface-variant text-xs flex items-center gap-1" style="">
                        <span class="material-symbols-outlined text-sm text-primary" style="">location_on</span>
                        Fitzberg Elite Center · London, UK
                    </p>
                </div>
                <div
                        class="relative w-full h-[260px] md:h-[320px] rounded-2xl overflow-hidden border border-surface-variant/20 bg-slate-100">
                    <div class="absolute inset-0 bg-[#e5e3df]"
                         style="background-image: radial-gradient(#d1d1d1 1px, transparent 1px); background-size: 20px 20px;">
                    </div>
                    <div class="absolute top-3 right-3 flex flex-col gap-2">
                        <div
                                class="bg-white p-1.5 rounded-lg shadow-md flex flex-col border border-outline-variant/20">
                            <button
                                    class="p-1 hover:bg-surface-container-low transition-colors text-on-surface-variant"
                                    style=""><span class="material-symbols-outlined text-xl"
                                                   style="">add</span></button>
                            <div class="h-[1px] bg-outline-variant/20 w-full my-1"></div>
                            <button
                                    class="p-1 hover:bg-surface-container-low transition-colors text-on-surface-variant"
                                    style=""><span class="material-symbols-outlined text-xl"
                                                   style="">remove</span></button>
                        </div>
                        <button
                                class="bg-white p-2 rounded-lg shadow-md border border-outline-variant/20 text-on-surface-variant hover:bg-surface-container-low transition-colors"
                                style="">
                            <span class="material-symbols-outlined text-xl" style="">my_location</span>
                        </button>
                    </div>
                    <div class="absolute inset-0 flex items-center justify-center">
                        <div class="relative flex flex-col items-center">
                            <div
                                    class="bg-primary text-white p-1.5 rounded-full shadow-lg relative z-10 animate-bounce">
                                    <span class="material-symbols-outlined text-2xl"
                                          style='font-variation-settings: "FILL" 1;'>location_on</span>
                            </div>
                            <div class="w-3.5 h-1 bg-black/20 rounded-full blur-[2px] mt-[-3px]"></div>
                        </div>
                    </div>
                    <div class="absolute bottom-3 left-3">
                        <div
                                class="bg-white/90 backdrop-blur px-2 py-1 rounded-lg border border-outline-variant/20 shadow-sm">
                            <p class="text-[8px] font-bold text-on-surface-variant uppercase tracking-wider"
                               style="">Fitzberg Map Data</p>
                        </div>
                    </div>
                </div>
                <div class="flex justify-end">
                    <button class="text-xs font-bold text-primary hover:underline flex items-center gap-1"
                            style="">지도로 보기 <span class="material-symbols-outlined text-xs"
                                                  style="">open_in_new</span></button>
                </div>
            </section>
        </div>
    </div>
</main>
<!-- Bottom Navigation for Mobile -->
<div
        class="md:hidden fixed bottom-0 w-full bg-white border-t border-slate-100 px-6 py-3 flex justify-between items-center z-50">
    <button class="flex flex-col items-center gap-1 text-slate-400" style="">
        <span class="material-symbols-outlined" style="">dashboard</span>
    </button>
    <button class="flex flex-col items-center gap-1 text-slate-400" style="">
        <span class="material-symbols-outlined" style="">calendar_today</span>
    </button>
    <button class="flex flex-col items-center gap-1 text-blue-700" style="">
        <span class="material-symbols-outlined" style='font-variation-settings: "FILL" 1;'>person</span>
    </button>
    <button class="flex flex-col items-center gap-1 text-slate-400" style="">
        <span class="material-symbols-outlined" style="">notifications</span>
    </button>
</div>
</body>
</html>
