<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>신고 및 문의내역 관리 - 핏츠버그</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "surface-container-lowest": "#ffffff",
                        "surface-container-highest": "#e1e2e4",
                        "surface-container": "#edeef0",
                        "on-primary": "#ffffff",
                        "on-error-container": "#93000a",
                        "background": "#f8f9fb",
                        "error": "#ba1a1a",
                        "outline": "#727785",
                        "secondary-container": "#dce2f3",
                        "on-secondary-fixed-variant": "#404754",
                        "tertiary": "#924700",
                        "tertiary-fixed-dim": "#ffb786",
                        "on-tertiary-fixed": "#311400",
                        "surface-variant": "#e1e2e4",
                        "primary-container": "#2170e4",
                        "on-surface-variant": "#424754",
                        "error-container": "#ffdad6",
                        "surface-container-low": "#f3f4f6",
                        "on-tertiary-fixed-variant": "#723600",
                        "secondary-fixed-dim": "#c0c7d6",
                        "outline-variant": "#c2c6d6",
                        "tertiary-container": "#b75b00",
                        "on-primary-fixed-variant": "#004395",
                        "on-error": "#ffffff",
                        "inverse-surface": "#2e3132",
                        "on-tertiary-container": "#fffbff",
                        "on-secondary": "#ffffff",
                        "tertiary-fixed": "#ffdcc6",
                        "inverse-primary": "#adc6ff",
                        "on-secondary-fixed": "#151c27",
                        "inverse-on-surface": "#f0f1f3",
                        "on-tertiary": "#ffffff",
                        "surface-container-high": "#e7e8ea",
                        "primary-fixed": "#d8e2ff",
                        "surface": "#f8f9fb",
                        "secondary": "#585f6c",
                        "on-primary-fixed": "#001a42",
                        "surface-tint": "#005ac2",
                        "surface-bright": "#f8f9fb",
                        "secondary-fixed": "#dce2f3",
                        "on-surface": "#191c1e",
                        "surface-dim": "#d9dadc",
                        "on-background": "#191c1e",
                        "primary-fixed-dim": "#adc6ff",
                        "on-secondary-container": "#5e6572",
                        "on-primary-container": "#fefcff",
                        "primary": "#0058be"
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
        body { font-family: 'Inter', sans-serif; }
        .korean-text { line-height: 1.7; }
    </style>
</head>
<body class="bg-background text-on-surface">
<!-- SideNavBar Shell -->
<div class="flex">
	<jsp:include page="../member/sidebar.jsp"></jsp:include>
</div>
<!-- Main Content -->
<main class="ml-64 pt-16 p-10 min-h-screen">
<div class="max-w-7xl mx-auto space-y-8">
<!-- Headline and Action Button Row -->
<div class="flex justify-between items-end">
<div>
<h2 class="text-[1.5rem] font-semibold tracking-tight text-on-surface">신고 및 문의내역 관리</h2>
<p class="text-on-surface-variant text-sm mt-1">사용자들의 신고 내용과 1:1 문의 내역을 관리하고 답변할 수 있습니다.</p>
</div>
<button class="px-5 py-2.5 text-sm font-semibold text-on-primary bg-primary rounded-lg shadow-sm hover:opacity-90 transition-opacity flex items-center gap-2">
<span class="material-symbols-outlined text-base">edit</span>
                    공지사항 작성
                </button>
</div>
<!-- Tabs -->
<div class="border-b border-outline-variant/20">
<div class="flex gap-8">
<button class="pb-4 text-sm font-medium text-on-surface-variant hover:text-primary transition-colors relative">
                        신고내역
                    </button>
<button class="pb-4 text-sm font-bold text-primary relative">
                        문의내역
                        <div class="absolute bottom-0 left-0 w-full h-0.5 bg-primary"></div>
