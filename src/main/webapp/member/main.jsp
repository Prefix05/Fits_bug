<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.member.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
if(loginUser == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 대시보드</title>

<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">

<style>
body { font-family: 'Inter', sans-serif; }
</style>
</head>

<body class="bg-gray-100 flex">

<!-- ✅ 사이드바 -->
<jsp:include page="sidebar.jsp" />

<!-- ✅ 메인 -->
<div class="flex-1 ml-0 md:ml-72 p-8">


<h1 class="text-xl font-bold mb-4">
    <%= loginUser.getNickname() %>님 환영합니다 👋
</h1>

<!-- ========================= -->
<!-- 그래프 -->
<!-- ========================= -->
<div class="bg-white p-6 rounded-xl shadow mb-6">

<div class="flex justify-between mb-4">
    <h2 class="font-bold">
        나의 1RM 변화
        <span class="text-xs text-gray-500 ml-2">볼륨 = 중량 × 횟수 × 세트수</span>
    </h2>

    <div>
        <button onclick="loadChart('workout')" class="bg-blue-500 text-white px-3 py-1 rounded">운동</button>
        <button onclick="loadChart('food')" class="px-3 py-1">식단</button>
        <button onclick="loadChart('inbody')" class="px-3 py-1">인바디</button>
    </div>

</div>

<canvas id="chart" height="100"></canvas>

<div class="mt-4 text-right">
    <button onclick="loadFeedback()" 
        class="border px-4 py-2 rounded hover:bg-gray-100">
        피드백 보기
    </button>
</div>

<div id="calendar" class="hidden mt-4"></div>

</div>

<!-- ========================= -->
<!-- 기록 카드 -->
<!-- ========================= -->
<div class="grid grid-cols-3 gap-6 mb-6">

<!-- 운동 -->
<div class="bg-white p-4 rounded-xl shadow">
    <div class="flex justify-between">
        <h3 class="font-bold">운동 기록</h3>
        <span class="text-xs">오늘</span>
    </div>

    <p>#1 벤치프레스 95kg / 5회</p>
    <p>#2 스쿼트 100kg / 5회</p>

    <button onclick="openWorkoutModal()" class="mt-4 border border-dashed w-full py-2 rounded">
        + 기록 추가
    </button>
</div>

<!-- 식단 -->
<div class="bg-white p-4 rounded-xl shadow">
    <div class="flex justify-between">
        <h3 class="font-bold">식단 기록</h3>
        <span class="text-xs">오늘</span>
    </div>

    <p>닭가슴살 200g + 고구마 150g</p>

    <p class="text-sm mt-3 text-gray-500">
        총 2끼 · 약 800 kcal
    </p>

    <button onclick="openFoodModal()" class="mt-4 border border-dashed w-full py-2 rounded">
        + 기록 추가
    </button>
</div>

<!-- 인바디 -->
<div class="bg-white p-4 rounded-xl shadow">
    <div class="flex justify-between">
        <h3 class="font-bold">인바디 기록</h3>
        <span class="text-xs">03.15</span>
    </div>

    <p>체중: 75kg</p>
    <div class="w-full bg-gray-200 h-2 rounded mb-2">
        <div class="bg-blue-500 h-2 rounded w-3/4"></div>
    </div>

    <p>골격근량: 30kg</p>
    <div class="w-full bg-gray-200 h-2 rounded mb-2">
        <div class="bg-green-500 h-2 rounded w-2/3"></div>
    </div>

    <p>체지방량: 12kg</p>
    <div class="w-full bg-gray-200 h-2 rounded">
        <div class="bg-red-500 h-2 rounded w-1/3"></div>
    </div>

    <button onclick="openInbodyModal()" class="mt-4 border border-dashed w-full py-2 rounded">
        + 기록 추가
    </button>
</div>

</div> <!-- ✅ grid 닫기 -->


<!-- ========================= -->
<!-- 트레이너 일정 (🔥 위치 수정됨) -->
<!-- ========================= -->
<div class="bg-white p-6 rounded-xl shadow mb-6">

<h2 class="font-bold mb-4">트레이너 수업 가능 일정</h2>

<div class="grid grid-cols-8 gap-1 text-xs text-center">

<div>Time</div><div>Mon</div><div>Tue</div><div>Wed</div>
<div>Thu</div><div>Fri</div><div>Sat</div><div>Sun</div>

<% for(int i=9;i<=21;i+=2){ %>
<div><%= i %>:00</div>
<% for(int j=0;j<7;j++){ %>
<div class="h-10 bg-gray-200 rounded"></div>
<% } } %>

</div>
</div>

</div>

<!-- ========================= -->
<!-- 우측 -->
<!-- ========================= -->
<div class="w-80 p-6 space-y-6">

<!-- ✅ 상단 헤더 -->
<div class="flex justify-end items-center gap-4 mb-6">
    <% if(loginUser != null){ %>

        <!-- 알림 -->
        <div class="relative cursor-pointer" onclick="openNotification()">
   			 <span class="material-symbols-outlined text-2xl">notifications</span>
   			 <span id="notiCount"
          	 		class="absolute -top-1 -right-1 w-4 h-4 bg-red-500 text-white text-[10px] flex items-center justify-center rounded-full">
   			 </span>
		</div>

        <!-- 메시지 -->
        <div class="relative cursor-pointer" onclick="openChatModal()">
   			 <span class="material-symbols-outlined text-2xl">chat</span>
    		 <span id="chatCount"
          			class="absolute -top-1 -right-1 w-4 h-4 bg-blue-500 text-white text-[10px] flex items-center justify-center rounded-full">
    		 </span>
		</div>

    <% } %>
</div>

<!-- ✅ PT 일정 -->
<div class="bg-white p-4 rounded-xl shadow">

    <!-- 1줄: 제목 + 상세보기 -->
    <div class="flex justify-between items-center mb-2">
        <h3 class="font-bold">나의 PT 일정</h3>

        <a href="trainerDetail?trainerId=1"
           class="text-sm text-blue-500 hover:underline">
            상세보기
        </a>
    </div>

    <!-- 2줄: 이름 + 리뷰 버튼 -->
    <div class="flex justify-between items-center">
        <p class="text-sm">김태훈 트레이너</p>

        <button onclick="openReviewModal()" 
            class="text-sm bg-blue-500 text-white px-3 py-1 rounded">
            리뷰 작성
        </button>
    </div>

    <p class="text-sm text-gray-500 mt-1">4월 9일 12:00</p>

</div>

<!-- ✅ 멤버쉽 -->
<div class="bg-blue-500 text-white p-4 rounded-xl">

<div class="flex justify-between items-center mb-2">
    <p class="font-bold">멤버쉽</p>

    <!-- 🔥 상세보기 -->
    <a href="mypage?tab=membership"
       class="text-xs underline">
        상세보기
    </a>
</div>

<p class="text-sm">VIP 1:1 PT 20회</p>
<p class="text-sm">남은 횟수: 8회</p>

</div>

<!-- ========================= -->
<!-- 헬스장 핫타임 -->
<!-- ========================= -->
<div class="bg-white p-6 rounded-xl shadow mb-6">

<h2 class="font-bold mb-4">🔥 헬스장 핫타임</h2>

<!-- 안내 문구 -->
<div id="hotMessage"
     class="bg-red-400 text-white text-sm p-3 rounded mb-4">
    데이터 분석 중...
</div>

<!-- 요일별 -->
<h3 class="text-sm font-bold mb-2">요일별 이용자 수</h3>
<canvas id="dayChart" height="100"></canvas>

<!-- 시간별 -->
<h3 class="text-sm font-bold mt-6 mb-2">시간별 이용자 수</h3>
<canvas id="timeChart" height="100"></canvas>

</div>

</div>

</div>
</div>

<!-- ========================= -->
<!-- 모달 (🔥 위치 중요: body 끝) -->
<!-- ========================= -->

<!-- 운동 -->
<div id="workoutModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
<div class="bg-white p-6 rounded-xl w-96">
<input id="name" placeholder="운동명" class="border p-2 w-full mb-2">
<input id="weight" placeholder="무게" class="border p-2 w-full mb-2">
<input id="reps" placeholder="횟수" class="border p-2 w-full mb-2">

<button onclick="saveWorkout()" class="bg-blue-500 text-white w-full py-2">저장</button>
<button onclick="closeWorkoutModal()" class="mt-2 w-full border">닫기</button>
</div>
</div>

<!-- 식단 -->
<div id="foodModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
<div class="bg-white p-6 rounded-xl w-96">
<input id="foodName" placeholder="음식명" class="border p-2 w-full mb-2">
<input id="gram" placeholder="섭취량" class="border p-2 w-full mb-2">

<p id="result"></p>

<button onclick="calcCalorie()" class="bg-green-500 text-white w-full py-2">계산</button>
<button onclick="closeFoodModal()" class="mt-2 w-full border">닫기</button>
</div>
</div>

<!-- 인바디 -->
<div id="inbodyModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
<div class="bg-white p-6 rounded-xl w-96">
<input placeholder="체중" class="border p-2 w-full mb-2">
<input placeholder="골격근량" class="border p-2 w-full mb-2">
<input placeholder="체지방량" class="border p-2 w-full mb-2">
<button class="bg-purple-500 text-white w-full py-2">저장</button>
<button onclick="closeInbodyModal()" class="mt-2 w-full border">닫기</button>
</div>
</div>

<!-- ========================= -->
<!-- 피드백 리스트 모달 -->
<!-- ========================= -->
<div id="feedbackListModal"
class="hidden fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50">

<div class="bg-white w-[500px] max-h-[600px] overflow-y-auto rounded-xl p-6">

    <!-- 헤더 -->
    <div class="flex justify-between items-center mb-4">
        <h3 class="font-bold text-lg">트레이너 피드백</h3>
        <button onclick="closeFeedbackListModal()" 
            class="text-gray-500">✕</button>
    </div>

    <!-- 리스트 -->
    <div id="feedbackListContainer"></div>

</div>
</div>

<div id="notificationModal"
class="hidden fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">

<div class="bg-white w-80 rounded-xl p-4">

    <h3 class="font-bold mb-2">알림</h3>

    <div id="notificationList" class="max-h-80 overflow-y-auto"></div>

	<button onclick="readAllNotification()"
		class="text-sm text-blue-500">
		전체 읽음
	</button>

    <button onclick="closeNotification()" class="mt-2 w-full border">
        닫기
    </button>

</div>
</div>

<div id="chatModal"
class="hidden fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">

<div class="bg-white w-80 rounded-xl p-4">

    <h3 class="font-bold mb-2">채팅 목록</h3>

    <div id="chatList" class="max-h-80 overflow-y-auto"></div>

    <button onclick="closeChatModal()" class="mt-2 w-full border">
        닫기
    </button>

</div>
</div>

<!-- ========================= -->
<!-- 리뷰 작성 모달 -->
<!-- ========================= -->
<div id="reviewModal"
class="hidden fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">

<div class="bg-white p-6 rounded-xl w-[400px]">

<h3 class="font-bold text-lg mb-4">트레이너 리뷰 작성</h3>

<!-- 별점 -->
<div class="mb-3">
    <span class="mr-2">별점:</span>
    <select id="rating" class="border p-1">
        <option value="5">★★★★★</option>
        <option value="4">★★★★☆</option>
        <option value="3">★★★☆☆</option>
        <option value="2">★★☆☆☆</option>
        <option value="1">★☆☆☆☆</option>
    </select>
</div>

<!-- 이미지 -->
<input type="file" id="reviewImage" class="mb-3">

<!-- 리뷰 내용 -->
<textarea id="reviewContent"
placeholder="리뷰를 작성해주세요 (최소 20자)"
class="border w-full p-2 mb-3"></textarea>

<button onclick="submitReview()"
class="bg-blue-500 text-white w-full py-2 rounded">
저장하기
</button>

<button onclick="closeReviewModal()"
class="mt-2 w-full border py-2">
닫기
</button>

</div>
</div>

<!-- ========================= -->
<!-- JS -->
<!-- ========================= -->
<script>
let chart;
let currentData = [];

/* =========================
   공통 로더
========================= */
function loadChart(type){

    const chartEl = document.getElementById("chart");
    const calEl = document.getElementById("calendar");

    chartEl.style.display = "none";
    calEl.style.display = "none";

    fetch("chart?type="+type)
    .then(res=>res.json())
    .then(data=>{
        console.log("데이터 확인:", data);

        currentData = data;

        if(chart){
            chart.destroy();
        }

        if(type === "workout"){
            drawWorkoutChart(data);

        }else if(type === "food"){
            drawFoodCalendar(data);

        }else if(type === "inbody"){
            drawInbodyChart(data);
        }
    })
    .catch(err=>{
        console.error("차트 로딩 실패:", err);
    });
}

/* =========================
   운동 그래프
========================= */
function drawWorkoutChart(data){

    const chartEl = document.getElementById("chart");
    chartEl.style.display = "block";

    const labels = data.map(d=>d.date);
    const values = data.map(d=>d.value);

    chart = new Chart(chartEl, {
        type:'bar',
        data:{
            labels:labels,
            datasets:[{
                label:'운동 볼륨',
                data:values
            }]
        },
        options:{
            onClick:(e, elements)=>{
                if(elements.length > 0){
                    const index = elements[0].index;
                    const date = labels[index];
                    openFeedbackByDate(date);
                }
            }
        }
    });
}

/* =========================
   식단 캘린더
========================= */
function drawFoodCalendar(data){

    const cal = document.getElementById("calendar");

    cal.style.display = "block";
    cal.innerHTML = "";

    if(!data || data.length === 0){
        cal.innerHTML = "<p class='text-gray-400'>식단 데이터 없음</p>";
        return;
    }

    data.forEach(d=>{
        const food = d.food || "식단";
        const calorie = d.calorie || 0;

        cal.innerHTML += `
            <div class="border p-3 mb-2 rounded bg-gray-50">
                <div class="text-xs text-gray-400">${d.date}</div>
                <div class="font-bold">${food}</div>
                <div class="text-sm text-gray-500">${calorie} kcal</div>
            </div>
        `;
    });
}

/* =========================
   인바디 그래프
========================= */
function drawInbodyChart(data){

    const chartEl = document.getElementById("chart");
    chartEl.style.display = "block";

    const labels = data.map(d=>d.date);

    chart = new Chart(chartEl, {
        type:'line',
        data:{
            labels:labels,
            datasets:[
                {
                    label:'체중',
                    data:data.map(d=>d.weight || 0)
                },
                {
                    label:'골격근량',
                    data:data.map(d=>d.muscle || 0)
                },
                {
                    label:'체지방량',
                    data:data.map(d=>d.fat || 0)
                }
            ]
        },
        options:{
            onClick:(e, elements)=>{
                if(elements.length > 0){
                    const index = elements[0].index;
                    const date = labels[index];
                    openFeedbackByDate(date);
                }
            }
        }
    });
}

/* =========================
   피드백
========================= */
function loadFeedback(){

	fetch("feedback")
    .then(res => res.json())
    .then(list => {

        const container = document.getElementById("feedbackListContainer");
        container.innerHTML = "";

        // 최신순 정렬
        list.sort((a,b)=> new Date(b.date) - new Date(a.date));

        list.forEach(function(f){

        	var img = f.trainerImg || "https://via.placeholder.com/40";

            var summary = f.summary 
                ? f.summary 
                : (f.content ? f.content.substring(0, 30) + "..." : "내용 없음");

            container.innerHTML +=
                '<div onclick="openFeedbackModal(\'' + f.date + '\', \'' + f.trainer + '\', \'' + f.content + '\')" ' +
                'class="flex items-center gap-3 p-3 border-b cursor-pointer hover:bg-gray-50">' +

                    '<img src="' + img + '" class="w-10 h-10 rounded-full object-cover">' +

                    '<div class="flex-1">' +

                        '<div class="flex justify-between text-sm">' +
                            '<span class="font-bold">' + f.trainer + '</span>' +
                            '<span class="text-gray-400 text-xs">' + f.date + '</span>' +
                        '</div>' +

                        '<div class="text-sm text-gray-600 truncate">' +
                            summary +
                        '</div>' +

                    '</div>' +

                '</div>';
        });

        document.getElementById("feedbackListModal")
            .classList.remove("hidden");

    })
    .catch(err => {
        console.error("피드백 불러오기 실패", err);
    });
}

function openFeedbackByDate(date){

    fetch("feedback")
    .then(res=>res.json())
    .then(list=>{
        const target = list.find(f => f.date === date);

        if(target){
            openFeedbackModal(target.date, target.trainer, target.content);
        }else{
            alert("해당 날짜 피드백 없음");
        }
    });
}

let dayChart;
let timeChart;

function loadHotTime(){

    fetch("hotTime")
    .then(res=>res.json())
    .then(data=>{

        drawDayChart(data.dayData);
        drawTimeChart(data.timeData);

        // 🔥 가장 붐비는 요일 찾기
        let maxDay = data.dayData.reduce((a,b)=> a.count > b.count ? a : b);

        document.getElementById("hotMessage").innerText =
        "현재 가장 붐비는 요일은 " + maxDay.day + " 입니다. 혼잡 시간을 피하세요!";
    });
}

/* =========================
   요일별 그래프
========================= */
function drawDayChart(data){

    const ctx = document.getElementById("dayChart");

    if(dayChart) dayChart.destroy();

    dayChart = new Chart(ctx, {
        type:'bar',
        data:{
            labels: data.map(d=>d.day),
            datasets:[{
                label:'이용자 수',
                data: data.map(d=>d.count)
            }]
        }
    });
}

/* =========================
   시간별 그래프
========================= */
function drawTimeChart(data){

    const ctx = document.getElementById("timeChart");

    if(timeChart) timeChart.destroy();

    timeChart = new Chart(ctx, {
        type:'line',
        data:{
            labels: data.map(d=>d.time),
            datasets:[{
                label:'이용자 수',
                data: data.map(d=>d.count),
                fill:true
            }]
        }
    });
}

function loadNotification(){

    fetch("notification")
    .then(function(res){ return res.json(); })
    .then(function(data){

    	var countEl = document.getElementById("notiCount");

        // 🔥 뱃지 표시 / 숨김
        if(data.count > 0){
            countEl.style.display = "flex";
            countEl.innerText = data.count;
        }else{
            countEl.style.display = "none";
        }
        
        // 🔥 리스트 렌더
        var box = document.getElementById("notificationList");
        box.innerHTML = "";

        data.list.forEach(function(n){

            var html = "";

            html += "<div onclick=\"readNotification("
                 + n.id + ", '" + n.url + "')\" ";

            html += "class='p-3 border-b cursor-pointer hover:bg-gray-50 ";
            
            if(!n.isRead){
                html += "bg-blue-50"; // 🔥 안읽은 알림 강조
            }

            html += "'>";

            html += "<div class='text-sm'>" + n.message + "</div>";
            html += "<div class='text-xs text-gray-400'>" + n.createdAt + "</div>";

            html += "</div>";

            box.innerHTML += html;
        });
    });
}

function readNotification(id, url){

    fetch("notification", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "action=readOne&id=" + id
    })
    .then(function(){

        // 🔥 뱃지 감소
        var countEl = document.getElementById("notiCount");
        var count = parseInt(countEl.innerText);

        if(count > 1){
            countEl.innerText = count - 1;
        }else{
            countEl.style.display = "none";
        }

        // 🔥 이동
        location.href = url;
    });
}

