<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Fitsbug - 프로필 수정</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "tertiary-container": "#c64f00", "error-container": "#ffdad6", "primary-fixed": "#d8e2ff", "on-primary-fixed-variant": "#004493", surface: "#f9f9fe", "secondary-fixed-dim": "#adc6ff", "secondary-fixed": "#d8e2ff", "on-background": "#1a1c1f", "surface-container-high": "#e8e8ed", "surface-container-lowest": "#ffffff", "surface-variant": "#e2e2e7", "surface-dim": "#d9dade", "on-error": "#ffffff", "surface-tint": "#005bc1", "on-surface": "#1a1c1f", "inverse-on-surface": "#f0f0f5", tertiary: "#9e3d00", primary: "#0058bc", "on-tertiary-container": "#fffbff", "on-tertiary": "#ffffff", "on-error-container": "#93000a", error: "#ba1a1a", "surface-container-highest": "#e2e2e7", "primary-container": "#0070eb", "on-secondary-container": "#2d4c83", "on-tertiary-fixed": "#351000", "on-primary": "#ffffff", "surface-container-low": "#f3f3f8", "outline-variant": "#c1c6d7", "on-secondary-fixed": "#001a41", "on-primary-container": "#fefcff", "on-primary-fixed": "#001a41", secondary: "#405e96", "on-surface-variant": "#414755", "tertiary-fixed": "#ffdbcc", "surface-container": "#ededf2", "tertiary-fixed-dim": "#ffb595", "primary-fixed-dim": "#adc6ff", outline: "#717786", "on-tertiary-fixed-variant": "#7c2e00", "surface-bright": "#f9f9fe", "secondary-container": "#a1befd", "on-secondary": "#ffffff", "inverse-surface": "#2e3034", "on-secondary-fixed-variant": "#26467d", "inverse-primary": "#adc6ff", background: "#f9f9fe" }, borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" }, fontFamily: { headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter" } } } };</script>
    <style>
        body { font-family: 'Inter', sans-serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
    </style>
</head>
<body class="bg-surface text-on-surface min-h-screen">

<!-- SideNavBar -->
<c:set var="activePage" value="profile" scope="request"/>
<jsp:include page="/trainer/sideNav.jsp"/>

<!-- Main -->
<main class="lg:pl-64 min-h-screen">
    <div class="max-w-3xl mx-auto p-6 md:p-8">

        <!-- Header -->
        <div class="flex items-center gap-4 mb-8">
            <a href="${pageContext.request.contextPath}/trainer/profile"
               class="flex items-center justify-center w-9 h-9 rounded-full bg-surface-container-high hover:bg-surface-variant transition-colors">
                <span class="material-symbols-outlined text-on-surface-variant">arrow_back</span>
            </a>
            <div>
                <h1 class="text-2xl font-bold tracking-tight text-on-surface">프로필 수정</h1>
                <p class="text-on-surface-variant text-sm">변경사항은 저장 시 즉시 반영됩니다.</p>
            </div>
        </div>

        <c:if test="${not empty error}">
            <div class="mb-6 p-4 rounded-xl bg-red-50 border border-red-200 text-red-700 text-sm font-medium">${error}</div>
        </c:if>
        <c:if test="${param.saved == '1'}">
            <div class="mb-6 p-4 rounded-xl bg-emerald-50 border border-emerald-200 text-emerald-700 text-sm font-medium flex items-center gap-2">
                <span class="material-symbols-outlined text-base">check_circle</span>저장되었습니다.
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/trainer/profileEdit"
              method="post" enctype="multipart/form-data" class="space-y-6">

            <!-- Section 1: Basic Info -->
            <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-5 border border-surface-variant/30">
                <h3 class="text-base font-bold text-on-surface flex items-center gap-2 pb-4 border-b border-surface-container">
                    <span class="material-symbols-outlined text-primary">person</span>기본 정보
                </h3>

                <!-- Profile Image -->
                <div class="flex items-center gap-5">
                    <img id="avatar-preview" alt="프로필 사진"
                         class="w-20 h-20 rounded-full object-cover ring-2 ring-surface-variant flex-shrink-0"
                         src="${not empty sessionScope.loginUser.profileImg
                                 ? pageContext.request.contextPath.concat('/uploads/').concat(sessionScope.loginUser.profileImg)
                                 : pageContext.request.contextPath.concat('/img/profile_img.jpg')}"/>
                    <div>
                        <label class="inline-flex items-center gap-2 px-4 py-2 border border-outline-variant rounded-lg text-sm font-semibold text-on-surface-variant cursor-pointer hover:bg-surface-container-low transition-colors">
                            <span class="material-symbols-outlined text-base">photo_camera</span>사진 변경
                            <input type="file" name="profileImage" accept="image/*" class="hidden" onchange="previewAvatar(this)"/>
                        </label>
                        <p class="text-xs text-on-surface-variant/60 mt-1.5">JPG, PNG — 10MB 이하</p>
                    </div>
                </div>

                <!-- Name -->
                <div class="space-y-1.5">
                    <label class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider">이름</label>
                    <input type="text" name="name" value="${sessionScope.loginUser.name}"
                           class="w-full px-4 py-2.5 bg-surface-container-low rounded-xl text-sm text-on-surface outline-none focus:ring-2 focus:ring-primary/20 font-medium"
                           required/>
                </div>

                <!-- Nickname -->
                <div class="space-y-1.5">
                    <label class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider">닉네임</label>
                    <input type="text" name="nickname" value="${sessionScope.loginUser.nickname}"
                           class="w-full px-4 py-2.5 bg-surface-container-low rounded-xl text-sm text-on-surface outline-none focus:ring-2 focus:ring-primary/20"
                           placeholder="활동명 또는 닉네임"/>
                </div>

                <!-- Tel -->
                <div class="space-y-1.5">
                    <label class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider">전화번호</label>
                    <input type="tel" name="tel" value="${sessionScope.loginUser.tel}"
                           class="w-full px-4 py-2.5 bg-surface-container-low rounded-xl text-sm text-on-surface outline-none focus:ring-2 focus:ring-primary/20"
                           placeholder="010-0000-0000"/>
                </div>
            </section>

            <!-- Section 2: About -->
            <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-5 border border-surface-variant/30">
                <h3 class="text-base font-bold text-on-surface flex items-center gap-2 pb-4 border-b border-surface-container">
                    <span class="material-symbols-outlined text-primary">description</span>소개
                </h3>
                <div class="space-y-1.5">
                    <label class="block text-xs font-bold text-on-surface-variant uppercase tracking-wider">자기소개</label>
                    <textarea name="description" rows="5"
                              class="w-full px-4 py-3 bg-surface-container-low rounded-xl text-sm text-on-surface outline-none focus:ring-2 focus:ring-primary/20 resize-y leading-relaxed"
                              placeholder="경력, 전문 분야, 코칭 철학을 소개해 주세요.">${trainer.description}</textarea>
                </div>
            </section>

            <!-- Section 3: Specializations -->
            <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-4 border border-surface-variant/30">
                <h3 class="text-base font-bold text-on-surface flex items-center gap-2 pb-4 border-b border-surface-container">
                    <span class="material-symbols-outlined text-primary">fitness_center</span>전문 분야
                </h3>
                <div class="flex flex-wrap gap-2">
                    <c:forEach items="${[['YOGA','Yoga'],['WEIGHT_LOSS','체중 감량'],['MUSCLE_GAIN','근비대'],['BODY_RECOMPOSITION','체형 교정'],['STRENGTH_TRAINING','스트렝스'],['FUNCTIONAL_TRAINING','기능성 트레이닝'],['POSTURE_CORRECTION','자세 교정'],['PILATES','Pilates'],['CROSSFIT','CrossFit'],['REHABILITATION','재활'],['ATHLETIC_PERFORMANCE','운동 퍼포먼스']]}" var="item">
                        <%-- use JS to check --%>
                        <label class="spec-option cursor-pointer">
                            <input type="checkbox" name="specializations" value="${item[0]}" class="hidden spec-cb" data-val="${item[0]}"/>
                            <span class="spec-label inline-block px-4 py-2 rounded-full border text-sm font-semibold transition-colors
                                         border-outline-variant/40 text-on-surface-variant bg-surface-container-low
                                         peer-checked:bg-primary peer-checked:text-white peer-checked:border-primary">${item[1]}</span>
                        </label>
                    </c:forEach>
                </div>
            </section>

            <!-- Section 4: Traits -->
            <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-4 border border-surface-variant/30">
                <h3 class="text-base font-bold text-on-surface flex items-center gap-2 pb-4 border-b border-surface-container">
                    <span class="material-symbols-outlined text-primary">star</span>강점
                </h3>
                <div class="flex flex-wrap gap-2">
                    <c:forEach items="${[['KIND','친절한'],['BEGINNER_FRIENDLY','입문자 친화적'],['FUN','즐거운'],['MOTIVATIONAL','동기부여'],['DETAIL_ORIENTED','꼼꼼한'],['PATIENT','인내심 있는'],['RESULT_FOCUSED','결과 중심'],['FLEXIBLE','유연한'],['COMMUNICATIVE','소통 잘 하는']]}" var="item">
                        <label class="trait-option cursor-pointer">
                            <input type="checkbox" name="traits" value="${item[0]}" class="hidden trait-cb" data-val="${item[0]}"/>
                            <span class="trait-label inline-block px-4 py-2 rounded-full border text-sm font-semibold transition-colors
                                         border-outline-variant/40 text-on-surface-variant bg-surface-container-low">${item[1]}</span>
                        </label>
                    </c:forEach>
                </div>
            </section>

            <!-- Section 5: Certifications -->
            <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm space-y-4 border border-surface-variant/30">
                <h3 class="text-base font-bold text-on-surface flex items-center gap-2 pb-4 border-b border-surface-container">
                    <span class="material-symbols-outlined text-primary">workspace_premium</span>자격증
                </h3>
                <div id="cert-list" class="space-y-3">
                    <c:forEach items="${certifications}" var="cert">
                        <div class="cert-row bg-surface-container-low rounded-xl p-4 grid grid-cols-2 gap-3 relative">
                            <button type="button" onclick="removeRow(this)"
                                    class="absolute top-3 right-3 text-on-surface-variant/50 hover:text-error transition-colors">
                                <span class="material-symbols-outlined text-xl">close</span>
                            </button>
                            <div class="col-span-2 space-y-1">
                                <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">자격증 이름 *</label>
                                <input type="text" name="certName" value="${cert.certName}"
                                       class="w-full px-3 py-2 bg-white rounded-lg text-sm outline-none focus:ring-2 focus:ring-primary/20 border border-outline-variant/30" required/>
                            </div>
                            <div class="col-span-2 space-y-1">
                                <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">발급 기관</label>
                                <input type="text" name="issuingOrg" value="${cert.issuingOrg}"
                                       class="w-full px-3 py-2 bg-white rounded-lg text-sm outline-none focus:ring-2 focus:ring-primary/20 border border-outline-variant/30"/>
                            </div>
                            <div class="space-y-1">
                                <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">취득일</label>
                                <input type="date" name="issueDate" value="${cert.issueDate}"
                                       class="w-full px-3 py-2 bg-white rounded-lg text-sm outline-none focus:ring-2 focus:ring-primary/20 border border-outline-variant/30"/>
                            </div>
                            <div class="space-y-1">
                                <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">만료일</label>
                                <input type="date" name="expiryDate" value="${cert.expiryDate}"
                                       class="w-full px-3 py-2 bg-white rounded-lg text-sm outline-none focus:ring-2 focus:ring-primary/20 border border-outline-variant/30"/>
                            </div>
                            <div class="col-span-2 space-y-1">
                                <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">
                                    파일
                                    <c:if test="${not empty cert.certFile}">
                                        <span class="text-primary normal-case font-normal ml-1">(현재: ${cert.certFile})</span>
                                    </c:if>
                                </label>
                                <label class="inline-flex items-center gap-2 px-3 py-1.5 border border-outline-variant/40 rounded-lg text-xs font-semibold text-on-surface-variant cursor-pointer hover:bg-white transition-colors">
                                    <span class="material-symbols-outlined text-sm">attach_file</span>
                                    <span class="file-name-text">파일 선택</span>
                                    <input type="file" name="certFile" accept="image/*,.pdf" class="hidden" onchange="updateFileName(this)"/>
                                </label>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <button type="button" onclick="addCertRow()"
                        class="w-full py-3 border-2 border-dashed border-outline-variant/40 rounded-xl text-sm font-bold text-on-surface-variant hover:border-primary hover:text-primary hover:bg-primary/5 transition-all">
                    + 자격증 추가
                </button>
            </section>

            <!-- Section 6: Pricing & Availability link -->
            <section class="bg-surface-container-lowest rounded-2xl p-6 shadow-sm border border-surface-variant/30">
                <div class="flex items-center justify-between">
                    <div class="flex items-center gap-2">
                        <span class="material-symbols-outlined text-primary">payments</span>
                        <h3 class="text-base font-bold text-on-surface">수업 가격 및 가능 일정</h3>
                    </div>
                    <a href="${pageContext.request.contextPath}/trainer/pricing"
                       class="flex items-center gap-1 text-sm font-bold text-primary hover:underline">
                        수정하기 <span class="material-symbols-outlined text-base">arrow_forward</span>
                    </a>
                </div>
                <p class="text-xs text-on-surface-variant mt-2">요금제와 가능 시간은 별도 페이지에서 관리합니다.</p>
            </section>

            <!-- Actions -->
            <div class="flex gap-3 pt-2">
                <button type="submit"
                        class="flex-1 py-3.5 bg-primary text-white font-bold rounded-xl text-sm hover:bg-blue-700 active:scale-[0.98] transition-all shadow-sm">
                    변경사항 저장
                </button>
                <a href="${pageContext.request.contextPath}/trainer/profile"
                   class="px-6 py-3.5 bg-surface-container-high text-on-surface-variant font-bold rounded-xl text-sm hover:bg-surface-variant transition-colors text-center">
                    취소
                </a>
            </div>

        </form>
    </div>