</button>
</div>
</div>
<!-- Inquiry Management Split View -->
<div class="flex gap-6 h-[720px]">
<!-- Left Column: Inquiry List -->
<div class="w-1/3 bg-surface-container-lowest rounded-lg shadow-sm border border-outline-variant/10 flex flex-col overflow-hidden">
<div class="p-5 border-b border-outline-variant/10 flex flex-col gap-4 bg-white">
<div class="flex items-center justify-between">
<h4 class="font-bold text-sm text-on-surface">문의 목록</h4>
<div class="flex gap-1">
<button class="text-[10px] font-bold px-2.5 py-1 bg-primary text-white rounded">미처리</button>
<button class="text-[10px] font-bold px-2.5 py-1 text-on-surface-variant hover:bg-surface-container-low rounded transition-colors">처리완료</button>
</div>
</div>
<!-- Search Bar within List Header -->
<div class="relative">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline text-lg">search</span>
<input class="w-full bg-surface-container-low border-none rounded-lg pl-10 pr-4 py-2 text-xs focus:ring-1 focus:ring-primary/30" placeholder="목록 내 검색..." type="text"/>
</div>
</div>
<div class="flex-1 overflow-y-auto divide-y divide-outline-variant/5">
<!-- Item 1 -->
<div class="p-5 bg-primary/5 border-l-4 border-primary cursor-pointer hover:bg-primary/10 transition-colors">
<div class="flex justify-between mb-1.5">
<span class="text-[10px] px-2 py-0.5 bg-primary/10 text-primary font-bold rounded">결제 및 환불 문의</span>
<span class="text-[10px] text-on-surface-variant font-medium">1시간 전</span>
</div>
<h5 class="text-sm font-bold text-on-surface truncate">중복 결제 환불 요청</h5>
<p class="text-[11px] text-on-surface-variant mt-1.5 line-clamp-2 leading-relaxed">안녕하세요. 어제 정기 구독 결제를 진행했는데, 시스템 오류인지 중복 결제가 되었습니다. 확인 부탁드립니다.</p>
<div class="flex items-center mt-4 gap-2">
<div class="w-5 h-5 rounded-full bg-primary-fixed flex items-center justify-center">
<span class="text-[8px] font-bold text-on-primary-fixed">LV</span>
</div>
<span class="text-xs font-medium text-on-surface-variant">이영희 (LV-10)</span>
</div>
</div>
<!-- Item 2 -->
<div class="p-5 hover:bg-surface-container-low cursor-pointer transition-colors">
<div class="flex justify-between mb-1.5">
<span class="text-[10px] px-2 py-0.5 bg-slate-200 text-on-surface-variant font-bold rounded">계정 및 로그인 관련</span>
<span class="text-[10px] text-on-surface-variant font-medium">3시간 전</span>
</div>
<h5 class="text-sm font-bold text-on-surface truncate">로그인이 되지 않습니다</h5>
<p class="text-[11px] text-on-surface-variant mt-1.5 line-clamp-2 leading-relaxed">앱 업데이트 이후 로그인 화면에서 계속 오류가 발생하여 접속이 불가능합니다. 해결 방법 안내 부탁드려요.</p>
<div class="flex items-center mt-4 gap-2">
<div class="w-5 h-5 rounded-full bg-primary-fixed flex items-center justify-center">
<span class="text-[8px] font-bold text-on-primary-fixed">CS</span>
</div>
<span class="text-xs font-medium text-on-surface-variant">김철수 (CS-402)</span>
</div>
</div>
<!-- Item 3 -->
<div class="p-5 hover:bg-surface-container-low cursor-pointer transition-colors">
<div class="flex justify-between mb-1.5">
<span class="text-[10px] px-2 py-0.5 bg-slate-200 text-on-surface-variant font-bold rounded">계정 및 로그인 관련</span>
<span class="text-[10px] text-on-surface-variant font-medium">5시간 전</span>
</div>
<h5 class="text-sm font-bold text-on-surface truncate">비밀번호 찾기 이메일 미발송</h5>
<p class="text-[11px] text-on-surface-variant mt-1.5 line-clamp-2 leading-relaxed">비밀번호 재설정을 위해 이메일 인증을 시도했으나 스팸함까지 확인해봐도 메일이 오지 않습니다.</p>
<div class="flex items-center mt-4 gap-2">
<div class="w-5 h-5 rounded-full bg-slate-200 flex items-center justify-center">
<span class="text-[8px] font-bold text-on-surface-variant">MP</span>
</div>
<span class="text-xs font-medium text-on-surface-variant">박민호 (minho_p)</span>
</div>
</div>
</div>
</div>
<!-- Right Column: Detail View -->
<div class="flex-1 bg-surface-container-lowest rounded-lg shadow-sm border border-outline-variant/10 flex flex-col overflow-hidden">
<!-- Detail Header -->
<div class="p-6 border-b border-outline-variant/10 flex justify-between items-start bg-white">
<div>
<div class="flex items-center gap-3 mb-2">
<span class="text-[10px] px-2.5 py-0.5 bg-primary/10 text-primary font-bold rounded">문의 접수</span>
<span class="text-xs text-on-surface-variant font-medium">No. INQ-2024-0582</span>
</div>
<h3 class="text-xl font-bold text-on-surface">중복 결제 환불 요청</h3>
<p class="text-sm text-primary font-semibold mt-2">문의 유형: 결제 및 환불 문의</p>
<div class="flex items-center gap-4 mt-4 text-sm">
<div class="flex items-center gap-2.5">
<div class="w-7 h-7 rounded-full bg-slate-200 flex items-center justify-center overflow-hidden border border-outline-variant/10">
<img alt="Reporter" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuByIAk4266m60-1dQjz3IHsljDXu8VA4lZ_UIELHDhh_VQ38iKycxdbJ93Zl4YvyhRf-8nz9xrZZq4wiRn90nNb9Ws9SrctGP2CMIEZWJGGLwM-LMN4RtE9Sm-Y18SnJyqN6YHhvcArlRhtbvlJJbTa8ULkZqsG2f-eykqbtW_9wk3nNukK4hiysW3MyJfeRlCcMbCzmo4nlg2YR5zBdvBf6LKOzT7xm_wsalMXKTzTdMM35SRMmE7x7PjD9ThG7geTWPDILNW0NMI"/>
</div>
<span class="font-semibold text-on-surface">이영희 (회원번호 LV-10)</span>
</div>
<span class="text-outline-variant/40">|</span>
<span class="text-on-surface-variant text-[11px]">접수일시: 2024년 5월 22일 15:20</span>
</div>
</div>
</div>
<!-- Detail Scroll Area -->
<div class="flex-1 overflow-y-auto p-8 space-y-8">
<!-- Inquiry Content -->
<section>
<h4 class="text-[11px] font-bold text-on-surface-variant mb-3 uppercase tracking-wider">문의 내용</h4>
<div class="bg-surface-container-low p-6 rounded-lg text-sm leading-relaxed text-on-surface border border-outline-variant/5">
                                "안녕하세요. 어제 정기 구독 결제를 진행했는데, 시스템 오류인지 중복 결제가 되었습니다. 5월 22일 오후 3시경에 두 번 결제된 내역 확인 부탁드리며, 한 건에 대해서는 즉시 환불 처리 부탁드립니다. 카드 명세서 캡처본 첨부합니다."
                            </div>
