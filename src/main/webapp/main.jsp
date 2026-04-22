<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>핏츠버그 - 당신만의 최적의 운동을 발견하세요</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "on-surface": "#191b23",
                        "surface-container-highest": "#e1e2ec",
                        "on-tertiary-fixed-variant": "#74198b",
                        "tertiary-fixed": "#fdd6ff",
                        "tertiary": "#8c34a2",
                        "outline-variant": "#c2c6d6",
                        "surface-container": "#ecedf7",
                        "surface-container-high": "#e6e7f2",
                        "primary-fixed": "#d8e2ff",
                        "on-secondary-fixed": "#001a42",
                        "on-primary-fixed-variant": "#004395",
                        "on-secondary-fixed-variant": "#304671",
                        "inverse-primary": "#adc6ff",
                        "on-tertiary-container": "#fffbff",
                        "on-surface-variant": "#424754",
                        "on-background": "#191b23",
                        "on-tertiary": "#ffffff",
                        "error": "#ba1a1a",
                        "tertiary-fixed-dim": "#f4aeff",
                        "on-primary-fixed": "#001a42",
                        "inverse-on-surface": "#eff0fa",
                        "secondary-fixed": "#d8e2ff",
                        "outline": "#727785",
                        "on-secondary-container": "#405682",
                        "on-error": "#ffffff",
                        "surface-dim": "#d8d9e3",
                        "primary-container": "#2170e4",
                        "error-container": "#ffdad6",
                        "surface-container-lowest": "#ffffff",
                        "primary-fixed-dim": "#adc6ff",
                        "primary": "#0058be",
                        "secondary-fixed-dim": "#b1c6f9",
                        "secondary": "#495e8a",
                        "inverse-surface": "#2e3038",
                        "surface": "#f9f9ff",
                        "background": "#f9f9ff",
                        "surface-tint": "#005ac2",
                        "on-tertiary-fixed": "#340042",
                        "tertiary-container": "#a84fbe",
                        "surface-variant": "#e1e2ec",
                        "on-secondary": "#ffffff",
                        "surface-bright": "#f9f9ff",
                        "on-error-container": "#93000a",
                        "on-primary-container": "#fefcff",
                        "on-primary": "#ffffff",
                        "secondary-container": "#b6ccff",
                        "surface-container-low": "#f2f3fd"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.5rem",
                        "xl": "1rem",
                        "full": "9999px"
                    },
                    "fontFamily": {
                        "headline": ["Inter", "sans-serif"],
                        "body": ["Inter", "sans-serif"],
                        "label": ["Inter", "sans-serif"]
                    }
                },
            },
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            vertical-align: middle;
        }
        body { font-family: 'Inter', sans-serif; width: 1280px; margin: 0 auto; height: 1395px; position: relative; }
        .no-scrollbar::-webkit-scrollbar { display: none; }
        .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
        
        /* Specific slider styles to ensure 3 cards are visible */
        .card-slider-container {
            display: grid;
            grid-auto-flow: column;
            grid-auto-columns: calc((100% - 32px) / 3);
            gap: 16px;
            overflow-x: auto;
            scroll-behavior: smooth;
        }
    </style>
