<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>커뮤니티</title>

<script src="https://cdn.tailwindcss.com"></script>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800" rel="stylesheet"/>

<style>
body { font-family: 'Inter', sans-serif; }
</style>
</head>

<body class="bg-gray-50 flex">

<!-- 사이드바 -->
<jsp:include page="sidebar.jsp" />

<!-- 신고 모달 -->
<jsp:include page="reportModal.jsp" />

<!-- 게시글 작성 모달 -->
<jsp:include page="postModal.jsp" />

<!-- 우측 상단 -->
<!-- <div class="fixed top-4 right-6 flex gap-4 z-50">
    <span class="material-symbols-outlined">notifications</span>
    <span class="material-symbols-outlined">mail</span>
</div> -->

<!-- 메인 -->
<main class="flex-1 ml-0 md:ml-72 p-8 flex gap-8">

<!-- ================= LEFT ================= -->
<div class="flex-1 max-w-4xl mx-auto flex flex-col gap-6">

<!-- 헤더 -->
<div class="flex justify-between items-center">
    <h2 class="text-2xl font-bold">커뮤니티</h2>

    <div class="flex gap-3 items-center">
        <input type="text" placeholder="검색"
            class="px-4 py-2 rounded-full bg-gray-100 text-sm w-52"/>
        <button onclick="openPostModal()"
    		class="bg-blue-600 text-white px-4 py-2 rounded-full text-sm">
    		글 작성
		</button>
    </div>
</div>

<!-- 오운완 스트릭 -->
<div class="bg-white rounded-xl shadow p-6 flex justify-between items-center">
    <div class="flex items-center gap-4">
        <div class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center">
            🦴
        </div>
        <div>
            <div class="flex items-center gap-2">
                <span class="font-bold text-lg text-orange-500">5일 연속 오운완</span>
                <span class="text-xs text-gray-500">최고 기록: 14일</span>
            </div>

            <div class="flex gap-3 mt-3 text-xs">
                <div><div class="w-8 h-8 bg-orange-400 text-white rounded-full flex items-center justify-center">✔</div>월</div>
                <div><div class="w-8 h-8 bg-orange-400 text-white rounded-full flex items-center justify-center">✔</div>화</div>
                <div><div class="w-8 h-8 bg-orange-400 text-white rounded-full flex items-center justify-center">✔</div>수</div>
                <div><div class="w-8 h-8 bg-orange-400 text-white rounded-full flex items-center justify-center">✔</div>목</div>
                <div><div class="w-8 h-8 bg-orange-400 text-white rounded-full flex items-center justify-center">✔</div>금</div>
                <div><div class="w-8 h-8 border-2 border-orange-300 rounded-full"></div>토</div>
                <div><div class="w-8 h-8 bg-gray-200 rounded-full"></div>일</div>
            </div>
        </div>
    </div>

    <div class="text-sm text-gray-500">
        이번주 목표까지 <span class="text-blue-600 font-bold">2일</span> 남음
    </div>
</div>

<!-- 카테고리 -->
<div class="flex gap-2">
    <button onclick="filterPost('all', this)" class="tab px-4 py-2 bg-blue-600 text-white rounded-full text-sm">전체</button>
    <button onclick="filterPost('owun', this)" class="tab px-4 py-2 bg-gray-200 rounded-full text-sm">✔ 오운완</button>
    <button onclick="filterPost('free', this)" class="tab px-4 py-2 bg-gray-200 rounded-full text-sm">자유게시판</button>
</div>

<!-- DB 게시글 출력 -->
<!-- 테스트용 게시글 -->
<article class="post owun bg-white rounded-xl shadow overflow-hidden">

<div class="p-3">
    <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">✔ 오운완</span>
</div>