</section>
<!-- Attachments -->
<section>
<h4 class="text-[11px] font-bold text-on-surface-variant mb-3 uppercase tracking-wider">결제 내역 증빙 (2)</h4>
<div class="grid grid-cols-2 gap-4">
<div class="relative group rounded-lg overflow-hidden border border-outline-variant/10 aspect-video bg-surface-container-low">
<img alt="Evidence 1" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAJ-Dhm0ED_YSd8sV8ZtgTB7c-7d_cHzukDta8vfYiOjgzCSo5U-_ZTZn4Wba-EAnaPh7YDm-xkeZc4AT1DiQj-VhU7RffnZLeysgxsKAztAUMVh59AsferQDe7URREzY6wFdPTwa9sO4XhMTE3T7XgDCKwFFMPwLbAKQ9DaTWcgPR1TV0rsass78zt4DxrIJSe96H0wlnfxgvft0t9cFhS3AJhDilVB2-LNoMKgwCfe3L5LwAd03OYl-nkg__FtWVF49MRlh-nrYw"/>
<div class="absolute inset-0 bg-black/40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
<span class="material-symbols-outlined text-white text-2xl">zoom_in</span>
</div>
</div>
<div class="relative group rounded-lg overflow-hidden border border-outline-variant/10 aspect-video bg-surface-container-low">
<img alt="Evidence 2" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDuZzIsw-aWdDG33ra0oNPnhQ0QH6kIRv99nFUYrl7DkLLCrhkaRQV9E8v8T4rFz4ra178bC_px_-Txl8OgdntOKkqUoxgyauxb-O7nzNq44qv3GyzgkOBSG2v_75KiPqrt-JiA6KQD0Bv38rsydsSgBTUbB6p2auWZmvFCaeokToOg3XYmce2eIIjLnd92m5OdfENc9fj8N9il7txc4wOSAJHXRELpwf43jhh2uiodPJkwxsJ9a-gLyAlETeaCFN-78a0ZfYtfqyk"/>
<div class="absolute inset-0 bg-black/40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
<span class="material-symbols-outlined text-white text-2xl">zoom_in</span>
</div>
</div>
</div>
</section>
<!-- Admin Response Section -->
<section class="border-t border-outline-variant/10 pt-8">
<h4 class="text-sm font-bold text-on-surface mb-4 flex items-center gap-2">
<span class="material-symbols-outlined text-sm">reply</span>
                                관리자 답변
                            </h4>