</head>
<body class="bg-surface text-on-surface overflow-x-hidden">
<aside class="h-full w-64 fixed left-0 top-0 bg-slate-50 dark:bg-slate-950 flex flex-col justify-between p-5 z-50 border-r border-surface-container-highest">
<div class="flex flex-col">
<div class="text-2xl font-black text-blue-600 dark:text-blue-500 italic mb-4 flex items-center gap-2">
<img class="w-8 h-8 rounded-full" alt="Fitbull Logo" src="<%=contextPath%>/resources/images/logo.png" onerror="this.src='https://lh3.googleusercontent.com/aida-public/AB6AXuCveWQWdmN7R9sHZYJtczW7JlQkSJksW17FyrAjX0sIqVNoO7rUvZ5aVmTxr--s6QdrpYaJkNs9Aj3Lm4Z9ICG1waBV-yEKtgQqf7a77X3bEMweDYmiRv_2wprNj_xs__Vqyh2f5bVQr3QkuYOxRdXb5jfED0ktJFxf9r0RpjFrb6By02eTD3KzReErGiYzzhFyCBXRSRYqsQM2VKkdk7mWWO2R5jjBRMjcPYzPyBozh6wbh3bLzhw8KrRNIyipW0rhClHJNWthxiM'"/>
<span>핏츠버그</span>
</div>
<div class="flex p-1 bg-surface-container rounded-full mb-6 text-[11px] font-bold">
<button class="flex-1 py-1.5 rounded-full bg-primary text-on-primary shadow-sm">회원</button>
<button class="flex-1 py-1.5 rounded-full text-on-surface-variant hover:text-on-surface">트레이너</button>
<button class="flex-1 py-1.5 rounded-full text-on-surface-variant hover:text-on-surface">헬스장</button>
</div>
<nav class="space-y-1">
<a class="bg-white dark:bg-slate-800 text-blue-600 dark:text-blue-400 shadow-sm rounded-xl px-4 py-2 flex items-center gap-3" href="#">
<span class="material-symbols-outlined text-xl" data-icon="home">home</span>
<span class="font-semibold text-sm">홈</span>
</a>
<a class="text-slate-500 dark:text-slate-400 px-4 py-2 flex items-center gap-3 hover:bg-blue-50 dark:hover:bg-blue-900/20 rounded-xl" href="#">
<span class="material-symbols-outlined text-xl" data-icon="exercise">exercise</span>
<span class="font-medium text-sm">운동가이드</span>
</a>
<a class="text-slate-500 dark:text-slate-400 px-4 py-2 flex items-center gap-3 hover:bg-blue-50 dark:hover:bg-blue-900/20 rounded-xl" href="#">
<span class="material-symbols-outlined text-xl" data-icon="sports_gymnastics">sports_gymnastics</span>
<span class="font-medium text-sm">트레이너</span>
</a>
<a class="text-slate-500 dark:text-slate-400 px-4 py-2 flex items-center gap-3 hover:bg-blue-50 dark:hover:bg-blue-900/20 rounded-xl" href="#">
<span class="material-symbols-outlined text-xl" data-icon="location_on">location_on</span>
<span class="font-medium text-sm">헬스장</span>
</a>
<a class="text-slate-500 dark:text-slate-400 px-4 py-2 flex items-center gap-3 hover:bg-blue-50 dark:hover:bg-blue-900/20 rounded-xl" href="community.jsp">
<span class="material-symbols-outlined text-xl" data-icon="forum">forum</span>
<span class="font-medium text-sm">커뮤니티</span>
</a>
<a class="text-slate-500 dark:text-slate-400 px-4 py-2 flex items-center gap-3 hover:bg-blue-50 dark:hover:bg-blue-900/20 rounded-xl" href="#">
<span class="material-symbols-outlined text-xl" data-icon="person">person</span>
<span class="font-medium text-sm">마이페이지</span>
</a>
</nav>
</div>
<div class="flex flex-col gap-2 mt-auto pt-4 border-t border-surface-container-highest">
<button onclick="location.href='<%=contextPath%>/login.jsp'" class="bg-primary text-on-primary py-2.5 px-4 rounded-xl font-bold text-sm active:scale-95 transition-transform">
                로그인하여 시작하기
            </button>
<button onclick="location.href='<%=contextPath%>/join.jsp'" class="border-2 border-outline-variant text-on-surface py-2.5 px-4 rounded-xl font-bold text-sm hover:bg-surface-container-low transition-colors active:scale-95">
                회원가입
            </button>
</div>
</aside>
<main class="ml-64 pb-32">
<header class="sticky top-0 z-40 bg-white/80 dark:bg-slate-900/80 backdrop-blur-md px-10 py-6 border-b border-surface-container-highest">
<h1 class="text-2xl font-bold tracking-tight text-on-surface">당신만의 최적의 운동을 발견하세요</h1>
</header>
<div class="px-10 space-y-12 mt-6">
<section class="relative">
<div class="flex justify-between items-center mb-4">
<h2 class="text-lg font-bold flex items-center gap-2">
<span class="w-1 h-5 bg-primary rounded-full"></span>
                        운동 가이드
                    </h2>
