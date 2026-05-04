<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.member.MemberDTO"%>
<%
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
    if(loginUser == null){ response.sendRedirect("login.jsp"); return; }
    String sender = loginUser.getEmail();
    String receiver = request.getParameter("receiver") != null ? request.getParameter("receiver") : "trainer1";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>핏츠버그 - 채팅</title>
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Noto Sans KR','Nunito',sans-serif;background:#F7F9FC;display:flex;min-height:100vh;}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800;900&family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">
</head>
<body>

<!-- 사이드바 -->
<jsp:include page="sidebar.jsp" />

<!-- 채팅 메인 레이아웃 -->
<div style="margin-left:260px;flex:1;display:flex;height:100vh;overflow:hidden;">

  <!-- ── 채팅 창 ── -->
  <div style="flex:1;display:flex;flex-direction:column;background:white;border-right:1.5px solid #E8EDF5;">

    <!-- 채팅 헤더 -->
    <div style="padding:20px 24px;border-bottom:1.5px solid #E8EDF5;display:flex;align-items:center;gap:14px;background:white;">
      <div style="position:relative;">
        <img id="trainerHeaderImg" src="https://api.dicebear.com/7.x/avataaars/svg?seed=trainer" style="width:46px;height:46px;border-radius:50%;border:2.5px solid #FF6B35;object-fit:cover;" alt="트레이너">
      </div>
      <div style="flex:1;">
        <div id="trainerHeaderName" style="font-weight:800;font-size:16px;color:#1A1F36;">트레이너</div>
        <!-- <div style="font-size:12px;color:#00BFA5;font-weight:600;">🟢 온라인</div> -->
      </div>
      <button onclick="goFeedback()" style="
        padding:8px 18px;border-radius:99px;border:1.5px solid #E8EDF5;
        background:white;color:#5A6480;font-size:13px;font-weight:700;cursor:pointer;
        font-family:'Noto Sans KR',sans-serif;display:flex;align-items:center;gap:6px;
        transition:all 0.2s;
      " onmouseover="this.style.borderColor='#FF6B35';this.style.color='#FF6B35'" onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#5A6480'">
        <span class="material-symbols-outlined" style="font-size:16px;">rate_review</span>최신 피드백
      </button>
    </div>

    <!-- 메시지 영역 -->
    <div id="chatBox" style="
      flex:1;overflow-y:auto;padding:24px;
      display:flex;flex-direction:column;gap:12px;
      background:linear-gradient(180deg,#F7F9FC 0%,#FFFFFF 100%);
    "></div>

    <!-- 입력 영역 -->
    <div style="padding:16px 20px;border-top:1.5px solid #E8EDF5;background:white;display:flex;align-items:flex-end;gap:10px;">
      <button style="width:38px;height:38px;border-radius:50%;border:1.5px solid #E8EDF5;background:white;cursor:pointer;display:flex;align-items:center;justify-content:center;font-size:18px;flex-shrink:0;transition:all 0.2s;" onmouseover="this.style.background='#FFF3EE'" onmouseout="this.style.background='white'">📎</button>
      <textarea id="msgInput" placeholder="메시지를 입력하세요..." rows="1" style="
        flex:1;padding:12px 18px;border-radius:22px;border:2px solid #E8EDF5;
        font-family:'Noto Sans KR',sans-serif;font-size:14px;color:#1A1F36;
        outline:none;resize:none;transition:border-color 0.2s,box-shadow 0.2s;
        max-height:120px;line-height:1.5;
      " onfocus="this.style.borderColor='#FF6B35';this.style.boxShadow='0 0 0 3px rgba(255,107,53,0.1)'"
         onblur="this.style.borderColor='#E8EDF5';this.style.boxShadow='none'"
         oninput="autoResize(this)" onkeydown="handleKey(event)"></textarea>
      <button onclick="sendMsg()" style="
        width:44px;height:44px;border-radius:50%;border:none;cursor:pointer;
        background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;
        display:flex;align-items:center;justify-content:center;flex-shrink:0;
        box-shadow:0 4px 14px rgba(255,107,53,0.35);transition:all 0.2s;
      " onmouseover="this.style.transform='scale(1.08)'" onmouseout="this.style.transform='scale(1)'">
        <span class="material-symbols-outlined" style="font-size:20px;">send</span>
      </button>
    </div>
  </div>

  <!-- ── 트레이너 정보 사이드 ── -->
  <div style="width:280px;flex-shrink:0;background:white;border-left:1.5px solid #E8EDF5;overflow-y:auto;display:flex;flex-direction:column;">

    <!-- 트레이너 프로필 -->
    <div style="padding:28px 22px;text-align:center;border-bottom:1.5px solid #E8EDF5;background:linear-gradient(180deg,#FFF3EE,white);">
      <div style="position:relative;display:inline-block;margin-bottom:14px;">
        <img id="trainerImg" src="https://api.dicebear.com/7.x/avataaars/svg?seed=trainer" style="width:80px;height:80px;border-radius:50%;border:3px solid #FF6B35;object-fit:cover;" alt="트레이너">
      </div>
      <h3 id="trainerName" style="font-size:17px;font-weight:900;color:#1A1F36;margin-bottom:4px;">트레이너 정보 로딩 중...</h3>
      <div style="display:inline-flex;align-items:center;gap:6px;padding:4px 12px;border-radius:99px;background:#E8F8F6;color:#00897B;font-size:12px;font-weight:700;">
        🏅 전문 트레이너
      </div>
    </div>

    <!-- PT 진행 현황 -->
    <div style="padding:20px 22px;border-bottom:1.5px solid #E8EDF5;">
      <div style="font-size:13px;font-weight:700;color:#5A6480;margin-bottom:10px;">PT 진행 현황</div>
      <p id="sessionText" style="font-size:13px;color:#1A1F36;font-weight:600;margin-bottom:8px;">로딩 중...</p>
      <div style="height:8px;background:#F0F0F0;border-radius:99px;overflow:hidden;">
        <div id="sessionBar" style="height:100%;background:linear-gradient(90deg,#00BFA5,#26D4BB);border-radius:99px;width:0%;transition:width 0.8s ease;"></div>
      </div>
    </div>

    <!-- 다음 수업 -->
    <div style="padding:20px 22px;border-bottom:1.5px solid #E8EDF5;">
      <div style="font-size:13px;font-weight:700;color:#5A6480;margin-bottom:8px;">📅 다음 수업</div>
      <div id="nextClassTime" style="font-size:16px;font-weight:900;color:#FF6B35;">불러오는 중...</div>
    </div>

    <!-- 핏불 응원 -->
    <div style="padding:20px 22px;margin:16px;border-radius:18px;background:linear-gradient(135deg,#FF6B35,#FFD166);text-align:center;">
      <div style="font-size:34px;margin-bottom:8px;">🐾</div>
      <div style="font-size:14px;font-weight:800;color:white;margin-bottom:4px;">오늘도 화이팅!</div>
      <div style="font-size:12px;color:rgba(255,255,255,0.85);">트레이너와 함께라면<br>무조건 성공해요!</div>
    </div>

    <!-- 피드백 버튼 -->
    <div style="padding:0 16px 20px;">
      <button onclick="goFeedback()" style="
        width:100%;padding:12px;border-radius:14px;border:none;cursor:pointer;
        background:linear-gradient(135deg,#00BFA5,#26D4BB);color:white;
        font-size:14px;font-weight:800;font-family:'Noto Sans KR',sans-serif;
        box-shadow:0 4px 14px rgba(0,191,165,0.3);transition:all 0.2s;
        display:flex;align-items:center;justify-content:center;gap:8px;
      " onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform='none'">
        <span class="material-symbols-outlined" style="font-size:18px;">rate_review</span>
        최신 피드백 보기
      </button>
    </div>

  </div><!-- end trainer side -->
</div>

<script>
const sender   = "<%=sender%>";
const receiver = "<%=receiver%>";
let nextTime   = null;

// 날짜 포맷
function formatTime(dateStr) {
  const d = new Date(dateStr);
  const h = d.getHours().toString().padStart(2,'0');
  const m = d.getMinutes().toString().padStart(2,'0');
  return h + ':' + m;
}

// 채팅 로드
function loadChat() {
  fetch("message?sender=" + sender + "&receiver=" + receiver)
    .then(res => res.json())
    .then(data => {
      const box = document.getElementById("chatBox");
      const isBottom = box.scrollHeight - box.clientHeight <= box.scrollTop + 60;
      box.innerHTML = "";

      data.forEach(function(m) {
        const isMe = m.sender === sender;
        const wrap = document.createElement('div');
        wrap.style.cssText = `display:flex;justify-content:${isMe ? 'flex-end' : 'flex-start'};gap:8px;align-items:flex-end;`;

        if (!isMe) {
          const av = document.createElement('img');
          av.src = "https://api.dicebear.com/7.x/avataaars/svg?seed=trainer";
          av.style.cssText = "width:32px;height:32px;border-radius:50%;border:2px solid #E8EDF5;flex-shrink:0;";
          wrap.appendChild(av);
        }

        const inner = document.createElement('div');
        inner.style.cssText = "display:flex;flex-direction:column;align-items:" + (isMe ? "flex-end" : "flex-start") + ";gap:3px;max-width:68%;";

        const bubble = document.createElement('div');
        bubble.style.cssText = isMe
          ? "background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;border-radius:18px 18px 4px 18px;padding:11px 16px;font-size:14px;line-height:1.5;box-shadow:0 2px 8px rgba(255,107,53,0.25);"
          : "background:white;color:#1A1F36;border:1.5px solid #E8EDF5;border-radius:18px 18px 18px 4px;padding:11px 16px;font-size:14px;line-height:1.5;box-shadow:0 2px 6px rgba(0,0,0,0.06);";
        bubble.innerText = m.content;

        const timeEl = document.createElement('div');
        timeEl.style.cssText = "font-size:11px;color:#C4CEDE;";
        timeEl.innerText = m.createdAt ? formatTime(m.createdAt) : '';

        inner.appendChild(bubble);
        inner.appendChild(timeEl);
        wrap.appendChild(inner);

        if (isMe) {
          const av2 = document.createElement('img');
          av2.src = "https://api.dicebear.com/7.x/adventurer/svg?seed=me";
          av2.style.cssText = "width:32px;height:32px;border-radius:50%;border:2px solid #FFB4A2;flex-shrink:0;";
          wrap.appendChild(av2);
        }

        box.appendChild(wrap);
      });

      if (isBottom || data.length === 0) box.scrollTop = box.scrollHeight;
    });
}

// 메시지 전송
function sendMsg() {
  const input = document.getElementById("msgInput");
  const msg = input.value.trim();
  if (!msg) return;
  input.value = "";
  input.style.height = "auto";

  fetch("message", {
    method: "POST",
    headers: {"Content-Type": "application/x-www-form-urlencoded"},
    body: "sender=" + encodeURIComponent(sender) + "&receiver=" + encodeURIComponent(receiver) + "&content=" + encodeURIComponent(msg)
  }).then(() => loadChat());
}

// Enter 키 처리 (Shift+Enter = 줄바꿈)
function handleKey(e) {
  if (e.key === 'Enter' && !e.shiftKey) {
    e.preventDefault();
    sendMsg();
  }
}

// textarea 자동 높이
function autoResize(el) {
  el.style.height = "auto";
  el.style.height = Math.min(el.scrollHeight, 120) + "px";
}

// 트레이너 정보
function loadTrainer() {
  fetch("trainerInfo?trainerEmail=" + receiver)
    .then(res => res.json())
    .then(data => {
      document.getElementById("trainerImg").src = data.profile || "https://api.dicebear.com/7.x/avataaars/svg?seed=trainer";
      document.getElementById("trainerHeaderImg").src = data.profile || "https://api.dicebear.com/7.x/avataaars/svg?seed=trainer";
      document.getElementById("trainerName").innerText = data.nickname || "트레이너";
      document.getElementById("trainerHeaderName").innerText = data.nickname || "트레이너";
      document.getElementById("sessionText").innerText = "진행 중 (" + data.done + "/" + data.total + "회)";
      const pct = data.total > 0 ? (data.done / data.total * 100) : 0;
      document.getElementById("sessionBar").style.width = pct + "%";
    }).catch(() => {});
}

// 다음 수업 카운트다운
function loadNextClass() {
  fetch("nextClass?email=" + sender + "&trainerEmail=" + receiver)
    .then(res => res.json())
    .then(data => {
      if (!data.time) {
        document.getElementById("nextClassTime").innerText = "예약 없음";
        return;
      }
      nextTime = new Date(data.time);
      updateCountdown();
    }).catch(() => {
      document.getElementById("nextClassTime").innerText = "정보 없음";
    });
}

function updateCountdown() {
  if (!nextTime) return;
  const diff = nextTime - new Date();
  if (diff <= 0) { document.getElementById("nextClassTime").innerText = "수업 시작됨 🔥"; return; }
  const days  = Math.floor(diff / 86400000);
  const hours = Math.floor((diff % 86400000) / 3600000);
  const mins  = Math.floor((diff % 3600000) / 60000);
  document.getElementById("nextClassTime").innerText =
    (days > 0 ? "D-" + days + " " : "오늘 ") + hours + "시간 " + mins + "분 후";
}

function goFeedback() {
  location.href = "<%=request.getContextPath()%>/mypage?tab=feedback";
}

// 초기화
loadChat();
loadTrainer();
loadNextClass();
setInterval(loadChat, 2000);
setInterval(updateCountdown, 60000);
</script>

</body>
</html>