<!-- Logs -->
<div class="space-y-4 mb-6">
<div class="bg-surface-container-low p-4 rounded-lg border border-outline-variant/5 shadow-sm">
<div class="flex justify-between items-center mb-2">
<span class="text-[11px] font-bold text-primary">System Admin</span>
<span class="text-[10px] text-on-surface-variant">2024.05.22 16:30</span>
</div>
<p class="text-xs text-on-surface-variant korean-text">안녕하세요 이영희 회원님, 핏츠버그 관리자입니다. 먼저 결제 과정에서 불편을 드려 대단히 죄송합니다. 확인 결과 시스템 일시적 오류로 인해 중복 결제된 내역이 확인되었습니다. 요청하신 한 건에 대해서는 현재 결제 취소 승인이 완료되었으며, 카드사에 따라 영업일 기준 3~5일 이내에 환불 처리가 완료될 예정입니다. 추가 문의 사항이 있으시면 언제든 고객센터로 연락 주시기 바랍니다. 감사합니다.</p>
</div>
</div>
<!-- Textarea and Submit -->
<div class="space-y-4">
<textarea class="w-full bg-surface-container-low border border-outline-variant/10 rounded-lg p-4 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all placeholder:text-on-surface-variant/40 leading-relaxed korean-text" placeholder="답변 내용을 입력하세요..." rows="4"></textarea>
<div class="flex justify-end">
<button class="bg-primary text-white px-6 py-2 rounded-lg text-sm font-bold shadow-sm hover:opacity-90 active:scale-95 transition-all">
                                        답변 등록
                                    </button>
</div>
</div>
</section>
</div>
</div>
</div>
<!-- Summary Cards Section at the Bottom -->
<div class="grid grid-cols-1 md:grid-cols-4 gap-6 pt-4">
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/5 transition-all hover:border-primary/10">
<h3 class="text-xs font-medium text-on-surface-variant mb-1">전체 내역</h3>
<p class="text-2xl font-bold text-on-surface">1,248 <span class="text-sm font-normal text-outline">건</span></p>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border-l-4 border-error border-y border-r border-outline-variant/5 transition-all hover:border-primary/10">
<h3 class="text-xs font-medium text-on-surface-variant mb-1">신고 내역</h3>
<p class="text-2xl font-bold text-error">32 <span class="text-sm font-normal text-outline">건</span></p>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/5 transition-all hover:border-primary/10">
<h3 class="text-xs font-medium text-on-surface-variant mb-1">문의 내역</h3>
<p class="text-2xl font-bold text-on-surface">12 <span class="text-sm font-normal text-outline">건</span></p>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/5 transition-all hover:border-primary/10">
<h3 class="text-xs font-medium text-on-surface-variant mb-1">처리 완료 (금일)</h3>
<p class="text-2xl font-bold text-primary">41 <span class="text-sm font-normal text-outline">건</span></p>
</div>
</div>
</div>
</main>
</body></html>