<a class="text-xs font-bold text-primary hover:underline" href="#">모두보기</a>
</div>
<div class="group relative flex items-center">
<div class="card-slider-container no-scrollbar w-full pb-2" id="exercise-slider">
<div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-sm flex flex-col border border-outline-variant/10">
<div class="relative h-40">
<img class="w-full h-full object-cover" alt="데드리프트" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDzfNvoKphEa7oSksSxieSN5z8yxClKPimzTQ4YQPPcX0WPgcojDTVtNyZvNCijgRf8H2lhMiGF9D5do8a3YV5EGD55sD4ojYnPQEym0vmuErW1zcIuLYCj17UvpsUb0W8n5ILj6HFNeXRBzrqxES9_yRVLv-gA2VYu3FnAkXO_PhticuKDkrE6h9rmoJQZ5X2L-1y9364SP8kFA_F76-lAMiwA2L3x4EJBKIvQTnnq_L_Q9H-vVFF75OyEMPsF4ntI-Vli5TkAsSM"/>
<div class="absolute top-2 left-2 flex gap-1">
<span class="bg-black/60 backdrop-blur-sm text-white text-[9px] font-bold px-1.5 py-0.5 rounded">하체/전신</span>
<span class="bg-primary text-on-primary text-[9px] font-bold px-1.5 py-0.5 rounded">근력</span>
<span class="bg-amber-500 text-white text-[9px] font-bold px-1.5 py-0.5 rounded">중급</span>
</div>
</div>
<div class="p-4 flex flex-col h-full">
<h3 class="font-bold text-sm mb-1 truncate">데드리프트</h3>
<p class="text-[11px] text-on-surface-variant mb-4 truncate">데드리프트 위주의 고중량 복합 다관절 운동 루틴</p>
<div class="grid grid-cols-2 gap-2 mt-auto">
<button class="border border-primary text-primary py-1.5 rounded-lg text-xs font-bold hover:bg-primary/5">영상보기</button>
<button class="bg-primary text-on-primary py-1.5 rounded-lg text-xs font-bold active:scale-95 transition-transform">기록시작</button>
</div>
</div>
</div>
<div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-sm flex flex-col border border-outline-variant/10">
<div class="relative h-40">
<img class="w-full h-full object-cover" alt="벤치프레스" src="https://lh3.googleusercontent.com/aida-public/AB6AXuB0R3nhXMHGRRhGU3ic8k7vDeQm-Curk2GF6seyibz2QjB5UEsPMrfQIkYLV9o5haGIT_JvC32XWj_ZND-BxGnupYytfJb7lwbvg-AaDsSfFhEGz2qgNcsFREHgjLiDbM9p3t8PKtV7mUJisgsgIsrd6lPGsenZVolz0nuJJja6GHxbwjgP_DJn9zAn3MOCn0MeljMsbAMWVvPkiY93ZDq-YhNCidbdiYSKDwbyoDHnL4wGfNokAj0_G2NzXFTIfHJvDGseD85FS2Q"/>
<div class="absolute top-2 left-2 flex gap-1">
<span class="bg-black/60 backdrop-blur-sm text-white text-[9px] font-bold px-1.5 py-0.5 rounded">전신</span>
<span class="bg-tertiary text-on-tertiary text-[9px] font-bold px-1.5 py-0.5 rounded">유연성</span>
<span class="bg-green-600 text-white text-[9px] font-bold px-1.5 py-0.5 rounded">초급</span>
</div>
</div>
<div class="p-4 flex flex-col h-full">
<h3 class="font-bold text-sm mb-1 truncate">벤치프레스</h3>
<p class="text-[11px] text-on-surface-variant mb-4 truncate">근육 긴장을 완화하고 가동 범위를 늘려주는 스트레칭</p>
<div class="grid grid-cols-2 gap-2 mt-auto">
<button class="border border-tertiary text-tertiary py-1.5 rounded-lg text-xs font-bold hover:bg-tertiary/5">영상보기</button>
<button class="bg-tertiary text-on-tertiary py-1.5 rounded-lg text-xs font-bold active:scale-95 transition-transform">기록시작</button>
</div>
</div>
</div>
<div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-sm flex flex-col border border-outline-variant/10">
<div class="relative h-40">
<img class="w-full h-full object-cover" alt="런닝머신" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDB-OW11lRqov921AjCl0Khc1jahs1l6mJMjA1D-xkpk6fqQvWSelrMXU9gjemjR5SLioh4e1_MXqXJ907dwLvZ7blN1joY9yMfmU1eLQ97GaHOl3QkIKiHfU9LHSCpKcQ2di67EH5lstPV6bRB7ncHDKhSPfGv-DD6CNw6k49fV5GiPVFaj73ehfZXtDO-bf0EBnECgaiVgI_pjkYaTBV3cwzkOdcjlT-QxY1FS7jqf0p0OIkw1RPAutouEAg9Hj9PewZqrNSMySQ"/>
<div class="absolute top-2 left-2 flex gap-1">
<span class="bg-black/60 backdrop-blur-sm text-white text-[9px] font-bold px-1.5 py-0.5 rounded">심폐</span>
<span class="bg-error text-on-error text-[9px] font-bold px-1.5 py-0.5 rounded">유산소</span>
<span class="bg-red-600 text-white text-[9px] font-bold px-1.5 py-0.5 rounded">고급</span>
</div>
</div>
<div class="p-4 flex flex-col h-full">
<h3 class="font-bold text-sm mb-1 truncate">런닝머신</h3>
<p class="text-[11px] text-on-surface-variant mb-4 truncate">짧은 휴식과 최대 강도의 반복으로 이루어진 HIIT</p>
<div class="grid grid-cols-2 gap-2 mt-auto">
<button class="border border-error text-error py-1.5 rounded-lg text-xs font-bold hover:bg-error/5">영상보기</button>
<button class="bg-error text-on-error py-1.5 rounded-lg text-xs font-bold active:scale-95 transition-transform">기록시작</button>
</div>
</div>
</div>
</div>
<button class="absolute -right-6 z-10 p-3 rounded-full bg-white shadow-xl border border-outline-variant hover:bg-primary hover:text-white transition-all active:scale-90 flex items-center justify-center" onclick="document.getElementById('exercise-slider').scrollBy({left: 400, behavior: 'smooth'})">
<span class="material-symbols-outlined text-2xl">chevron_right</span>
</button>
</div>
</section>
<section class="relative">
<div class="flex justify-between items-center mb-4">
<h2 class="text-lg font-bold flex items-center gap-2">
<span class="w-1 h-5 bg-primary rounded-full"></span>
                        전문 트레이너 목록
                    </h2>