</main>

<!-- New cert row template -->
<template id="cert-template">
    <div class="cert-row bg-surface-container-low rounded-xl p-4 grid grid-cols-2 gap-3 relative">
        <button type="button" onclick="removeRow(this)"
                class="absolute top-3 right-3 text-on-surface-variant/50 hover:text-error transition-colors">
            <span class="material-symbols-outlined text-xl">close</span>
        </button>
        <div class="col-span-2 space-y-1">
            <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">자격증 이름 *</label>
            <input type="text" name="certName" placeholder="예: 생활스포츠지도사 2급"
                   class="w-full px-3 py-2 bg-white rounded-lg text-sm outline-none focus:ring-2 focus:ring-primary/20 border border-outline-variant/30" required/>
        </div>
        <div class="col-span-2 space-y-1">
            <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">발급 기관</label>
            <input type="text" name="issuingOrg" placeholder="예: 국민체육진흥공단"
                   class="w-full px-3 py-2 bg-white rounded-lg text-sm outline-none focus:ring-2 focus:ring-primary/20 border border-outline-variant/30"/>
        </div>
        <div class="space-y-1">
            <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">취득일</label>
            <input type="date" name="issueDate"
                   class="w-full px-3 py-2 bg-white rounded-lg text-sm outline-none focus:ring-2 focus:ring-primary/20 border border-outline-variant/30"/>
        </div>
        <div class="space-y-1">
            <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">만료일</label>
            <input type="date" name="expiryDate"
                   class="w-full px-3 py-2 bg-white rounded-lg text-sm outline-none focus:ring-2 focus:ring-primary/20 border border-outline-variant/30"/>
        </div>
        <div class="col-span-2 space-y-1">
            <label class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider">파일</label>
            <label class="inline-flex items-center gap-2 px-3 py-1.5 border border-outline-variant/40 rounded-lg text-xs font-semibold text-on-surface-variant cursor-pointer hover:bg-white transition-colors">
                <span class="material-symbols-outlined text-sm">attach_file</span>
                <span class="file-name-text">파일 선택</span>
                <input type="file" name="certFile" accept="image/*,.pdf" class="hidden" onchange="updateFileName(this)"/>
            </label>
        </div>
    </div>