function readAllNotification(){

    fetch("notification", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "action=readAll"
    })
    .then(function(){
        document.getElementById("notiCount").style.display = "none";
        loadNotification();
    });
}

function loadChatList(){

    fetch("messageList")
    .then(function(res){ return res.json(); })
    .then(function(list){

        var box = document.getElementById("chatList");
        box.innerHTML = "";

        list.forEach(function(c){

            var html = "";

            html += "<div onclick=\"enterChat('" + c.email + "')\" ";
            html += "class='p-3 border-b cursor-pointer hover:bg-gray-50'>";

            html += "<div class='font-bold'>" + c.nickname + "</div>";
            html += "<div class='text-sm text-gray-500'>" + c.lastMessage + "</div>";

            if(c.unreadCount > 0){
                html += "<div class='text-xs text-red-500'>읽지않음 " + c.unreadCount + "</div>";
            }

            html += "</div>";

            box.innerHTML += html;
        });
    });
}

function enterChat(email){

    fetch("message", {
        method:"POST",
        headers:{
            "Content-Type":"application/x-www-form-urlencoded"
        },
        body:"action=readAll&receiver=" + email
    })
    .then(function(){
        location.href = "chat.jsp?receiver=" + email;
    });
}

function loadChatCount(){

    fetch("chatCount")
    .then(function(res){ return res.text(); })
    .then(function(count){

        var el = document.getElementById("chatCount");

        if(parseInt(count) > 0){
            el.style.display = "flex";
            el.innerText = count;
        }else{
            el.style.display = "none";
        }
    });
}

