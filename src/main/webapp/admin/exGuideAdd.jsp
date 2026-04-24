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
      .hangul-lh { line-height: 1.7; }
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
<button onclick="location.href='<%= contextPath %>/admin/exGuideList'" 
class="bg-primary text-white px-6 py-2.5 rounded-lg text-sm font-semibold flex items-center gap-2 hover:bg-primary/90 transition-colors shadow-sm">
<span class="material-symbols-outlined text-lg">arrow_back</span>
목록으로 돌아가기
</button>
</div>
<!-- Registration Form Content -->
<div class="grid grid-cols-12 gap-8">
<!-- Registration Form -->
<div class="col-span-12 lg:col-span-8">
<section class="bg-surface-container-lowest p-8 rounded-xl shadow-sm border border-outline-variant/10">
<div class="flex items-center gap-3 mb-8">
<div class="w-10 h-10 bg-primary-fixed flex items-center justify-center rounded-lg text-primary">
<span class="material-symbols-outlined">add_circle</span>
</div>
<h3 class="text-xl font-bold tracking-tight">신규 가이드 등록</h3>
</div>
<form class="space-y-6">
<div class="space-y-2">
<label class="text-xs font-bold text-outline uppercase tracking-wider">가이드 제목</label>
<input class="w-full bg-surface-container-low border-none border-b-2 border-outline-variant focus:border-primary focus:ring-0 text-base px-0 py-3 transition-all placeholder:text-outline-variant" placeholder="예: 초보자를 위한 하체 스쿼트의 정석" type="text"/>
</div>
<div class="grid grid-cols-2 gap-6">
<div class="space-y-2">
<label class="text-xs font-bold text-outline uppercase tracking-wider">운동 타입</label>
<select class="w-full bg-surface-container-low border-none border-b-2 border-outline-variant focus:border-primary focus:ring-0 text-sm py-3 transition-all">
<option>근력</option>
<option>유산소</option>
</select>
</div>
<div class="space-y-2">
<label class="text-xs font-bold text-outline uppercase tracking-wider">난이도</label>
<div class="flex gap-2 pt-2"><span class="px-4 py-1.5 rounded-full bg-secondary-container text-on-secondary-container text-xs font-semibold cursor-pointer border border-transparent hover:border-primary transition-all">초급</span>
<span class="px-4 py-1.5 rounded-full bg-surface-container-high text-on-surface-variant text-xs font-semibold cursor-pointer border border-transparent hover:border-primary transition-all">중급</span>
<span class="px-4 py-1.5 rounded-full bg-surface-container-high text-on-surface-variant text-xs font-semibold cursor-pointer border border-transparent hover:border-primary transition-all">고급</span></div>
</div>
</div><div class="space-y-2 pt-4"><label class="text-xs font-bold text-outline uppercase tracking-wider">운동 부위</label><div class="flex flex-wrap gap-2 pt-2"><span class="px-4 py-1.5 rounded-full bg-surface-container-high text-on-surface-variant text-xs font-semibold cursor-pointer border border-transparent hover:border-primary transition-all">가슴</span>
<span class="px-4 py-1.5 rounded-full bg-surface-container-high text-on-surface-variant text-xs font-semibold cursor-pointer border border-transparent hover:border-primary transition-all">등</span>
<span class="px-4 py-1.5 rounded-full bg-surface-container-high text-on-surface-variant text-xs font-semibold cursor-pointer border border-transparent hover:border-primary transition-all">하체</span>
<span class="px-4 py-1.5 rounded-full bg-surface-container-high text-on-surface-variant text-xs font-semibold cursor-pointer border border-transparent hover:border-primary transition-all">팔</span>
<span class="px-4 py-1.5 rounded-full bg-surface-container-high text-on-surface-variant text-xs font-semibold cursor-pointer border border-transparent hover:border-primary transition-all">어깨</span>
<span class="px-4 py-1.5 rounded-full bg-surface-container-high text-on-surface-variant text-xs font-semibold cursor-pointer border border-transparent hover:border-primary transition-all">전신</span></div></div>
<div class="space-y-2">
<label class="text-xs font-bold text-outline uppercase tracking-wider">상세 설명</label>
<textarea class="w-full bg-surface-container-low border-none border-b-2 border-outline-variant focus:border-primary focus:ring-0 text-sm px-4 py-3 rounded-lg transition-all hangul-lh min-h-[200px]" placeholder="운동 방법, 주의사항, 호흡법 등을 상세히 기록해 주세요." rows="6"></textarea>
</div>
<div class="space-y-2">
<label class="text-xs font-bold text-outline uppercase tracking-wider">핵심자세포인트</label>
<textarea class="w-full bg-surface-container-low border-none border-b-2 border-outline-variant focus:border-primary focus:ring-0 text-sm px-4 py-3 rounded-lg transition-all hangul-lh min-h-[200px]" placeholder="운동 시 반드시 지켜야 할 자세의 핵심 포인트를 입력해 주세요." rows="6"></textarea>
</div>
<div class="pt-4">
<button class="w-full bg-primary hover:bg-primary-container text-on-primary py-4 rounded-xl font-bold text-base transition-all scale-100 active:scale-[0.98] shadow-lg shadow-primary/20" type="submit">
                                가이드 등록하기
                            </button>
</div>
</form>
</section>
</div>
<!-- Media Upload Column -->
<div class="col-span-12 lg:col-span-4 space-y-6">
<div class="space-y-4">
<label class="text-xs font-bold text-outline uppercase tracking-wider">미디어 업로드</label>
<div class="flex flex-col gap-4">
<div class="border-2 border-dashed border-outline-variant/50 rounded-xl p-10 flex flex-col items-center justify-center bg-surface-container-lowest hover:bg-surface-container-low transition-all cursor-pointer group h-64">
<span class="material-symbols-outlined text-outline group-hover:text-primary mb-3 text-4xl">image</span>
<p class="text-sm font-medium text-on-surface-variant">이미지 업로드</p>
<p class="text-xs text-outline mt-1">PNG, JPG (최대 10MB)</p>
</div>
<div class="border-2 border-dashed border-outline-variant/50 rounded-xl p-10 flex flex-col items-center justify-center bg-surface-container-lowest hover:bg-surface-container-low transition-all cursor-pointer group h-64">
<span class="material-symbols-outlined text-outline group-hover:text-primary mb-3 text-4xl">movie</span>
<p class="text-sm font-medium text-on-surface-variant">영상 업로드</p>
<p class="text-xs text-outline mt-1">MP4, MOV (최대 100MB)</p>
</div>
</div>
</div>
</div>
</div>
</div>
</main>
<!-- Floating Action Button -->
<button class="fixed bottom-8 right-8 w-14 h-14 bg-on-surface text-surface rounded-full flex items-center justify-center shadow-2xl hover:scale-110 active:scale-95 transition-all z-50">
<span class="material-symbols-outlined">help_outline</span>
</button>
</body></html>