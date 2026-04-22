<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

<div class="max-w-md mx-auto mt-10 bg-white p-6 rounded shadow">

    <!-- STEP 1 -->
    <div id="step1">
        <h2 class="text-xl font-bold mb-4">회원가입</h2>

        <select id="role" class="w-full border p-2 mb-3">
            <option value="USER">일반</option>
            <option value="TRAINER">트레이너</option>
            <option value="GYM">헬스장</option>
        </select>

        <input id="id" placeholder="아이디" class="w-full border p-2 mb-2">
        <input id="pw" placeholder="비밀번호" type="password" class="w-full border p-2 mb-2">
        <input id="name" placeholder="이름" class="w-full border p-2 mb-4">

        <button onclick="submitJoin()" class="w-full bg-orange-500 text-white py-2">
            회원가입 완료
        </button>
    </div>

    <!-- STEP 2 (트레이너) -->
    <div id="step2" class="hidden">
        <h2 class="text-xl font-bold mb-4">트레이너 인증</h2>

        <input id="career" placeholder="경력" class="w-full border p-2 mb-2">
        <input id="cert" placeholder="자격증" class="w-full border p-2 mb-4">

        <button onclick="submitTrainer()" class="w-full bg-blue-500 text-white py-2">
            제출하기
        </button>
    </div>

    <!-- STEP 3 (헬스장) -->
    <div id="step3" class="hidden">
        <h2 class="text-xl font-bold mb-4">사업자 인증</h2>

        <input id="bizNo" placeholder="사업자번호" class="w-full border p-2 mb-4">

        <button onclick="submitGym()" class="w-full bg-green-500 text-white py-2">
            제출하기
        </button>
    </div>

</div>

<script>
function submitJoin() {
    const data = {
        id: document.getElementById("id").value,
        pw: document.getElementById("pw").value,
        name: document.getElementById("name").value,
        role: document.getElementById("role").value
    };

    fetch("join", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(data)
    })
    .then(res => res.json())
    .then(res => {
        if (res.result === "trainer") {
            showStep(2);
        } else if (res.result === "gym") {
            showStep(3);
        } else {
            alert("회원가입 완료");
        }
    });
}

function submitTrainer() {
    fetch("trainer", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            career: document.getElementById("career").value,
            cert: document.getElementById("cert").value
        })
    }).then(() => alert("트레이너 인증 완료"));
}

function submitGym() {
    fetch("gym", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            bizNo: document.getElementById("bizNo").value
        })
    }).then(() => alert("사업자 인증 완료"));
}

function showStep(step) {
    document.getElementById("step1").classList.add("hidden");
    document.getElementById("step2").classList.add("hidden");
    document.getElementById("step3").classList.add("hidden");

    document.getElementById("step" + step).classList.remove("hidden");
}
</script>

</body>
</html> --%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50">

<!-- ================= STEP 1 ================= -->
<div id="step1" class="min-h-screen flex">

    <div class="w-1/2 p-10">
        <h1 class="text-3xl font-bold mb-6">회원가입</h1>

        <!-- 역할 선택 -->
        <div class="flex gap-2 mb-6">
            <button type="button" onclick="selectRole('member')" class="roleBtn bg-blue-500 text-white px-4 py-2 rounded">회원</button>
            <button type="button" onclick="selectRole('trainer')" class="roleBtn bg-gray-200 px-4 py-2 rounded">트레이너</button>
            <button type="button" onclick="selectRole('gym')" class="roleBtn bg-gray-200 px-4 py-2 rounded">헬스장</button>
        </div>

        <form id="joinForm" method="post" action="join.do">

            <input type="hidden" name="role" id="role" value="member"/>

            <input name="id" placeholder="아이디" class="block w-full mb-3 p-3 border"/>

            <input name="pw" type="password" placeholder="비밀번호" class="block w-full mb-3 p-3 border"/>

            <input name="name" placeholder="이름" class="block w-full mb-3 p-3 border"/>

            <input name="phone" placeholder="전화번호" class="block w-full mb-6 p-3 border"/>

            <button type="button" onclick="goStep2()" class="bg-blue-500 text-white w-full py-3 rounded">
                다음 단계
            </button>
        </form>
    </div>

    <div class="w-1/2 bg-black"></div>
</div>

<!-- ================= STEP 2 ================= -->
<div id="step2" class="hidden fixed inset-0 bg-black/50 flex justify-center items-center">

    <div class="bg-white p-8 rounded w-[500px]">
        <h2 class="text-xl font-bold mb-6">맞춤형 정보 입력</h2>

        <input name="height" placeholder="키(cm)" class="block w-full mb-3 p-3 border"/>
        <input name="weight" placeholder="몸무게(kg)" class="block w-full mb-6 p-3 border"/>

        <div class="flex justify-between">
            <button onclick="backStep1()" class="px-4 py-2 border">이전</button>
            <button onclick="goStep3()" class="bg-blue-500 text-white px-6 py-2 rounded">다음</button>
        </div>
    </div>
