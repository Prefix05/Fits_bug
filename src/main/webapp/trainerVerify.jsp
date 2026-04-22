<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>트레이너 인증</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

</head>

<body class="bg-gray-900 flex items-center justify-center h-screen">

<div class="bg-white w-[420px] p-8 rounded">

<h2 class="text-xl font-bold mb-6">트레이너 인증 (선택)</h2>

<form action="trainerVerify" method="post" class="space-y-4">

<input name="experience" placeholder="운동 경력 (예: 3년)" class="w-full border p-3 rounded">

<textarea name="career" placeholder="커리어" class="w-full border p-3 rounded"></textarea>

<input name="certificate" placeholder="자격증" class="w-full border p-3 rounded">

<div class="flex gap-2">
<button type="button" onclick="location.href='main.jsp'" class="w-1/2 border p-3 rounded">
건너뛰기
</button>

<button class="w-1/2 bg-orange-500 text-white p-3 rounded">
제출하기
</button>
</div>

</form>

</div>

</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>트레이너 인증</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "surface-bright": "#f8f9fb",
                        "background": "#f8f9fb",
                        "surface-tint": "#a04100",
                        "tertiary-fixed": "#d0e4ff",
                        "outline": "#8e7164",
                        "primary-fixed-dim": "#ffb693",
                        "inverse-surface": "#2e3132",
                        "inverse-on-surface": "#f0f1f3",
                        "tertiary-fixed-dim": "#9ccaff",
                        "on-surface-variant": "#5a4136",
                        "on-tertiary-fixed-variant": "#00497b",
                        "error": "#ba1a1a",
                        "surface-container-high": "#e7e8ea",
                        "secondary-fixed": "#ffdbcc",
                        "tertiary-container": "#059eff",
                        "on-primary-fixed-variant": "#7a3000",
                        "surface-dim": "#d9dadc",
                        "tertiary": "#0062a1",
                        "surface-container-lowest": "#ffffff",
                        "on-primary-fixed": "#351000",
                        "on-error-container": "#93000a",
                        "on-tertiary": "#ffffff",
                        "secondary": "#96481e",
                        "on-secondary-container": "#763006",
                        "secondary-fixed-dim": "#ffb693",
                        "secondary-container": "#fe9a69",
                        "surface-container-low": "#f3f4f6",
                        "error-container": "#ffdad6",
                        "surface-container": "#edeef0",
                        "surface": "#f8f9fb",
                        "on-surface": "#191c1e",
                        "on-secondary": "#ffffff",
                        "on-secondary-fixed": "#351000",
                        "primary-container": "#ff6b00",
                        "on-tertiary-container": "#003357",
                        "on-background": "#191c1e",
                        "surface-variant": "#e1e2e4",
                        "on-secondary-fixed-variant": "#783207",
                        "surface-container-highest": "#e1e2e4",
                        "on-tertiary-fixed": "#001d35",
                        "on-error": "#ffffff",
                        "outline-variant": "#e2bfb0",
                        "on-primary": "#ffffff",
                        "primary-fixed": "#ffdbcc",
                        "on-primary-container": "#572000",
                        "inverse-primary": "#ffb693",
                        "primary": "#a04100"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.5rem",
                        "sm": "0.5rem",
                        "lg": "2rem",
                        "xl": "3rem",
                        "full": "9999px"
                    },
                    "spacing": {},
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
        }
        .material-symbols-outlined.filled {
            font-variation-settings: 'FILL' 1;
        }
    </style>