<a class="text-xs font-bold text-primary hover:underline" href="#">모두보기</a>
</div>
<div class="group relative flex items-center">
<div class="card-slider-container no-scrollbar w-full pb-2" id="trainer-slider">
<div class="bg-white rounded-2xl p-4 shadow-sm border border-outline-variant/10 text-center flex flex-col items-center">
<div class="relative mb-3">
<img class="w-16 h-16 rounded-full object-cover border-2 border-primary-fixed" alt="김지훈 트레이너" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAhkFiXcZcXRmPhdGGGvjOxmVdMn-QhOObGKi5SKmfZRTwAw2NGY81IKKiyI1bLmq9dyhNNIh8JGAnq8SOXjyqcKh9DtoyAoX9p850xWlVMR2e6sQHf9pYwJwDNOKTqC7LmSFqWuKJxB9HVB3NtAWqNZsmw6GmgFO-k0l9gCT9djwpSc4pZazEp12NXTS9UUgFY2OZNL4oYAhGsQuUWOzH1XaVjce5O-M9zq6d7DolwgOTU8YCyS0jirkAqjjrnocGyu3wvh4v1zio"/>
</div>
<h4 class="font-bold text-sm">김지훈 트레이너</h4>
<p class="text-primary text-[10px] font-semibold mb-2">바디프로필 / 근력증진</p>
<div class="flex gap-1 items-center mb-3">
<span class="text-xs font-bold">4.9</span>
<span class="text-on-surface-variant text-[10px]">(후기 128)</span>
</div>
<div class="w-full pt-2 border-t border-slate-100 flex justify-between items-center mt-auto">
<span class="text-[10px] text-on-surface-variant">1회 PT</span>
<span class="text-sm font-black">65,000원~</span>
</div>
</div>
<div class="bg-white rounded-2xl p-4 shadow-sm border border-outline-variant/10 text-center flex flex-col items-center">
<div class="relative mb-3">
<img class="w-16 h-16 rounded-full object-cover border-2 border-primary-fixed" alt="이서연 트레이너" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAvXOrztKYMnEPEShnkvPRQ_LgbVKP6odsWckpRrzomXLVCLwk0oLAbIAfJkanINC9ZC9tgnOzHXB0bExthiTUfzCdd8CUlkPi-MkhNYYu66De0Im_gpg1H1zdkb0IuN2XobRJ2BNcLN1ZcLRrElVHjZD1CnG50B0lJ2XOlxMPbGXZ7Y0FL-liu53a-9Qx1jLI4jTaI_4xD0jDriT9NgrdDzAdUqj4PpYOP60mbnKvXPJo4LkZ19n--_2hVvPZNF1qO6d5cJR92QHc"/>
</div>
<h4 class="font-bold text-sm">이서연 트레이너</h4>
<p class="text-primary text-[10px] font-semibold mb-2">요가 / 체형교정</p>
<div class="flex gap-1 items-center mb-3">
<span class="text-xs font-bold">5.0</span>
<span class="text-on-surface-variant text-[10px]">(후기 210)</span>
</div>
<div class="w-full pt-2 border-t border-slate-100 flex justify-between items-center mt-auto">
<span class="text-[10px] text-on-surface-variant">1회 PT</span>
<span class="text-sm font-black">70,000원~</span>
</div>
</div>
<div class="bg-white rounded-2xl p-4 shadow-sm border border-outline-variant/10 text-center flex flex-col items-center">
<div class="relative mb-3">
<img class="w-16 h-16 rounded-full object-cover border-2 border-primary-fixed" alt="박민호 트레이너" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCbjJVaFJ3bz84Ufbf_oFdgLj60iv2ADwlT5bonTTK9apF3YPJ2QFj5pyMqhVUIN3x3Qc8QtKwlqkV2RiYOkk-8L0z2fJgk95ZzLZ61pLf6i0xo4j2UN1nxsEDUVBJJi2D9ODvdCrR2k9yxhMPXHDLdr265FIBO2n9ts3BJ8nEOy_tjdODq_PmBGA81fBT-NL-sM1RuQE4cw5t8YHbPIwi9FaAmQFrX2-R0pcyX33Qt8HDAkeYRMZvLgTD7Z6R3S8YKs2FbDMbv384"/>
</div>
<h4 class="font-bold text-sm">박민호 트레이너</h4>
<p class="text-primary text-[10px] font-semibold mb-2">재활 / 기능성 훈련</p>
<div class="flex gap-1 items-center mb-3">
<span class="text-xs font-bold">4.8</span>
<span class="text-on-surface-variant text-[10px]">(후기 85)</span>
</div>
<div class="w-full pt-2 border-t border-slate-100 flex justify-between items-center mt-auto">
<span class="text-[10px] text-on-surface-variant">1회 PT</span>
<span class="text-sm font-black">60,000원~</span>
</div>
</div>
</div>
<button class="absolute -right-6 z-10 p-3 rounded-full bg-white shadow-xl border border-outline-variant hover:bg-primary hover:text-white transition-all active:scale-90 flex items-center justify-center" onclick="document.getElementById('trainer-slider').scrollBy({left: 400, behavior: 'smooth'})">
<span class="material-symbols-outlined text-2xl">chevron_right</span>
</button>
</div>
</section>
<section class="relative">
<div class="flex justify-between items-center mb-4">
<h2 class="text-lg font-bold flex items-center gap-2">
<span class="w-1 h-5 bg-primary rounded-full"></span>
                        추천 헬스장
                    </h2>