</div>

<!-- ================= STEP 3 ================= -->
<div id="step3" class="hidden fixed inset-0 bg-black/50 flex justify-center items-center">

    <div class="bg-white p-8 rounded w-[500px]">
        <h2 class="text-xl font-bold mb-6">운동 목표</h2>

        <select name="goal" class="w-full mb-6 p-3 border">
            <option value="light">주 1~2회</option>
            <option value="normal">주 3~4회</option>
            <option value="hard">주 5회 이상</option>
        </select>

        <div class="flex justify-between">
            <button onclick="backStep2()" class="px-4 py-2 border">이전</button>

            <!-- 최종 submit -->
            <button onclick="submitJoin()" class="bg-blue-500 text-white px-6 py-2 rounded">
                가입 완료
            </button>
        </div>
    </div>
</div>

<script>

function selectRole(role){
    document.getElementById("role").value = role;

    document.querySelectorAll(".roleBtn").forEach(btn=>{
        btn.classList.remove("bg-blue-500","text-white");
        btn.classList.add("bg-gray-200");
    });

    event.target.classList.add("bg-blue-500","text-white");
}

// step 이동
function goStep2(){
    document.getElementById("step2").classList.remove("hidden");
}

function goStep3(){
    document.getElementById("step2").classList.add("hidden");
    document.getElementById("step3").classList.remove("hidden");
}

function backStep1(){
    document.getElementById("step2").classList.add("hidden");
}

function backStep2(){
    document.getElementById("step3").classList.add("hidden");
    document.getElementById("step2").classList.remove("hidden");
}

// 최종 submit
function submitJoin(){
    document.getElementById("joinForm").submit();
}

</script>

</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>핏츠버그 회원가입</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;500;700;900&display=swap" rel="stylesheet"/>

<script>
tailwind.config = {
  theme: {
    extend: {
      fontFamily: {
        headline: ["Public Sans"],
        body: ["Public Sans"],
        label: ["Public Sans"]
      }
    }
  }
}
</script>

<style>
body { font-family: 'Public Sans', sans-serif; }

/* 선택된 역할 스타일 */
.active-role {
    background-color: #2563EB !important;
    color: white !important;
    ring: 1px solid #2563EB;
}
</style>

</head>

<body class="bg-white min-h-screen flex items-center justify-center font-body text-slate-900">

<div class="w-full min-h-screen flex flex-col md:flex-row">

<!-- LEFT -->
<div class="w-full md:w-1/2 flex flex-col justify-center px-8 md:px-16 lg:px-24 py-12 bg-white">

<!-- 로고 -->
<div class="flex items-center gap-3 mb-16">
<img class="w-10 h-10 rounded-full bg-slate-100 p-1"
src="https://lh3.googleusercontent.com/aida/ADBb0ujjoLwjvLo850PgDZwzgmAYzZTgTk21eSgJ3rWxU-xEuAs9e-R7sXqi0uUJBAQPNA0NEJxsFWsTqdfMku_dWbd9ATeoYS_ItBbJP-RdVQfpAJhuNPZxHtnvGvZNjggxjgVuKb1MicmYie3MM69SHptMJ09BTGw047UVywTqEE-3qSW5zEUZMKD3ldCnv3D2f5w63ffSNZWnc6KuEw5JdR0BFEgXIX4RomxnpNrEpgD9cE47jjl6IjBS9X5WROo6UcnpdohMd8g_"/>
<span class="text-2xl font-black">핏츠버그</span>
</div>

<!-- 타이틀 -->
<div class="mb-10">
<h1 class="text-3xl md:text-4xl font-bold mb-4">
핏츠버그 파트너스 가입을<br/>환영합니다
</h1>
<p class="text-slate-500 text-lg">혼자서도 완벽한 운동을 시작해 보세요.</p>
</div>

<!-- 역할 선택 -->
<div class="flex flex-wrap gap-2 mb-10">
<button type="button" class="role-btn active-role px-6 py-2.5 rounded-full text-sm font-medium"
data-role="member">회원</button>

<button type="button" class="role-btn px-6 py-2.5 rounded-full bg-slate-50 text-slate-600 text-sm font-medium ring-1 ring-slate-200"
data-role="trainer">트레이너</button>

<button type="button" class="role-btn px-6 py-2.5 rounded-full bg-slate-50 text-slate-600 text-sm font-medium ring-1 ring-slate-200"
data-role="gym">헬스장</button>
</div>

<!-- FORM -->
<form action="join" method="post" class="space-y-6 w-full max-w-md">

<input type="hidden" name="role" id="role" value="member">

<!-- 아이디 -->
<div>
<label class="block text-sm font-semibold mb-2">아이디</label>
<div class="flex gap-3">
<input name="username" required
class="w-full rounded-xl py-3 ring-1 ring-slate-300 px-3"
placeholder="아이디를 입력해주세요">

