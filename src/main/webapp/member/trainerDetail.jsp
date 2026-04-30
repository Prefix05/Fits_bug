<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="dto.member.MemberDTO"%>
<%@ page import="dto.member.TrainerDTO" %>

<%
TrainerDTO trainer = (TrainerDTO) request.getAttribute("trainer");
%>
<% String contextPath = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>핏츠버그 - 트레이너 상세</title>
<script src="https://js.tosspayments.com/v1/payment"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800;900&family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Noto Sans KR','Nunito',sans-serif;background:#F7F9FC;display:flex;min-height:100vh;}
.fb-inp{width:100%;padding:12px 16px;border-radius:12px;border:2px solid #E8EDF5;background:#F7F9FC;font-family:'Noto Sans KR',sans-serif;font-size:14px;color:#1A1F36;outline:none;transition:all 0.2s;}
.fb-inp:focus{border-color:#FF6B35;box-shadow:0 0 0 3px rgba(255,107,53,0.12);background:white;}
.review-card{background:white;border:1.5px solid #E8EDF5;border-radius:16px;padding:18px;transition:all 0.2s;}
.review-card:hover{box-shadow:0 4px 16px rgba(0,0,0,0.08);}
@keyframes fb_modal_in{from{opacity:0;transform:scale(0.9) translateY(20px);}to{opacity:1;transform:scale(1) translateY(0);}}
</style>
</head>
<body>

<jsp:include page="sidebar.jsp"/>

<main style="flex:1;margin-left:260px;max-width:calc(100vw - 260px);">

  <!-- 트레이너 커버 -->
  <div style="background:linear-gradient(135deg,#FF6B35 0%,#FF8C5A 50%,#00BFA5 100%);padding:40px 48px;position:relative;overflow:hidden;">
    <div style="position:absolute;width:400px;height:400px;border-radius:50%;background:rgba(255,255,255,0.07);top:-100px;right:-60px;"></div>
    <div style="position:relative;z-index:1;display:flex;align-items:center;gap:28px;">
      <img id="trainerImg" src="https://api.dicebear.com/7.x/avataaars/svg?seed=trainer1"
           style="width:110px;height:110px;border-radius:50%;border:4px solid white;object-fit:cover;box-shadow:0 8px 24px rgba(0,0,0,0.2);" alt="트레이너">
      <div>
        <div style="font-size:13px;color:rgba(255,255,255,0.8);font-weight:600;margin-bottom:6px;">전문 트레이너</div>
        <h1 id="trainerName" style="font-size:32px;font-weight:900;color:white;margin-bottom:8px;"><%= trainer.getName() %> 트레이너</h1>
        <div style="display:flex;gap:10px;flex-wrap:wrap;">
          <span style="background:rgba(255,255,255,0.2);backdrop-filter:blur(6px);border:1.5px solid rgba(255,255,255,0.3);padding:5px 14px;border-radius:99px;font-size:13px;font-weight:700;color:white;">💪 근력 강화</span>
          <span style="background:rgba(255,255,255,0.2);backdrop-filter:blur(6px);border:1.5px solid rgba(255,255,255,0.3);padding:5px 14px;border-radius:99px;font-size:13px;font-weight:700;color:white;">🏋️ 체형 교정</span>
          <span style="background:rgba(255,255,255,0.2);backdrop-filter:blur(6px);border:1.5px solid rgba(255,255,255,0.3);padding:5px 14px;border-radius:99px;font-size:13px;font-weight:700;color:white;">⭐ 4.9 (리뷰 128)</span>
        </div>
      </div>
    </div>
  </div>

  <!-- 본문 -->
  <div style="padding:32px 48px;display:grid;grid-template-columns:1fr 340px;gap:28px;align-items:start;">

    <!-- 왼쪽 -->
    <div style="display:flex;flex-direction:column;gap:22px;">

      <!-- 소개 -->
      <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">
        <h2 style="font-size:16px;font-weight:800;color:#1A1F36;margin-bottom:14px;">👋 트레이너 소개</h2>
        <p id="trainerBio" style="font-size:14px;color:#5A6480;line-height:1.8;">
          안녕하세요, 김태훈 트레이너입니다. 7년간 500명 이상의 회원을 지도한 경험을 바탕으로, 초보자부터 운동 고급자까지 모든 분들에게 맞춤형 PT를 제공합니다. 여러분의 목표를 함께 이루어나가겠습니다! 💪
        </p>
      </div>

      <!-- 이용권 선택 -->
      <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">
        <h2 style="font-size:16px;font-weight:800;color:#1A1F36;margin-bottom:18px;">🎫 PT 이용권 선택</h2>
        <div style="display:flex;flex-direction:column;gap:12px;" id="ptPackages">
          <% int[][] pkgs={{1,65000},{5,300000},{10,550000},{20,980000}};
             String[] labels={"1회","5회 패키지","10회 패키지","20회 VIP"};
             String[] badges={"","","🔥 인기","⭐ 추천"};
             for(int i=0;i<pkgs.length;i++){ int cnt=pkgs[i][0],price=pkgs[i][1]; %>
          <label style="display:flex;align-items:center;justify-content:space-between;padding:16px 18px;border:2px solid #E8EDF5;border-radius:14px;cursor:pointer;transition:all 0.2s;" onmouseover="this.style.borderColor='#FF6B35';this.style.background='#FFF9F7'" onmouseout="this.style.borderColor='#E8EDF5';this.style.background='white'">
            <div style="display:flex;align-items:center;gap:14px;">
              <input type="radio" name="ptPkg" value="<%=price%>" data-name="PT <%=cnt%>회권" style="accent-color:#FF6B35;width:18px;height:18px;" <%= i==0?"checked":"" %>>
              <div>
                <div style="font-weight:800;font-size:14px;color:#1A1F36;"><%=labels[i]%> <% if(!badges[i].isEmpty()){ %><span style="font-size:12px;margin-left:6px;padding:2px 8px;border-radius:99px;background:linear-gradient(135deg,#FF6B35,#FFD166);color:white;"><%=badges[i]%></span><% } %></div>
                <% if(i>0){ int save=pkgs[0][1]*cnt-price; %>
                <div style="font-size:12px;color:#00897B;font-weight:700;margin-top:2px;"><%=save/10000%>만원 절약!</div>
                <% } %>
              </div>
            </div>
            <div style="font-size:16px;font-weight:900;color:#FF6B35;"><%=String.format("%,d",price)%>원</div>
          </label>
          <% } %>
        </div>
      </div>

      <!-- 수업 시간 선택 -->
      <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">
        <h2 style="font-size:16px;font-weight:800;color:#1A1F36;margin-bottom:16px;">📅 첫 수업 시간 선택</h2>
        <select id="time" class="fb-inp" style="cursor:pointer;">
          <option value="2026-04-30 10:00:00">4월 30일 (수) 10:00</option>
          <option value="2026-04-30 12:00:00">4월 30일 (수) 12:00</option>
          <option value="2026-05-01 09:00:00">5월 1일 (목) 09:00</option>
          <option value="2026-05-01 14:00:00">5월 1일 (목) 14:00</option>
          <option value="2026-05-02 11:00:00">5월 2일 (금) 11:00</option>
        </select>
      </div>

      <!-- 리뷰 -->
      <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:18px;">
          <h2 style="font-size:16px;font-weight:800;color:#1A1F36;">⭐ 수강생 후기</h2>
          <div style="display:flex;align-items:center;gap:8px;">
            <span style="font-size:24px;font-weight:900;color:#1A1F36;">4.9</span>
            <div>
              <div style="color:#FFD166;font-size:16px;">★★★★★</div>
              <div style="font-size:11px;color:#9DA8C0;">128개 리뷰</div>
            </div>
          </div>
        </div>
        <div id="reviewList" style="display:flex;flex-direction:column;gap:12px;"></div>
      </div>

    </div><!-- end left -->

    <!-- 오른쪽: 결제 패널 -->
    <div style="position:sticky;top:24px;display:flex;flex-direction:column;gap:16px;">

      <!-- 요약 카드 -->
      <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 4px 20px rgba(0,0,0,0.08);padding:24px;">
        <h3 style="font-size:15px;font-weight:800;color:#1A1F36;margin-bottom:16px;">📋 결제 요약</h3>
        <div style="display:flex;flex-direction:column;gap:10px;margin-bottom:16px;">
          <div style="display:flex;justify-content:space-between;font-size:13px;">
            <span style="color:#9DA8C0;font-weight:600;">트레이너</span>
            <span style="font-weight:700;color:#1A1F36;" id="summaryTrainer">김태훈 트레이너</span>
          </div>
          <div style="display:flex;justify-content:space-between;font-size:13px;">
            <span style="color:#9DA8C0;font-weight:600;">이용권</span>
            <span style="font-weight:700;color:#1A1F36;" id="summaryPkg">1회권</span>
          </div>
          <div style="display:flex;justify-content:space-between;font-size:13px;">
            <span style="color:#9DA8C0;font-weight:600;">첫 수업</span>
            <span style="font-weight:700;color:#FF6B35;" id="summaryTime">4월 30일 10:00</span>
          </div>
        </div>
        <div style="border-top:1.5px solid #E8EDF5;padding-top:14px;display:flex;justify-content:space-between;align-items:center;">
          <span style="font-size:14px;font-weight:700;color:#1A1F36;">총 결제금액</span>
          <span style="font-size:22px;font-weight:900;color:#FF6B35;" id="summaryPrice">65,000원</span>
        </div>
      </div>

      <!-- 결제 버튼 -->
      <button onclick="pay()" style="width:100%;padding:16px;border-radius:99px;border:none;cursor:pointer;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:16px;font-weight:900;font-family:'Noto Sans KR',sans-serif;box-shadow:0 6px 24px rgba(255,107,53,0.35);transition:all 0.2s;display:flex;align-items:center;justify-content:center;gap:10px;" onmouseover="this.style.transform='translateY(-2px)';this.style.boxShadow='0 8px 28px rgba(255,107,53,0.45)'" onmouseout="this.style.transform='none';this.style.boxShadow='0 6px 24px rgba(255,107,53,0.35)'">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><rect x="2" y="5" width="20" height="14" rx="3" stroke="white" stroke-width="2"/><path d="M2 10h20" stroke="white" stroke-width="2"/></svg>
        결제하기
      </button>

      <!-- 채팅 버튼 -->
      <button onclick="goChat()" style="width:100%;padding:13px;border-radius:99px;border:1.5px solid #E8EDF5;cursor:pointer;background:white;color:#5A6480;font-size:14px;font-weight:700;font-family:'Noto Sans KR',sans-serif;display:flex;align-items:center;justify-content:center;gap:8px;transition:all 0.2s;" onmouseover="this.style.borderColor='#00BFA5';this.style.color='#00BFA5'" onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#5A6480'">
        <span class="material-symbols-outlined" style="font-size:18px;">chat</span>
        트레이너에게 문의하기
      </button>

      <!-- 안내 -->
      <div style="background:#F7F9FC;border-radius:14px;padding:14px 16px;">
        <div style="font-size:12px;color:#9DA8C0;line-height:1.7;">
          🔒 안전한 토스 결제<br>
          📅 수업 7일 전 무료 취소<br>
          ⭐ 불만족 시 100% 환불 보장
        </div>
      </div>

    </div><!-- end right -->
  </div><!-- end grid -->
</main>

<script>
const trainerId = <%= request.getParameter("trainerId") != null ? request.getParameter("trainerId") : "1" %>;

// 트레이너 정보 로드
fetch("trainerInfo?trainerId=" + trainerId)
  .then(r => r.json())
  .then(data => {
    if(data.profile) document.getElementById("trainerImg").src = data.profile;
    if(data.nickname){ document.getElementById("trainerName").innerText = data.nickname + " 트레이너"; document.getElementById("summaryTrainer").innerText = data.nickname + " 트레이너"; }
    if(data.bio) document.getElementById("trainerBio").innerText = data.bio;
  }).catch(() => {});

// 리뷰 로드
fetch("review?trainerId=" + trainerId)
  .then(r => r.json())
  .then(list => {
    const box = document.getElementById("reviewList");
    if(!list || !list.length){ box.innerHTML = "<p style='color:#9DA8C0;font-size:14px;text-align:center;padding:20px;'>아직 리뷰가 없어요.</p>"; return; }
    box.innerHTML = list.slice(0,4).map(rv => `
      <div class="review-card">
        <div style="display:flex;align-items:center;gap:10px;margin-bottom:10px;">
          <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=${rv.userId}" style="width:36px;height:36px;border-radius:50%;border:1.5px solid #E8EDF5;" alt="리뷰어">
          <div style="flex:1;">
            <div style="font-weight:700;font-size:13px;color:#1A1F36;">${rv.userId}</div>
            <div style="font-size:12px;color:#9DA8C0;">${rv.createdAt||''}</div>
          </div>
          <div style="color:#FFD166;font-size:14px;font-weight:700;">${'★'.repeat(rv.rating||5)}</div>
        </div>
        ${rv.image ? `<img src="${rv.image}" style="width:100%;max-height:160px;object-fit:cover;border-radius:10px;margin-bottom:10px;" alt="리뷰 이미지">` : ''}
        <p style="font-size:13px;color:#5A6480;line-height:1.6;">${rv.content}</p>
      </div>
    `).join("");
  }).catch(() => {
    // 더미 리뷰
    document.getElementById("reviewList").innerHTML = `
      <div class="review-card">
        <div style="display:flex;align-items:center;gap:10px;margin-bottom:10px;">
          <img src="https://api.dicebear.com/7.x/adventurer/svg?seed=u1" style="width:36px;height:36px;border-radius:50%;border:1.5px solid #E8EDF5;">
          <div><div style="font-weight:700;font-size:13px;color:#1A1F36;">근육왕철수</div><div style="font-size:12px;color:#9DA8C0;">2026.04.20</div></div>
          <div style="margin-left:auto;color:#FFD166;font-size:14px;">★★★★★</div>
        </div>
        <p style="font-size:13px;color:#5A6480;line-height:1.6;">자세 교정을 정말 꼼꼼하게 해주셔서 부상 없이 중량을 올릴 수 있었어요! 강력 추천합니다 💪</p>
      </div>`;
  });

// 패키지 선택 시 요약 업데이트
document.querySelectorAll('input[name="ptPkg"]').forEach(radio => {
  radio.addEventListener('change', function(){
    const label = this.closest('label').querySelector('.fb-inp, div > div:first-child')?.innerText || '';
    document.getElementById('summaryPkg').innerText = this.dataset.name || 'PT권';
    document.getElementById('summaryPrice').innerText = parseInt(this.value).toLocaleString() + '원';
  });
});

document.getElementById('time').addEventListener('change', function(){
  const txt = this.options[this.selectedIndex].text;
  document.getElementById('summaryTime').innerText = txt;
});

// 결제
function pay(){
  const radio = document.querySelector('input[name="ptPkg"]:checked');
  const amount = radio ? parseInt(radio.value) : 65000;
  const productName = radio ? (radio.dataset.name || 'PT') : 'PT';

  const tossPayments = TossPayments("test_ck_5OWRapdA8dJO4LMYoZWYVo1zEqZK");
  tossPayments.requestPayment("카드", {
    amount,
    orderId: "ORDER_" + Date.now(),
    orderName: productName,
    successUrl: window.location.origin + "<%=contextPath%>/paymentSuccess.jsp",
    failUrl:    window.location.origin + "<%=contextPath%>/paymentFail.jsp"
  });
}

function goChat(){
  fetch("trainerInfo?trainerId=" + trainerId).then(r=>r.json()).then(data=>{
    location.href = "<%=contextPath%>/chat.jsp?receiver=" + (data.email || "trainer");
  }).catch(()=>{ location.href="<%=contextPath%>/chat.jsp"; });
}
</script>
</body>
</html>
