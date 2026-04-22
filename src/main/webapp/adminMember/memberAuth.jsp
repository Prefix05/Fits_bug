<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      .hide-scrollbar::-webkit-scrollbar { display: none; }
      .hide-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
    </style>
</head>
<body class="bg-surface font-body text-on-surface antialiased">
<%
    String contextPath = request.getContextPath();
%>
<div class="flex">
	<jsp:include page="../sidebar.jsp"></jsp:include>
</div>
<!-- Main Content Area -->
<main class="ml-64 min-h-screen">
<!-- Page Canvas -->
<div class="pt-24 px-10 pb-10 max-w-7xl">
<!-- Header Section -->
<div class="flex justify-between items-end mb-8">
<div>
<h2 class="text-2xl font-semibold font-headline tracking-tight text-on-surface">회원관리</h2>
<p class="text-on-surface-variant mt-1">신규 가입 회원의 정보를 검토하고 승인 프로세스를 진행합니다.</p>
</div>
</div>
<!-- Main Tabs -->
<div class="flex gap-8 mb-8 border-b border-outline-variant/20">
<a href="<%= request.getContextPath() %>/memberAuth"
class="pb-4 text-sm font-bold text-primary border-b-2 border-primary relative">자격승인</a>
<a href="<%= request.getContextPath() %>/memberGym"
class="pb-4 text-sm font-medium text-on-surface-variant hover:text-primary transition-colors relative">회원리스트</a>
</div>
<!-- Content Grid: Member List + Detail Profile -->
<div class="grid grid-cols-12 gap-8 items-start">
<!-- Left: Pending List (5 cols) -->
<section class="col-span-12 lg:col-span-5 flex flex-col gap-4">
<div class="flex items-center justify-between px-2">
<h3 class="font-bold text-lg flex items-center gap-2">
승인 대기 중인 회원
<span class="bg-primary/10 text-primary text-[11px] px-2 py-0.5 rounded-full font-bold">4</span>
</h3>
</div>
<div class="space-y-3 max-h-[700px] overflow-y-auto pr-2 hide-scrollbar">
<!-- Member Card 1 (Active/Selected) -->
<div class="group p-5 bg-surface-container-lowest rounded-xl shadow-sm border-2 border-primary transition-all cursor-pointer">
<div class="flex items-center gap-4">
<img class="w-14 h-14 rounded-full object-cover" data-alt="Close up portrait of a young Korean woman" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBuizLJWwWRasfQxAPVqtzlF4JuhPSkz6QdfsrWdWYq60QFEwXkHEnv_Ed573UnZcFpUnyjOgxoYY-35J8fHWE86MzP8G7keqoFEAP6Vvqhm4FbDfCIlIq2KK_T7lrnkpV6y05D73kSKwd_LTR8GKkzesJBaD7BLCACV1SBysMYf1WrMUGsTeSoKkIgLKljkYQFsfxiNWwjIpoqicFrTIyBuxWmZLMpqvocN8k4Tyv_tegXpQQi3suxWlSKjixe7olVEI0OKIFEtOY"/>
<div class="flex-1">
<div class="flex justify-between items-start">
<h4 class="font-bold text-on-surface text-base">김서연</h4>
<span class="text-[11px] text-on-surface-variant">2023.10.24 14:20</span>
</div>
<p class="text-xs text-on-secondary-container mt-1">강남구청점 • 퍼스널 트레이닝</p>
</div>
</div>
</div>
<!-- Member Card 2 -->
<div class="group p-5 bg-surface-container-lowest rounded-xl hover:shadow-md transition-all cursor-pointer border border-outline-variant/10">
<div class="flex items-center gap-4">
<img class="w-14 h-14 rounded-full object-cover grayscale group-hover:grayscale-0 transition-all" data-alt="Middle aged Korean man" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAWECKbhJa25Bvf2WgZHFJvhiYVpWk_fBTkuKDsmOtlPcUGynYlzVnP_eI6x2JlC89ujD_MW6NSLhZlr8halbWJucQh2HYg56LLBydKFqEdud4BBe-wUGOGf9W8qGcBOEIIKiptd2stAGDiY_aHSEaJcDZBggZYnsfBdgoguEFL6nkIfMdahBLbaJ0n4g91zK_rA-n2VTKX4U8skbv2fsri-FqhPB-Z79WbLgp7Z7jGhMCR2NjWpvH_LAgfHLlLlk66hWPklVibM3I"/>
<div class="flex-1">
<div class="flex justify-between items-start">
<h4 class="font-bold text-on-surface text-base">이준호</h4>
<span class="text-[11px] text-on-surface-variant">2023.10.24 11:05</span>
</div>
<p class="text-xs text-on-secondary-container mt-1">청담 프리미엄점 • 바디프로필반</p>
</div>
</div>
</div>
<!-- Member Card 3 -->
<div class="group p-5 bg-surface-container-lowest rounded-xl hover:shadow-md transition-all cursor-pointer border border-outline-variant/10">
<div class="flex items-center gap-4">
<img class="w-14 h-14 rounded-full object-cover grayscale group-hover:grayscale-0 transition-all" data-alt="Portrait of a young woman" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDd75Ox5WMSDDnZSNIPBtWzP77lQGWFFRlpYL3lEuUntIledKg_CCJgeSYKP5EVvaC7yDIPlVzUde9J4qRhPRrftTvI0FJoPaIh8lz6X2tWVJcEHj9JGaFp-28QYP1c4S0_fOJOJPbWkWX_op4VEqAdMzCuRigZYLc9qakD_Y_qCf2zHsocdx1VvB0-sscbKlQYXAeGRvwGZ70-LAUtGmFjJYoMRGju8sSX84_XnttrKrwmJH1lOFZg-ckytMHrGbKOpkEqhDk8vFw"/>
<div class="flex-1">
<div class="flex justify-between items-start">
<h4 class="font-bold text-on-surface text-base">박지민</h4>
<span class="text-[11px] text-on-surface-variant">2023.10.23 18:45</span>
</div>
<p class="text-xs text-on-secondary-container mt-1">판교 테크노점 • 요가/필라테스</p>
</div>
</div>
</div>
<!-- Member Card 4 -->
<div class="group p-5 bg-surface-container-lowest rounded-xl hover:shadow-md transition-all cursor-pointer border border-outline-variant/10">
<div class="flex items-center gap-4">
<img class="w-14 h-14 rounded-full object-cover grayscale group-hover:grayscale-0 transition-all" data-alt="Korean business professional" src="https://lh3.googleusercontent.com/aida-public/AB6AXuATuM09AsGB_vA3YDHv8LZURsaTkD1x3UqrIwM2vGwtVy2VrnnLNHH-g3dJ1NdRlpDlK_d_c6jrgYb_eUYZLXp6bOR5wawStDnlEeEYFm4r2Vb-PjUoc7LRr1gL-EGfpCdSaJQB5ZgDSgbNBAkgW3d7jGXCFG7-nwjVA7u27Zjwrdsq-K0x75dVhm7IMY4NVriBaBijEwpQAvUpyrT1vgVvZYY1PbWLX4vGsxwEkBC7ib5GGPMRCNoGWNNki6FHGvBp7eR_by2VO-Q"/>
<div class="flex-1">
<div class="flex justify-between items-start">
<h4 class="font-bold text-on-surface text-base">최성훈</h4>
<span class="text-[11px] text-on-surface-variant">2023.10.23 15:30</span>
</div>
<p class="text-xs text-on-secondary-container mt-1">강남구청점 • 근력증진반</p>
</div>
</div>
</div>
</div>
</section>
<!-- Right: Detailed Profile Card (7 cols) -->
<section class="col-span-12 lg:col-span-7">
<div class="bg-surface-container-lowest rounded-2xl shadow-sm overflow-hidden sticky top-24 border border-outline-variant/10">
<div class="h-32 primary-gradient relative">
<div class="absolute -bottom-12 left-8 p-1 bg-white rounded-full shadow-md">
<img class="w-24 h-24 rounded-full object-cover" data-alt="Member detailed profile portrait" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDdLHYEiE_1mG4AF7v-SG4BILshMrIx3SNYmfB39kt4kztR52JoE564Cbpayk8MNJ6JIZRDEj6tN_MbQGF2GjiX05f3soS3OdBgf7SXep4oOZqV56m9WXH5GZK9cM0HIDczVmG6DxEDZWZ9MXkW0AWIeubAlE5b2sN8ITKIOOI_atX3WGdfa7Va18XddycnhaNz7w3zvvc4LTXz5Hlo9jiYTnjI4ArsLOHRiQhRDwICiaesiecmuewJWSOT7D0VRZPZgGH4A9gOU5M"/>
</div>
</div>
<div class="pt-16 px-10 pb-10">
<div class="flex justify-between items-start mb-8">
<div>
<div class="flex items-center gap-2">
<h3 class="text-2xl font-bold text-on-surface">김서연</h3>
<span class="text-sm text-on-surface-variant font-medium">(26세, 여)</span>
</div>
<p class="text-primary font-semibold mt-1">seoyeon.kim@email.com</p>
</div>
<div class="flex gap-2">
<button class="px-6 py-2.5 rounded-xl border border-outline-variant text-on-surface-variant font-bold text-sm hover:bg-surface-container-high transition-colors">반려</button>
<button class="px-8 py-2.5 rounded-xl primary-gradient text-white font-bold text-sm shadow-sm hover:opacity-90 transition-opacity">승인</button>
</div>
</div>
<div class="grid grid-cols-2 gap-y-8 gap-x-12 mb-10">
<div>
<h4 class="text-[11px] font-bold text-outline-variant uppercase tracking-widest mb-3">연락처</h4>
<div class="flex items-center gap-3 text-on-surface">
<span class="material-symbols-outlined text-primary text-lg">call</span>
<p class="text-sm font-medium">010-2345-6789</p>
</div>
</div>
<div>
<h4 class="text-[11px] font-bold text-outline-variant uppercase tracking-widest mb-3">지망 지점 / 트레이너</h4>
<div class="flex items-center gap-3 text-on-surface">
<span class="material-symbols-outlined text-primary text-lg">location_on</span>
<p class="text-sm font-medium">강남구청점 / 박하준 트레이너</p>
</div>
</div>
<div>
<h4 class="text-[11px] font-bold text-outline-variant uppercase tracking-widest mb-3">가입 경로</h4>
<div class="flex items-center gap-3 text-on-surface">
<span class="material-symbols-outlined text-primary text-lg">explore</span>
<p class="text-sm font-medium">인스타그램 광고</p>
</div>
</div>
<div>
<h4 class="text-[11px] font-bold text-outline-variant uppercase tracking-widest mb-3">관심 분야</h4>
<div class="flex flex-wrap gap-2">
<span class="px-2 py-1 bg-secondary-fixed text-on-secondary-fixed-variant text-[10px] font-bold rounded">체중감량</span>
<span class="px-2 py-1 bg-secondary-fixed text-on-secondary-fixed-variant text-[10px] font-bold rounded">근력강화</span>
</div>
</div>
</div>
<div class="p-6 bg-surface-container-low rounded-xl">
<h4 class="text-[11px] font-bold text-outline-variant uppercase tracking-widest mb-4 flex items-center gap-2">
<span class="material-symbols-outlined text-sm">chat_bubble</span>
                                    가입 인사 및 목표
                                </h4>
<p class="text-sm leading-relaxed text-on-surface-variant">
                                    안녕하세요! 평소 운동에 관심이 많았는데 이번 기회에 핏츠버그에서 체계적인 관리를 받고 싶어 가입하게 되었습니다. 3개월 안에 기초 체력을 기르고 바디프로필 촬영까지 도전해보고 싶습니다. 잘 부탁드려요!
                                </p>
</div>
<div class="mt-8 flex items-center justify-between p-4 border-t border-outline-variant/10">
<span class="text-xs text-on-surface-variant italic">최종 업데이트: 2시간 전</span>
<div class="flex items-center gap-1 text-primary cursor-pointer hover:underline">
<span class="text-xs font-bold">첨부 서류 확인 (2)</span>
<span class="material-symbols-outlined text-sm">open_in_new</span>
</div>
</div>
</div>
</div>
</section>
</div>
</div>
</main>
<!-- FAB for quick action -->
</body></html>