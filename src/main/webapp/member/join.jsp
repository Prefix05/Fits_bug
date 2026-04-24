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

.active-role {
    background-color: #2563EB !important;
    color: white !important;
    ring: 1px solid #2563EB;
}
</style>
</head>

<body class="bg-white min-h-screen flex items-center justify-center text-slate-900">

<div class="w-full min-h-screen flex">

<!-- LEFT -->
<div class="w-full md:w-1/2 flex flex-col justify-center px-12 py-12">

<h1 class="text-3xl font-bold mb-8">회원가입</h1>

<!-- 역할 선택 -->
<div class="flex gap-2 mb-8">
<button type="button" class="role-btn active-role px-5 py-2 rounded-full" data-role="member">회원</button>
<button type="button" class="role-btn px-5 py-2 rounded-full bg-gray-200" data-role="trainer">트레이너</button>
<button type="button" class="role-btn px-5 py-2 rounded-full bg-gray-200" data-role="gym">헬스장</button>
</div>

<form action="join" method="post" class="space-y-5 max-w-md">

<input type="hidden" name="role" id="role" value="member">
<input type="hidden" name="verified" value="true">

<!-- 이메일 (아이디) -->
<div>
<label class="block mb-1 font-semibold">아이디 (이메일)</label>

<div class="flex gap-2">
<input name="username" id="username" required
class="flex-1 p-3 border rounded"
placeholder="example@email.com">

<button type="button" onclick="checkEmail()"
class="px-4 bg-gray-200 rounded whitespace-nowrap">중복확인</button>
</div>

<!-- 메시지 -->
<div id="emailMsg" class="text-sm mt-1"></div>
</div>

<!-- 인증 영역 -->
<div>

<div class="flex gap-2 mt-2">
<input type="text" id="emailDisplay" readonly
class="flex-1 p-3 border rounded bg-gray-100"
placeholder="발급된 인증 코드를 입력해주세요">

<button type="button" id="verifyBtn" onclick="sendCode()"
class="px-4 bg-gray-200 rounded whitespace-nowrap" disabled>
본인인증
</button>
</div>

<!-- 코드 입력 -->
<div id="codeBox" class="hidden mt-3">

<div class="flex gap-2">
<input type="text" id="code"
class="w-full p-3 border rounded"
placeholder="인증 코드 입력">

<button type="button" id="confirmBtn" onclick="verifyCode()"
class="px-4 bg-gray-200 rounded">확인</button>
</div>

<div id="codeMsg" class="text-sm mt-1"></div>
<div id="timer" class="text-xs text-red-500"></div>

</div>

</div>

<!-- 비밀번호 -->
<div>
<label class="block mb-1 font-semibold">비밀번호</label>
<input type="password" name="password" required
class="w-full p-3 border rounded">
</div>

<!-- 닉네임 -->
<div>
<label class="block mb-1 font-semibold">닉네임</label>
<input name="nickname" required
class="w-full p-3 border rounded">
</div>

<!-- 이름 -->
<div>
<label class="block mb-1 font-semibold">이름</label>
<input name="name" required
class="w-full p-3 border rounded">
</div>

<!-- 연락처 -->
<div>
<label class="block mb-1 font-semibold">연락처</label>
<input name="phone" required
class="w-full p-3 border rounded">
</div>

<button class="w-full bg-blue-600 text-white py-3 rounded font-bold">
회원가입
</button>

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

// ================= 역할 선택 =================
const roleBtns = document.querySelectorAll(".role-btn");
const roleInput = document.getElementById("role");

roleBtns.forEach(btn => {
    btn.addEventListener("click", () => {

        const role = btn.dataset.role;

        if(role === "trainer"){
            location.href = "trainerJoin.jsp";
            return;
        }
        if(role === "gym"){
            location.href = "gymJoin.jsp";
            return;
        }

        roleBtns.forEach(b => b.classList.remove("active-role"));
        btn.classList.add("active-role");

        roleInput.value = role;
    });
});


// ================= 이메일 중복확인 =================
function checkEmail(){

    const email = document.getElementById("username").value;

    if(!email.includes("@")){
        showEmailMsg("이메일 형식이 아닙니다.", "red");
        return;
    }

    fetch("checkEmail?email=" + email)
    .then(res => res.json())
    .then(res => {

        if(res.exists){
            showEmailMsg("이미 사용중인 아이디입니다.", "red");
            document.getElementById("verifyBtn").disabled = true;
        }else{
            showEmailMsg("사용 가능한 이메일입니다.", "green");

            document.getElementById("emailDisplay").value = email;
            document.getElementById("verifyBtn").disabled = false;
        }

    });
}

function showEmailMsg(msg, color){
    const el = document.getElementById("emailMsg");
    el.innerText = msg;
    el.className = "text-" + color + "-500 text-sm mt-1";
}


// ================= 인증 =================
let timerInterval;
let timeLeft = 180;

// 인증 코드 요청
function sendCode(){

    const email = document.getElementById("username").value;

    fetch("sendEmailCode", {
        method: "POST",
        headers: {"Content-Type":"application/json"},
        body: JSON.stringify({email})
    });

    document.getElementById("codeBox").classList.remove("hidden");
    document.getElementById("codeMsg").innerText = "인증 코드가 전송되었습니다.";

    startTimer();
}

// 타이머
function startTimer(){
    clearInterval(timerInterval);
    timeLeft = 180;

    timerInterval = setInterval(() => {
        const min = Math.floor(timeLeft / 60);
        const sec = timeLeft % 60;

        document.getElementById("timer").innerText =
            `남은 시간: ${min}:${sec.toString().padStart(2,'0')}`;

        timeLeft--;

        if(timeLeft < 0){
            clearInterval(timerInterval);
            document.getElementById("timer").innerText = "인증 시간 만료";
        }
    }, 1000);
}


// 인증 코드 확인
function verifyCode(){

    const email = document.getElementById("username").value;
    const code = document.getElementById("code").value;

    fetch("verifyEmailCode", {
        method: "POST",
        headers: {"Content-Type":"application/json"},
        body: JSON.stringify({email, code})
    })
    .then(res => res.json())
    .then(res => {

        if(res.success){
            successVerify();
        }else{
            document.getElementById("codeMsg").innerText = "코드가 올바르지 않습니다.";
            document.getElementById("codeMsg").className = "text-red-500 text-sm";
        }

    });
}


// 인증 성공
function successVerify(){

    clearInterval(timerInterval);

    document.getElementById("verifyBtn").innerText = "✔ 인증완료";
    document.getElementById("verifyBtn").classList.add("bg-green-500","text-white");
    document.getElementById("verifyBtn").disabled = true;

    document.getElementById("codeMsg").innerText = "인증 완료";
    document.getElementById("codeMsg").className = "text-green-500 text-sm";

    document.getElementById("code").readOnly = true;
    document.getElementById("confirmBtn").disabled = true;

    document.getElementById("verified").value = "true";
}

</script>

</body>
</html>