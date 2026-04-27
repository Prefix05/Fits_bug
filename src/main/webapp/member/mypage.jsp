<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.member.MemberDTO"%>
<%@ page import="dto.member.WorkoutPlanDTO"%>

<%
MemberDTO user = (MemberDTO) request.getAttribute("member");
WorkoutPlanDTO plan = (WorkoutPlanDTO) request.getAttribute("plan");

if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

if (plan == null) {
    plan = new WorkoutPlanDTO();
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">

<style>
body { font-family: 'Inter', sans-serif; }
.tab { display:none; }
.tab.active { display:block; }
</style>
</head>

<body class="bg-gray-100 flex">

<!-- ✅ 사이드바 -->
<jsp:include page="sidebar.jsp" />

<div class="flex-1 ml-0 md:ml-72 p-8">

<!-- ================= 상단 아이콘 ================= -->
<!-- <div class="flex justify-end gap-4 mb-4">

    <div class="relative cursor-pointer">
        <span class="material-symbols-outlined text-2xl">notifications</span>
        <span class="absolute -top-1 -right-1 bg-red-500 text-white text-xs px-1 rounded-full">3</span>
    </div>

    <div class="relative cursor-pointer">
        <span class="material-symbols-outlined text-2xl">mail</span>
        <span class="absolute -top-1 -right-1 bg-blue-500 text-white text-xs px-1 rounded-full">2</span>
    </div>

</div> -->

<!-- ================= 배너 ================= -->
<div class="bg-gradient-to-r from-blue-700 to-blue-400 text-white p-8 rounded-xl shadow mb-6 text-center">
    <div class="flex flex-col items-center justify-center">
    	<h1 class="text-3xl font-bold">MY PAGE</h1>
    	<p class="text-sm opacity-80">MANAGE YOUR FITNESS JOURNEY</p>
    </div>
</div>

<!-- ========================= -->
<!-- 🔥 퀵 메뉴 -->
<!-- ========================= -->
<div class="bg-white p-6 rounded-xl shadow mb-6">
<div class="grid grid-cols-5 text-center gap-4">

	<div onclick="showTab('profileTab', event)" 
         class="hover:bg-gray-50 p-3 rounded cursor-pointer tab-btn bg-gray-100">
        <div class="text-blue-500 text-2xl">👤</div>
        <p class="text-sm mt-1">개인정보 관리</p>
        <p class="text-xs text-gray-400">프로필 및 보안</p>
    </div>

    <div onclick="showTab('recordTab', event)" 
         class="hover:bg-gray-50 p-3 rounded cursor-pointer tab-btn">
        <div class="text-2xl">📋</div>
        <p class="text-sm mt-1">나의 기록 관리</p>
        <p class="text-xs text-gray-400">데이터 추적</p>
    </div>

	<div onclick="showTab('paymentTab', event)" 
     class="hover:bg-gray-50 p-3 rounded cursor-pointer tab-btn">
    <div class="text-2xl">💳</div>
    <p class="text-sm mt-1">결제 내역 조회</p>
    <p class="text-xs text-gray-400">구독 히스토리</p>
</div>

	<div onclick="showTab('feedbackTab', event)"
    	 class="hover:bg-gray-50 p-3 rounded cursor-pointer tab-btn">
        <div class="text-2xl">👨‍🏫</div>
        <p class="text-sm mt-1">담당 트레이너</p>
        <p class="text-xs text-gray-400">매칭 정보</p>
    </div>

	<div onclick="showTab('communityTab', event)"
     	 class="hover:bg-gray-50 p-3 rounded cursor-pointer tab-btn">
    	<div class="text-2xl">💬</div>
    	<p class="text-sm mt-1">나의 커뮤니티</p>
    	<p class="text-xs text-gray-400">활동 내역</p>
	</div>

</div>
</div>

<!-- ================= TAB 1 : 개인정보 ================= -->
<div id="profileTab" class="tab active">

<!-- 🔥 개인정보 카드 -->
<!-- ========================= -->
<div class="bg-white p-6 rounded-xl shadow mb-6">

<div class="flex justify-between mb-4">
    <h2 class="font-bold">개인정보 관리</h2>
    <button class="text-blue-500 text-sm">수정하기</button>
</div>

<div class="flex gap-6">

<!-- 프로필 -->
<div>
<img id="profileImg"
src="upload/<%= user.getProfileImage() == null ? "default.png" : user.getProfileImage() %>"
class="w-28 h-28 rounded-full object-cover border">

<form id="uploadForm">
<input type="file" name="profile" onchange="uploadImg()" class="mt-2 text-xs">
</form>
</div>

<!-- 정보 -->
<div class="flex-1">

<p class="mb-2">
<span class="text-gray-400">아이디</span><br>
<%= user.getEmail() %>
</p>

<p class="mb-2">
<span class="text-gray-400">닉네임</span><br>
<%= user.getNickname() %>
</p>

<p class="mb-2">
<span class="text-gray-400">이메일 인증</span><br>
<span class="<%= user.isEmailVerified() ? "text-green-500" : "text-red-500" %>">
<%= user.isEmailVerified() ? "✔ 인증완료" : "❌ 미인증" %>
</span>
</p>

</div>

</div>
</div>

<!-- ========================= -->
<!-- 🔥 운동 계획 -->
<!-- ========================= -->
<div class="bg-white p-6 rounded-xl shadow mb-6">

<div class="flex justify-between mb-4">
    <h2 class="font-bold">맞춤형 운동 계획 정보</h2>
    <button class="text-blue-500 text-sm">수정하기</button>
</div>

<div class="grid grid-cols-2 gap-4">

<div class="bg-gray-50 p-4 rounded">
    <p class="text-gray-400 text-sm">운동 목표</p>
    <p class="font-bold"><%= plan.getGoal() == null ? "미설정" : plan.getGoal() %></p>
</div>

<div class="bg-gray-50 p-4 rounded">
    <p class="text-gray-400 text-sm">운동 경험 수준</p>
    <p class="font-bold"><%= plan.getLevel() == null ? "미설정" : plan.getLevel() %></p>
</div>

<div class="bg-gray-50 p-4 rounded">
    <p class="text-gray-400 text-sm">키 / 몸무게</p>
    <p class="font-bold">
        <%= plan.getHeight() == 0 ? "-" : plan.getHeight() %> /
        <%= plan.getWeight() == 0 ? "-" : plan.getWeight() %>
    </p>
</div>

<div class="bg-gray-50 p-4 rounded">
    <p class="text-gray-400 text-sm">식단</p>
    <p class="font-bold"><%= plan.getDiet() == null ? "-" : plan.getDiet() %></p>
</div>

</div>
</div>

</div>

<!-- ================= TAB 2 : 기록 ================= -->
<div id="recordTab" class="tab">

<div class="mb-4">
    <h2 class="text-xl font-bold">나의 기록 대시보드</h2>
    <p class="text-sm text-gray-500 mt-1">
        전체 운동, 식단, 인바디 기록을 확인하세요
    </p>
</div>

<div class="bg-white p-6 rounded-xl shadow">
    <!-- 🔥 제목 + 우측 설명 -->
    <div class="flex justify-between items-center mb-4">
        <h2 class="font-bold text-lg">Strength 변화 추이</h2>
        
        <!-- 🔥 토글 버튼 -->
        <div class="flex gap-2">
            <button onclick="changeView('workout', event)" class="view-btn bg-blue-500 text-white px-3 py-1 rounded">운동</button>
            <button onclick="changeView('food', event)" class="view-btn px-3 py-1 rounded">식단</button>
            <button onclick="changeView('inbody', event)" class="view-btn px-3 py-1 rounded">인바디</button>
        </div>
    </div>
    
    <div class="text-right text-xs text-gray-500 mb-2">
        단위: kg · 추정 1RM = 무게 × (1 + 0.033 × 횟수)
    </div>

    <canvas id="chart"></canvas>
    
    <!-- 🔥 운동 히스토리 -->
	<div id="workoutHistory" class="mt-6">
  	  <h3 class="font-bold mb-3">운동 히스토리</h3>
  	  <div id="historyList" class="space-y-2"></div>
	</div>
    
    <!-- 캘린더 영역 -->
	<div class="flex justify-between items-center mt-4">
    	<button onclick="prevMonth()" class="px-3 py-1 bg-gray-200 rounded">◀</button>
    	<h2 id="calendarTitle" class="font-bold"></h2>
    	<button onclick="nextMonth()" class="px-3 py-1 bg-gray-200 rounded">▶</button>
	</div>

    <div id="foodList" class="mt-4"></div>
    
    <!-- 🔥 모달 -->
	<div id="foodModal" class="fixed inset-0 bg-black bg-opacity-40 hidden justify-center items-center">
   	 <div class="bg-white w-80 p-6 rounded-xl shadow-lg relative">
     	   <button onclick="closeModal()" class="absolute top-2 right-2">✖</button>
     	   <h2 id="modalDate" class="font-bold mb-2"></h2>
     	   <div id="modalContent"></div>
   	 </div>
	</div>

</div>
</div>

<!-- ================= TAB 3 : 결제 ================= -->
<div id="paymentTab" class="tab">

<!-- 🔥 이용중 회원권 -->
<div class="mb-6 flex justify-center">
    <div class="bg-white p-6 rounded-xl shadow w-full max-w-md">

    <h2 class="font-bold mb-4">이용중인 회원권</h2>

    <div id="activeMembership" class="bg-gray-50 p-4 rounded">
        <!-- JS로 채움 -->
    </div>
    </div>
</div>

<!-- 🔥 결제 내역 -->
<div class="bg-white p-6 rounded-xl shadow">

    <h2 class="font-bold mb-2">결제 내역 관리</h2>
    <p class="text-sm text-gray-500 mb-4">이용권 결제 내역을 확인하세요</p>

    <div class="overflow-x-auto">
        <table class="w-full text-sm text-left border">
            <thead class="bg-gray-100">
                <tr>
                    <th class="p-2 border">결제 일시</th>
                    <th class="p-2 border">이용권</th>
                    <th class="p-2 border">트레이너</th>
                    <th class="p-2 border">결제 금액</th>
                </tr>
            </thead>
            <tbody id="paymentTable">
                <!-- JS로 채움 -->
            </tbody>
        </table>
    </div>

</div>

</div>

<div id="feedbackTab" class="tab">

    <!-- 상단 -->
    <div class="mb-4">
        <h2 class="text-xl font-bold">담당 트레이너</h2>
        <p class="text-sm text-gray-500 mt-1">
            나의 PT 피드백 및 트레이너 정보를 확인하세요
        </p>
    </div>

    <!-- 🔥 트레이너 카드 -->
    <div class="bg-white p-6 rounded-xl shadow mb-6">

        <div class="flex items-center gap-4">

            <!-- 프로필 -->
            <img src="https://via.placeholder.com/80"
                 class="w-20 h-20 rounded-full border">

            <!-- 정보 -->
            <div class="flex-1">
                <p class="font-bold text-lg">김트레이너</p>
                <p class="text-sm text-gray-500">근력 / 체형교정 전문</p>
                <p class="text-xs text-gray-400">⭐ 4.9 (120명)</p>
            </div>

            <!-- 채팅 버튼 -->
            <button onclick="goChat()"
                    class="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600">
                💬 채팅하기
            </button>

        </div>

    </div>

    <!-- 🔥 최근 피드백 -->
    <div class="bg-white p-6 rounded-xl shadow">

        <!-- 제목 -->
        <div class="flex justify-between items-center mb-4">
            <h3 class="font-bold">최근 PT 피드백</h3>

            <button onclick="location.href='ptFeedback.jsp'"
                    class="text-sm text-blue-500 hover:underline">
                전체보기 →
            </button>
        </div>

        <!-- 리스트 -->
        <div id="recentFeedbackBox" class="space-y-3">
            <!-- JS로 채움 -->
        </div>

    </div>

</div>

<!-- ================= TAB 4 : 나의 커뮤니티 ================= -->
<div id="communityTab" class="tab">

<div class="mb-4">
    <h2 class="text-xl font-bold">나의 커뮤니티 활동</h2>
    <p class="text-sm text-gray-500 mt-1">
        내가 작성한 게시글과 반응을 확인하세요
    </p>
</div>

<!-- 🔥 게시글 리스트 -->
<div class="bg-white p-6 rounded-xl shadow max-w-2xl mx-auto">

    <!-- 상단 -->
    <div class="flex justify-between items-center mb-4">
        <h3 class="font-bold">나의 게시글</h3>

        <a href="community.jsp"
           class="text-sm text-blue-500 hover:underline">
            커뮤니티
        </a>
    </div>

    <!-- 🔥 게시글 -->
    <div id="myPostBox" class="space-y-4">
        <!-- JS로 채움 -->
    </div>

</div>

</div>

</div>
<!-- ================= JS ================= -->
<script>
let chartInstance = null;
let currentView = "workout";

let currentDate = new Date();
let currentFoodData = [];

window.onload = function() {
	
	loadData("workout");
	loadCommunityData();
}

/* =========================
   탭 전환
========================= */
function showTab(tabId, e){
    document.querySelectorAll(".tab").forEach(t=>t.classList.remove("active"));
    document.querySelectorAll(".tab-btn").forEach(btn=>{
        btn.classList.remove("bg-gray-100");
    });
    
    if(e) e.currentTarget.classList.add("bg-gray-100");

	// 선택한 탭 보이기
    var target = document.getElementById(tabId);

    if(target){
        target.classList.add("active");
    }
    
    if(tabId === "recordTab"){
        loadData(currentView);
    }
    
    if(tabId === "paymentTab"){
        loadPaymentData(); 
    }
    
    if(tabId === "communityTab"){
        loadCommunityData();
    }
    
    if(tabId === "feedbackTab"){
    	loadRecentFeedback();
    }
}

/* =========================
토글 변경
========================= */
function changeView(type, e){

 currentView = type;

 document.querySelectorAll(".view-btn").forEach(btn=>{
     btn.classList.remove("bg-blue-500","text-white");
 });

 if(e) e.currentTarget.classList.add("bg-blue-500","text-white");

 loadData(type);
}

/* =========================
색상 랜덤 생성
========================= */
function getColor(){
 const colors = [
     "#3b82f6","#ef4444","#10b981","#f59e0b","#8b5cf6","#ec4899"
 ];
 return colors[Math.floor(Math.random()*colors.length)];
}

/* =========================
   프로필 업로드
========================= */
function uploadImg(){
    let form = document.getElementById("uploadForm");
    let data = new FormData(form);

    fetch("uploadProfile", {
        method:"POST",
        body:data
    })
    .then(res=>res.text())
    .then(file=>{
        document.getElementById("profileImg").src = "upload/" + file;
    });
}

/* =========================
   데이터 로드
========================= */
function loadData(type){
    const chartEl = document.getElementById("chart");
    const foodEl = document.getElementById("foodList");
    const historyEl = document.getElementById("workoutHistory");

    chartEl.style.display = "none";
    foodEl.style.display = "none";
    historyEl.style.display = "none";

    fetch(type)
    .then(res => {
    if (!res.ok) {
        throw new Error("서버 응답 실패");
    }
    return res.json();
	})
    .then(data=>render(type,data))
    .catch(()=>{
    
    if(type === "workout"){
        chartEl.style.display = "block";
        historyEl.style.display = "block";

        const dummy = [
            {date:"04-01", name:"벤치프레스", weight:80, reps:5, set:1},
            {date:"04-01", name:"벤치프레스", weight:85, reps:3, set:2},
            {date:"04-02", name:"스쿼트", weight:100, reps:5, set:1},
            {date:"04-02", name:"스쿼트", weight:110, reps:3, set:2}
        ];

        drawWorkoutChart(dummy);
        drawWorkoutHistory(dummy);
        return;
    }

    if(type === "food"){
        foodEl.style.display = "block";

        currentFoodData = [
            {date:"2026-04-01", food:"닭가슴살", calorie:300},
            {date:"2026-04-02", food:"샐러드", calorie:250}
        ];

        drawCalendar();
    }

    if(type === "inbody"){
        chartEl.style.display = "block";

        drawInbodyChart([
            {date:"04-01", weight:70, muscle:30, fat:15},
            {date:"04-02", weight:69, muscle:31, fat:14}
        ]);
    }
});
}

function loadPaymentData(){

    // 🔥 실제 서버 연동 시 fetch로 교체
    const active = {
        name: "PT 10회권",
        remain: 6,
        total: 10,
        startDate: "2026-04-01",
        endDate: "2026-05-01"
    };

    const history = [
        {date:"2026-04-01", name:"PT 10회권", trainer:"김트레이너", price:300000},
        {date:"2026-03-01", name:"헬스 1개월", trainer:"", price:80000}
    ];

    drawMembership(active);
    drawPaymentTable(history);
}

/* =========================
최근 피드백 로드
========================= */
function loadRecentFeedback(){

    // 🔥 서버 연결 시 fetch 사용
    /*
    fetch("ptFeedback?mode=recent")
    .then(res => res.json())
    .then(data => drawRecentFeedback(data));
    */

    // 🔥 더미 데이터 (지금 테스트용)
    const data = [
        {
            date:"2026-04-20",
            exercise:"벤치프레스 자세 안정됨 👍",
            food:"단백질 섭취 부족",
            comment:"다음 주는 중량 증가 목표"
        },
        {
            date:"2026-04-18",
            exercise:"스쿼트 깊이 개선 필요",
            food:"식단 아주 좋음",
            comment:"하체 집중 훈련 예정"
        },
        {
            date:"2026-04-15",
            exercise:"데드리프트 자세 교정 완료",
            food:"야식 줄이기 필요",
            comment:"코어 강화 추가 예정"
        }
    ];

    drawRecentFeedback(data);
}

/* =========================
피드백 그리기
========================= */
function drawRecentFeedback(list){

    const box = document.getElementById("recentFeedbackBox");

    if(!list || list.length === 0){
        box.innerHTML = "<p class='text-sm text-gray-400'>피드백 없음</p>";
        return;
    }

    box.innerHTML = "";

    list.forEach(item => {

        let html = `
        <div class="border rounded p-3 hover:bg-gray-50 cursor-pointer">

            <!-- 날짜 -->
            <div class="text-xs text-gray-400 mb-1">
                ${item.date}
            </div>

            <!-- 운동 -->
            <div class="text-sm mb-1">
                🏋️ ${item.exercise}
            </div>

            <!-- 식단 -->
            <div class="text-sm mb-1">
                🥗 ${item.food}
            </div>

            <!-- 코멘트 -->
            <div class="text-xs text-gray-500">
                ${item.comment}
            </div>

        </div>
        `;

        box.innerHTML += html;
    });
}

function goChat(){
    location.href = "chat.jsp";

    // 또는 트레이너 ID 넘기기
    // location.href = "chat.jsp?trainerId=1";
}

function loadCommunityData(){

   /*  // 🔥 서버 연결 시 fetch로 교체
    const myPost = {
        title: "오늘 가슴 운동 루틴 공유합니다 💪",
        content: "벤치프레스 + 덤벨프레스 조합 추천!",
        image: "", // 없으면 빈값
        likeCount: 12,
        commentCount: 4
    }; */
 // 🔥 더미 데이터 (여러 개)
    const posts = [
        {
            id: 1,
            title: "가슴 운동 루틴 공유 💪",
            content: "벤치프레스 + 인클라인 추천!",
            image: "",
            likeCount: 12,
            commentCount: 4
        },
        {
            id: 2,
            title: "다이어트 식단 기록",
            content: "닭가슴살 + 고구마 + 샐러드",
            image: "",
            likeCount: 8,
            commentCount: 2
        },
        {
            id: 3,
            title: "하체 운동 인증🔥",
            content: "스쿼트 120kg 성공!",
            image: "",
            likeCount: 20,
            commentCount: 7
        }
    ];

    drawMyPosts(posts);
}

/* function drawMyPost(post){

    const box = document.getElementById("myPostBox");

    if(!post){
        box.innerHTML = "<p class='text-sm text-gray-400'>게시글 없음</p>";
        return;
    }

    let imgHtml = "";

    if(post.image){
        imgHtml = `
            <img src="${post.image}" 
                 class="w-full h-40 object-cover rounded mb-3">
        `;
    }else{
        imgHtml = `
            <div class="w-full h-40 bg-gray-100 rounded mb-3 flex items-center justify-center text-gray-400 text-xs">
                이미지 없음
            </div>
        `;
    }

    box.innerHTML = `
        <div class="border rounded p-4">

            ${imgHtml}

            <!-- 제목 -->
            <p class="font-bold text-sm mb-1">${post.title}</p>

            <!-- 내용 -->
            <p class="text-xs text-gray-500 mb-3">
                ${post.content}
            </p>

            <!-- 좋아요 + 댓글 -->
            <div class="flex gap-4 text-xs text-gray-500">

                <div class="flex items-center gap-1">
                    <span class="material-symbols-outlined text-sm">favorite</span>
                    ${post.likeCount}
                </div>

                <div class="flex items-center gap-1">
                    <span class="material-symbols-outlined text-sm">chat_bubble</span>
                    ${post.commentCount}
                </div>

            </div>

        </div>
    `;
} */

function drawMyPosts(posts){

    const box = document.getElementById("myPostBox");

    if(!posts || posts.length === 0){
        box.innerHTML = "<p class='text-sm text-gray-400'>게시글 없음</p>";
        return;
    }

    box.innerHTML = "";

    posts.forEach(post => {

        let imgHtml = "";

        if(post.image){
            imgHtml = `
                <img src="${post.image}" 
                     class="w-full h-40 object-cover rounded mb-3">
            `;
        }else{
            imgHtml = `
                <div class="w-full h-32 bg-gray-100 rounded mb-3 flex items-center justify-center text-gray-400 text-xs">
                    이미지 없음
                </div>
            `;
        }

        let html = `
        <!-- 🔥 카드 전체 클릭 가능 -->
        <div onclick="goDetail(${post.id})"
             class="border rounded p-4 cursor-pointer hover:shadow-md transition">

            ${imgHtml}
            
            <!-- 제목 -->
            <p class="font-bold text-sm mb-1">${post.title}</p>

            <!-- 내용 -->
            <p class="text-xs text-gray-500 mb-3 line-clamp-2">
                ${post.content}
            </p>

            <!-- 좋아요 + 댓글 -->
            <div class="flex gap-4 text-xs text-gray-500">

                <div class="flex items-center gap-1">
                    <span class="material-symbols-outlined text-sm">favorite</span>
                    ${post.likeCount}
                </div>

                <div class="flex items-center gap-1">
                    <span class="material-symbols-outlined text-sm">chat_bubble</span>
                    ${post.commentCount}
                </div>

            </div>

        </div>
        `;

        box.innerHTML += html;
    });
}

function goDetail(postId){
    // 🔥 실제 서버 연결 시
    location.href = "communityDetail.jsp?id=" + postId;
}

/* =========================
렌더 분기
========================= */
function render(type,data){

 const chartEl = document.getElementById("chart");
 const foodEl = document.getElementById("foodList");
 const historyEl = document.getElementById("workoutHistory");
 
 chartEl.style.display = "none";
 foodEl.style.display = "none";
 historyEl.style.display = "none";

 if(type === "workout"){
	 chartEl.style.display = "block";
     historyEl.style.display = "block";

     drawWorkoutChart(data);
     drawWorkoutHistory(data);
 }

 if(type === "food"){
     foodEl.style.display = "block";
     currentFoodData = data;
     drawCalendar();
 }

 if(type === "inbody"){
     chartEl.style.display = "block";
     drawInbodyChart(data);
 }
}

function drawMembership(data){

    const box = document.getElementById("activeMembership");

    if(!data){
        box.innerHTML = "이용중인 회원권이 없습니다.";
        return;
    }

    // 🔥 기본값 (총 횟수 없을 경우 대비)
    const total = data.total || 10; 
    const remain = data.remain;

    // 🔥 게이지 퍼센트
    const percent = Math.max(0, (remain / total) * 100);

    // 🔥 만료일 계산
    const today = new Date();
    const endDate = new Date(data.endDate || "2026-05-01");

    const diffTime = endDate - today;
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

    let ddayText = "";
    if(diffDays > 0){
        ddayText = "D-" + diffDays;
    }else if(diffDays === 0){
        ddayText = "D-DAY";
    }else{
        ddayText = "만료됨";
    }

    box.innerHTML = `
        <div class="bg-gradient-to-r from-blue-500 to-blue-400 text-white rounded-xl shadow-lg p-5">

            <!-- 🔥 회원권 이름 (핵심 강조) -->
            <div class="flex justify-between items-center mb-2">
                <div class="text-xl font-bold tracking-wide">
                    🎫 ${data.name}
                </div>
                <div class="text-xs bg-white/20 px-2 py-1 rounded">
                    ${ddayText}
                </div>
            </div>

            <!-- 🔥 등록일 -->
            <div class="text-xs opacity-80 mb-4">
                등록일: ${data.startDate}
            </div>

            <!-- 🔥 게이지 -->
            <div class="mb-4">
                <div class="flex justify-between text-xs mb-1">
                    <span>사용량</span>
                    <span>${remain} / ${total}</span>
                </div>

                <div class="w-full bg-white/30 h-2 rounded">
                    <div class="bg-white h-2 rounded transition-all duration-500"
                         style="width:${percent}%">
                    </div>
                </div>
            </div>

            <!-- 🔥 하단 정보 -->
            <div class="flex justify-between items-end">
                <div class="text-xs opacity-80">
                    만료일: ${data.endDate || "미정"}
                </div>

                <div class="text-right">
                    <div class="text-xs opacity-80">잔여</div>
                    <div class="text-2xl font-bold">${remain}회</div>
                </div>
            </div>

        </div>
    `;
}

/* =========================
운동 그래프
========================= */
function drawWorkoutChart(data){

 if(chartInstance) chartInstance.destroy();

 const labels = [...new Set(data.map(d=>d.date))];
 const grouped = {};

 data.forEach(d=>{
     if(!grouped[d.name]) grouped[d.name] = [];

     const oneRM = d.weight * (1 + 0.033 * (d.reps || 1));

     grouped[d.name].push({
         date:d.date,
         value:oneRM.toFixed(1)
     });
 });
 
 const colors = ["#3b82f6","#ef4444","#10b981","#f59e0b","#8b5cf6"];

 const datasets = Object.keys(grouped).map((name, i)=>{
     return {
         label:name,
         data:labels.map(date=>{
             const f = grouped[name].find(d=>d.date===date);
             return f ? f.value : null;
         }),
         borderColor:colors[i % colors.length],
         tension:0.3,
         fill:false
     };
 });
 
 chartInstance = new Chart(document.getElementById("chart"), {
     type:'line',
     data:{ labels, datasets }
 });
}

/* =========================
식단 캘린더
========================= */
/* function drawCalendar(data){

    var box = document.getElementById("foodList");
    box.innerHTML = "";

    var map = {};
    data.forEach(function(d){
        map[d.date] = d;
    });

    var html = "<div class='grid grid-cols-7 gap-2 text-center'>";

    for(var i=1; i<=30; i++){

        var date = "2024-04-" + (i < 10 ? "0"+i : i);
        var d = map[date];

        html += "<div class='border rounded p-2 h-24 text-xs'>";
        html += "<div class='font-bold'>" + i + "</div>";

        if(d){
            html += "<div class='text-green-600'>" + d.food + "</div>";
            html += "<div>" + d.calorie + "kcal</div>";
        }

        html += "</div>";
    }

    html += "</div>";

    box.innerHTML = html;
} */

/* =========================
인바디 그래프
========================= */
function drawInbodyChart(data){

    if(chartInstance) chartInstance.destroy();

    chartInstance = new Chart(document.getElementById("chart"), {
        type:'line',
        data:{
            labels:data.map(d=>d.date),
            datasets:[
                {label:'체중', data:data.map(d=>d.weight), borderColor:'#3b82f6'},
                {label:'골격근량', data:data.map(d=>d.muscle), borderColor:'#10b981'},
                {label:'체지방량', data:data.map(d=>d.fat), borderColor:'#ef4444'}
            ]
        }
    });
}

/* =========================
📅 캘린더 생성
========================= */
function drawCalendar(){

 const box = document.getElementById("foodList");
 box.innerHTML = "";

 const year = currentDate.getFullYear();
 const month = currentDate.getMonth();

 document.getElementById("calendarTitle").innerText =
     year + "년 " + (month+1) + "월";

 const firstDay = new Date(year, month, 1).getDay();
 const lastDate = new Date(year, month+1, 0).getDate();

 let map = {};
 currentFoodData.forEach(d=> map[d.date] = d);

 let html = "<div class='grid grid-cols-7 gap-2 text-center'>";

 for(let i=0;i<firstDay;i++){
     html += "<div></div>";
 }

 for(let i=1;i<=lastDate;i++){

     let fullDate = year+"-"+String(month+1).padStart(2,'0')+"-"+String(i).padStart(2,'0');
     let d = map[fullDate];

     html += "<div onclick=\"openModal('"+fullDate+"')\" class='border p-2 h-24 cursor-pointer hover:bg-gray-100'>";
     html += "<div class='font-bold'>"+i+"</div>";

     if(d){
         html += "<div class='text-green-600'>"+d.food+"</div>";
         html += "<div>"+d.calorie+"kcal</div>";
     }

     html += "</div>";
 }

 html += "</div>";
 box.innerHTML = html;
}

function drawPaymentTable(list){

    const tbody = document.getElementById("paymentTable");
    tbody.innerHTML = "";

    list.forEach(item => {

        let html = `
        <tr class="border">
            <td class="p-2 border">${item.date}</td>
            <td class="p-2 border">${item.name}</td>
            <td class="p-2 border">${item.trainer || "-"}</td>
            <td class="p-2 border">${item.price.toLocaleString()}원</td>
        </tr>
        `;

        tbody.innerHTML += html;
    });
}

/* =========================
월 이동
========================= */
function prevMonth(){
 currentDate.setMonth(currentDate.getMonth()-1);
 drawCalendar();
}

function nextMonth(){
 currentDate.setMonth(currentDate.getMonth()+1);
 drawCalendar();
}

function drawWorkoutHistory(data){

    const box = document.getElementById("historyList");
    box.innerHTML = "";

    // 🔥 최고 무게 찾기
    let maxWeight = Math.max(...data.map(d => d.weight));

    data.forEach((d, index)=>{

        let isBest = d.weight == maxWeight;

        let html = "";
        html += "<div class='flex justify-between items-center bg-gray-50 p-3 rounded'>";

        html += "<div>";
        html += "<div class='text-sm text-gray-500'>#"+(index+1)+" | "+d.date+"</div>";
        html += "<div class='font-bold'>"+d.name+"</div>";
        html += "</div>";

        html += "<div class='text-right'>";
        html += "<div>"+d.weight+"kg × "+d.reps+"회</div>";

        if(isBest){
            html += "<div class='text-yellow-500 text-lg'>👑</div>";
        }

        html += "</div>";

        html += "</div>";

        box.innerHTML += html;
    });
}

/* =========================
모달
========================= */
function openModal(date){

 const modal = document.getElementById("foodModal");
 const title = document.getElementById("modalDate");
 const content = document.getElementById("modalContent");

 title.innerText = date;

 let found = currentFoodData.find(d=>d.date===date);

 if(found){
     content.innerHTML =
         "<p>식단: "+found.food+"</p>" +
         "<p>칼로리: "+found.calorie+" kcal</p>";
 }else{
     content.innerHTML = "데이터 없음";
 }

 modal.classList.remove("hidden");
 modal.classList.add("flex");
}

function closeModal(){
 document.getElementById("foodModal").classList.add("hidden");
}

</script>

</body>
</html>