<div class="flex justify-between items-center p-5 pt-0">

    <div class="flex gap-3 items-center">
        <img src="https://randomuser.me/api/portraits/men/10.jpg"
             class="w-10 h-10 rounded-full"/>

        <div>
            <div class="font-semibold">테스트유저</div>
            <div class="text-xs text-gray-500">방금 전</div>
        </div>
    </div>

    <button onclick="openReportModal(999)"
        class="flex items-center gap-1 text-sm text-gray-400 hover:text-red-500">
        신고 <span class="material-symbols-outlined text-sm">flag</span>
    </button>

</div>

<img src="https://images.unsplash.com/photo-1599058917212-d750089bc07e"
     class="w-full h-80 object-cover"/>

<div class="p-5">
    <h3 class="font-bold mb-2">테스트 게시글</h3>
    <p>모달 테스트용 게시글입니다 </p>

    <div class="text-blue-500 text-sm mt-2">
        #테스트 #오운완
    </div>
    
    <div class="flex gap-4 mt-3 text-sm items-center">

    <button onclick="react(this, ${post.id}, 'like')" 
            id="btn-like-${post.id}" 
            class="flex items-center gap-1">
        ❤️ <span id="like-${post.id}">${post.likeCount}</span>
    </button>

    <button onclick="react(this, ${post.id}, 'good')" 
            id="btn-good-${post.id}" 
            class="flex items-center gap-1">
        👍 <span id="good-${post.id}">${post.goodCount}</span>
    </button>

    <button onclick="react(this, ${post.id}, 'muscle')" 
            id="btn-muscle-${post.id}" 
            class="flex items-center gap-1">
        💪 <span id="muscle-${post.id}">${post.muscleCount}</span>
    </button>

</div>

    <div class="flex mt-4 text-sm text-gray-600 items-center">
        <button onclick="toggleComment(this)" class="ml-auto flex items-center gap-1">
            <span class="material-symbols-outlined text-sm">chat</span> 댓글
        </button>
    </div>
</div>

<div class="comment-box hidden bg-gray-50 p-5">
    테스트 댓글입니다
</div>

</article>
<c:forEach var="post" items="${postList}">

<!-- ================= 게시글 ================= -->
<!-- 오운완 -->
<!-- <article class="post owun bg-white rounded-xl shadow overflow-hidden">

    <div class="p-3">
        <span class="bg-green-500 text-white text-xs px-2 py-1 rounded">✔ 오운완</span>
    </div>

    <div class="flex justify-between items-center p-5 pt-0">

        <div class="flex gap-3 items-center">
            <img src="https://randomuser.me/api/portraits/men/32.jpg"
                 class="w-10 h-10 rounded-full"/>
            <div>
                <div class="font-semibold">강철근</div>
                <div class="text-xs text-gray-500">2시간 전</div>
            </div>
        </div>

        신고
        <button onclick="openReportModal(1)"
            class="flex items-center gap-1 text-sm text-gray-400 hover:text-red-500">
            신고 <span class="material-symbols-outlined text-sm">flag</span>
        </button>
    </div>

    <img src="https://images.unsplash.com/photo-1599058917212-d750089bc07e"
         class="w-full h-80 object-cover"/>

    <div class="p-5">
        <p>데드리프트 성공 🔥</p>

        <div class="flex mt-4 text-sm text-gray-600 items-center">
            <button onclick="toggleComment(this)" class="ml-auto flex items-center gap-1">
                <span class="material-symbols-outlined text-sm">chat</span> 2
            </button>
        </div>
    </div>

    <div class="comment-box hidden bg-gray-50 p-5">
        댓글1<br>댓글2
    </div>

</article>

