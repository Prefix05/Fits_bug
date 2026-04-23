<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.member.MemberDTO"%>
<%@ page import="dto.member.WorkoutPlanDTO"%>

<%
MemberDTO user = (MemberDTO) request.getAttribute("member");
WorkoutPlanDTO plan = (WorkoutPlanDTO) request.getAttribute("plan");

// 로그인 안 된 경우
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

// plan null 방어
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
</head>

<body class="bg-gray-100">

<div class="max-w-5xl mx-auto mt-10">

<!-- ================= 프로필 ================= -->
<div class="bg-white p-6 rounded-xl shadow">

<div class="flex justify-between">
<h2 class="font-bold">개인정보 관리</h2>
</div>

<div class="flex gap-6 mt-4">

<!-- 프로필 이미지 -->
<div>
<img id="profileImg"
src="upload/<%= user.getProfileImage() == null ? "default.png" : user.getProfileImage() %>"
class="w-28 h-28 rounded-full object-cover">

<form id="uploadForm">
<input type="file" name="profile" onchange="uploadImg()" class="mt-2">
</form>
</div>

<!-- 유저 정보 -->
<div>
<p>이메일: <%= user.getEmail() %></p>
<p>닉네임: <%= user.getNickname() %></p>

<p>
이메일 인증:
<span class="<%= user.isEmailVerified() ? "text-green-500" : "text-red-500" %>">
<%= user.isEmailVerified() ? "✔ 인증완료" : "❌ 미인증" %>
</span>
</p>

<p>로그인 방식: <%= user.getSocialType() == null ? "일반 로그인" : user.getSocialType() %></p>

</div>

</div>
</div>

<!-- ================= 운동 계획 ================= -->
<div class="bg-white mt-6 p-6 rounded-xl shadow">

<h2 class="font-bold mb-4">맞춤형 운동 계획</h2>

<p>목표: <%= plan.getGoal() == null ? "미설정" : plan.getGoal() %></p>
<p>레벨: <%= plan.getLevel() == null ? "미설정" : plan.getLevel() %></p>
<p>키/몸무게: 
    <%= plan.getHeight() == 0 ? "-" : plan.getHeight() %> / 
    <%= plan.getWeight() == 0 ? "-" : plan.getWeight() %>
</p>

<p>식단: <%= plan.getDiet() == null ? "-" : plan.getDiet() %></p>
<p>운동 빈도: <%= plan.getFrequency() == null ? "-" : plan.getFrequency() %></p>

</div>

<!-- ================= 그래프 ================= -->
<div class="bg-white mt-6 p-6 rounded-xl shadow">

<h2 class="font-bold mb-4">운동 기록</h2>

<canvas id="chart"></canvas>

</div>

</div>

<!-- ================= JS ================= -->
<script>

// 이미지 업로드
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


// 그래프 (더미데이터 fallback 포함)
fetch("records")
.then(res=>res.json())
.then(data=>{
    drawChart(data);
})
.catch(()=>{
    // ✅ DB 없이 테스트용 더미 데이터
    const dummy = [
        {date:"04-01", weight:70},
        {date:"04-02", weight:69.8},
        {date:"04-03", weight:69.5},
        {date:"04-04", weight:69.7}
    ];
    drawChart(dummy);
});

function drawChart(data){

    const labels = data.map(d=>d.date);
    const values = data.map(d=>d.weight);

    new Chart(document.getElementById("chart"), {
        type:'line',
        data:{
            labels:labels,
            datasets:[{
                label:'몸무게 변화',
                data:values
            }]
        }
    });
}

</script>

</body>
</html>