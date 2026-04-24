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

	<button onclick="loadFeedback()" class="border px-3 py-2 rounded">
    피드백 보기
	</button>
</div>

<canvas id="chart" height="100"></canvas>

<div id="calendar" class="hidden mt-4"></div>

</div>

<!-- ========================= -->
<!-- 피드백 리스트 -->
<!-- ========================= -->
<div id="feedbackBox" class="bg-white p-6 rounded-xl shadow mb-6 hidden">

<h2 class="font-bold mb-4">트레이너 피드백</h2>

<div id="feedbackList"></div>

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
<!-- ========================= -->
<!-- 우측 -->
<!-- ========================= -->
<div class="w-80 p-6 space-y-6">

<!-- ✅ PT 일정 -->
<div class="bg-white p-4 rounded-xl shadow">

<div class="flex justify-between items-center mb-2">
    <h3 class="font-bold">나의 PT 일정</h3>

    <!-- 🔥 상세보기 -->
    <a href="trainerDetail?trainerId=1"
       class="text-sm text-blue-500 hover:underline">
        상세보기
    </a>
</div>

<p class="text-sm">김태훈 트레이너</p>
<p class="text-sm text-gray-500">4월 9일 12:00</p>

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

<!-- 나의 활동 -->
<!-- ✅ 나의 활동 -->
<div class="bg-white p-4 rounded-xl shadow">

    <!-- 상단 -->
    <div class="flex justify-between items-center mb-3">
        <h3 class="font-bold">나의 활동</h3>

        <a href="community.jsp"
           class="text-sm text-blue-500 hover:underline">
            커뮤니티
        </a>
    </div>

    <!-- 🔥 게시글 영역 -->
    <c:choose>

        <c:when test="${not empty myPost}">

            <div class="border rounded p-3">

                <!-- 이미지 -->
                <c:choose>
                    <c:when test="${not empty myPost.image}">
                        <img src="${myPost.image}" 
                             class="w-full h-32 object-cover rounded mb-2">
                    </c:when>
                    <c:otherwise>
                        <div class="w-full h-32 bg-gray-100 rounded mb-2 flex items-center justify-center text-gray-400 text-xs">
                            이미지 없음
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- 제목 -->
                <p class="font-bold text-sm">${myPost.title}</p>

                <!-- 내용 -->
                <p class="text-xs text-gray-500 mb-2">
                    ${myPost.content}
                </p>

                <!-- 좋아요 + 댓글 -->
                <div class="flex gap-3 text-xs text-gray-500">

                    <div class="flex items-center gap-1">
                        <span class="material-symbols-outlined text-sm">favorite</span>
                        ${myPost.likeCount}
                    </div>

                    <div class="flex items-center gap-1">
                        <span class="material-symbols-outlined text-sm">chat_bubble</span>
                        ${myPost.commentCount}
                    </div>
                </div>

            </div>

        </c:when>

        <c:otherwise>
            <p class="text-sm text-gray-400">게시글 없음</p>
        </c:otherwise>

    </c:choose>

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
<!-- 피드백 상세 모달 -->
<!-- ========================= -->
<div id="feedbackModal"
class="hidden fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">

<div class="bg-white p-6 rounded-xl w-[500px]">

<h3 class="font-bold text-lg mb-3">피드백 상세</h3>

<p id="fbDate" class="text-sm text-gray-500"></p>
<p id="fbTrainer" class="font-bold mb-2"></p>

<hr class="my-2">

<p id="fbContent"></p>

<button onclick="closeFeedbackModal()"
class="mt-4 w-full border py-2">닫기</button>

</div>
</div>

<!-- ========================= -->
<!-- JS -->
<!-- ========================= -->
<script>
let chart;
let currentData = [];

/* =========================
   페이지 로드
========================= */
window.onload = function(){
    loadChart('workout');
};

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
    .then(res=>res.json())
    .then(list=>{

        list.sort((a, b) => new Date(b.date) - new Date(a.date));

        const box = document.getElementById("feedbackBox");
        const container = document.getElementById("feedbackList");

        box.classList.remove("hidden");
        container.innerHTML = "";

        list.forEach(f=>{
            container.innerHTML += `
                <div onclick="openFeedbackModal(
                    '${f.date}',
                    '${f.trainer}',
                    '${f.content}'
                )"
                class="border p-3 mb-2 rounded cursor-pointer hover:bg-gray-50">

                    <div class="flex justify-between">
                        <span class="font-bold">${f.trainer}</span>
                        <span class="text-xs text-gray-400">${f.date}</span>
                    </div>

                    <p class="text-sm text-gray-600">
                        ${f.summary}
                    </p>
                </div>
            `;
        });
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
</script>

</body>
</html>