</template>

<script>
    // ── Checkbox toggle styling ────────────────────────────────────────────
    function initCheckboxes(cbClass, labelClass, selectedList) {
        const selected = new Set(selectedList);
        document.querySelectorAll('.' + cbClass).forEach(cb => {
            const label = cb.nextElementSibling;
            if (selected.has(cb.dataset.val)) {
                cb.checked = true;
                label.classList.remove('border-outline-variant/40', 'text-on-surface-variant', 'bg-surface-container-low');
                label.classList.add('bg-primary', 'text-white', 'border-primary');
            }
            cb.parentElement.addEventListener('click', () => {
                cb.checked = !cb.checked;
                if (cb.checked) {
                    label.classList.remove('border-outline-variant/40', 'text-on-surface-variant', 'bg-surface-container-low');
                    label.classList.add('bg-primary', 'text-white', 'border-primary');
                } else {
                    label.classList.remove('bg-primary', 'text-white', 'border-primary');
                    label.classList.add('border-outline-variant/40', 'text-on-surface-variant', 'bg-surface-container-low');
                }
            });
        });
    }

    // Pre-fill from DB
    const savedSpecs  = [<c:forEach items="${specializations}" var="s" varStatus="st">'${s}'<c:if test="${!st.last}">,</c:if></c:forEach>];
    const savedTraits = [<c:forEach items="${traits}" var="t" varStatus="st">'${t}'<c:if test="${!st.last}">,</c:if></c:forEach>];
    initCheckboxes('spec-cb',  'spec-label',  savedSpecs);
    initCheckboxes('trait-cb', 'trait-label', savedTraits);

    // ── Cert rows ──────────────────────────────────────────────────────────
    function addCertRow() {
        const tpl = document.getElementById('cert-template');
        document.getElementById('cert-list').appendChild(tpl.content.cloneNode(true));
    }

    function removeRow(btn) {
        btn.closest('.cert-row').remove();
    }

    function updateFileName(input) {
        const span = input.closest('label').querySelector('.file-name-text');
        span.textContent = input.files.length > 0 ? input.files[0].name : '파일 선택';
    }

    // ── Profile image preview ──────────────────────────────────────────────
    function previewAvatar(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = e => document.getElementById('avatar-preview').src = e.target.result;
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>
