<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PT 피드백</title>

<script src="https://cdn.tailwindcss.com"></script>

<style>
.tab-content { display:none; }
.tab-content.active { display:block; }
</style>
</head>

<body class="bg-gray-100 p-6">

<div class="max-w-5xl mx-auto">

    <h1 class="text-2xl font-bold mb-6">🏋️ PT 세션 피드백</h1>

    <!-- 캘린더 -->
    <div class="bg-white p-4 rounded-xl shadow mb-6">
        <h2 class="font-bold mb-3">PT 수업 날짜</h2>
        <div id="calendar" class="grid grid-cols-4 gap-2 text-center"></div>
    </div>

    <!-- 토글 -->
    <div class="bg-white p-4 rounded-xl shadow mb-6">

        <div class="flex gap-2 mb-4">
            <button onclick="changeTab('exercise', event)"
                    class="tab-btn bg-blue-500 text-white px-3 py-1 rounded">운동</button>
            <button onclick="changeTab('food', event)"
                    class="tab-btn px-3 py-1 rounded">식단</button>
            <button onclick="changeTab('inbody', event)"
                    class="tab-btn px-3 py-1 rounded">인바디</button>
        </div>

        <div id="exerciseBox" class="tab-content active"></div>
        <div id="foodBox" class="tab-content"></div>
        <div id="inbodyBox" class="tab-content"></div>

    </div>

    <!-- 공통 -->
    <div class="bg-white p-4 rounded-xl shadow">

        <div class="mb-4">
            <h3 class="font-bold">📈 성장 포인트</h3>
            <p id="growth" class="text-sm text-gray-600 mt-1"></p>
        </div>

        <div>
            <h3 class="font-bold">📅 다음 계획</h3>
            <p id="nextPlan" class="text-sm text-gray-600 mt-1"></p>
        </div>

    </div>

</div>

<script>

let feedbackList = [];
let currentTab = "exercise";

/* 초기 로딩 */
window.onload = function(){

    fetch("ptFeedback")
    .then(function(res){ return res.json(); })
    .then(function(data){
        feedbackList = data;
        drawCalendar();
    });
}

/* 캘린더 */
function drawCalendar(){

    var box = document.getElementById("calendar");
    box.innerHTML = "";

    if(!feedbackList || feedbackList.length === 0){
        box.innerHTML = "<p class='text-gray-400'>데이터 없음</p>";
        return;
    }

    for(var i=0; i<feedbackList.length; i++){

        var f = feedbackList[i];
        var date = f.sessionDate.split("T")[0];

        var html = "";
        html += "<div onclick='loadDetail(" + f.id + ")' ";
        html += "class='p-3 border rounded cursor-pointer hover:bg-blue-100'>";
        html += date;
        html += "</div>";

        box.innerHTML += html;
    }
}

/* 토글 */
function changeTab(type, e){

    currentTab = type;

    var btns = document.querySelectorAll(".tab-btn");
    for(var i=0; i<btns.length; i++){
        btns[i].classList.remove("bg-blue-500","text-white");
    }

    e.currentTarget.classList.add("bg-blue-500","text-white");

    var tabs = document.querySelectorAll(".tab-content");
    for(var i=0; i<tabs.length; i++){
        tabs[i].classList.remove("active");
    }

    document.getElementById(type+"Box").classList.add("active");
}

/* 상세 로드 */
function loadDetail(id){

    fetch("ptFeedback?mode=detail&id=" + id)
    .then(function(res){ return res.json(); })
    .then(function(d){

        // 운동
        var exHtml = "";
        exHtml += "<h3 class='font-bold mb-2'>🏋️ 운동 피드백</h3>";
        exHtml += "<div class='bg-gray-50 p-3 rounded text-sm'>";
        exHtml += (d.exercise ? d.exercise : "데이터 없음");
        exHtml += "</div>";

        document.getElementById("exerciseBox").innerHTML = exHtml;

        // 식단
        var foodHtml = "";
        foodHtml += "<h3 class='font-bold mb-2'>🥗 식단 피드백</h3>";
        foodHtml += "<div class='bg-gray-50 p-3 rounded text-sm'>";
        foodHtml += (d.food ? d.food : "데이터 없음");
        foodHtml += "</div>";

        document.getElementById("foodBox").innerHTML = foodHtml;

        // 인바디
        var inbodyHtml = "";
        inbodyHtml += "<h3 class='font-bold mb-2'>📊 인바디 피드백</h3>";
        inbodyHtml += "<div class='bg-gray-50 p-3 rounded text-sm'>";
        inbodyHtml += (d.inbody ? d.inbody : "데이터 없음");
        inbodyHtml += "</div>";

        document.getElementById("inbodyBox").innerHTML = inbodyHtml;

        // 공통
        document.getElementById("growth").innerText =
            (d.growth ? d.growth : "데이터 없음");

        document.getElementById("nextPlan").innerText =
            (d.nextPlan ? d.nextPlan : "데이터 없음");
    });
}

</script>

</body>
</html>