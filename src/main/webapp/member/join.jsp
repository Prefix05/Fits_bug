<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>핏츠버그 - 회원가입</title>
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800;900&family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Noto Sans KR','Nunito',sans-serif;background:#F7F9FC;min-height:100vh;display:flex;}

/* 왼쪽 폼 */
.form-side{width:52%;display:flex;flex-direction:column;justify-content:center;padding:60px 56px;overflow-y:auto;}
/* 오른쪽 브랜드 */
.brand-side{flex:1;background:linear-gradient(145deg,#FF6B35 0%,#FF8C5A 40%,#00BFA5 100%);display:flex;flex-direction:column;align-items:center;justify-content:center;padding:60px 48px;position:relative;overflow:hidden;}
.brand-side::before{content:'';position:absolute;width:460px;height:460px;border-radius:50%;background:rgba(255,255,255,0.07);top:-100px;left:-80px;}
.brand-side::after{content:'';position:absolute;width:320px;height:320px;border-radius:50%;background:rgba(255,255,255,0.05);bottom:-60px;right:-60px;}

/* 역할 버튼 */
.role-btn{padding:10px 22px;border-radius:99px;border:2px solid #E8EDF5;background:white;color:#5A6480;font-size:14px;font-weight:700;cursor:pointer;font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;}
.role-btn.active{background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;border-color:transparent;box-shadow:0 4px 14px rgba(255,107,53,0.3);}

/* 입력 */
.fb-inp{width:100%;padding:13px 18px;border-radius:14px;border:2px solid #E8EDF5;background:#F7F9FC;font-family:'Noto Sans KR',sans-serif;font-size:14px;color:#1A1F36;outline:none;transition:all 0.2s;}
.fb-inp:focus{border-color:#FF6B35;box-shadow:0 0 0 3px rgba(255,107,53,0.12);background:white;}
.fb-inp::placeholder{color:#C4CEDE;}
.fb-label{font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;}

/* 버튼 */
.btn-main{width:100%;padding:14px;border:none;border-radius:99px;cursor:pointer;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-family:'Noto Sans KR',sans-serif;font-size:16px;font-weight:800;box-shadow:0 6px 20px rgba(255,107,53,0.35);transition:all 0.2s;}
.btn-main:hover{transform:translateY(-2px);box-shadow:0 8px 28px rgba(255,107,53,0.45);}
.btn-sm{padding:10px 16px;border-radius:12px;border:none;cursor:pointer;background:#F7F9FC;border:1.5px solid #E8EDF5;color:#5A6480;font-family:'Noto Sans KR',sans-serif;font-size:13px;font-weight:700;white-space:nowrap;transition:all 0.2s;}
.btn-sm:hover{border-color:#FF6B35;color:#FF6B35;}
.btn-sm:disabled{opacity:0.45;cursor:not-allowed;}
.btn-sm.verified{background:linear-gradient(135deg,#00BFA5,#26D4BB);color:white;border-color:transparent;}

@media(max-width:768px){.brand-side{display:none;}.form-side{width:100%;padding:40px 28px;}}
</style>
</head>
<body>

<!-- ══ 왼쪽: 폼 ══ -->
<div class="form-side">

  <!-- 로고 -->
  <a href="login.jsp" style="display:flex;align-items:center;gap:10px;text-decoration:none;margin-bottom:36px;">
    <div style="width:40px;height:40px;border-radius:50%;background:linear-gradient(135deg,#FF6B35,#00BFA5);display:flex;align-items:center;justify-content:center;font-size:20px;">🐾</div>
    <span style="font-family:'Nunito',sans-serif;font-size:22px;font-weight:900;background:linear-gradient(135deg,#FF6B35,#00BFA5);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;">핏츠버그</span>
  </a>

  <h1 style="font-size:28px;font-weight:900;color:#1A1F36;margin-bottom:6px;">회원가입 🎉</h1>
  <p style="font-size:14px;color:#9DA8C0;margin-bottom:28px;">핏불 가족이 되어 건강한 여정을 시작해봐요!</p>

  <!-- 역할 선택 -->
  <div style="display:flex;gap:8px;margin-bottom:28px;">
    <button type="button" class="role-btn active" data-role="member">🏃 일반 회원</button>
    <button type="button" class="role-btn" data-role="trainer" onclick="location.href='trainerJoin.jsp'">🏋️ 트레이너</button>
    <button type="button" class="role-btn" data-role="gym" onclick="location.href='gymJoin.jsp'">🏢 헬스장</button>
  </div>

  <form action="join" method="post" style="display:flex;flex-direction:column;gap:18px;max-width:440px;">
    <input type="hidden" name="role" id="role" value="member">
    <input type="hidden" name="verified" id="verified" value="false">

    <!-- 이메일 -->
    <div>
      <label class="fb-label">아이디 (이메일)</label>
      <div style="display:flex;gap:10px;">
        <input name="username" id="username" class="fb-inp" placeholder="example@email.com" autocomplete="email">
        <button type="button" onclick="checkEmail()" class="btn-sm">중복 확인</button>
      </div>
      <div id="emailMsg" style="font-size:13px;margin-top:6px;min-height:18px;"></div>
    </div>

    <!-- 이메일 인증 -->
    <div>
      <label class="fb-label">이메일 인증</label>
      <div style="display:flex;gap:10px;">
        <input type="text" id="emailDisplay" readonly class="fb-inp" style="background:#F0F0F0;cursor:not-allowed;" placeholder="이메일 중복 확인 후 인증 가능">
        <button type="button" id="verifyBtn" onclick="sendCode()" class="btn-sm" disabled>본인 인증</button>
      </div>
      <!-- 코드 입력 -->
      <div id="codeBox" style="display:none;margin-top:10px;">
        <div style="display:flex;gap:10px;">
          <input type="text" id="code" class="fb-inp" placeholder="인증 코드 6자리 입력">
          <button type="button" id="confirmBtn" onclick="verifyCode()" class="btn-sm">확인</button>
        </div>
        <div style="display:flex;justify-content:space-between;margin-top:6px;">
          <div id="codeMsg" style="font-size:13px;"></div>
          <div id="timer" style="font-size:12px;color:#FF4D4D;font-weight:700;"></div>
        </div>
      </div>
    </div>

    <!-- 비밀번호 -->
    <div>
      <label class="fb-label">비밀번호</label>
      <input type="password" name="password" class="fb-inp" placeholder="비밀번호 (8자 이상)" autocomplete="new-password">
    </div>

    <!-- 닉네임 -->
    <div>
      <label class="fb-label">닉네임</label>
      <input name="nickname" class="fb-inp" placeholder="핏불에서 사용할 닉네임">
    </div>

    <!-- 이름 -->
    <div>
      <label class="fb-label">이름</label>
      <input name="name" class="fb-inp" placeholder="실명을 입력하세요">
    </div>

    <!-- 연락처 -->
    <div>
      <label class="fb-label">연락처</label>
      <input name="phone" class="fb-inp" placeholder="010-0000-0000">
    </div>

    <button type="submit" class="btn-main" style="margin-top:6px;">🚀 가입 완료하기</button>

    <p style="text-align:center;font-size:14px;color:#9DA8C0;">
      이미 계정이 있으신가요? <a href="login.jsp" style="color:#FF6B35;font-weight:700;text-decoration:none;">로그인하기 →</a>
    </p>
  </form>

</div>

<!-- ══ 오른쪽: 브랜드 ══ -->
<div class="brand-side">
  <!-- 핏불 마스코트 -->
  <div style="position:relative;z-index:1;text-align:center;margin-bottom:32px;">
    <div style="width:180px;height:180px;border-radius:50%;background:rgba(255,255,255,0.2);backdrop-filter:blur(8px);display:flex;align-items:center;justify-content:center;margin:0 auto 20px;box-shadow:0 12px 40px rgba(0,0,0,0.15);animation:fb_float 4s ease-in-out infinite;">
      <svg width="130" height="130" viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
        <circle cx="100" cy="85" r="44" fill="rgba(255,255,255,0.9)"/>
        <circle cx="76" cy="60" r="15" fill="rgba(255,255,255,0.9)"/><circle cx="124" cy="60" r="15" fill="rgba(255,255,255,0.9)"/>
        <circle cx="76" cy="60" r="9" fill="#F4A0A0"/><circle cx="124" cy="60" r="9" fill="#F4A0A0"/>
        <ellipse cx="100" cy="90" rx="28" ry="22" fill="#E8E8F0"/>
        <path d="M58 70 Q100 55 142 70" stroke="#FFD166" stroke-width="7" fill="none" stroke-linecap="round"/>
        <circle cx="87" cy="80" r="6" fill="#1A1F36"/><circle cx="113" cy="80" r="6" fill="#1A1F36"/>
        <circle cx="88.5" cy="78.5" r="2" fill="white"/><circle cx="114.5" cy="78.5" r="2" fill="white"/>
        <ellipse cx="100" cy="93" rx="7" ry="5" fill="#1A1F36"/>
        <path d="M87 103 Q100 115 113 103" stroke="#FF6B35" stroke-width="3.5" fill="none" stroke-linecap="round"/>
        <ellipse cx="80" cy="97" rx="8" ry="5" fill="#FFB4A2" opacity="0.8"/>
        <ellipse cx="120" cy="97" rx="8" ry="5" fill="#FFB4A2" opacity="0.8"/>
        <ellipse cx="100" cy="152" rx="50" ry="36" fill="rgba(255,255,255,0.85)"/>
      </svg>
    </div>
    <div style="font-family:'Nunito',sans-serif;font-size:36px;font-weight:900;color:white;letter-spacing:-1px;">핏츠버그</div>
    <div style="font-size:14px;color:rgba(255,255,255,0.85);margin-top:8px;">🐾 핏불과 함께하는 피트니스 여정</div>
  </div>

  <!-- 혜택 카드들 -->
  <div style="position:relative;z-index:1;display:flex;flex-direction:column;gap:14px;width:100%;max-width:320px;">
    <div style="background:rgba(255,255,255,0.15);backdrop-filter:blur(8px);border:1.5px solid rgba(255,255,255,0.25);border-radius:16px;padding:16px 20px;display:flex;align-items:center;gap:14px;">
      <div style="font-size:28px;">💪</div>
      <div>
        <div style="font-size:14px;font-weight:800;color:white;">맞춤형 운동 플랜</div>
        <div style="font-size:12px;color:rgba(255,255,255,0.75);">AI가 내 수준에 맞는 운동을 추천해요</div>
      </div>
    </div>
    <div style="background:rgba(255,255,255,0.15);backdrop-filter:blur(8px);border:1.5px solid rgba(255,255,255,0.25);border-radius:16px;padding:16px 20px;display:flex;align-items:center;gap:14px;">
      <div style="font-size:28px;">🏋️</div>
      <div>
        <div style="font-size:14px;font-weight:800;color:white;">전문 트레이너 매칭</div>
        <div style="font-size:12px;color:rgba(255,255,255,0.75);">500+ 인증 트레이너와 연결돼요</div>
      </div>
    </div>
    <div style="background:rgba(255,255,255,0.15);backdrop-filter:blur(8px);border:1.5px solid rgba(255,255,255,0.25);border-radius:16px;padding:16px 20px;display:flex;align-items:center;gap:14px;">
      <div style="font-size:28px;">🏆</div>
      <div>
        <div style="font-size:14px;font-weight:800;color:white;">오운완 커뮤니티</div>
        <div style="font-size:12px;color:rgba(255,255,255,0.75);">핏불 멤버들과 동기부여를 나눠요</div>
      </div>
    </div>
  </div>
</div>

<style>
@keyframes fb_float{0%,100%{transform:translateY(0);}50%{transform:translateY(-12px);}}
</style>

<script>
const roleBtns = document.querySelectorAll(".role-btn");
roleBtns.forEach(btn => {
  btn.addEventListener("click", () => {
    const role = btn.dataset.role;
    if(role === "trainer"){ location.href="trainerJoin.jsp"; return; }
    if(role === "gym"){     location.href="gymJoin.jsp";     return; }
    roleBtns.forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
    document.getElementById("role").value = role;
  });
});

function checkEmail(){
  const email = document.getElementById("username").value;
  if(!email.includes("@")){ showMsg("emailMsg","이메일 형식이 아닙니다.","#FF4D4D"); return; }
  fetch("<%=request.getContextPath()%>/checkEmail?email="+encodeURIComponent(email))
    .then(r=>r.json()).then(res=>{
      if(res.exists){
        showMsg("emailMsg","이미 사용 중인 이메일입니다.","#FF4D4D");
        document.getElementById("verifyBtn").disabled = true;
      } else {
        showMsg("emailMsg","✔ 사용 가능한 이메일입니다.","#00897B");
        document.getElementById("emailDisplay").value = email;
        document.getElementById("verifyBtn").disabled = false;
      }
    });
}

function showMsg(id, msg, color){
  const el = document.getElementById(id);
  el.innerText = msg; el.style.color = color; el.style.fontWeight = "700";
}

let timerInterval, timeLeft = 180;

function sendCode(){
  const email = document.getElementById("username").value;
  fetch("<%=request.getContextPath()%>/sendEmailCode",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({email})});
  document.getElementById("codeBox").style.display = "block";
  showMsg("codeMsg","📧 인증 코드가 전송되었습니다.","#00897B");
  startTimer();
}

function startTimer(){
  clearInterval(timerInterval); timeLeft = 180;
  timerInterval = setInterval(()=>{
    const m = Math.floor(timeLeft/60), s = timeLeft%60;
    document.getElementById("timer").innerText = "남은 시간 "+m+":"+(s<10?"0"+s:s);
    timeLeft--;
    if(timeLeft < 0){
      clearInterval(timerInterval);
      document.getElementById("timer").innerText = "⛔ 인증 시간 만료";
      document.getElementById("verifyBtn").disabled = true;
      document.getElementById("confirmBtn").disabled = true;
    }
  },1000);
}

function verifyCode(){
  const email = document.getElementById("username").value;
  const code  = document.getElementById("code").value;
  fetch("<%=request.getContextPath()%>/verifyCode",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({email,code})})
    .then(r=>r.text()).then(result=>{
      if(result==="success") successVerify();
      else showMsg("codeMsg","코드가 올바르지 않습니다.","#FF4D4D");
    });
}

function successVerify(){
  clearInterval(timerInterval);
  const btn = document.getElementById("verifyBtn");
  btn.innerText = "✔ 인증 완료"; btn.classList.add("verified"); btn.disabled = true;
  document.getElementById("confirmBtn").disabled = true;
  document.getElementById("code").readOnly = true;
  document.getElementById("timer").innerText = "";
  showMsg("codeMsg","✔ 인증이 완료되었습니다!","#00897B");
  document.getElementById("verified").value = "true";
}
</script>
</body>
</html>
