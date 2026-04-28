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
            "colors": {
                    "surface": "#f8f9fb",
                    "on-tertiary": "#ffffff",
                    "secondary": "#585f6c",
                    "on-primary-container": "#fefcff",
                    "tertiary-container": "#b75b00",
                    "outline-variant": "#c2c6d6",
                    "background": "#f8f9fb",
                    "primary": "#0058be",
                    "inverse-on-surface": "#f0f1f3",
                    "on-surface-variant": "#424754",
                    "surface-dim": "#d9dadc",
                    "on-primary": "#ffffff",
                    "on-error": "#ffffff",
                    "tertiary-fixed-dim": "#ffb786",
                    "on-secondary-fixed": "#151c27",
                    "error": "#ba1a1a",
                    "surface-container": "#edeef0",
                    "surface-container-highest": "#e1e2e4",
                    "secondary-container": "#dce2f3",
                    "surface-container-lowest": "#ffffff",
                    "on-tertiary-container": "#fffbff",
                    "inverse-surface": "#2e3132",
                    "surface-container-low": "#f3f4f6",
                    "on-background": "#191c1e",
                    "on-tertiary-fixed-variant": "#723600",
                    "on-tertiary-fixed": "#311400",
                    "on-surface": "#191c1e",
                    "secondary-fixed": "#dce2f3",
                    "on-secondary-container": "#5e6572",
                    "inverse-primary": "#adc6ff",
                    "surface-variant": "#e1e2e4",
                    "tertiary-fixed": "#ffdcc6",
                    "on-primary-fixed": "#001a42",
                    "primary-container": "#2170e4",
                    "surface-container-high": "#e7e8ea",
                    "on-primary-fixed-variant": "#004395",
                    "secondary-fixed-dim": "#c0c7d6",
                    "on-secondary-fixed-variant": "#404754",
                    "tertiary": "#924700",
                    "surface-tint": "#005ac2",
                    "surface-bright": "#f8f9fb",
                    "primary-fixed-dim": "#adc6ff",
                    "outline": "#727785",
                    "on-secondary": "#ffffff",
                    "on-error-container": "#93000a",
                    "error-container": "#ffdad6",
                    "primary-fixed": "#d8e2ff"
            },
            "borderRadius": {
                    "DEFAULT": "0.5rem",
                    "lg": "0.5rem",
                    "xl": "0.75rem",
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
            vertical-align: middle;
        }
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-surface text-on-surface">
<!-- SideNavBar Shell -->
<div class="flex">
	<jsp:include page="../member/sidebar.jsp"></jsp:include>
</div>
<!-- Main Canvas -->
<main class="ml-64 min-h-screen">
<!-- Content Area -->
<div class="pt-24 px-10 pb-10 space-y-8">
<!-- Header Section -->
<section class="relative">
<h2 class="text-2xl font-semibold mb-6">신고 및 문의내역 관리</h2>
<button class="absolute right-0 top-0 flex items-center px-4 py-2 bg-primary text-white rounded-lg text-sm font-semibold hover:opacity-90 transition-opacity">
<span class="material-symbols-outlined text-sm mr-2">edit_note</span>공지사항 작성
</button>
<!-- Tab Navigation -->
<div class="flex space-x-8 border-b border-outline-variant/10">
<button class="pb-4 text-sm font-bold text-primary border-b-2 border-primary">신고내역</button>
<button class="pb-4 text-sm font-medium text-on-surface-variant hover:text-primary transition-colors">문의내역</button>
</div>
</section>
<!-- Main Workspace: Asymmetric Layout -->
<div class="grid grid-cols-12 gap-8">
<!-- Left: List Panel -->
<div class="col-span-5 bg-surface-container-low rounded-xl flex flex-col h-[700px] overflow-hidden">
<div class="p-6 bg-surface-container-low">
<div class="flex justify-between items-center mb-4">
<h3 class="text-lg font-semibold">신고 목록</h3>
<div class="flex bg-surface-container-high rounded-lg p-1">
<button class="px-4 py-1.5 text-xs font-semibold bg-surface-container-lowest rounded-md shadow-sm">미처리</button>
<button class="px-4 py-1.5 text-xs font-semibold text-on-surface-variant">처리완료</button>
</div>
</div>
<!-- Search Bar within List Panel Header -->
<div class="relative">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline text-lg">search</span>
<input class="w-full bg-surface-container-lowest border-none rounded-lg py-2 pl-10 pr-4 text-sm focus:ring-1 focus:ring-primary/20 placeholder:text-outline" placeholder="목록 내 검색" type="text"/>
</div>
</div>
<div class="flex-1 overflow-y-auto px-4 pb-6 space-y-2">
<!-- Report Item 1 -->
<div class="p-4 bg-surface-container-lowest rounded-lg border-l-4 border-error cursor-pointer hover:bg-surface transition-colors">
<div class="flex justify-between mb-1">
<span class="text-xs font-bold text-error">부적절한 홍보 및 광고</span>
<span class="text-xs text-on-surface-variant">10분 전</span>
</div>
<h4 class="text-sm font-semibold mb-1 truncate">부적절한 게시물 광고 의심</h4>
<p class="text-xs text-on-surface-variant truncate">운동 정보 게시판에 불법 도박 사이트 홍보...</p>
<div class="mt-3 flex items-center text-[10px] text-outline">
<span class="material-symbols-outlined text-xs mr-1">person</span> 김철수(user_01)
                            </div>