<button type="button"
class="px-6 py-3 bg-slate-100 rounded-xl text-sm font-semibold whitespace-nowrap">
중복확인
</button>
</div>
</div>

<!-- 비밀번호 -->
<div>
<label class="block text-sm font-semibold mb-2">비밀번호</label>
<input type="password" name="password" required
class="w-full rounded-xl py-3 ring-1 ring-slate-300 px-3"
placeholder="비밀번호를 입력해주세요">
</div>

<!-- 이름 -->
<div>
<label class="block text-sm font-semibold mb-2">이름 / 닉네임</label>
<input name="nickname" required
class="w-full rounded-xl py-3 ring-1 ring-slate-300 px-3"
placeholder="이름 또는 닉네임">
</div>

<!-- 연락처 -->
<div>
<label class="block text-sm font-semibold mb-2">연락처</label>
<input name="phone" required
class="w-full rounded-xl py-3 ring-1 ring-slate-300 px-3"
placeholder="010-0000-0000">
</div>

<!-- 버튼 -->
<div class="pt-4">
<button type="submit"
class="w-full py-4 rounded-xl text-white font-bold bg-blue-600 hover:bg-blue-700">
회원가입 완료
</button>
</div>

</form>
</div>

<!-- RIGHT -->
<div class="hidden md:block md:w-1/2 relative bg-slate-900">

<div class="absolute inset-0 bg-cover bg-center"
style="background-image:url('https://lh3.googleusercontent.com/aida-public/AB6AXuB4xtK3O5GT-5y9CJWlerii7aPWu5pK2KpFABJoNUPBmWVpOM3ZZw3eo9Zc3rfDLQ3UTyTLxFoHlUv9ic3PlfPMyPDCTKay-OSiqBMOHkAwVlrFbXlWvZ9TewuneJr5SA5Nkuwf7HnGThq2pRv8mE6kPaJv6-Sz7BkpA2lhNxSXxyKjuLSBS8p2aA3B55XeCzp55qSCtGXTyRq13GNepQFUW97RODytT8ZVvM7pDLH_HYb6_cf460V4VvsX80AVIspKkLoiqazqgu4')">
</div>

<div class="absolute inset-0 bg-gradient-to-t from-black/80"></div>

<div class="absolute bottom-16 left-16 right-16 text-white">
<blockquote class="text-2xl mb-6">
"최고의 트레이닝은 완벽한 환경에서 시작됩니다."
</blockquote>

<div class="flex items-center gap-4">
<div class="w-12 h-12 rounded-full overflow-hidden">
<img src="https://lh3.googleusercontent.com/aida-public/AB6AXuAZH_DaK1hIp-0yJ7yo3Uh_us8thyfxrvb8Wdsxu2PAUJy2spSNxjEEY2QHlKbk-_wcXcYkAFsNPYwDJp9rg8xuUCvpMtaWXzQU2-dG06jHTCbEDIfsycoPPjjuHuIGm58xm_5OzY5c4bS5gLV6I0LexkvW_I2N9fTN1xjKzbxcNzwjj4bO8ld3NH2oOAW2dfG5hlACfYJCzIA_nvyh7QFPG8Qm-y5pcEch0FZ593uyHxRTHPbNc2_UHqmvRYJv-qLoHn-1IOdSRCA"/>
</div>
<div>
<div class="font-bold">Sarah Jenkins</div>
<div class="text-sm text-slate-300">Lead Trainer</div>
</div>
</div>

</div>
</div>

</div>

<!-- JS -->
<script>
const buttons = document.querySelectorAll(".role-btn");
const roleInput = document.getElementById("role");

buttons.forEach(btn => {
  btn.addEventListener("click", () => {
	  
	  const role = btn.dataset.role;

      // ⭐ 트레이너 선택 시 페이지 이동
      if(role === "trainer"){
          window.location.href = "trainerJoin.jsp";
          return;
      }

  	  // ⭐ 헬스장 이동 (추가된 부분)
      if(role === "gym"){
          window.location.href = "gymJoin.jsp";
          return;
      }
      
      // 기본 회원 처리
        buttons.forEach(b => {
            b.classList.remove("active-role");
            b.classList.add("bg-gray-200");
        });

        btn.classList.add("active-role");
        btn.classList.remove("bg-gray-200");

        roleInput.value = role;

    /* buttons.forEach(b => {
      b.classList.remove("active-role");
      b.classList.add("bg-slate-50","text-slate-600");
    });

    btn.classList.add("active-role");
    btn.classList.remove("bg-slate-50","text-slate-600");

    roleInput.value = btn.dataset.role; */
  });
});
</script>
<script>
const buttons = document.querySelectorAll(".role-btn");

buttons.forEach(btn => {
    btn.addEventListener("click", () => {
        const role = btn.dataset.role;

        if(role === "trainer"){
            location.href = "trainerJoin";
        } else if(role === "gym"){
            location.href = "gymJoin";
        }
    });
});
</script>

</body>
</html>