자유게시판
<article class="post free bg-white rounded-xl shadow overflow-hidden">

    <div class="p-3">
        <span class="bg-gray-300 text-black text-xs px-2 py-1 rounded">자유</span>
    </div>

    <div class="flex justify-between items-center p-5 pt-0">

        <div class="flex gap-3 items-center">
            <img src="https://randomuser.me/api/portraits/women/44.jpg"
                 class="w-10 h-10 rounded-full"/>
            <div>
                <div class="font-semibold">근육몬</div>
                <div class="text-xs text-gray-500">1시간 전</div>
            </div>
        </div>

        신고
        <button onclick="openReportModal(2)"
            class="flex items-center gap-1 text-sm text-gray-400 hover:text-red-500">
            신고 <span class="material-symbols-outlined text-sm">flag</span>
        </button>
    </div>

    <div class="p-5">
        <p>헬스장 추천 부탁드립니다!</p>

        <div class="flex mt-4 text-sm text-gray-600 items-center">
            <button onclick="toggleComment(this)" class="ml-auto flex items-center gap-1">
                <span class="material-symbols-outlined text-sm">chat</span> 1
            </button>
        </div>
    </div>

    <div class="comment-box hidden bg-gray-50 p-5">
        댓글입니다
    </div>

</article> -->
<article class="post ${post.category} bg-white rounded-xl shadow overflow-hidden">

<!-- 카테고리 -->
<div class="p-3">
<c:choose>
<c:when test="${post.category eq 'owun'}">
<span class="bg-green-500 text-white text-xs px-2 py-1 rounded">✔ 오운완</span>
</c:when>
<c:otherwise>
<span class="bg-gray-300 text-black text-xs px-2 py-1 rounded">자유</span>
</c:otherwise>
</c:choose>
</div>

<!-- 작성자 -->
<div class="flex justify-between items-center p-5 pt-0">

    <div class="flex gap-3 items-center">
        <img src="https://randomuser.me/api/portraits/men/32.jpg"
             class="w-10 h-10 rounded-full"/>

        <div>
            <div class="font-semibold">${post.userId}</div>
            <div class="text-xs text-gray-500">${post.createdAt}</div>
        </div>
    </div>

    <!-- 신고 -->
    <button onclick="openReportModal(${post.id})"
        class="flex items-center gap-1 text-sm text-gray-400 hover:text-red-500">
        신고 <span class="material-symbols-outlined text-sm">flag</span>
    </button>

</div>

<!-- 이미지 -->
<c:if test="${not empty post.image}">
<img src="${pageContext.request.contextPath}/${post.image}"
     class="w-full h-80 object-cover"/>
</c:if>

<!-- 내용 -->
<div class="p-5">
    <h3 class="font-bold mb-2">${post.title}</h3>
    <p>${post.content}</p>

    <div class="text-blue-500 text-sm mt-2">
        ${post.hashtags}
    </div>
    
    	<div class="flex gap-4 mt-3 text-sm items-center">

    <button onclick="react(this, ${post.id}, 'like')" 
            id="btn-like-${post.id}" 
            class="flex items-center gap-1">
        ❤️ <span id="like-${post.id}">${post.likeCount}</span>
    </button>

    <button onclick="react(this, ${post.id}, 'good')" 
            id="btn-good-${post.id}" 
            class="flex items-center gap-1">
        👍 <span id="good-${post.id}">${post.goodCount}</span>
    </button>

    <button onclick="react(this, ${post.id}, 'muscle')" 
            id="btn-muscle-${post.id}" 
            class="flex items-center gap-1">
        💪 <span id="muscle-${post.id}">${post.muscleCount}</span>
    </button>

</div>

    <!-- 댓글 -->
    <div class="flex mt-4 text-sm text-gray-600 items-center">
        <button onclick="toggleComment(this)" class="ml-auto flex items-center gap-1">
            <span class="material-symbols-outlined text-sm">chat</span> 댓글
        </button>
    </div>
</div>

<div class="comment-box hidden bg-gray-50 p-5">
    댓글 영역
</div>

</article>

</c:forEach>
</div>

<!-- ================= RIGHT ================= -->
<aside class="w-80 flex flex-col gap-4">

<h3 class="font-bold text-lg">🏆 이번 주 오운완 랭킹</h3>

<c:forEach var="post" items="${postList}" varStatus="status">

<c:if test="${status.index < 3}">

