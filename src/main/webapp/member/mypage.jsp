<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.member.MemberDTO"%>
<%@ page import="dto.member.WorkoutPlanDTO"%>
<%
MemberDTO user = (MemberDTO) request.getAttribute("member");
WorkoutPlanDTO plan = (WorkoutPlanDTO) request.getAttribute("plan");
if (user == null) { response.sendRedirect("login.jsp"); return; }
if (plan == null) { plan = new WorkoutPlanDTO(); }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>핏츠버그 - 마이페이지</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800;900&family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Noto Sans KR','Nunito',sans-serif;background:#F7F9FC;display:flex;min-height:100vh;}
.tab{display:none;} .tab.active{display:block;}

/* 퀵메뉴 아이템 */
.quick-item{
  padding:18px 10px;border-radius:16px;cursor:pointer;text-align:center;
  border:1.5px solid #E8EDF5;background:white;transition:all 0.2s;
}
.quick-item:hover{border-color:#FF6B35;background:#FFF3EE;transform:translateY(-2px);}
.quick-item.active{background:linear-gradient(135deg,#FF6B35,#FF8C5A);border-color:transparent;box-shadow:0 4px 16px rgba(255,107,53,0.3);}
.quick-item.active p{color:white!important;}

/* 뷰 전환 버튼 */
.view-btn{
  padding:8px 18px;border-radius:99px;border:1.5px solid #E8EDF5;
  background:white;color:#5A6480;font-size:13px;font-weight:700;cursor:pointer;
  font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
}
.view-btn.active{background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;border-color:transparent;box-shadow:0 3px 12px rgba(255,107,53,0.3);}

/* 정보 라벨 */
.info-label{font-size:12px;color:#9DA8C0;font-weight:600;margin-bottom:4px;}
.info-value{font-size:14px;font-weight:700;color:#1A1F36;}

/* 입력 공통 */
.fb-inp{
  width:100%;padding:12px 16px;border-radius:12px;border:2px solid #E8EDF5;
  background:#F7F9FC;font-family:'Noto Sans KR',sans-serif;font-size:14px;
  color:#1A1F36;outline:none;transition:border-color 0.2s,box-shadow 0.2s;
}
.fb-inp:focus{border-color:#FF6B35;box-shadow:0 0 0 3px rgba(255,107,53,0.12);background:white;}
.fb-inp::placeholder{color:#C4CEDE;}

/* 모달 */
.fb-modal-wrap{display:none;position:fixed;inset:0;background:rgba(26,31,54,0.52);z-index:1000;align-items:center;justify-content:center;backdrop-filter:blur(5px);}
.fb-modal-box{background:white;border-radius:24px;padding:32px;width:100%;max-width:420px;box-shadow:0 12px 40px rgba(0,0,0,0.15);animation:fb_in 0.3s ease;}
@keyframes fb_in{from{opacity:0;transform:scale(0.9) translateY(20px);}to{opacity:1;transform:scale(1) translateY(0);}}

/* 캘린더 셀 */
.cal-cell{border:1.5px solid #E8EDF5;border-radius:10px;padding:8px;min-height:80px;cursor:pointer;transition:all 0.2s;background:white;}
.cal-cell:hover{background:#FFF3EE;border-color:#FF6B35;}
.cal-cell.has-data{background:linear-gradient(135deg,#E8F8F6,white);border-color:rgba(0,191,165,0.3);}

/* 이력 아이템 */
.history-item{display:flex;justify-content:space-between;align-items:center;padding:12px 16px;background:#F7F9FC;border-radius:12px;border:1.5px solid #E8EDF5;}
.history-item.best{background:linear-gradient(135deg,#FFF3EE,white);border-color:rgba(255,107,53,0.25);}

/* 피드백 카드 */
.feedback-card{border:1.5px solid #E8EDF5;border-radius:14px;padding:16px;cursor:pointer;transition:all 0.2s;}
.feedback-card:hover{background:#FFF3EE;border-color:#FF6B35;transform:translateY(-1px);}

/* 게시글 카드 */
.post-mini{border:1.5px solid #E8EDF5;border-radius:14px;overflow:hidden;cursor:pointer;transition:all 0.2s;background:white;}
.post-mini:hover{box-shadow:0 6px 20px rgba(0,0,0,0.1);transform:translateY(-2px);}

/* 결제 테이블 */
.pay-table th{background:#F7F9FC;padding:12px 16px;font-size:13px;font-weight:700;color:#5A6480;text-align:left;border-bottom:1.5px solid #E8EDF5;}
.pay-table td{padding:12px 16px;font-size:14px;color:#1A1F36;border-bottom:1.5px solid #F0F0F0;}
.pay-table tr:last-child td{border-bottom:none;}
</style>
</head>

<body>
<jsp:include page="sidebar.jsp" />

<div style="flex:1;margin-left:260px;padding:32px 36px;max-width:calc(100vw - 260px);">

<!-- ── 배너 ── -->
<div style="
  background:linear-gradient(135deg,#FF6B35 0%,#FF8C5A 45%,#00BFA5 100%);
  border-radius:24px;padding:36px 40px;margin-bottom:28px;
  display:flex;align-items:center;justify-content:space-between;
  box-shadow:0 8px 28px rgba(255,107,53,0.25);position:relative;overflow:hidden;
">
  <div style="position:absolute;width:300px;height:300px;border-radius:50%;background:rgba(255,255,255,0.07);top:-80px;right:60px;"></div>
  <div style="position:relative;z-index:1;">
    <div style="font-size:13px;color:rgba(255,255,255,0.8);font-weight:600;margin-bottom:6px;">🐾 나의 피트니스 여정</div>
    <h1 style="font-size:30px;font-weight:900;color:white;letter-spacing:-0.5px;">
      <%= user.getNickname() %>님의 마이페이지
    </h1>
    <p style="font-size:14px;color:rgba(255,255,255,0.85);margin-top:6px;">오늘도 핏불과 함께 목표를 향해 달려봐요! 💪</p>
  </div>
  <div style="position:relative;z-index:1;display:flex;gap:20px;">
    <div style="text-align:center;background:rgba(255,255,255,0.18);border-radius:16px;padding:16px 22px;backdrop-filter:blur(8px);">
      <div style="font-size:24px;font-weight:900;color:white;">5일</div>
      <div style="font-size:11px;color:rgba(255,255,255,0.85);font-weight:600;">연속 출석</div>
    </div>
    <div style="text-align:center;background:rgba(255,255,255,0.18);border-radius:16px;padding:16px 22px;backdrop-filter:blur(8px);">
      <div style="font-size:24px;font-weight:900;color:white;">VIP</div>
      <div style="font-size:11px;color:rgba(255,255,255,0.85);font-weight:600;">회원 등급</div>
    </div>
  </div>
</div>

<!-- ── 퀵 메뉴 ── -->
<div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:20px 24px;margin-bottom:24px;">
  <div style="display:grid;grid-template-columns:repeat(5,1fr);gap:12px;">

    <div onclick="showTab('profileTab',this)" class="quick-item tab-btn active">
      <div style="font-size:28px;margin-bottom:8px;">👤</div>
      <p style="font-size:13px;font-weight:700;color:#1A1F36;">개인정보</p>
      <p style="font-size:11px;color:#9DA8C0;margin-top:2px;">프로필 관리</p>
    </div>

    <div onclick="showTab('recordTab',this)" class="quick-item tab-btn">
      <div style="font-size:28px;margin-bottom:8px;">📋</div>
      <p style="font-size:13px;font-weight:700;color:#1A1F36;">나의 기록</p>
      <p style="font-size:11px;color:#9DA8C0;margin-top:2px;">데이터 추적</p>
    </div>

    <div onclick="showTab('paymentTab',this)" class="quick-item tab-btn">
      <div style="font-size:28px;margin-bottom:8px;">💳</div>
      <p style="font-size:13px;font-weight:700;color:#1A1F36;">결제 내역</p>
      <p style="font-size:11px;color:#9DA8C0;margin-top:2px;">구독 히스토리</p>
    </div>

    <div onclick="showTab('feedbackTab',this)" class="quick-item tab-btn">
      <div style="font-size:28px;margin-bottom:8px;">🏋️</div>
      <p style="font-size:13px;font-weight:700;color:#1A1F36;">담당 트레이너</p>
      <p style="font-size:11px;color:#9DA8C0;margin-top:2px;">피드백 확인</p>
    </div>

    <div onclick="showTab('communityTab',this)" class="quick-item tab-btn">
      <div style="font-size:28px;margin-bottom:8px;">💬</div>
      <p style="font-size:13px;font-weight:700;color:#1A1F36;">커뮤니티</p>
      <p style="font-size:11px;color:#9DA8C0;margin-top:2px;">내 활동 내역</p>
    </div>

  </div>
</div>

<!-- ════════════════════════════════════
     TAB 1 : 개인정보
════════════════════════════════════ -->
<div id="profileTab" class="tab active">
<div style="display:grid;grid-template-columns:1fr 1fr;gap:24px;">

  <!-- 개인정보 카드 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:22px;">
      <h2 style="font-size:16px;font-weight:800;color:#1A1F36;">개인정보 관리</h2>
      <button onclick="openProfileModal()" style="padding:7px 16px;border-radius:99px;border:1.5px solid #FF6B35;background:white;color:#FF6B35;font-size:13px;font-weight:700;cursor:pointer;font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;" onmouseover="this.style.background='#FFF3EE'" onmouseout="this.style.background='white'">✏️ 수정</button>
    </div>

    <div style="display:flex;gap:20px;align-items:flex-start;">
      <!-- 프로필 이미지 -->
      <div style="text-align:center;">
        <img id="profileImg"
          src="upload/<%= user.getProfileImage() == null ? "default.png" : user.getProfileImage() %>"
          onerror="this.src='https://api.dicebear.com/7.x/adventurer/svg?seed=<%= user.getNickname() %>'"
          style="width:90px;height:90px;border-radius:50%;border:3px solid #FF6B35;object-fit:cover;" alt="프로필">
        <form id="uploadForm">
          <label style="margin-top:10px;display:inline-block;padding:5px 12px;border-radius:99px;border:1.5px solid #E8EDF5;font-size:11px;font-weight:700;color:#5A6480;cursor:pointer;transition:all 0.2s;" onmouseover="this.style.borderColor='#FF6B35';this.style.color='#FF6B35'" onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#5A6480'">
            📷 변경
            <input type="file" name="profile" onchange="uploadImg()" style="display:none;">
          </label>
        </form>
      </div>

      <!-- 정보 -->
      <div style="flex:1;display:flex;flex-direction:column;gap:14px;">
        <div><div class="info-label">아이디 (이메일)</div><div class="info-value"><%= user.getEmail() %></div></div>
        <div><div class="info-label">닉네임</div><div class="info-value"><%= user.getNickname() %></div></div>
        <div>
          <div class="info-label">이메일 인증</div>
          <div style="display:inline-flex;align-items:center;gap:5px;padding:4px 12px;border-radius:99px;font-size:12px;font-weight:700;
            background:<%= user.isEmailVerified() ? "#E8F8F6" : "#FFF0EE" %>;
            color:<%= user.isEmailVerified() ? "#00897B" : "#FF4D1F" %>;">
            <%= user.isEmailVerified() ? "✔ 인증 완료" : "✕ 미인증" %>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 운동 계획 카드 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:22px;">
      <h2 style="font-size:16px;font-weight:800;color:#1A1F36;">맞춤형 운동 계획</h2>
      <button onclick="openPlanModal()" style="padding:7px 16px;border-radius:99px;border:1.5px solid #00BFA5;background:white;color:#00BFA5;font-size:13px;font-weight:700;cursor:pointer;font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;" onmouseover="this.style.background='#E8F8F6'" onmouseout="this.style.background='white'">✏️ 수정</button>
    </div>
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
      <div style="background:#FFF3EE;border-radius:12px;padding:14px;">
        <div class="info-label">운동 목표</div>
        <div class="info-value"><%= plan.getGoal() == null ? "미설정" : plan.getGoal() %></div>
      </div>
      <div style="background:#E8F8F6;border-radius:12px;padding:14px;">
        <div class="info-label">경험 수준</div>
        <div class="info-value"><%= plan.getLevel() == null ? "미설정" : plan.getLevel() %></div>
      </div>
      <div style="background:#F7F9FC;border-radius:12px;padding:14px;">
        <div class="info-label">키 / 몸무게</div>
        <div class="info-value">
          <%= plan.getHeight() == 0 ? "-" : plan.getHeight() %>cm /
          <%= plan.getWeight() == 0 ? "-" : plan.getWeight() %>kg
        </div>
      </div>
      <div style="background:#FFF9E6;border-radius:12px;padding:14px;">
        <div class="info-label">식단 유형</div>
        <div class="info-value"><%= plan.getDiet() == null ? "-" : plan.getDiet() %></div>
      </div>
    </div>
  </div>

</div>
</div>

<!-- ════════════════════════════════════
     TAB 2 : 기록
════════════════════════════════════ -->
<div id="recordTab" class="tab">
<div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">

  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:22px;">
    <div>
      <h2 style="font-size:16px;font-weight:800;color:#1A1F36;">나의 기록 대시보드</h2>
      <p style="font-size:12px;color:#9DA8C0;margin-top:3px;">운동 · 식단 · 인바디 전체 기록</p>
    </div>
    <div style="display:flex;gap:8px;">
      <button onclick="changeView('workout',this)" class="view-btn active">💪 운동</button>
      <button onclick="changeView('food',this)" class="view-btn">🥗 식단</button>
      <button onclick="changeView('inbody',this)" class="view-btn">📊 인바디</button>
    </div>
  </div>

  <div style="font-size:12px;color:#9DA8C0;text-align:right;margin-bottom:12px;">
    단위: kg · 추정 1RM = 무게 × (1 + 0.033 × 횟수)
  </div>

  <!-- 차트 -->
  <canvas id="chart" style="display:none;max-height:280px;"></canvas>

  <!-- 운동 히스토리 -->
  <div id="workoutHistory" style="display:none;margin-top:22px;">
    <h3 style="font-size:14px;font-weight:800;color:#1A1F36;margin-bottom:12px;">📅 운동 히스토리</h3>
    <div id="historyList" style="display:flex;flex-direction:column;gap:8px;"></div>
  </div>

  <!-- 식단 캘린더 -->
  <div id="foodList" style="display:none;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:14px;">
      <button onclick="prevMonth()" style="width:36px;height:36px;border-radius:50%;border:1.5px solid #E8EDF5;background:white;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;transition:all 0.2s;" onmouseover="this.style.borderColor='#FF6B35'" onmouseout="this.style.borderColor='#E8EDF5'">◀</button>
      <h3 id="calendarTitle" style="font-size:15px;font-weight:800;color:#1A1F36;"></h3>
      <button onclick="nextMonth()" style="width:36px;height:36px;border-radius:50%;border:1.5px solid #E8EDF5;background:white;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;transition:all 0.2s;" onmouseover="this.style.borderColor='#FF6B35'" onmouseout="this.style.borderColor='#E8EDF5'">▶</button>
    </div>
    <div id="calendarGrid" style="display:grid;grid-template-columns:repeat(7,1fr);gap:6px;"></div>
  </div>

</div>
</div>

<!-- ════════════════════════════════════
     TAB 3 : 결제 내역
════════════════════════════════════ -->
<div id="paymentTab" class="tab">

  <!-- 이용 중 회원권 -->
  <div id="activeMembership" style="margin-bottom:24px;"></div>

  <!-- 결제 내역 테이블 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;overflow:hidden;">
    <div style="margin-bottom:18px;">
      <h2 style="font-size:16px;font-weight:800;color:#1A1F36;">결제 내역 관리</h2>
      <p style="font-size:13px;color:#9DA8C0;margin-top:4px;">이용권 결제 내역을 확인하세요</p>
    </div>
    <div style="overflow-x:auto;">
      <table class="pay-table" style="width:100%;border-collapse:collapse;">
        <thead>
          <tr>
            <th>결제 일시</th><th>이용권</th><th>트레이너</th><th>결제 금액</th>
          </tr>
        </thead>
        <tbody id="paymentTable"></tbody>
      </table>
    </div>
  </div>

</div>

<!-- ════════════════════════════════════
     TAB 4 : 담당 트레이너 & 피드백
════════════════════════════════════ -->
<div id="feedbackTab" class="tab">
<div style="display:grid;grid-template-columns:320px 1fr;gap:24px;">

  <!-- 트레이너 카드 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">
    <div style="text-align:center;margin-bottom:20px;">
      <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=trainer"
           style="width:88px;height:88px;border-radius:50%;border:3px solid #00BFA5;object-fit:cover;margin-bottom:12px;" alt="트레이너">
      <div style="font-size:18px;font-weight:900;color:#1A1F36;">김태훈 트레이너</div>
      <div style="font-size:13px;color:#9DA8C0;margin-top:4px;">근력 / 체형교정 전문</div>
      <div style="margin-top:8px;display:flex;justify-content:center;gap:6px;flex-wrap:wrap;">
        <span style="padding:4px 12px;border-radius:99px;background:#E8F8F6;color:#00897B;font-size:12px;font-weight:700;">⭐ 4.9</span>
        <span style="padding:4px 12px;border-radius:99px;background:#FFF3EE;color:#FF6B35;font-size:12px;font-weight:700;">120명</span>
      </div>
    </div>
    <div style="border-top:1.5px solid #E8EDF5;padding-top:16px;display:flex;flex-direction:column;gap:10px;">
      <div style="display:flex;justify-content:space-between;">
        <span style="font-size:13px;color:#9DA8C0;font-weight:600;">PT 진행</span>
        <span style="font-size:13px;font-weight:700;color:#1A1F36;">12 / 20회</span>
      </div>
      <div style="height:8px;background:#F0F0F0;border-radius:99px;overflow:hidden;">
        <div style="width:60%;height:100%;background:linear-gradient(90deg,#00BFA5,#26D4BB);border-radius:99px;"></div>
      </div>
      <div style="display:flex;justify-content:space-between;margin-top:4px;">
        <span style="font-size:13px;color:#9DA8C0;font-weight:600;">다음 수업</span>
        <span style="font-size:13px;font-weight:700;color:#FF6B35;">4월 30일 11:00</span>
      </div>
    </div>
    <button onclick="goChat()" style="
      width:100%;margin-top:18px;padding:12px;border-radius:14px;border:none;cursor:pointer;
      background:linear-gradient(135deg,#00BFA5,#26D4BB);color:white;
      font-size:14px;font-weight:800;font-family:'Noto Sans KR',sans-serif;
      box-shadow:0 4px 14px rgba(0,191,165,0.3);transition:all 0.2s;
      display:flex;align-items:center;justify-content:center;gap:8px;
    " onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform='none'">
      <span class="material-symbols-outlined" style="font-size:18px;">chat</span>
      채팅하기
    </button>
    <button onclick="location.href='ptFeedback.jsp'" style="
      width:100%;margin-top:8px;padding:12px;border-radius:14px;border:1.5px solid #E8EDF5;
      background:white;color:#5A6480;font-size:14px;font-weight:700;cursor:pointer;
      font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
    " onmouseover="this.style.background='#F7F9FC'" onmouseout="this.style.background='white'">
      전체 피드백 보기 →
    </button>
  </div>

  <!-- 피드백 리스트 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:18px;">
      <h3 style="font-size:16px;font-weight:800;color:#1A1F36;">📋 최근 PT 피드백</h3>
    </div>
    <div id="recentFeedbackBox" style="display:flex;flex-direction:column;gap:12px;"></div>
  </div>

</div>
</div>

<!-- ════════════════════════════════════
     TAB 5 : 나의 커뮤니티
════════════════════════════════════ -->
<div id="communityTab" class="tab">
<div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:26px;">
  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;">
    <div>
      <h2 style="font-size:16px;font-weight:800;color:#1A1F36;">나의 커뮤니티 활동</h2>
      <p style="font-size:12px;color:#9DA8C0;margin-top:3px;">내가 작성한 게시글과 반응</p>
    </div>
    <a href="community.jsp" style="padding:8px 18px;border-radius:99px;border:1.5px solid #E8EDF5;background:white;color:#5A6480;font-size:13px;font-weight:700;text-decoration:none;transition:all 0.2s;" onmouseover="this.style.borderColor='#FF6B35';this.style.color='#FF6B35'" onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#5A6480'">커뮤니티 →</a>
  </div>
  <div id="myPostBox" style="display:grid;grid-template-columns:repeat(3,1fr);gap:16px;"></div>
</div>
</div>

</div><!-- end content -->

<!-- ════════ 모달: 개인정보 수정 ════════ -->
<div id="profileModal" class="fb-modal-wrap">
  <div class="fb-modal-box">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:22px;">
      <h2 style="font-size:18px;font-weight:900;color:#1A1F36;">개인정보 수정</h2>
      <button onclick="closeProfileModal()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;" onmouseover="this.style.background='#FEE2E2';this.style.color='#EF4444'" onmouseout="this.style.background='#F7F9FC';this.style.color='#5A6480'">✕</button>
    </div>
    <div style="display:flex;flex-direction:column;gap:14px;">
      <div>
        <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">닉네임</label>
        <input id="editNickname" class="fb-inp" placeholder="닉네임" value="<%= user.getNickname() %>">
      </div>
      <div>
        <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">새 비밀번호</label>
        <input id="editPassword" type="password" class="fb-inp" placeholder="새 비밀번호">
      </div>
    </div>
    <button onclick="updateProfile()" style="width:100%;margin-top:22px;padding:13px;border-radius:99px;border:none;cursor:pointer;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:15px;font-weight:800;font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 16px rgba(255,107,53,0.3);">저장하기</button>
    <button onclick="closeProfileModal()" style="width:100%;margin-top:8px;padding:11px;border-radius:99px;border:1.5px solid #E8EDF5;background:white;color:#5A6480;font-size:14px;font-weight:600;cursor:pointer;font-family:'Noto Sans KR',sans-serif;">닫기</button>
  </div>
</div>

<!-- ════════ 모달: 운동계획 수정 ════════ -->
<div id="planModal" class="fb-modal-wrap">
  <div class="fb-modal-box">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:22px;">
      <h2 style="font-size:18px;font-weight:900;color:#1A1F36;">운동 계획 수정</h2>
      <button onclick="closePlanModal()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;" onmouseover="this.style.background='#FEE2E2';this.style.color='#EF4444'" onmouseout="this.style.background='#F7F9FC';this.style.color='#5A6480'">✕</button>
    </div>
    <div style="display:flex;flex-direction:column;gap:12px;">
      <input id="goal" class="fb-inp" placeholder="운동 목표 (예: 다이어트, 근육증가)" value="<%= plan.getGoal() == null ? "" : plan.getGoal() %>">
      <input id="level" class="fb-inp" placeholder="운동 경험 수준 (초급/중급/고급)" value="<%= plan.getLevel() == null ? "" : plan.getLevel() %>">
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:10px;">
        <input id="height" class="fb-inp" placeholder="키 (cm)" type="number" value="<%= plan.getHeight() == 0 ? "" : plan.getHeight() %>">
        <input id="weight" class="fb-inp" placeholder="몸무게 (kg)" type="number" value="<%= plan.getWeight() == 0 ? "" : plan.getWeight() %>">
      </div>
      <input id="diet" class="fb-inp" placeholder="식단 유형 (예: 고단백, 저탄수)" value="<%= plan.getDiet() == null ? "" : plan.getDiet() %>">
    </div>
    <button onclick="updatePlan()" style="width:100%;margin-top:22px;padding:13px;border-radius:99px;border:none;cursor:pointer;background:linear-gradient(135deg,#00BFA5,#26D4BB);color:white;font-size:15px;font-weight:800;font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 16px rgba(0,191,165,0.3);">저장하기</button>
    <button onclick="closePlanModal()" style="width:100%;margin-top:8px;padding:11px;border-radius:99px;border:1.5px solid #E8EDF5;background:white;color:#5A6480;font-size:14px;font-weight:600;cursor:pointer;font-family:'Noto Sans KR',sans-serif;">닫기</button>
  </div>
</div>

<!-- ════════ 모달: 식단 상세 ════════ -->
<div id="foodModal" class="fb-modal-wrap">
  <div class="fb-modal-box" style="max-width:360px;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:18px;">
      <h2 id="modalDate" style="font-size:16px;font-weight:900;color:#1A1F36;"></h2>
      <button onclick="closeFoodModal()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;" onmouseover="this.style.background='#FEE2E2';this.style.color='#EF4444'" onmouseout="this.style.background='#F7F9FC';this.style.color='#5A6480'">✕</button>
    </div>
    <div id="modalContent"></div>
    <button onclick="closeFoodModal()" style="width:100%;margin-top:18px;padding:11px;border-radius:99px;border:1.5px solid #E8EDF5;background:white;color:#5A6480;font-size:14px;font-weight:600;cursor:pointer;font-family:'Noto Sans KR',sans-serif;">닫기</button>
  </div>
</div>

<script>
let chartInstance = null;
let currentView   = "workout";
let currentDate   = new Date();
let currentFoodData = [];

// ── 초기 로드 ──
window.onload = function() {
  loadData("workout");
  loadCommunityData();
  const tab = "<%= request.getAttribute("tab") %>";
  if (tab && tab !== "null") openTab(tab);
};

// ── 탭 전환 ──
function showTab(tabId, el) {
  document.querySelectorAll(".tab").forEach(t => t.classList.remove("active"));
  document.querySelectorAll(".tab-btn").forEach(b => {
    b.classList.remove("active");
    b.querySelectorAll("p").forEach(p => { p.style.color = ""; });
  });
  document.getElementById(tabId).classList.add("active");
  if (el) el.classList.add("active");

  if (tabId === "recordTab")   loadData(currentView);
  if (tabId === "paymentTab")  loadPaymentData();
  if (tabId === "communityTab") loadCommunityData();
  if (tabId === "feedbackTab") loadRecentFeedback();
}

function openTab(name) {
  const map = {profile:"profileTab",record:"recordTab",payment:"paymentTab",feedback:"feedbackTab",community:"communityTab"};
  const id = map[name];
  if (!id) return;
  const btns = document.querySelectorAll(".tab-btn");
  btns.forEach(b => {
    if (b.getAttribute("onclick") && b.getAttribute("onclick").includes(id)) showTab(id, b);
  });
}

// ── 뷰 전환 ──
function changeView(type, el) {
  currentView = type;
  document.querySelectorAll(".view-btn").forEach(b => b.classList.remove("active"));
  if (el) el.classList.add("active");
  loadData(type);
}

// ── 데이터 로드 ──
function loadData(type) {
  const chartEl   = document.getElementById("chart");
  const foodEl    = document.getElementById("foodList");
  const historyEl = document.getElementById("workoutHistory");
  chartEl.style.display = foodEl.style.display = historyEl.style.display = "none";

  fetch(type)
    .then(res => { if (!res.ok) throw new Error(); return res.json(); })
    .then(data => render(type, data))
    .catch(() => {
      if (type === "workout") {
        render("workout", [
          {date:"04-26",name:"벤치프레스",weight:85,reps:5,set:1},
          {date:"04-26",name:"벤치프레스",weight:90,reps:3,set:2},
          {date:"04-27",name:"스쿼트",weight:100,reps:5,set:1},
          {date:"04-27",name:"스쿼트",weight:110,reps:3,set:2}
        ]);
      } else if (type === "food") {
        currentFoodData = [{date:"2026-04-26",food:"닭가슴살+고구마",calorie:580},{date:"2026-04-27",food:"샐러드+프로틴",calorie:420}];
        render("food", currentFoodData);
      } else if (type === "inbody") {
        render("inbody", [{date:"04-01",weight:76,muscle:30,fat:15},{date:"04-15",weight:75,muscle:31,fat:14},{date:"04-26",weight:74,muscle:32,fat:13}]);
      }
    });
}

function render(type, data) {
  const chartEl   = document.getElementById("chart");
  const foodEl    = document.getElementById("foodList");
  const historyEl = document.getElementById("workoutHistory");
  chartEl.style.display = foodEl.style.display = historyEl.style.display = "none";

  if (type === "workout") {
    chartEl.style.display = historyEl.style.display = "block";
    drawWorkoutChart(data);
    drawWorkoutHistory(data);
  } else if (type === "food") {
    foodEl.style.display = "block";
    currentFoodData = data;
    drawCalendar();
  } else if (type === "inbody") {
    chartEl.style.display = "block";
    drawInbodyChart(data);
  }
}

// ── 운동 차트 ──
function drawWorkoutChart(data) {
  if (chartInstance) chartInstance.destroy();
  const labels  = [...new Set(data.map(d => d.date))];
  const grouped = {};
  data.forEach(d => {
    if (!grouped[d.name]) grouped[d.name] = [];
    grouped[d.name].push({date:d.date, value:(d.weight*(1+0.033*d.reps)).toFixed(1)});
  });
  const colors = ["#FF6B35","#00BFA5","#9333EA","#FFD166","#FF4D4D"];
  const datasets = Object.keys(grouped).map((name,i) => ({
    label:name,
    data:labels.map(date => { const f=grouped[name].find(d=>d.date===date); return f?f.value:null; }),
    borderColor:colors[i%colors.length],
    backgroundColor:colors[i%colors.length]+"20",
    tension:0.4, fill:true, pointRadius:5, pointHoverRadius:7
  }));
  chartInstance = new Chart(document.getElementById("chart"), {
    type:"line",
    data:{labels, datasets},
    options:{
      plugins:{legend:{labels:{color:"#5A6480",font:{family:"'Noto Sans KR'",weight:"700"}}}},
      scales:{
        x:{grid:{display:false},ticks:{color:"#9DA8C0"}},
        y:{grid:{color:"#F0F0F0"},ticks:{color:"#9DA8C0"}}
      }
    }
  });
}

// ── 운동 히스토리 ──
function drawWorkoutHistory(data) {
  const box = document.getElementById("historyList");
  box.innerHTML = "";
  const maxW = Math.max(...data.map(d=>d.weight));
  data.forEach((d,i) => {
    const isBest = d.weight === maxW;
    box.innerHTML += 
    	  '<div class="history-item ' + (isBest ? 'best' : '') + '">' +
    	    '<div>' +
    	      '<div style="font-size:12px;color:#9DA8C0;font-weight:600;">#' + (i+1) + ' · ' + d.date + '</div>' +
    	      '<div style="font-weight:800;font-size:14px;color:#1A1F36;margin-top:2px;">' + d.name + '</div>' +
    	    '</div>' +
    	    '<div style="text-align:right;">' +
    	      '<div style="font-size:14px;font-weight:700;color:' + (isBest ? '#FF6B35' : '#1A1F36') + ';">' + d.weight + 'kg × ' + d.reps + '회</div>' +
    	      (isBest ? '<div style="font-size:18px;margin-top:2px;">👑 최고기록</div>' : '') +
    	    '</div>' +
    	  '</div>';
  });
}

// ── 인바디 차트 ──
function drawInbodyChart(data) {
  if (chartInstance) chartInstance.destroy();
  chartInstance = new Chart(document.getElementById("chart"), {
    type:"line",
    data:{
      labels:data.map(d=>d.date),
      datasets:[
        {label:"체중(kg)",data:data.map(d=>d.weight),borderColor:"#FF6B35",backgroundColor:"rgba(255,107,53,0.08)",tension:0.4,fill:true,pointRadius:5},
        {label:"골격근량(kg)",data:data.map(d=>d.muscle),borderColor:"#00BFA5",backgroundColor:"rgba(0,191,165,0.08)",tension:0.4,fill:true,pointRadius:5},
        {label:"체지방량(kg)",data:data.map(d=>d.fat),borderColor:"#9333EA",backgroundColor:"rgba(147,51,234,0.08)",tension:0.4,fill:true,pointRadius:5}
      ]
    },
    options:{
      plugins:{legend:{labels:{color:"#5A6480",font:{family:"'Noto Sans KR'",weight:"700"}}}},
      scales:{x:{grid:{display:false},ticks:{color:"#9DA8C0"}},y:{grid:{color:"#F0F0F0"},ticks:{color:"#9DA8C0"}}}
    }
  });
}

// ── 식단 캘린더 ──
function drawCalendar() {
  const grid = document.getElementById("calendarGrid");
  if (!grid) return;
  const year = currentDate.getFullYear(), month = currentDate.getMonth();
  document.getElementById("calendarTitle").innerText = year+"년 "+(month+1)+"월";
  const firstDay = new Date(year,month,1).getDay();
  const lastDate = new Date(year,month+1,0).getDate();
  const map = {};
  currentFoodData.forEach(d => map[d.date] = d);
  const days = ["일","월","화","수","목","금","토"];
  
  let html = days.map(function(d){
	  return '<div style="text-align:center;font-size:12px;font-weight:700;color:#9DA8C0;padding:6px 0;">' + d + '</div>';
	}).join("");

	for (let i=1;i<=lastDate;i++) {
	  const full = year + "-" + String(month+1).padStart(2,"0") + "-" + String(i).padStart(2,"0");
	  const d = map[full];

	  html += 
	    '<div onclick="openFoodModal(\'' + full + '\')" class="cal-cell ' + (d ? 'has-data' : '') + '">' +
	      '<div style="font-size:12px;font-weight:800;color:#1A1F36;margin-bottom:4px;">' + i + '</div>' +
	      (d 
	        ? '<div style="font-size:11px;color:#00897B;font-weight:600;">' + d.food + '</div>' +
	          '<div style="font-size:11px;color:#9DA8C0;">' + d.calorie + 'kcal</div>'
	        : ''
	      ) +
	    '</div>';
  }
  grid.innerHTML = html;
}

function prevMonth() { currentDate.setMonth(currentDate.getMonth()-1); drawCalendar(); }
function nextMonth() { currentDate.setMonth(currentDate.getMonth()+1); drawCalendar(); }

// ── 결제 데이터 ──
function loadPaymentData() {

  // ✅ 테스트용 상태 변경 가능
  const active = {
    orderId: "ORD1234",
    productName: "PT 20회권 VIP",
    remain: 20,
    total: 20,
    used: true,          // 🔥 true = 환불 버튼 / false = 취소 버튼
    status: "DONE",      // 🔥 여기 바꿔가면서 테스트
    startDate: "2026-04-01",
    endDate: "2026-05-31"
  };

  const history = [
    {date:"2026-04-01",name:"PT 20회권 VIP",trainer:"김태훈",price:600000},
    {date:"2026-03-01",name:"헬스 1개월",trainer:"",price:80000}
  ];

  drawMembership(active);
  drawPaymentTable(history);
}

function drawMembership(data) {
	  const box = document.getElementById("activeMembership");
	  const percent = Math.round((data.remain / data.total) * 100);
	  if (!data) { box.innerHTML = ""; return; }

	  let actionBtn = "";
	  let overlay   = "";
	  let titleStyle = "";

	  // 상태 분기
	  switch(data.status){

	    case "READY":
	      actionBtn = '<button onclick="cancelPayment(\''+data.orderId+'\')">❌ 결제 취소</button>';
	      break;

	    case "DONE":
	    case "USING":
	    	if(data.remain === data.total){
	    		  actionBtn = '<button onclick="refundPayment(\'' + data.orderId + '\')">💸 100% 환불</button>';
	    		}else if(data.remain > 0){
	    		  actionBtn = '<button onclick="refundPayment(\'' + data.orderId + '\')">💸 부분 환불</button>';
	    		}else{
	    		  actionBtn = '<button disabled>환불 불가</button>';
	    		}
	    		break;

	    case "CANCEL_REQ":
	    case "REFUND_REQ":
	      overlay = '<div style="position:absolute;top:10px;right:10px;color:#FF6B35;font-weight:900;">처리 진행중</div>';
	      titleStyle = "text-decoration:line-through;";
	      break;

	    case "CANCEL_DONE":
	      overlay = '<div style="position:absolute;top:10px;right:10px;color:#9DA8C0;">취소 완료</div>';
	      titleStyle = "text-decoration:line-through;";
	      break;

	    case "REFUND_DONE":
	      overlay = '<div style="position:absolute;top:10px;right:10px;color:#00BFA5;">환불 완료</div>';
	      titleStyle = "text-decoration:line-through;";
	      break;
	  }

	  box.innerHTML =
	    '<div style="position:relative;background:linear-gradient(135deg,#FF6B35,#FF8C5A);border-radius:20px;padding:28px;">'
	    + overlay +
	    '<div style="'+titleStyle+'">' +
	      '<div style="color:white;">이용 중인 회원권</div>' +
	      '<div style="font-size:22px;font-weight:900;color:white;">🎫 '+data.productName+'</div>' +
	    '</div>' +
	    '<div style="margin-top:16px;">' +
	    '<div style="color:white;font-size:13px;">남은 횟수 ' + data.remain + ' / ' + data.total + '</div>' +
	    '<div style="height:10px;background:rgba(255,255,255,0.3);border-radius:99px;margin-top:6px;overflow:hidden;">' +
	      '<div style="width:' + percent + '%;height:100%;background:white;border-radius:99px;"></div>' +
	    '</div>' +
	    '<div style="margin-top:12px;">' + actionBtn + '</div>' +
	    '</div>';
	}

function drawPaymentTable(list) {
  const tbody = document.getElementById("paymentTable");
  tbody.innerHTML = list.map(function(item){
	  return '<tr>' +
	    '<td>' + item.date + '</td>' +
	    '<td><span style="background:#FFF3EE;color:#FF6B35;padding:4px 10px;border-radius:99px;">' + item.name + '</span></td>' +
	    '<td>' + (item.trainer || "-") + '</td>' +
	    '<td>' + item.price.toLocaleString() + '원</td>' +
	  '</tr>';
	}).join("");
}

function cancelPayment(orderId){
	  if(!confirm("정말 취소하시겠습니까?")) return;

	  fetch("paymentAction",{
	    method:"POST",
	    headers:{"Content-Type":"application/x-www-form-urlencoded"},
	    body:"orderId="+orderId+"&action=cancel"
	  })
	  .then(res=>res.text())
	  .then(()=>location.reload());
	}

	/* function refundPayment(orderId){
	  if(!confirm("환불 요청하시겠습니까?")) return;

	  fetch("paymentAction",{
	    method:"POST",
	    headers:{"Content-Type":"application/x-www-form-urlencoded"},
	    body:"orderId="+orderId+"&action=refund"
	  })
	  .then(res=>res.text())
	  .then(()=>location.reload());
	} */
	
	function refundPayment(orderId){

		  if(!confirm("환불 요청하시겠습니까?")) return;

		  fetch("refund", {
		    method:"POST",
		    headers:{"Content-Type":"application/x-www-form-urlencoded"},
		    body: "orderId=" + orderId + "&paymentKey=PAYMENT_KEY&amount=10000"
		  })
		  .then(function(res){ return res.json(); })
		  .then(function(data){
			  console.log(data);
			    if(data.code){ 
			      alert("환불 실패: " + data.message);
			    }else{
			      alert("환불 성공");
			    }
		  });
		}

// ── 피드백 ──
function loadRecentFeedback() {
  const data = [
    {date:"2026-04-27",exercise:"벤치프레스 자세 안정됨 👍",food:"단백질 섭취 부족",comment:"다음 주는 중량 증가 목표"},
    {date:"2026-04-24",exercise:"스쿼트 깊이 개선 필요",food:"식단 아주 좋음 ✅",comment:"하체 집중 훈련 예정"},
    {date:"2026-04-20",exercise:"데드리프트 자세 교정 완료",food:"야식 줄이기 필요",comment:"코어 강화 추가 예정"}
  ];
  drawRecentFeedback(data);
}

function drawRecentFeedback(list) {
  const box = document.getElementById("recentFeedbackBox");
  if (!list || !list.length) { box.innerHTML = "<p style='color:#9DA8C0;font-size:14px;'>피드백 없음</p>"; return; }
  box.innerHTML = list.map(function(item){
	  return '<div class="feedback-card">' +
	    '<div>📅 ' + item.date + '</div>' +
	    '<div>🏋️ ' + item.exercise + '</div>' +
	    '<div>🥗 ' + item.food + '</div>' +
	    '<div>💬 ' + item.comment + '</div>' +
	  '</div>';
	}).join("");
}

// ── 커뮤니티 ──
function loadCommunityData() {
  const posts = [
    {id:1,title:"가슴 운동 루틴 공유 💪",content:"벤치프레스 + 인클라인 추천!",image:"",likeCount:12,commentCount:4,category:"owun"},
    {id:2,title:"다이어트 식단 기록 🥗",content:"닭가슴살 + 고구마 + 샐러드",image:"",likeCount:8,commentCount:2,category:"free"},
    {id:3,title:"하체 운동 인증 🔥",content:"스쿼트 120kg 성공!",image:"",likeCount:20,commentCount:7,category:"owun"}
  ];
  drawMyPosts(posts);
}

function drawMyPosts(posts) {
  const box = document.getElementById("myPostBox");
  if (!posts||!posts.length) { box.innerHTML = "<p style='color:#9DA8C0;font-size:14px;'>게시글 없음</p>"; return; }
  box.innerHTML = posts.map(function(post){
	  return '<div onclick="goDetail(' + post.id + ')" class="post-mini">' +
	    '<div>' + (post.category === 'owun' ? '🏆' : '💬') + '</div>' +
	    '<div>' +
	      '<div>' + (post.category === 'owun' ? '🏆 오운완' : '💬 자유') + '</div>' +
	      '<div>' + post.title + '</div>' +
	      '<div>' + post.content + '</div>' +
	      '<div>❤️ ' + post.likeCount + ' 💬 ' + post.commentCount + '</div>' +
	    '</div>' +
	  '</div>';
	}).join("");
}

function goDetail(id) { location.href="communityDetail.jsp?id="+id; }
function goChat()      { location.href="chat.jsp"; }

// ── 프로필 업로드 ──
function uploadImg() {
  const data = new FormData(document.getElementById("uploadForm"));
  fetch("uploadProfile",{method:"POST",body:data})
    .then(res=>res.text())
    .then(file=>{ document.getElementById("profileImg").src="upload/"+file; });
}

// ── 개인정보 수정 ──
function openProfileModal()  { document.getElementById("profileModal").style.display="flex"; }
function closeProfileModal() { document.getElementById("profileModal").style.display="none"; }
function updateProfile() {
  fetch("updateProfile",{method:"POST",headers:{"Content-Type":"application/x-www-form-urlencoded"},
    body:`nickname=${document.getElementById("editNickname").value}&password=${document.getElementById("editPassword").value}`})
  .then(res=>res.text()).then(r=>{if(r==="ok"){alert("수정 완료");location.reload();}else alert("수정 실패");});
}

// ── 운동계획 수정 ──
function openPlanModal()  { document.getElementById("planModal").style.display="flex"; }
function closePlanModal() { document.getElementById("planModal").style.display="none"; }
function updatePlan() {
  fetch("updatePlan",{method:"POST",headers:{"Content-Type":"application/x-www-form-urlencoded"},
    body:`goal=${document.getElementById("goal").value}&level=${document.getElementById("level").value}&height=${document.getElementById("height").value}&weight=${document.getElementById("weight").value}&diet=${document.getElementById("diet").value}`})
  .then(res=>res.text()).then(r=>{if(r==="ok"){alert("수정 완료");location.reload();}else alert("수정 실패");});
}

// ── 식단 모달 ──
function openFoodModal(date) {
  const m = document.getElementById("foodModal");
  document.getElementById("modalDate").innerText = "📅 "+date;
  const found = currentFoodData.find(d=>d.date===date);
  document.getElementById("modalContent").innerHTML = found
  ? '<div>' +
      '<div>' + found.food + '</div>' +
      '<div>🔥 ' + found.calorie + ' kcal</div>' +
    '</div>'
  : '<p>기록된 식단이 없습니다.</p>';
}
function closeFoodModal() { document.getElementById("foodModal").style.display="none"; }
</script>

</body>
</html>