<a class="text-xs font-bold text-primary hover:underline" href="#">모두보기</a>
</div>
<div class="group relative flex items-center">
<div class="card-slider-container no-scrollbar w-full pb-4" id="gym-slider">
<div class="bg-surface-container-lowest rounded-2xl overflow-hidden shadow-sm border border-outline-variant/10">
<div class="relative h-44">
<img class="w-full h-full object-cover" alt="더 프라임 휘트니스 강남점" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBYebjvJBGGB0uqMx-s6UEpZ5Htv7sCQKD91Me_KF9KLev064wVAsZgmVc3O6IR_LD5z2pE125OWg3dwXP2As6SdM4hFkuoZIa005AxiMPicTcLxJMfBMBdFwekToeDpm28CedgpsfUdqwzrsE4FZJ6w_ji3zCGbhXN6SB8fedpR4_vFsdXRZREWtgOXORGjsToWH47RMoCgV5punXmd1-kYl6ppvUHjITHK-YmTxCe6J8AD-JjZMj_cAjaFi5sGSOl8ZYem7P4gQU"/>
<div class="absolute bottom-3 left-3 bg-white/90 px-2 py-0.5 rounded text-[10px] text-primary font-bold">강남구</div>
</div>
<div class="p-4">
<div class="flex justify-between items-start mb-1">
<h3 class="font-bold text-base truncate">더 프라임 휘트니스 강남점</h3>
<span class="text-primary font-bold text-sm">4.9</span>
</div>
<p class="text-on-surface-variant text-[10px] flex items-center gap-1 mb-2 truncate">
<span class="material-symbols-outlined text-[10px]">location_on</span>
                                    서울특별시 강남구 테헤란로 123
                                </p>
