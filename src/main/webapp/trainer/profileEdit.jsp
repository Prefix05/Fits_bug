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
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&amp;display=swap"
          rel="stylesheet" />
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet" />
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "surface-container-low": "#f3f3f8",
                        "background": "#f9f9fe",
                        "error": "#ba1a1a",
                        "surface-container-lowest": "#ffffff",
                        "on-secondary-fixed": "#001a41",
                        "inverse-primary": "#adc6ff",
                        "surface": "#f9f9fe",
                        "secondary-fixed-dim": "#adc6ff",
                        "outline": "#717786",
                        "primary-fixed-dim": "#adc6ff",
                        "on-secondary": "#ffffff",
                        "on-tertiary-fixed-variant": "#7c2e00",
                        "tertiary-fixed-dim": "#ffb595",
                        "secondary-container": "#a1befd",
                        "primary-fixed": "#d8e2ff",
                        "secondary-fixed": "#d8e2ff",
                        "on-primary-fixed-variant": "#004493",
                        "on-primary": "#ffffff",
                        "on-tertiary-fixed": "#351000",
                        "on-background": "#1a1c1f",
                        "outline-variant": "#c1c6d7",
                        "on-error-container": "#93000a",
                        "error-container": "#ffdad6",
                        "surface-container-high": "#e8e8ed",
                        "on-primary-container": "#fefcff",
                        "primary": "#0058bc",
                        "inverse-on-surface": "#f0f0f5",
                        "tertiary": "#9e3d00",
                        "on-tertiary-container": "#fffbff",
                        "inverse-surface": "#2e3034",
                        "on-primary-fixed": "#001a41",
                        "surface-variant": "#e2e2e7",
                        "surface-bright": "#f9f9fe",
                        "on-tertiary": "#ffffff",
                        "on-secondary-fixed-variant": "#26467d",
                        "on-surface": "#1a1c1f",
                        "on-error": "#ffffff",
                        "surface-tint": "#005bc1",
                        "surface-container-highest": "#e2e2e7",
                        "surface-container": "#ededf2",
                        "on-secondary-container": "#2d4c83",
                        "surface-dim": "#d9dade",
                        "secondary": "#405e96",
                        "tertiary-fixed": "#ffdbcc",
                        "tertiary-container": "#c64f00",
                        "primary-container": "#0070eb",
                        "on-surface-variant": "#414755"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "2xl": "1rem",
                        "full": "9999px"
                    },
                    "fontFamily": {
                        "headline": ["Inter"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    }
                },
            },
        }
    </script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>

