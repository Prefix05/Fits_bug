<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String contextPath = request.getContextPath();
%>     
<!DOCTYPE html>

<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "surface-dim": "#d9dadc",
              "secondary": "#585f6c",
              "on-surface": "#191c1e",
              "tertiary": "#924700",
              "background": "#f8f9fb",
              "primary-fixed": "#d8e2ff",
              "surface-bright": "#f8f9fb",
              "on-secondary-container": "#5e6572",
              "tertiary-fixed": "#ffdcc6",
              "primary": "#3B82F6",
              "on-tertiary-fixed": "#311400",
              "secondary-fixed": "#dce2f3",
              "surface-tint": "#3B82F6",
              "on-primary-fixed": "#001a42",
              "on-tertiary-fixed-variant": "#723600",
              "primary-fixed-dim": "#adc6ff",
              "primary-container": "#2170e4",
              "on-secondary-fixed": "#151c27",
              "surface-container": "#edeef0",
              "surface-container-highest": "#e1e2e4",
              "on-error": "#ffffff",
              "on-primary": "#ffffff",
              "error-container": "#ffdad6",
              "on-surface-variant": "#424754",
              "tertiary-fixed-dim": "#ffb786",
              "surface-variant": "#e1e2e4",
              "inverse-primary": "#adc6ff",
              "surface": "#f8f9fb",
              "surface-container-low": "#f3f4f6",
              "surface-container-low-80": "rgba(243, 244, 246, 0.8)",
              "surface-container-lowest": "#ffffff",
              "surface-container-high": "#e7e8ea",
              "error": "#ba1a1a",
              "on-secondary": "#ffffff",
              "on-primary-fixed-variant": "#004395",
              "on-tertiary": "#ffffff",
              "outline": "#727785",
              "secondary-fixed-dim": "#c0c7d6",
              "on-primary-container": "#fefcff",
              "on-tertiary-container": "#fffbff",
              "outline-variant": "#c2c6d6",
              "secondary-container": "#dce2f3",
              "inverse-on-surface": "#f0f1f3",
              "on-background": "#191c1e",
              "tertiary-container": "#b75b00",
              "inverse-surface": "#2e3132",
              "on-error-container": "#93000a",
              "on-secondary-fixed-variant": "#404754"
            },
            fontFamily: {
              "headline": ["Inter"],
              "body": ["Inter"],
              "label": ["Inter"]
            },
            borderRadius: {"DEFAULT": "0.5rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
          },
        },
      }
    </script>