</head>
<body class="bg-background font-body text-on-surface antialiased h-screen w-screen overflow-hidden relative">
<!-- Background Image with Overlay -->
<div class="absolute inset-0 z-0 bg-cover bg-center" data-alt="Dark, moody, high-end fitness gym interior with modern equipment and dramatic lighting, slightly out of focus." style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBMdTg95p3QNGjKAO_DLmeBnrUkTQFWNS89Skc1sK3TgJy43-WPL0bMnJhkfxcCvp0U3hV6AKuccXH_bG6R3rM0A5oDss_L8HBEaPGPj1g2o_CTGFNsV2WU5zRxDzLdcszx1iOC2a43SOz1kOF4ojeMMqjeLKywio7xMC3HXvAy918TQrSDBmGuF9recp8dbc0-7Ctyz7rdoEoJWICWj-53R_yp89SEcohfmKN0llDU9ZcMDpL1uPV4RfgEH_oX68pczxSAebNr2bs');">
<div class="absolute inset-0 bg-inverse-surface/60 backdrop-blur-md"></div>
</div>
<!-- Main Content Area -->
<main class="relative z-10 w-full h-full flex flex-col items-center justify-center p-6">
<!-- Top Toast Message -->
<div class="absolute top-8 w-full max-w-md px-4 flex justify-center animate-[slideDown_0.5s_ease-out]">
<div class="bg-surface-container-lowest text-on-surface shadow-[0_8px_30px_rgb(0,0,0,0.12)] rounded-full py-3 px-5 flex items-center gap-3 border border-surface-container-high/50">
<div class="bg-[#e8f5e9] text-[#2e7d32] rounded-full p-1 flex items-center justify-center">
<span class="material-symbols-outlined filled text-lg">check_circle</span>
</div>
<p class="text-sm font-medium tracking-tight whitespace-nowrap">회원가입이 완료되었습니다. 관리자 승인 후 인증 마크가 부여됩니다.</p>
</div>
</div>
<!-- Verification Modal -->
<div class="bg-surface-container-lowest w-full max-w-[440px] rounded-DEFAULT p-8 shadow-[0_20px_60px_rgba(25,28,30,0.06)] relative overflow-hidden">
<!-- Header -->
<div class="text-center mb-8">
<h2 class="text-2xl font-bold font-headline tracking-tight text-on-surface mb-2">트레이너 인증 (선택)</h2>
<p class="text-on-surface-variant text-sm font-medium">입력 시 인증된 트레이너로 표시됩니다 (관리자 승인 필요)</p>
</div>
<!-- Form -->
<form class="space-y-6">
<!-- Experience Field -->
<div class="space-y-2">
<label class="block text-sm font-semibold text-on-surface">운동 경력</label>
<input class="w-full bg-surface-variant border-none rounded-sm px-4 py-3 text-sm text-on-surface placeholder:text-on-surface-variant/50 focus:ring-2 focus:ring-primary/20 focus:bg-primary-fixed/10 transition-colors" placeholder="년 수 입력 (예: 3년)" type="text"/>
</div>
<!-- Career Field -->
<div class="space-y-2">
<label class="block text-sm font-semibold text-on-surface">커리어 (근무 이력)</label>
<textarea class="w-full bg-surface-variant border-none rounded-sm px-4 py-3 text-sm text-on-surface placeholder:text-on-surface-variant/50 focus:ring-2 focus:ring-primary/20 focus:bg-primary-fixed/10 transition-colors resize-none" placeholder="주요 근무 이력 작성" rows="3"></textarea>
</div>
<!-- Certificate Name Field -->
<div class="space-y-2">
<label class="block text-sm font-semibold text-on-surface">자격증 입력</label>
<input class="w-full bg-surface-variant border-none rounded-sm px-4 py-3 text-sm text-on-surface placeholder:text-on-surface-variant/50 focus:ring-2 focus:ring-primary/20 focus:bg-primary-fixed/10 transition-colors" placeholder="자격증 명칭 입력" type="text"/>
</div>
<!-- Certificate Upload Box -->
<div class="relative group cursor-pointer">
<div class="w-full border-2 border-dashed border-outline-variant/30 rounded-sm bg-surface-container hover:bg-surface-container-high transition-colors py-8 flex flex-col items-center justify-center gap-2 group-hover:border-primary/30">
<span class="material-symbols-outlined text-3xl text-on-surface-variant">photo_camera</span>
<span class="text-sm font-medium text-on-surface-variant">자격증 업로드</span>
<div class="absolute right-4 bottom-4 w-8 h-8 rounded-full bg-surface-container-lowest shadow-sm flex items-center justify-center text-on-surface">
<span class="material-symbols-outlined text-sm">upload</span>
</div>
</div>
</div>
<!-- Actions -->
<div class="flex gap-4 pt-4">
<button class="flex-1 py-3.5 px-4 rounded-full border border-outline-variant text-on-surface font-semibold text-sm hover:bg-surface-container transition-colors text-center" type="button">건너뛰기</button>
<button class="flex-1 py-3.5 px-4 rounded-full bg-gradient-to-br from-primary-container to-primary text-on-primary font-semibold text-sm hover:scale-[1.02] transition-transform duration-200 shadow-sm text-center" type="submit">제출하기</button>
</div>
<!-- Action Buttons -->
<!-- <div class="flex gap-4 pt-4">
<button class="flex-1 bg-surface-container-lowest text-on-surface py-3 rounded-full font-medium text-[14px] hover:bg-surface-container-low transition-colors shadow-[inset_0_0_0_1px_rgba(226,191,176,0.3)]" type="button">건너뛰기</button>
<button class="flex-1 bg-gradient-to-br from-primary-container to-primary text-on-primary py-3 rounded-full font-medium text-[14px] shadow-[0_4px_14px_rgba(255,107,0,0.25)] hover:scale-[1.02] transition-transform duration-300" type="submit">제출하기</button>
</div> -->
</form>
</div>
</main>
</body></html>