<div class="flex justify-between items-center">
<span class="text-[10px] text-on-surface-variant">한 달 이용권</span>
<span class="text-base font-black text-primary">80,000원~</span>
</div>
</div>
</div>
<div class="bg-surface-container-lowest rounded-2xl overflow-hidden shadow-sm border border-outline-variant/10">
<div class="relative h-44">
<img class="w-full h-full object-cover" alt="어반 필라테스 & 요가" src="https://lh3.googleusercontent.com/aida-public/AB6AXuB-xX_u_uZChpv5Mukt_lCw8KdSgBWvBnZNhzeWfNk9UfB8Y5UWtm-l_WXvcWyQrS87pSHE0ViBE0Ti5ulnGnhRF00QXd9DfZZ8p0bL_n8ggSEF0hz8FWh-QFulKC4qH0pfH4bNGDbjuFiG2SdFMX17CC-ZaqOt17om-QzduYTadchu95nmcTpS9oAcZiaj1dePNx-rDjwp4DLarfr-M-g8diTQmdavXAk-bQpJ2JTfh8hl4gd_Rp_IC7VlXObhy8l1Rrpkzx7swoo"/>
<div class="absolute bottom-3 left-3 bg-white/90 px-2 py-0.5 rounded text-[10px] text-primary font-bold">서초구</div>
</div>
<div class="p-4">
<div class="flex justify-between items-start mb-1">
<h3 class="font-bold text-base truncate">어반 필라테스 & 요가</h3>
<span class="text-primary font-bold text-sm">4.8</span>
</div>
<p class="text-on-surface-variant text-[10px] flex items-center gap-1 mb-2 truncate">
<span class="material-symbols-outlined text-[10px]">location_on</span>
                                    서울특별시 서초구 서초대로 456
                                </p>
<div class="flex justify-between items-center">
<span class="text-[10px] text-on-surface-variant">10회 수강권</span>
<span class="text-base font-black text-primary">250,000원~</span>
</div>
</div>
</div>
</div>
<button class="absolute -right-6 z-10 p-3 rounded-full bg-white shadow-xl border border-outline-variant hover:bg-primary hover:text-white transition-all active:scale-90 flex items-center justify-center" onclick="document.getElementById('gym-slider').scrollBy({left: 400, behavior: 'smooth'})">
<span class="material-symbols-outlined text-2xl">chevron_right</span>
</button>
</div>
</section>
</div>
</main>
<div class="fixed bottom-6 left-1/2 -translate-x-1/2 w-full max-w-4xl px-8 z-[100] ml-32">
<div class="bg-white dark:bg-slate-900 border border-slate-100 dark:border-slate-800 rounded-2xl px-8 py-5 flex items-center justify-between shadow-2xl backdrop-blur-sm">
<div class="flex flex-col">
<span class="text-on-surface font-bold text-sm leading-tight">로그인하시면 더 많은 기능을 사용할 수 있습니다.</span>
<span class="text-on-surface-variant text-xs mt-0.5">개인 맞춤 운동 계획과 식단 관리를 시작해 보세요.</span>
</div>
<div class="flex items-center gap-6">
<span class="text-[10px] font-black text-slate-300 tracking-widest hidden md:block">FITSBUG EXPERIENCE</span>
<button onclick="location.href='<%=contextPath%>/login.jsp'" class="bg-blue-600 hover:bg-blue-700 text-white px-8 py-2.5 rounded-xl text-sm font-bold shadow-lg shadow-blue-500/20 active:scale-95 transition-all">
로그인
</button>
</div>
</div>
</div>
</body>
</html>