<style>
      .material-symbols-outlined {
        font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
      }
      .glass-header {
        backdrop-filter: blur(24px);
        background-color: rgba(255, 255, 255, 0.8);
      }
      .primary-gradient {
        background: linear-gradient(135deg, #3B82F6 0%, #2563EB 100%);
      }
    </style>
</head>
<body class="bg-surface font-body text-on-surface antialiased">
<!-- SideNavBar Shell -->
<div class="flex">
	<jsp:include page="../member/sidebar.jsp"></jsp:include>
</div>
<!-- Main Content Area -->
<main class="ml-64 min-h-screen">
<!-- Page Canvas -->
<div class="pt-24 px-10 pb-10">
<!-- Header Section -->
<div class="flex justify-between items-center mb-8">
<div>
<h2 class="text-2xl font-semibold font-headline tracking-tight text-on-surface">운동가이드 관리</h2>
<p class="text-on-surface-variant mt-1">등록된 운동 가이드를 수정하거나 삭제할 수 있는 관리 대시보드입니다.</p>
</div>
<button onclick="location.href='<%= contextPath %>/admin/exGuideAdd'"
class="bg-primary text-white px-6 py-2.5 rounded-lg text-sm font-semibold flex items-center gap-2 hover:bg-primary/90 transition-colors shadow-sm">
<span class="material-symbols-outlined text-lg">add</span>
등록
</button>
</div>
<!-- Filter/Search Section -->
<div class="bg-surface-container-lowest p-4 rounded-xl shadow-sm border border-outline-variant/10 mb-8 flex items-center justify-between">
<div class="relative w-72 flex items-center">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-on-surface-variant text-lg">search</span>
<input class="w-full pl-10 pr-4 py-2 bg-surface-container-low border-none rounded-lg text-sm focus:ring-2 focus:ring-primary/20 outline-none transition-all" placeholder="운동 가이드 검색..." type="text"/>
</div>
<div class="flex items-center gap-2 flex-wrap">
<span class="text-xs font-medium text-on-surface-variant mr-2">분류:</span>
<div class="flex gap-1.5"><button class="px-3 py-1.5 text-xs font-medium rounded-full bg-primary text-white">전체</button>
<button class="px-3 py-1.5 text-xs font-medium rounded-full bg-surface-container hover:bg-surface-container-high text-on-surface-variant transition-colors">가슴</button>
<button class="px-3 py-1.5 text-xs font-medium rounded-full bg-surface-container hover:bg-surface-container-high text-on-surface-variant transition-colors">등</button>
<button class="px-3 py-1.5 text-xs font-medium rounded-full bg-surface-container hover:bg-surface-container-high text-on-surface-variant transition-colors">하체</button>
<button class="px-3 py-1.5 text-xs font-medium rounded-full bg-surface-container hover:bg-surface-container-high text-on-surface-variant transition-colors">팔</button>
<button class="px-3 py-1.5 text-xs font-medium rounded-full bg-surface-container hover:bg-surface-container-high text-on-surface-variant transition-colors">어깨</button>
<button class="px-3 py-1.5 text-xs font-medium rounded-full bg-surface-container hover:bg-surface-container-high text-on-surface-variant transition-colors">전신</button></div>
</div>
</div>
<!-- Exercise Grid -->
<div class="bg-surface-container-lowest rounded-xl shadow-sm border border-outline-variant/10 p-8">
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
<!-- Card 1 -->
<div class="bg-white rounded-lg border border-outline-variant/10 overflow-hidden flex flex-col hover:shadow-md transition-shadow">
<div class="relative aspect-video">
<img alt="Barbell Squat" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA1CuUOMgpJpbGffV5FHa7rCWPXgNvITIEN2p2WgzYmtGel-fTy6nu7LBdqzhAYRDRjoHOG_MTCZkLv18lsF5NghWRz34Qdc4wbSWUL_-rbLs2JtutAFhYIGH9wEH0rtXid0hQ0NBoKZkdGL5xgx5RfIWNOR9BfLNQsaY84Bt0ddzsbWlBY0An6vu_97kyp0c4cNPFRpasHswzQ2IUJkmwdXkACiFoLSl5Pn4VzKEvPri3520Wu7pDsiusaa8cCFFByJf9xtFxTl7Y"/>
<div class="absolute top-2 left-2 bg-primary/90 text-white text-[10px] font-bold px-2 py-0.5 rounded uppercase">하체</div>
</div>
<div class="p-4 flex-grow flex flex-col">
<h3 class="font-bold text-sm mb-2 text-on-surface">고중량 백 스쿼트 가이드</h3>
<div class="flex items-center gap-3 text-on-surface-variant text-[11px] mb-4">
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">visibility</span> 12,402</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">calendar_today</span> 2024.01.15</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">schedule</span> 15:30</span>
</div>
<div class="flex gap-2 mt-auto">
<button class="flex-1 py-1.5 border border-primary text-primary text-xs font-semibold rounded hover:bg-primary/5 transition-colors">수정</button>
<button class="flex-1 py-1.5 border border-error text-error text-xs font-semibold rounded hover:bg-error/5 transition-colors">삭제</button>
</div>
</div>
</div>
<!-- Card 2 -->
<div class="bg-white rounded-lg border border-outline-variant/10 overflow-hidden flex flex-col hover:shadow-md transition-shadow">
<div class="relative aspect-video">
<img alt="Pull ups" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAoPsBZHOHqkH41hx4oXcS4NLWYL_WyuxJH-Nd8_-h64lGDfGyjOKzrHuhSXW1Ag1LDLNlJuHgMvdUdIOv0SvSfBTq43ngw96Mcf5vvUeLbVrTkjQKc2ZQ-khbt625XtM5DCYQnFdV784Xtwf1DIa115NpPMCCnHnyYiuk_N3Shi7LZhT59MxAEuN_fstDPQDvv1lwd1sAuru9dG7J28qKhbWNzDWdRG6yRkYVpIokraOGJCChZSAFGQuuXAYGtmZoTI2B8yv0wlsQ"/>
<div class="absolute top-2 left-2 bg-primary/90 text-white text-[10px] font-bold px-2 py-0.5 rounded uppercase">등</div>
</div>
<div class="p-4 flex-grow flex flex-col">
<h3 class="font-bold text-sm mb-2 text-on-surface">풀업의 정석: 광배근 타겟</h3>
<div class="flex items-center gap-3 text-on-surface-variant text-[11px] mb-4">
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">visibility</span> 8,921</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">calendar_today</span> 2024.01.14</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">schedule</span> 08:45</span>
</div>
<div class="flex gap-2 mt-auto">
<button class="flex-1 py-1.5 border border-primary text-primary text-xs font-semibold rounded hover:bg-primary/5 transition-colors">수정</button>
<button class="flex-1 py-1.5 border border-error text-error text-xs font-semibold rounded hover:bg-error/5 transition-colors">삭제</button>
</div>
</div>
</div>
<!-- Card 3 -->
<div class="bg-white rounded-lg border border-outline-variant/10 overflow-hidden flex flex-col hover:shadow-md transition-shadow">
<div class="relative aspect-video">
<img alt="Plank" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuB6TuPEflTtDXc-VxBLyYkXPs3jXy1Dw4TPwCWNh9TV_vr3Zq4fVQ6YQxw0vsRIzpQTZamvG2AdPvJU2r2-Y2SshIX6iSZ0_WGmDZh3rBO96qTPATIUb1xrYCU9OQoDkXcgLQCQky0xUV1WUlNyKnBVBj2lDJe2D7IAaEuOYBqAVTK5ibDqw_VpJ8pamlXhHMtKHoog3ZJCi5HVa84cbPV-YJb8qbr3C4S-KVp8AwZP3y5TsHPBVa3Oz5mmowp5f6aMwOXfsebBPiQ"/>
<div class="absolute top-2 left-2 bg-primary/90 text-white text-[10px] font-bold px-2 py-0.5 rounded uppercase">기타</div>
</div>
<div class="p-4 flex-grow flex flex-col">
<h3 class="font-bold text-sm mb-2 text-on-surface">코어 안정성을 위한 10분 플랭크</h3>
<div class="flex items-center gap-3 text-on-surface-variant text-[11px] mb-4">
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">visibility</span> 25,600</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">calendar_today</span> 2024.01.14</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">schedule</span> 10:12</span>
</div>
<div class="flex gap-2 mt-auto">
<button class="flex-1 py-1.5 border border-primary text-primary text-xs font-semibold rounded hover:bg-primary/5 transition-colors">수정</button>
<button class="flex-1 py-1.5 border border-error text-error text-xs font-semibold rounded hover:bg-error/5 transition-colors">삭제</button>
</div>
</div>
</div>
<!-- Card 4 -->
<div class="bg-white rounded-lg border border-outline-variant/10 overflow-hidden flex flex-col hover:shadow-md transition-shadow">
<div class="relative aspect-video">
<img alt="Dumbbell Press" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAKZcb4WUJYmdY3fzaM8-auAgA5DHDgftGgH0J86e7pLlsGTMfq_xtHU1Im_9Freb6XV4Vbov7tQsXid4aorsllleIfNVAj9nRZFX7DJ40WoytJ0kiQCfN613ecnQIJ_OAgDIcIb7HvwpVCJNFyWSvNJvlgbsw1lS2_YvRR7CecZCwpvP5vBVX-RWnIOQ2x11VC7w_5DsDdMfORXSbHUXJIIR_xinKBlzbKpD2PvDdc7r359CYzjYhPCuZA8uiPZjfOCbOPYqwDVOs"/>
<div class="absolute top-2 left-2 bg-primary/90 text-white text-[10px] font-bold px-2 py-0.5 rounded uppercase">가슴</div>
</div>
<div class="p-4 flex-grow flex flex-col">
<h3 class="font-bold text-sm mb-2 text-on-surface">덤벨 프레스: 가슴 근육 고립</h3>
<div class="flex items-center gap-3 text-on-surface-variant text-[11px] mb-4">
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">visibility</span> 5,433</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">calendar_today</span> 2024.01.14</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">schedule</span> 12:00</span>
</div>
<div class="flex gap-2 mt-auto">
<button class="flex-1 py-1.5 border border-primary text-primary text-xs font-semibold rounded hover:bg-primary/5 transition-colors">수정</button>
<button class="flex-1 py-1.5 border border-error text-error text-xs font-semibold rounded hover:bg-error/5 transition-colors">삭제</button>
</div>
</div>
</div>
<!-- Card 5 -->
<div class="bg-white rounded-lg border border-outline-variant/10 overflow-hidden flex flex-col hover:shadow-md transition-shadow">
<div class="relative aspect-video">
<img alt="HIIT Sprint" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBHKrh5EEhE-_cS8Di1pI4fbpyfq5YH8OjbRQH1jElTQVSh8aYyyTzPQUEvObgPocZ94y-8TaxsW_KvqWdofoE2ifWeGdRnZU8rIGBEGO46xSDhwfqJv3xZ7jlnhn8ADPlksADNEoKZRQUe1DZe4X7Fncb1HuYzL5Fl3Q-elTNuR7leHwfXbOgkC_kIR_L4voVPZEtOCw74V0j0u4L5ZHpoLe8BUExH9uBzx2SPmxRzJFy_f3vUo0OFP0SF0Ugt9F4vQsZhlkncwxI"/>
<div class="absolute top-2 left-2 bg-primary/90 text-white text-[10px] font-bold px-2 py-0.5 rounded uppercase">하체</div>
</div>
<div class="p-4 flex-grow flex flex-col">
<h3 class="font-bold text-sm mb-2 text-on-surface">체지방 연소를 위한 HIIT 스프린트</h3>
<div class="flex items-center gap-3 text-on-surface-variant text-[11px] mb-4">
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">visibility</span> 18,109</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">calendar_today</span> 2024.01.14</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">schedule</span> 20:00</span>
</div>
<div class="flex gap-2 mt-auto">
<button class="flex-1 py-1.5 border border-primary text-primary text-xs font-semibold rounded hover:bg-primary/5 transition-colors">수정</button>
<button class="flex-1 py-1.5 border border-error text-error text-xs font-semibold rounded hover:bg-error/5 transition-colors">삭제</button>
</div>
</div>
</div>
<!-- Card 6 -->
<div class="bg-white rounded-lg border border-outline-variant/10 overflow-hidden flex flex-col hover:shadow-md transition-shadow">
<div class="relative aspect-video">
<img alt="Stretching" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCDR98ORBrXuSVWS8C-3cLv1JCPvo5sxW8RjZfiSb5lQMpWCvdQriI46D5igAdMl7KDcNVO5V_5Lo8hWxESeomCeoHI8ySp7X1MHIyiuckU3_a1JKTgJcY9TUc_dQcctvsH_BgDdkZoWZTJ6X3M-nEeAPaPH7vkIajcvZyxbb3iu5BflpWCHl2FhUMvDNwk1r2TUzTavj71DaRxzvz5m5xLrZaVLyA5WRJILicJcQt6GU--FPRKx0M9CyptKmggOnchJD04T7noajI"/>
<div class="absolute top-2 left-2 bg-primary/90 text-white text-[10px] font-bold px-2 py-0.5 rounded uppercase">팔</div>
</div>
<div class="p-4 flex-grow flex flex-col">
<h3 class="font-bold text-sm mb-2 text-on-surface">운동 후 필수 리커버리 스트레칭</h3>
<div class="flex items-center gap-3 text-on-surface-variant text-[11px] mb-4">
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">visibility</span> 11,005</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">calendar_today</span> 2024.01.14</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">schedule</span> 14:45</span>
</div>
<div class="flex gap-2 mt-auto">
<button class="flex-1 py-1.5 border border-primary text-primary text-xs font-semibold rounded hover:bg-primary/5 transition-colors">수정</button>
<button class="flex-1 py-1.5 border border-error text-error text-xs font-semibold rounded hover:bg-error/5 transition-colors">삭제</button>
</div>
</div>
</div>
<!-- Card 7 -->
<div class="bg-white rounded-lg border border-outline-variant/10 overflow-hidden flex flex-col hover:shadow-md transition-shadow">
<div class="relative aspect-video">
<img alt="Kettlebell Swings" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA9Z5MAOEpI8d7gG8iwcoWXrrvJAFKFWVsfe1EkW7KbLw9Bb3J6EDnZV66LJCj2oDXVYadDmOXMhTq32-0m_XOMb050iOL1ANCgXO4ps9MIIe5J5pec6kitw0AnyqyBP8omMvJi_mJLWcqBfTi8gn9UYGaOrsC9Gm8Puu873HYcsrXP_QW7FWlFkIlzrmX7jgFNmVPEScilz5mB3NYIwEiQoB06VbNlCZnpg_fGR523q7X9OYYrGhIVSPUm1VXG_6thO6dk044V7O8"/>
<div class="absolute top-2 left-2 bg-primary/90 text-white text-[10px] font-bold px-2 py-0.5 rounded uppercase">하체</div>
</div>
<div class="p-4 flex-grow flex flex-col">
<h3 class="font-bold text-sm mb-2 text-on-surface">케틀벨 스윙: 전신 협응성 강화</h3>
<div class="flex items-center gap-3 text-on-surface-variant text-[11px] mb-4">
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">visibility</span> 7,211</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">calendar_today</span> 2024.01.14</span>
<span class="flex items-center gap-1"><span class="material-symbols-outlined text-sm">schedule</span> 18:20</span>
</div>
<div class="flex gap-2 mt-auto">
<button class="flex-1 py-1.5 border border-primary text-primary text-xs font-semibold rounded hover:bg-primary/5 transition-colors">수정</button>
<button class="flex-1 py-1.5 border border-error text-error text-xs font-semibold rounded hover:bg-error/5 transition-colors">삭제</button>
</div>
</div>
</div>
</div>
<!-- Pagination -->
<div class="mt-8 flex items-center justify-between border-t border-outline-variant/10 pt-6">
<p class="text-xs text-on-surface-variant">전체 128개 중 1-8 표시 중</p>
<div class="flex items-center gap-1">
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container transition-colors">
<span class="material-symbols-outlined text-lg" data-icon="chevron_left">chevron_left</span>
</button>
<button class="w-8 h-8 flex items-center justify-center rounded bg-primary text-white font-bold text-xs shadow-sm">1</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container text-xs font-medium">2</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container text-xs font-medium">3</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container text-xs font-medium">...</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container text-xs font-medium">12</button>
<button class="w-8 h-8 flex items-center justify-center rounded hover:bg-surface-container transition-colors">
<span class="material-symbols-outlined text-lg" data-icon="chevron_right">chevron_right</span>
</button>
</div>
</div>
</div>
</div>
</main>
</body></html>