<div class="bg-gray-100 p-4 rounded-xl flex items-center gap-3">

    <c:choose>
        <c:when test="${status.index == 0}">🥇</c:when>
        <c:when test="${status.index == 1}">🥈</c:when>
        <c:otherwise>🥉</c:otherwise>
    </c:choose>

    <img src="https://randomuser.me/api/portraits/men/32.jpg" class="w-10 h-10 rounded-full"/>

    <div class="flex-1">
        <div class="font-bold">${post.userId}</div>
        <div class="text-sm text-orange-500">
            🔥 ${post.likeCount + post.goodCount + post.muscleCount}
        </div>
    </div>

</div>

</c:if>
</c:forEach>

</aside>

</main>

<!-- ================= JS ================= -->
<script>

// 필터
function filterPost(type, el){
    const posts = document.querySelectorAll(".post");

    posts.forEach(p=>{
        if(type === "all" || p.classList.contains(type)){
            p.style.display = "block";
        }else{
            p.style.display = "none";
        }
    });

    document.querySelectorAll(".tab").forEach(btn=>{
        btn.classList.remove("bg-blue-600","text-white");
        btn.classList.add("bg-gray-200");
    });

    el.classList.add("bg-blue-600","text-white");
}

// 댓글
function toggleComment(btn){
    const box = btn.closest("article").querySelector(".comment-box");
    box.classList.toggle("hidden");
}

// 신고 모달
function openReportModal(postId){
    document.getElementById("reportModal").classList.remove("hidden");
    document.getElementById("reportPostId").value = postId;
}

function closeModal(){
    document.getElementById("reportModal").classList.add("hidden");
}

// 게시글 작성 모달
function openPostModal(){
    document.getElementById("postModal").classList.remove("hidden");
}

function closePostModal(){
    document.getElementById("postModal").classList.add("hidden");
}

// 카테고리 선택
function selectCategory(type){

    const owunBtn = document.getElementById("owunBtn");
    const freeBtn = document.getElementById("freeBtn");

    const uploadText = document.getElementById("uploadText");
    const hashtagInput = document.getElementById("hashtagInput");
    const categoryInput = document.getElementById("category");

    // 초기화
    owunBtn.classList.remove("bg-blue-600","text-white");
    freeBtn.classList.remove("bg-blue-600","text-white");

    owunBtn.classList.add("bg-gray-200");
    freeBtn.classList.add("bg-gray-200");

    if(type === "owun"){
        owunBtn.classList.add("bg-blue-600","text-white");
        uploadText.innerText = "운동 인증샷을 공유해보세요!";
        hashtagInput.value = "#등운동 #오운완";
        categoryInput.value = "owun";

    }else{
        freeBtn.classList.add("bg-blue-600","text-white");
        uploadText.innerText = "자유로운 인증샷을 공유해보세요!";
        hashtagInput.value = "#프로틴 #운동장비";
        categoryInput.value = "free";
    }
}

function react(btn, postId, type){

    fetch("reaction", {
        method: "POST",
        headers: {"Content-Type":"application/x-www-form-urlencoded"},
        body: "postId="+postId+"&type="+type
    })
    .then(res=>res.text())
    .then(result => {

        if(result === "ok"){

            // 숫자 증가
            let countSpan = document.getElementById(type + "-" + postId);
            let count = parseInt(countSpan.innerText);
            countSpan.innerText = count + 1;

            // 버튼 비활성화 (중복 방지)
            btn.disabled = true;
            btn.style.opacity = 0.5;

            // 🔥 총합 점수 계산
            let like = parseInt(document.getElementById("like-"+postId).innerText);
            let good = parseInt(document.getElementById("good-"+postId).innerText);
            let muscle = parseInt(document.getElementById("muscle-"+postId).innerText);

            let total = like + good + muscle;

            // 콘솔 확인용
            console.log("🔥 total:", total);
        }
    });
}
</script>

</body>
</html>