</div>
<!-- Report Item 2 -->
<div class="p-4 bg-surface rounded-lg cursor-pointer hover:bg-surface-container-high transition-colors">
<div class="flex justify-between mb-1">
<span class="text-xs font-bold text-tertiary">욕설, 비하, 비방 등 혐오 표현</span>
<span class="text-xs text-on-surface-variant">2시간 전</span>
</div>
<h4 class="text-sm font-semibold mb-1 truncate">욕설 및 비방 게시글</h4>
<p class="text-xs text-on-surface-variant truncate">댓글 섹션에서 특정 회원을 향한 인신공격성...</p>
<div class="mt-3 flex items-center text-[10px] text-outline">
<span class="material-symbols-outlined text-xs mr-1">person</span> 이영희(fitness_pro)
                            </div>
</div>
<!-- Report Item 3 -->
<div class="p-4 bg-surface rounded-lg cursor-pointer hover:bg-surface-container-high transition-colors">
<div class="flex justify-between mb-1">
<span class="text-xs font-bold text-error">음란물 또는 청소년에게 부적합한 내용</span>
<span class="text-xs text-on-surface-variant">5시간 전</span>
</div>
<h4 class="text-sm font-semibold mb-1 truncate">잘못된 운동 지식 전파</h4>
<p class="text-xs text-on-surface-variant truncate">부상 위험이 매우 높은 동작을 전문적인 방법인 것 처럼...</p>
<div class="mt-3 flex items-center text-[10px] text-outline">
<span class="material-symbols-outlined text-xs mr-1">person</span> 박민호(minho_p)
                            </div>
</div>
<!-- Report Item 4 -->
<div class="p-4 bg-surface rounded-lg cursor-pointer hover:bg-surface-container-high transition-colors">
<div class="flex justify-between mb-1">
<span class="text-xs font-bold text-secondary">기타</span>
<span class="text-xs text-on-surface-variant">어제</span>
</div>
<h4 class="text-sm font-semibold mb-1 truncate">도배성 게시물 신고</h4>
<p class="text-xs text-on-surface-variant truncate">의미 없는 문자열을 반복적으로 게시하여 게시판 이용 방해...</p>
<div class="mt-3 flex items-center text-[10px] text-outline">
<span class="material-symbols-outlined text-xs mr-1">person</span> 최지우(jiwoo_choi)
                            </div>
