<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Fitzberg - 요금 및 스케줄</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script id="tailwind-config">tailwind.config = {
        darkMode: "class", theme: { extend: { colors: {
            "on-tertiary": "#ffffff", "on-surface": "#1a1c1f", "on-secondary-container": "#2d4c83",
            "surface-container-high": "#e8e8ed", tertiary: "#9e3d00", surface: "#f9f9fe",
            "on-error": "#ffffff", "surface-container-highest": "#e2e2e7",
            "on-primary-fixed-variant": "#004493", "on-tertiary-container": "#fffbff",
            "secondary-fixed": "#d8e2ff", "surface-container": "#ededf2",
            "primary-fixed-dim": "#adc6ff", "tertiary-fixed-dim": "#ffb595",
            "on-background": "#1a1c1f", "surface-variant": "#e2e2e7",
            "inverse-primary": "#adc6ff", "tertiary-fixed": "#ffdbcc",
            "outline-variant": "#c1c6d7", "on-secondary-fixed-variant": "#26467d",
            "on-primary-container": "#fefcff", "on-secondary": "#ffffff",
            "surface-bright": "#f9f9fe", "primary-fixed": "#d8e2ff",
            "on-tertiary-fixed-variant": "#7c2e00", "surface-dim": "#d9dade",
            "on-surface-variant": "#414755", "surface-container-low": "#f3f3f8",
            outline: "#717786", "on-tertiary-fixed": "#351000",
            "error-container": "#ffdad6", secondary: "#405e96",
            "on-error-container": "#93000a", "inverse-surface": "#2e3034",
            "secondary-fixed-dim": "#adc6ff", "on-primary-fixed": "#001a41",
            primary: "#0058bc", "tertiary-container": "#c64f00",
            "on-secondary-fixed": "#001a41", "secondary-container": "#a1befd",
            "primary-container": "#0070eb", "surface-container-lowest": "#ffffff",
            "surface-tint": "#005bc1", error: "#ba1a1a",
            "on-primary": "#ffffff", background: "#f9f9fe", "inverse-on-surface": "#f0f0f5"
        }, borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" },
           fontFamily: { headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter" } } }
    };</script>
    <style>
        body { font-family: 'Inter', sans-serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased">

<!-- SideNavBar -->
<aside class="fixed left-0 top-0 h-full w-64 bg-slate-50 dark:bg-slate-900 z-20 flex-col p-6 hidden lg:flex">
    <a href="" class="flex items-center gap-3 mb-10">
        <div class="w-10 h-10 bg-[#007AFF] rounded-xl flex items-center justify-center shrink-0">
            <span class="material-symbols-outlined text-white text-2xl">exercise</span>
        </div>
        <h1 class="text-2xl font-bold tracking-tight text-on-surface">Fitsbug</h1>
    </a>
    <nav class="flex-1 space-y-1">
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 rounded-lg"
           href="${pageContext.request.contextPath}/trainer/dashboard">
            <span class="material-symbols-outlined">dashboard</span>대시보드
        </a>
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 rounded-lg"
           href="${pageContext.request.contextPath}/trainer/clients">
            <span class="material-symbols-outlined">group</span>회원관리
        </a>
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 rounded-lg"
           href="#">
            <span class="material-symbols-outlined">calendar_today</span>일정
        </a>
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 rounded-lg"
           href="#">
            <span class="material-symbols-outlined">chat</span>메시지
        </a>
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-blue-700 border-r-4 border-blue-700 bg-slate-200/50 rounded-lg">
            <span class="material-symbols-outlined">payments</span>요금 및 스케줄
        </a>
    </nav>
    <div class="mt-auto pt-6 space-y-1">
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 rounded-lg" href="#">
            <span class="material-symbols-outlined">settings</span>설정
        </a>
        <div class="border-t border-slate-200 my-2"></div>
    </div>
    <a href="${pageContext.request.contextPath}/trainer/profile"
       class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 rounded-lg">
        <img alt="${sessionScope.loginUser.name}" class="w-10 h-10 rounded-full object-cover shrink-0"
             src="${not empty sessionScope.loginUser.profileImg
                    ? pageContext.request.contextPath.concat('/uploads/').concat(sessionScope.loginUser.profileImg)
                    : pageContext.request.contextPath.concat('/img/profile_img.jpg')}"/>
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-on-surface truncate">${sessionScope.loginUser.name}</p>
            <p class="text-xs text-slate-500 truncate">마이프로필</p>
        </div>
    </a>
</aside>

<!-- Main -->
<div class="lg:ml-64 min-h-screen pt-8 pb-20 lg:pb-8 px-4 md:px-8">
    <div class="max-w-3xl mx-auto">

        <!-- Header -->
        <div class="mb-8">
            <h1 class="text-3xl font-extrabold tracking-tight text-on-surface">요금 및 스케줄</h1>
            <p class="text-on-surface-variant mt-1">프로필에 표시될 수업 요금과 운영 시간을 설정하세요.</p>
        </div>

        <!-- Success banner -->
        <c:if test="${param.saved == '1'}">
            <div class="mb-6 flex items-center gap-3 bg-green-50 border border-green-200 text-green-800 px-4 py-3 rounded-xl text-sm font-medium">
                <span class="material-symbols-outlined text-green-600 text-base">check_circle</span>
                저장되었습니다.
            </div>
        </c:if>

        <!-- Error banner -->
        <c:if test="${not empty error}">
            <div class="mb-6 flex items-center gap-3 bg-error-container border border-error/20 text-error px-4 py-3 rounded-xl text-sm font-medium">
                <span class="material-symbols-outlined text-base">error</span>
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/trainer/pricing" method="post">

            <!-- ── Pricing Section ──────────────────────────────────────── -->
            <section class="bg-surface-container-lowest rounded-2xl border border-surface-variant/30 shadow-sm p-6 mb-6">
                <div class="flex items-center justify-between mb-5">
                    <div class="flex items-center gap-2">
                        <span class="material-symbols-outlined text-primary">payments</span>
                        <h2 class="text-base font-bold text-on-surface">1:1 트레이닝 요금</h2>
                    </div>
                    <button type="button" onclick="addPricingRow()"
                            class="flex items-center gap-1 text-xs font-bold text-primary hover:underline">
                        <span class="material-symbols-outlined text-sm">add</span>요금 추가
                    </button>
                </div>

                <div id="pricing-list" class="space-y-3">
                    <%-- Populate from DB on load --%>
                    <c:forEach var="p" items="${pricingList}" varStatus="st">
                        <div class="pricing-row flex flex-col sm:flex-row items-start sm:items-center gap-3 p-4 bg-surface-container-low rounded-xl border border-outline-variant/20">
                            <div class="flex-1 min-w-0">
                                <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider block mb-1">패키지 이름</label>
                                <input type="text" name="pricingLabel" value="${p.label}"
                                       placeholder="예: 10회 패키지"
                                       class="w-full bg-white border border-outline-variant rounded-lg px-3 py-2 text-sm text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"/>
                            </div>
                            <div class="w-24 shrink-0">
                                <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider block mb-1">횟수</label>
                                <input type="number" name="sessionCount" value="${p.sessionCount}" min="1"
                                       class="w-full bg-white border border-outline-variant rounded-lg px-3 py-2 text-sm text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"/>
                            </div>
                            <div class="w-32 shrink-0">
                                <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider block mb-1">가격 (원)</label>
                                <input type="number" name="price" value="${p.price}" min="0" step="1000"
                                       class="w-full bg-white border border-outline-variant rounded-lg px-3 py-2 text-sm text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"/>
                            </div>
                            <div class="flex items-center gap-2 pt-5 shrink-0">
                                <label class="flex items-center gap-1.5 cursor-pointer select-none">
                                    <input type="checkbox" name="popularRow" value="${st.index}"
                                           ${p.popular ? 'checked' : ''}
                                           class="w-4 h-4 accent-primary"/>
                                    <span class="text-xs font-medium text-on-surface-variant">인기</span>
                                </label>
                                <button type="button" onclick="removePricingRow(this)"
                                        class="p-1.5 rounded-lg text-outline hover:text-error hover:bg-error-container/30 transition-colors">
                                    <span class="material-symbols-outlined text-base">delete</span>
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <c:if test="${empty pricingList}">
                    <%-- If no DB rows, add one blank row via JS on load --%>
                    <script>document.addEventListener('DOMContentLoaded', addPricingRow);</script>
                </c:if>
            </section>

            <!-- ── Availability Section ─────────────────────────────────── -->
            <section class="bg-surface-container-lowest rounded-2xl border border-surface-variant/30 shadow-sm p-6 mb-8">
                <div class="flex items-center gap-2 mb-5">
                    <span class="material-symbols-outlined text-primary">calendar_month</span>
                    <h2 class="text-base font-bold text-on-surface">운영 시간</h2>
                </div>

                <%-- Build a map of dayOfWeek → AvailabilityDTO for easy lookup in JSP --%>
                <c:set var="MON_avail" value=""/>
                <c:set var="TUE_avail" value=""/>
                <c:set var="WED_avail" value=""/>
                <c:set var="THU_avail" value=""/>
                <c:set var="FRI_avail" value=""/>
                <c:set var="SAT_avail" value=""/>
                <c:set var="SUN_avail" value=""/>
                <c:forEach var="a" items="${availabilityList}">
                    <c:if test="${a.dayOfWeek == 'MON'}"><c:set var="MON_avail" value="${a}"/></c:if>
                    <c:if test="${a.dayOfWeek == 'TUE'}"><c:set var="TUE_avail" value="${a}"/></c:if>
                    <c:if test="${a.dayOfWeek == 'WED'}"><c:set var="WED_avail" value="${a}"/></c:if>
                    <c:if test="${a.dayOfWeek == 'THU'}"><c:set var="THU_avail" value="${a}"/></c:if>
                    <c:if test="${a.dayOfWeek == 'FRI'}"><c:set var="FRI_avail" value="${a}"/></c:if>
                    <c:if test="${a.dayOfWeek == 'SAT'}"><c:set var="SAT_avail" value="${a}"/></c:if>
                    <c:if test="${a.dayOfWeek == 'SUN'}"><c:set var="SUN_avail" value="${a}"/></c:if>
                </c:forEach>

                <div class="space-y-2">
                    <c:set var="days" value="MON,TUE,WED,THU,FRI,SAT,SUN"/>
                    <c:set var="dayLabels" value="월,화,수,목,금,토,일"/>
                    <%-- Render each day row using an EL trick --%>
                    <c:forEach var="dayCode" items="MON,TUE,WED,THU,FRI,SAT,SUN" varStatus="ds">
                        <c:set var="dayLabel" value="${ds.index == 0 ? '월' : ds.index == 1 ? '화' : ds.index == 2 ? '수' : ds.index == 3 ? '목' : ds.index == 4 ? '금' : ds.index == 5 ? '토' : '일'}"/>
                        <c:set var="avail"    value="${ds.index == 0 ? MON_avail : ds.index == 1 ? TUE_avail : ds.index == 2 ? WED_avail : ds.index == 3 ? THU_avail : ds.index == 4 ? FRI_avail : ds.index == 5 ? SAT_avail : SUN_avail}"/>
                        <c:set var="enabled"  value="${not empty avail}"/>
                        <div class="flex items-center gap-4 p-3 rounded-xl border ${enabled ? 'bg-blue-50 border-blue-200' : 'bg-surface-container-low border-outline-variant/20'} avail-row"
                             id="avail-row-${dayCode}">
                            <label class="flex items-center gap-2 cursor-pointer w-12 shrink-0">
                                <input type="checkbox" name="availEnabled_${dayCode}"
                                       value="1"
                                       ${enabled ? 'checked' : ''}
                                       onchange="toggleDay('${dayCode}', this.checked)"
                                       class="w-4 h-4 accent-primary"/>
                                <span class="text-sm font-bold ${enabled ? 'text-primary' : 'text-on-surface-variant'}">${dayLabel}</span>
                            </label>
                            <div class="flex items-center gap-2 flex-1 ${enabled ? '' : 'opacity-40'}" id="avail-times-${dayCode}">
                                <input type="time" name="startTime_${dayCode}"
                                       value="${not empty avail ? avail.startTime : '09:00'}"
                                       ${enabled ? '' : 'disabled'}
                                       class="bg-white border border-outline-variant rounded-lg px-3 py-2 text-sm text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"/>
                                <span class="text-on-surface-variant text-sm">~</span>
                                <input type="time" name="endTime_${dayCode}"
                                       value="${not empty avail ? avail.endTime : '18:00'}"
                                       ${enabled ? '' : 'disabled'}
                                       class="bg-white border border-outline-variant rounded-lg px-3 py-2 text-sm text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"/>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>

            <!-- Save Button -->
            <div class="flex justify-end">
                <button type="submit"
                        class="px-8 py-3 bg-primary text-on-primary font-bold rounded-xl hover:bg-blue-700 transition-colors active:scale-95 shadow-sm">
                    저장하기
                </button>
            </div>

        </form>
    </div>
</div>

<template id="pricing-row-template">
    <div class="pricing-row flex flex-col sm:flex-row items-start sm:items-center gap-3 p-4 bg-surface-container-low rounded-xl border border-outline-variant/20">
        <div class="flex-1 min-w-0">
            <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider block mb-1">패키지 이름</label>
            <input type="text" name="pricingLabel" placeholder="예: 10회 패키지"
                   class="w-full bg-white border border-outline-variant rounded-lg px-3 py-2 text-sm text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"/>
        </div>
        <div class="w-24 shrink-0">
            <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider block mb-1">횟수</label>
            <input type="number" name="sessionCount" value="1" min="1"
                   class="w-full bg-white border border-outline-variant rounded-lg px-3 py-2 text-sm text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"/>
        </div>
        <div class="w-32 shrink-0">
            <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider block mb-1">가격 (원)</label>
            <input type="number" name="price" value="0" min="0" step="1000"
                   class="w-full bg-white border border-outline-variant rounded-lg px-3 py-2 text-sm text-on-surface focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none"/>
        </div>
        <div class="flex items-center gap-2 pt-5 shrink-0">
            <label class="flex items-center gap-1.5 cursor-pointer select-none">
                <input type="checkbox" name="popularRow" value="__IDX__"
                       class="w-4 h-4 accent-primary popular-check"/>
                <span class="text-xs font-medium text-on-surface-variant">인기</span>
            </label>
            <button type="button" onclick="removePricingRow(this)"
                    class="p-1.5 rounded-lg text-outline hover:text-error hover:bg-error-container/30 transition-colors">
                <span class="material-symbols-outlined text-base">delete</span>
            </button>
        </div>
    </div>
</template>

<script>
    function addPricingRow() {
        const list = document.getElementById('pricing-list');
        const idx  = list.querySelectorAll('.pricing-row').length;
        const tpl  = document.getElementById('pricing-row-template');
        const html = tpl.innerHTML.replace('__IDX__', idx);
        const div  = document.createElement('div');
        div.innerHTML = html;
        list.appendChild(div.firstElementChild);
        reindexPopularCheckboxes();
    }

    function removePricingRow(btn) {
        btn.closest('.pricing-row').remove();
        reindexPopularCheckboxes();
    }

    function reindexPopularCheckboxes() {
        document.querySelectorAll('#pricing-list .pricing-row').forEach((row, i) => {
            const cb = row.querySelector('.popular-check');
            if (cb) cb.value = i;
        });
    }

    function toggleDay(dayCode, enabled) {
        const row   = document.getElementById('avail-row-' + dayCode);
        const times = document.getElementById('avail-times-' + dayCode);
        const label = row.querySelector('span');
        times.querySelectorAll('input[type="time"]').forEach(inp => inp.disabled = !enabled);
        if (enabled) {
            row.classList.replace('bg-surface-container-low', 'bg-blue-50');
            row.classList.replace('border-outline-variant/20', 'border-blue-200');
            times.classList.remove('opacity-40');
            label.classList.replace('text-on-surface-variant', 'text-primary');
        } else {
            row.classList.replace('bg-blue-50', 'bg-surface-container-low');
            row.classList.replace('border-blue-200', 'border-outline-variant/20');
            times.classList.add('opacity-40');
            label.classList.replace('text-primary', 'text-on-surface-variant');
        }
    }
</script>
</body>
</html>
