<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>회원가입 인증</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "on-primary-fixed-variant": "#7a3000",
                        "primary-container": "#ff6b00",
                        "primary": "#a04100",
                        "surface-dim": "#d9dadc",
                        "tertiary": "#0062a1",
                        "tertiary-fixed-dim": "#9ccaff",
                        "outline": "#8e7164",
                        "on-primary": "#ffffff",
                        "surface-bright": "#f8f9fb",
                        "error": "#ba1a1a",
                        "secondary-container": "#fe9a69",
                        "surface-tint": "#a04100",
                        "on-error-container": "#93000a",
                        "on-primary-fixed": "#351000",
                        "tertiary-container": "#059eff",
                        "secondary": "#96481e",
                        "on-primary-container": "#572000",
                        "on-tertiary-container": "#003357",
                        "on-secondary-fixed": "#351000",
                        "surface-container-lowest": "#ffffff",
                        "on-tertiary": "#ffffff",
                        "surface-container-high": "#e7e8ea",
                        "surface-container-low": "#f3f4f6",
                        "secondary-fixed-dim": "#ffb693",
                        "primary-fixed-dim": "#ffb693",
                        "on-secondary-fixed-variant": "#783207",
                        "on-surface-variant": "#5a4136",
                        "on-secondary-container": "#763006",
                        "inverse-on-surface": "#f0f1f3",
                        "surface-variant": "#e1e2e4",
                        "secondary-fixed": "#ffdbcc",
                        "primary-fixed": "#ffdbcc",
                        "outline-variant": "#e2bfb0",
                        "background": "#f8f9fb",
                        "surface": "#f8f9fb",
                        "on-tertiary-fixed": "#001d35",
                        "inverse-primary": "#ffb693",
                        "error-container": "#ffdad6",
                        "on-secondary": "#ffffff",
                        "on-background": "#191c1e",
                        "tertiary-fixed": "#d0e4ff",
                        "inverse-surface": "#2e3132",
                        "surface-container-highest": "#e1e2e4",
                        "surface-container": "#edeef0",
                        "on-surface": "#191c1e",
                        "on-error": "#ffffff",
                        "on-tertiary-fixed-variant": "#00497b"
                    },
                    borderRadius: {
                        "DEFAULT": "0.5rem",
                        "lg": "1rem",
                        "xl": "1.5rem",
                        "full": "9999px"
                    },
                    fontFamily: {
                        "headline": ["Inter"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    }
                }
            }
        }
    </script>
<style>
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-surface relative min-h-screen font-body text-on-surface flex items-center justify-center">
<!-- Blurred Background (simulating overlay) -->
<div class="absolute inset-0 bg-inverse-surface/40 backdrop-blur-sm z-0"></div>
<!-- Main Container relative for toast positioning -->
<div class="relative w-full max-w-lg z-10 flex flex-col items-center px-4">
<div class="absolute -top-24 w-full bg-surface-container-lowest rounded-[8px] shadow-[0_4px_24px_rgba(25,28,30,0.06)] p-4 flex items-center gap-3">
<span class="material-symbols-outlined text-[#10B981] fill-current" style="font-variation-settings: 'FILL' 1;">check_circle</span>
<p class="text-on-surface text-[14px] leading-[1.6]">회원가입이 완료되었습니다. 관리자 승인 후 인증 마크가 부여됩니다.</p>
</div>
<!-- Success Toast Notification -->
<div class="absolute -top-24 w-full bg-surface-container-lowest rounded-[8px] shadow-[0_4px_24px_rgba(25,28,30,0.06)] p-4 flex items-center gap-3">
<span class="material-symbols-outlined text-[#10B981] fill-current" style="font-variation-settings: 'FILL' 1;">check_circle</span>
<p class="text-on-surface text-[14px] leading-[1.6]">회원가입이 완료되었습니다. 관리자 승인 후 인증 마크가 부여됩니다.</p>
</div>
<!-- Verification Modal -->
<div class="w-full bg-surface-container-lowest rounded-[16px] shadow-[0_8px_32px_rgba(25,28,30,0.08)] p-8">
<div class="text-center mb-8">
<h2 class="text-display-md font-bold text-on-surface tracking-tight mb-2">사업자 인증 (선택)</h2>
<p class="text-on-surface-variant text-[14px]">입력 시 인증된 헬스장으로 표시됩니다 (관리자 승인 필요)</p>
</div>
<form class="space-y-6">
<!-- Input Field -->
<div>
<label class="block text-on-surface font-medium text-[14px] mb-2">사업자등록번호</label>
<div class="relative">
<input class="w-full bg-surface-variant text-on-surface placeholder:text-on-surface-variant/50 rounded-[8px] border-none py-3 px-4 focus:bg-primary-fixed/10 focus:ring-0 focus:outline-none transition-all duration-300" placeholder="번호를 입력해주세요" style="box-shadow: inset 0 0 0 1px rgba(226, 191, 176, 0.15);" type="text"/>
</div>
</div>
<!-- File Upload Area -->
<div>
<div class="w-full border border-dashed border-outline-variant/30 bg-surface-container-low rounded-[8px] py-10 flex flex-col items-center justify-center cursor-pointer hover:bg-surface-variant/50 transition-colors">
<span class="material-symbols-outlined text-on-surface-variant text-3xl mb-2">cloud_upload</span>
<p class="text-on-surface font-medium text-[14px]">사업자등록증 업로드</p>
</div>
</div>
<!-- Action Buttons -->
<div class="flex gap-4 pt-4">
<button class="flex-1 bg-surface-container-lowest text-on-surface py-3 rounded-full font-medium text-[14px] hover:bg-surface-container-low transition-colors shadow-[inset_0_0_0_1px_rgba(226,191,176,0.3)]" type="button">건너뛰기</button>
<button class="flex-1 bg-gradient-to-br from-primary-container to-primary text-on-primary py-3 rounded-full font-medium text-[14px] shadow-[0_4px_14px_rgba(255,107,0,0.25)] hover:scale-[1.02] transition-transform duration-300" type="submit">제출하기</button>
</div>
</form>
</div>
</div>
</body></html>