/* =========================
   페이지 로드시 실행
========================= */
window.onload = function(){
    loadChart('workout');
    loadHotTime(); 
    loadChatCount();
};

/* =========================
   모달
========================= */
function openWorkoutModal(){ document.getElementById("workoutModal").classList.remove("hidden"); }
function closeWorkoutModal(){ document.getElementById("workoutModal").classList.add("hidden"); }

function openFoodModal(){ document.getElementById("foodModal").classList.remove("hidden"); }
function closeFoodModal(){ document.getElementById("foodModal").classList.add("hidden"); }

function openInbodyModal(){ document.getElementById("inbodyModal").classList.remove("hidden"); }
function closeInbodyModal(){ document.getElementById("inbodyModal").classList.add("hidden"); }

function openFeedbackModal(date, trainer, content){
    document.getElementById("fbDate").innerText = date;
    document.getElementById("fbTrainer").innerText = trainer;
    document.getElementById("fbContent").innerText = content;
    document.getElementById("feedbackModal").classList.remove("hidden");
}

function closeFeedbackModal(){
    document.getElementById("feedbackModal").classList.add("hidden");
}

function closeFeedbackListModal(){
    document.getElementById("feedbackListModal")
        .classList.add("hidden");
}

function openFeedbackByDate(date){

    fetch("feedback")
    .then(res=>res.json())
    .then(list=>{

        const target = list.find(f => f.date === date);

        if(target){
            openFeedbackModal(
                target.date,
                target.trainer,
                target.content
            );
        }else{
            alert("해당 날짜 피드백 없음");
        }
    });
}