</div>
</div>
</div>
<!-- Right: Detail Panel -->
<div class="col-span-7 space-y-6">
<div class="bg-surface-container-lowest rounded-xl p-8 shadow-sm h-full flex flex-col">
<!-- Action Header -->
<div class="flex justify-between items-start mb-8">
<div>
<div class="flex items-center space-x-2 mb-2">
<span class="bg-error/10 text-error px-2 py-1 rounded text-[10px] font-bold">미처리</span>
<span class="text-xs text-on-surface-variant">No. 2024-00152</span>
</div>
<h3 class="text-xl font-bold">부적절한 게시물 광고 의심</h3>
<p class="text-sm text-error font-medium mt-1">신고유형 : 부적절한 홍보 및 광고</p>
</div>
<div class="flex space-x-2">
<button class="px-5 py-2 text-sm font-semibold border border-outline-variant/20 rounded-lg hover:bg-surface transition-colors">반려</button>
<button class="px-5 py-2 text-sm font-semibold text-white rounded-lg hover:opacity-90 transition-opacity bg-red-600">숨김처리</button>
</div>
</div>
<!-- Content Info -->
<div class="flex-1 space-y-8">
<div class="grid grid-cols-2 gap-8">
<div class="space-y-1">
<p class="text-xs text-outline font-medium">신고자</p>
<p class="text-sm font-semibold">김철수 (ID: user_01)</p>
</div>
<div class="space-y-1">
<p class="text-xs text-outline font-medium">신고 일시</p>
<p class="text-sm font-semibold">2024.05.20 14:32:11</p>
</div>
<div class="space-y-1">
<p class="text-xs text-outline font-medium">대상 작성자</p>
<p class="text-sm font-semibold">광고봇99 (ID: ad_bot_99)</p>
</div>
</div>
<div class="space-y-2">
<p class="text-xs text-outline font-medium">상세 신고 내용</p>
<div class="bg-surface p-4 rounded-lg text-sm leading-relaxed text-on-surface-variant">
                                    자유게시판에 '단기간 고수익 보장' 이라는 제목으로 사행성 게임 사이트를 홍보하는 글을 지속적으로 올리고 있습니다. 이전에도 여러 번 신고했으나 아이디를 바꿔가며 활동하는 것으로 보입니다. 빠른 조치 부탁드립니다.
                                </div>
</div>
<div class="space-y-2">
<p class="text-xs text-outline font-medium">증거 이미지</p>
<div class="flex space-x-4">
<img alt="Report Evidence" class="w-32 h-32 object-cover rounded-lg border border-outline-variant/10" data-alt="screenshot of a forum post with gambling website links and colorful banners, red circles highlighting the illegal content" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAWRIQ_o2ubICCrxH2W7C0Pg5PUB65LTyWvi4JiphH28pDrJUvAONnICzZ4Yzwo1eoA6SgPweWGLTO_26pSl7uYEvNvg4mF4pSH9l5XTtUsz1bUDRnhCQ4Qj5Oflno60uGfHUcF0A_XL9goM1xRDd8e2w_Q6q7F6JelKruDfSq2cE6QKTzIDgiYM0g9RNt56PHrGY66NrxMDnq7RC5iBFvAm56u9XCA3B69PpxgXStDQdPtgZQGZjm6sZw6rG4OT6uPJB1flhBck8Y"/>
</div>
</div>
</div>
<!-- Link to Post -->
<div class="mt-auto pt-8 border-t border-outline-variant/10 flex justify-end">
<button class="flex items-center space-x-2 text-primary font-bold text-sm hover:underline">
<span>해당 게시물로 이동</span>
<span class="material-symbols-outlined text-sm">open_in_new</span>
</button>
</div>
</div>
</div>
</div>
<!-- Summary Indicators -->
<section class="grid grid-cols-4 gap-6">
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm">
<p class="text-xs text-on-surface-variant mb-1 font-medium">전체 내역</p>
<p class="text-2xl font-bold">1,248 <span class="text-sm font-normal text-outline">건</span></p>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border-l-4 border-error">
<p class="text-xs text-on-surface-variant mb-1 font-medium">신고 내역</p>
<p class="text-2xl font-bold text-error">32 <span class="text-sm font-normal text-outline">건</span></p>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm">
<p class="text-xs text-on-surface-variant mb-1 font-medium">문의 내역</p>
<p class="text-2xl font-bold">12 <span class="text-sm font-normal text-outline">건</span></p>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm">
<p class="text-xs text-on-surface-variant mb-1 font-medium">처리 완료 (금일)</p>
<p class="text-2xl font-bold text-primary">41 <span class="text-sm font-normal text-outline">건</span></p>
</div>
</section>
</div>
</main>
</body></html>