<body class="bg-background text-on-background min-h-screen">
<div class="max-w-7xl mx-auto flex gap-8 px-6 py-8">
    <!-- SideNavBar (Predicted Component) -->
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
            <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
               href="${pageContext.request.contextPath}/trainer/clients"><span class="material-symbols-outlined">group</span> 회원 관리</a>

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
<!-- Main Content Area -->
<main class="flex-1 md:ml-64 max-w-4xl space-y-8 pb-20">
    <!-- Header Section -->
    <section class="mb-8">
        <h1 class="text-3xl font-extrabold text-on-surface tracking-tight">프로필 수정</h1>
        <p class="text-on-surface-variant mt-1 text-base font-medium opacity-80">프로필 정보를 수정하고 관리하세요</p>
    </section>
    <!-- Section 1: About Me -->
    <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-6">
        <div class="flex items-center justify-between border-b border-surface-container pb-4">
            <h3 class="text-lg font-bold text-on-surface flex items-center gap-2">
                <span class="material-symbols-outlined text-primary">person_outline</span> 기본 정보
            </h3>
        </div>
        <div class="space-y-6">
            <!-- Name Input -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <label class="text-sm font-semibold text-on-surface-variant uppercase tracking-wider">이름</label>
                <input
                        class="w-full md:w-2/3 bg-surface-container-low border-none rounded-xl px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none font-medium"
                        type="text" placeholder="이름" value="홍길동" />
            </div>
            <!-- Profile Photo -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <label class="text-sm font-semibold text-on-surface-variant uppercase tracking-wider">프로필
                    사진</label>
                <div class="flex items-center gap-4 w-full md:w-2/3">
                    <img class="w-16 h-16 rounded-full object-cover shadow-sm"
                         data-alt="Alex Fischer's headshot"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuAhiAac6CUd1yvgTBZonn9XGy4q9dqoPd4cJ6ZuiVPWFyYgzwLxlleU2sLWZE0Y4gocDnyNzsxUscP-nXnsLltAq6v6boe-fnsKQZxoU8YRsAbr2MOgjSPdeBGCDhu8890fy332yEHDyXOk0y11sQut0Efnb6cck3tyBWzK9gjJ5s5OyTeV8rBXe7zXUXtzjfNf0fHJwVDy1ebwkIAEBvzfPJkIcvALFZHIYrTtD30RN-6PRdqFVaBxNLXrIEBRl_VxfA2mjmlCZC6V" />
                    <button
                            class="px-6 py-2 bg-surface-container-high hover:bg-surface-container-highest text-primary font-bold rounded-xl text-sm transition-all">변경</button>
                </div>
            </div>
            <!-- Banner Photo -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <label class="text-sm font-semibold text-on-surface-variant uppercase tracking-wider">배너
                    이미지</label>
                <div class="flex flex-col gap-3 w-full md:w-2/3">
                    <div class="w-full h-32 rounded-xl bg-surface-container overflow-hidden">
                        <img class="w-full h-full object-cover"
                             data-alt="Wide shot of a high-end modern fitness training facility with dark aesthetic and warm lighting"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBC8TGXIMj3t4DUmfKNof6VE_63cs5ENiMo4SQmoOnVdrRJw-HlZ8j2_1YL1dqd3YaASMG9_ea_pASkbI0EGlIyBxuE2YUU_kKsta8pFB1peRz7JIRqR4pL_4DEf7JMtAiaaPOMl5oGzAdZRAOTv9w8cSvNIe3JcmbmC58CxEFalLC2cgRx87XRgiPnZKsHwiTFkxcfFZYJvNCi2WGCRhuUOyIWsRpArxUGwXOEAPn0hM3CT5QCJhR2alKjrCDLpKXYgDjoWYn3-yLa" />
                    </div>
                    <button
                            class="w-fit px-6 py-2 bg-surface-container-high hover:bg-surface-container-highest text-primary font-bold rounded-xl text-sm transition-all">변경</button>
                </div>
            </div>
            <!-- Social Links -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <label
                        class="text-sm font-semibold text-on-surface-variant uppercase tracking-wider">Instagram</label>
                <input
                        class="w-full md:w-2/3 bg-surface-container-low border-none rounded-xl px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none"
                        placeholder="@example" type="text" />
            </div>
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <label
                        class="text-sm font-semibold text-on-surface-variant uppercase tracking-wider">LinkedIn</label>
                <input
                        class="w-full md:w-2/3 bg-surface-container-low border-none rounded-xl px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none"
                        placeholder="linkedin.com/in/example" type="text" />
            </div>
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <label
                        class="text-sm font-semibold text-on-surface-variant uppercase tracking-wider">Youtube</label>
                <input
                        class="w-full md:w-2/3 bg-surface-container-low border-none rounded-xl px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none"
                        placeholder="youtube.com/@example" type="text" />
            </div>
        </div>
    </section>

    <!-- Section 2: Gallery -->
    <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-6">
        <div class="flex items-center justify-between border-b border-surface-container pb-4">
            <h3 class="text-lg font-bold text-on-surface flex items-center gap-2">
                <span class="material-symbols-outlined text-primary">collections</span> 갤러리
            </h3>
            <button class="text-sm font-bold text-primary hover:opacity-80">사진 관리</button>
        </div>
        <div class="grid grid-cols-3 md:grid-cols-4 gap-4">
            <div class="aspect-square rounded-xl overflow-hidden bg-surface-container group relative">
                <img class="w-full h-full object-cover hover:scale-110 transition-transform duration-500"
                     data-alt="Trainer guiding client through bench press exercise with focus on form"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuDr-1PB3aeLMdItgBkHz3-jSlgRYgJWH3R4t2qWid4ayxs8JN70M37PoWRx1ERtxOmC8Af0PnuHshAP6qtES0TkbJqFDZqS4EEPh5T-bE-4FbbfS2XfCE5YQo9RhKfkayqXkEhgnmnKqDe_TpMfo7RNFPQL_gLnC2LOe_4S9AQBmuycw_EK2gcW5zsh7uxDYbXG3U9h-rmNnaKPkA6KBdXu7Z0XfxFHT97lExo0saTZuH5BNNoJUaluT4IjNXHj82WjJH-6zqRrpRtT" />
            </div>
            <div class="aspect-square rounded-xl overflow-hidden bg-surface-container group relative">
                <img class="w-full h-full object-cover hover:scale-110 transition-transform duration-500"
                     data-alt="Trainer Alex in mid-workout focusing on kettlebell swing"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuArdb2e0PZqXHlfm0tw984NbOkkLJOBPErRtVwsGGTsNSV9aeKerh12_PcFe9Bs1O2QyhZtE0BfxY9-xEPGDRfAFaAUDLbVfVgNmsd1cdLEXLHim_NvrH28dQ6aw5YvJaY-9WSoUsK7YgupE7-h9vops85QeM7NCqLh82wPQ4a1SS2R3avq-xZBqErFg5e2tMKuB2nUu6eizdCGZXtLDA0swe9YbXGBj7EGusyYJDcMeR6W1UnQl1CBNjYvYld3jEpoHIRvqXKXWB9s" />
            </div>
            <div class="aspect-square rounded-xl overflow-hidden bg-surface-container group relative">
                <img class="w-full h-full object-cover hover:scale-110 transition-transform duration-500"
                     data-alt="Close up of gym equipment weights and dumbbells in a high end studio"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuACYk3dBCtwLy_Z-lMMswl-r_UAQY4g2UQ6Ab8IsNLPdlot4Bvzk7_6nUa3E9nrTIG_5yK3H2kiVMIV8je_AHb7ucpL9fuIbyHi6hHMsN22FYCsHnUM5zHSRkTgJMrxDW4Se5KbQlMMwgSclT_VfGCp9WxBXdzMNlJCYjYxjjuh4IYvnN6AtWUN4npS_7U7weG4zx3eP157O8sEgvOqSwu5Li-qOTuThlKl28yVA1q0pidvzHO1Qh0mXSOiO8JjIVk6LgO3GDwGg645" />
            </div>
            <div
                    class="aspect-square rounded-xl bg-surface-container-low border-2 border-dashed border-outline-variant/30 flex flex-col items-center justify-center text-on-surface-variant hover:bg-surface-container transition-all cursor-pointer">
                <span class="material-symbols-outlined text-3xl">add_a_photo</span>
                <span class="text-[10px] font-bold mt-1 uppercase tracking-tighter">추가하기</span>
            </div>
        </div>
    </section>
    <!-- Section 3: Profile Details -->
    <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-6">
        <div class="flex items-center justify-between border-b border-surface-container pb-4">
            <h3 class="text-lg font-bold text-on-surface flex items-center gap-2">
                <span class="material-symbols-outlined text-primary">description</span> 소개
            </h3>
        </div>
        <div class="space-y-6">
            <!-- Specializations Chips -->
            <div class="space-y-2">
                <label class="text-sm font-semibold text-on-surface-variant uppercase tracking-wider">전문
                    분야</label>
                <div class="flex flex-wrap gap-2">
                    <span class="px-4 py-2 bg-primary text-white text-xs font-bold rounded-full">체중 감량</span>
                    <span class="px-4 py-2 bg-primary text-white text-xs font-bold rounded-full">근비대</span>
                    <span class="px-4 py-2 bg-primary text-white text-xs font-bold rounded-full">재활</span>
                    <button
                            class="px-4 py-2 bg-surface-container-high text-on-surface-variant text-xs font-bold rounded-full hover:bg-surface-container-highest transition-all">+
                        추가</button>
                </div>
            </div>
            <!-- Bio -->
            <div class="space-y-2">
                <label
                        class="text-sm font-semibold text-on-surface-variant uppercase tracking-wider">자기소개</label>
                <textarea
                        class="w-full bg-surface-container-low border-none rounded-xl px-4 py-4 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all outline-none font-medium min-h-[120px] leading-relaxed"
                        placeholder="자신의 강점과 트레이닝 철학을 입력하세요.">안녕하세요, 10년 경력의 엘리트 트레이너 알렉스 피셔입니다. 단순한 운동을 넘어 여러분의 라이프스타일 전반을 관리해 최상의 결과를 만들어 드립니다.</textarea>
            </div>
            <!-- Certifications -->
            <div class="space-y-2">
                <label
                        class="text-sm font-semibold text-on-surface-variant uppercase tracking-wider">자격증</label>
                <div class="space-y-3">
                    <div
                            class="flex items-center justify-between p-4 bg-surface-container-low rounded-xl group hover:bg-surface-container transition-all cursor-pointer">
                        <div>
                            <p class="font-bold text-on-surface text-sm">NASM-CPT</p>
                            <p class="text-xs text-on-surface-variant">National Academy of Sports Medicine</p>
                        </div>
                        <span
                                class="material-symbols-outlined text-on-surface-variant group-hover:translate-x-1 transition-transform">chevron_right</span>
                    </div>
                    <div
                            class="flex items-center justify-between p-4 bg-surface-container-low rounded-xl group hover:bg-surface-container transition-all cursor-pointer">
                        <div>
                            <p class="font-bold text-on-surface text-sm">CES 교정운동 전문가</p>
                            <p class="text-xs text-on-surface-variant">National Academy of Sports Medicine</p>
                        </div>
                        <span
                                class="material-symbols-outlined text-on-surface-variant group-hover:translate-x-1 transition-transform">chevron_right</span>
                    </div>
                    <button
                            class="w-full py-3 border-2 border-dashed border-outline-variant/30 rounded-xl text-sm font-bold text-on-surface-variant hover:bg-surface-container-low transition-all">+
                        자격증 추가</button>
                </div>
            </div>
        </div>
    </section>
    <!-- Section 4: Pricing -->
    <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-6">
        <div class="flex items-center justify-between border-b border-surface-container pb-4">
            <h3 class="text-lg font-bold text-on-surface flex items-center gap-2">
                <span class="material-symbols-outlined text-primary">payments</span> 수업 가격
            </h3>
            <button class="text-sm font-bold text-primary hover:opacity-80">가격 수정</button>
        </div>
        <div class="grid md:grid-cols-2 gap-4">
            <div class="p-5 rounded-2xl bg-surface-container-low border-none flex flex-col gap-1">
                        <span class="text-xs font-bold text-primary uppercase tracking-widest">1:1 Personal
                            Training</span>
                <h4 class="text-xl font-black text-on-surface">₩80,000 <span
                        class="text-sm font-medium text-on-surface-variant">/ 1회</span></h4>
                <p class="text-xs text-on-surface-variant mt-2">60분 집중 관리 및 식단 피드백 포함</p>
            </div>
            <div class="p-5 rounded-2xl bg-surface-container-low border-none flex flex-col gap-1">
                        <span class="text-xs font-bold text-primary uppercase tracking-widest">Package (10
                            Sessions)</span>
                <h4 class="text-xl font-black text-on-surface">₩720,000 <span
                        class="text-xs font-bold text-error ml-2">-10% OFF</span></h4>
                <p class="text-xs text-on-surface-variant mt-2">장기 목표 달성을 위한 최적의 패키지</p>
            </div>
        </div>
    </section>
    <!-- Section 5: Availability -->
    <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-6">
        <div class="flex items-center justify-between border-b border-surface-container pb-4">
            <h3 class="text-lg font-bold text-on-surface flex items-center gap-2">
                <span class="material-symbols-outlined text-primary">calendar_today</span> 일정
            </h3>
            <button class="text-sm font-bold text-primary hover:opacity-80">일정 수정</button>
        </div>
        <div
                class="flex flex-col md:flex-row md:items-center justify-between p-5 rounded-2xl bg-surface-container-low gap-4">
            <div class="flex items-center gap-4">
                <div class="w-12 h-12 bg-white rounded-full flex items-center justify-center shadow-sm">
                            <span class="material-symbols-outlined text-primary"
                                  style="font-variation-settings: 'FILL' 1;">schedule</span>
                </div>
                <div>
                    <p class="text-sm font-bold text-on-surface">운영 시간 요약</p>
                    <p class="text-lg font-black text-primary">월–금 · 07:00–20:00</p>
                </div>
            </div>
            <div class="text-right">
                <p class="text-xs font-bold text-on-surface-variant uppercase">주말 및 공휴일 휴무</p>
            </div>
        </div>
    </section>
    <!-- Save Changes Footer -->
    <div class="pt-8 border-t border-surface-container-highest flex gap-4">
        <button
                class="flex-1 py-4 bg-primary text-white font-black rounded-2xl text-lg shadow-lg shadow-primary/20 hover:scale-[1.02] active:scale-95 transition-all">변경
            사항 저장</button>
        <button
                class="px-8 py-4 bg-surface-container-high text-on-surface-variant font-bold rounded-2xl text-lg hover:bg-surface-container-highest transition-all">취소</button>
    </div>
</main>
</div>
</body>

</html>