function openReviewModal(){
    document.getElementById("reviewModal").classList.remove("hidden");
}

function closeReviewModal(){
    document.getElementById("reviewModal").classList.add("hidden");
}

function openNotification(){
    document.getElementById("notificationModal").classList.remove("hidden");
    loadNotification();
}

function closeNotification(){
    document.getElementById("notificationModal").classList.add("hidden");
}

function openChatModal(){
    document.getElementById("chatModal").classList.remove("hidden");
    loadChatList();
}

function closeChatModal(){
    document.getElementById("chatModal").classList.add("hidden");
}

/* =========================
   데이터 저장
========================= */
function saveWorkout(){
    fetch("workout", {
        method:"POST",
        headers:{"Content-Type":"application/x-www-form-urlencoded"},
        body:
        "name="+document.getElementById("name").value+
        "&weight="+document.getElementById("weight").value+
        "&reps="+document.getElementById("reps").value
    })
    .then(()=>location.reload());
}

function calcCalorie(){
    const name = document.getElementById("foodName").value;
    const gram = document.getElementById("gram").value;

    fetch("food", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            name: name,
            gram: gram
        })
    })
    .then(res => res.json())
    .then(data => {
        document.getElementById("result").innerText =
        "칼로리: " + data.calorie + " kcal";
    });
}

function submitReview(){

    const content = document.getElementById("reviewContent").value;

    if(content.length < 20){
        alert("리뷰는 20자 이상 작성해주세요");
        return;
    }

    const formData = new FormData();
    formData.append("rating", document.getElementById("rating").value);
    formData.append("content", content);
    formData.append("trainerId", 1); // 👉 현재 트레이너 ID

    const file = document.getElementById("reviewImage").files[0];
    if(file){
        formData.append("image", file);
    }

    fetch("review", {
        method: "POST",
        body: formData
    })
    .then(res=>res.text())
    .then(msg=>{
        alert(msg);
        closeReviewModal();
    });
}
</script>

</body>
</html>