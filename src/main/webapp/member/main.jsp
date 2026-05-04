<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.member.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
if(loginUser == null){
    response.sendRedirect("/member/login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>핏츠버그 - 대시보드</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body style="background:#F7F9FC;display:flex;min-height:100vh;font-family:'Noto Sans KR','Nunito',sans-serif;">

<!-- 사이드바 -->
<jsp:include page="sidebar.jsp" />

<!-- 메인 컨텐츠 -->
<div style="flex:1;margin-left:260px;padding:32px 36px;max-width:calc(100vw - 260px);">

  <!-- 페이지 헤더 -->
  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:28px;">
    <div>
      <h1 style="font-size:26px;font-weight:900;color:#1A1F36;letter-spacing:-0.5px;">
        안녕하세요, <span style="color:#FF6B35;"><%= loginUser.getNickname() %></span>님! 💪
      </h1>
      <p style="font-size:14px;color:#9DA8C0;margin-top:4px;">오늘도 핏불과 함께 건강한 하루 만들어봐요!</p>
    </div>

    <!-- 알림 + 채팅 아이콘 -->
    <div style="display:flex;align-items:center;gap:12px;">
      <button onclick="openNotification()" style="
        position:relative;width:44px;height:44px;border-radius:50%;
        border:none;background:white;cursor:pointer;
        box-shadow:0 2px 8px rgba(0,0,0,0.08);
        display:flex;align-items:center;justify-content:center;
        transition:all 0.2s;
      " onmouseover="this.style.background='#FFF3EE'" onmouseout="this.style.background='white'">
        <span class="material-symbols-outlined" style="font-size:22px;color:#5A6480;">notifications</span>
        <span id="notiCount" style="
          position:absolute;top:-2px;right:-2px;
          width:18px;height:18px;background:#FF6B35;color:white;
          border-radius:50%;font-size:10px;font-weight:700;
          display:none;align-items:center;justify-content:center;border:2px solid white;
        "></span>
      </button>

      <button onclick="openChatModal()" style="
        position:relative;width:44px;height:44px;border-radius:50%;
        border:none;background:white;cursor:pointer;
        box-shadow:0 2px 8px rgba(0,0,0,0.08);
        display:flex;align-items:center;justify-content:center;
        transition:all 0.2s;
      " onmouseover="this.style.background='#E8F8F6'" onmouseout="this.style.background='white'">
        <span class="material-symbols-outlined" style="font-size:22px;color:#5A6480;">chat</span>
        <span id="chatCount" style="
          position:absolute;top:-2px;right:-2px;
          width:18px;height:18px;background:#00BFA5;color:white;
          border-radius:50%;font-size:10px;font-weight:700;
          display:none;align-items:center;justify-content:center;border:2px solid white;
        "></span>
      </button>
    </div>
  </div>

  <!-- 통계 카드 행 -->
  <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:16px;margin-bottom:28px;">

    <div style="background:white;border-radius:16px;padding:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);display:flex;align-items:center;gap:14px;">
      <div style="width:48px;height:48px;border-radius:12px;background:#FFF3EE;display:flex;align-items:center;justify-content:center;font-size:22px;flex-shrink:0;">🔥</div>
      <div>
        <div style="font-size:22px;font-weight:900;color:#1A1F36;">5일</div>
        <div style="font-size:12px;color:#9DA8C0;font-weight:600;">오운완 스트릭</div>
      </div>
    </div>

    <div style="background:white;border-radius:16px;padding:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);display:flex;align-items:center;gap:14px;">
      <div style="width:48px;height:48px;border-radius:12px;background:#E8F8F6;display:flex;align-items:center;justify-content:center;font-size:22px;flex-shrink:0;">💪</div>
      <div>
        <div style="font-size:22px;font-weight:900;color:#1A1F36;">95kg</div>
        <div style="font-size:12px;color:#9DA8C0;font-weight:600;">벤치프레스 최고</div>
      </div>
    </div>

    <div style="background:white;border-radius:16px;padding:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);display:flex;align-items:center;gap:14px;">
      <div style="width:48px;height:48px;border-radius:12px;background:#FFF9E6;display:flex;align-items:center;justify-content:center;font-size:22px;flex-shrink:0;">🥗</div>
      <div>
        <div style="font-size:22px;font-weight:900;color:#1A1F36;">1,820</div>
        <div style="font-size:12px;color:#9DA8C0;font-weight:600;">오늘 칼로리(kcal)</div>
      </div>
    </div>

    <div style="background:linear-gradient(135deg,#FF6B35,#FF8C5A);border-radius:16px;padding:20px;border:none;box-shadow:0 4px 20px rgba(255,107,53,0.25);display:flex;align-items:center;gap:14px;">
      <div style="width:48px;height:48px;border-radius:12px;background:rgba(255,255,255,0.2);display:flex;align-items:center;justify-content:center;font-size:22px;flex-shrink:0;">🏅</div>
      <div>
        <div style="font-size:22px;font-weight:900;color:white;">VIP PT</div>
        <div style="font-size:12px;color:rgba(255,255,255,0.8);font-weight:600;">남은 횟수: 8회</div>
      </div>
    </div>

  </div>

  <!-- 2열 그리드: 차트 + 기록 -->
  <div style="display:grid;grid-template-columns:1fr 360px;gap:24px;margin-bottom:24px;">

    <!-- 왼쪽: 차트 -->
    <div style="background:white;border-radius:20px;padding:24px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;">
        <div>
          <h2 style="font-size:16px;font-weight:800;color:#1A1F36;">나의 운동 변화</h2>
          <p style="font-size:12px;color:#9DA8C0;margin-top:2px;">볼륨 = 중량 × 횟수 × 세트수</p>
        </div>
        <div style="display:flex;gap:6px;">
          <button onclick="loadChart('workout')" id="btn-workout" style="
            padding:7px 16px;border-radius:99px;border:none;cursor:pointer;font-size:13px;font-weight:700;
            background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;
            box-shadow:0 3px 12px rgba(255,107,53,0.3);font-family:'Noto Sans KR',sans-serif;
            transition:all 0.2s;
          ">운동</button>
          <button onclick="loadChart('food')" id="btn-food" style="
            padding:7px 16px;border-radius:99px;border:2px solid #E8EDF5;cursor:pointer;font-size:13px;font-weight:700;
            background:white;color:#5A6480;font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
          ">식단</button>
          <button onclick="loadChart('inbody')" id="btn-inbody" style="
            padding:7px 16px;border-radius:99px;border:2px solid #E8EDF5;cursor:pointer;font-size:13px;font-weight:700;
            background:white;color:#5A6480;font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
          ">인바디</button>
        </div>
      </div>
      <canvas id="chart" height="110"></canvas>
      <div id="calendar" style="display:none;margin-top:12px;"></div>
      <div style="margin-top:16px;text-align:right;">
        <button onclick="loadFeedback()" style="
          padding:8px 18px;border-radius:99px;border:1.5px solid #E8EDF5;
          background:white;color:#5A6480;font-size:13px;font-weight:600;cursor:pointer;
          font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
        " onmouseover="this.style.borderColor='#FF6B35';this.style.color='#FF6B35'"
           onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#5A6480'">
          트레이너 피드백 보기
        </button>
      </div>
    </div>

    <!-- 오른쪽: PT 일정 + 멤버십 -->
    <div style="display:flex;flex-direction:column;gap:16px;">

      <!-- PT 일정 -->
      <div style="background:white;border-radius:20px;padding:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:14px;">
          <h3 style="font-size:15px;font-weight:800;color:#1A1F36;">📅 나의 PT 일정</h3>
          <a href="trainerDetail?trainerId=1" style="font-size:12px;color:#FF6B35;text-decoration:none;font-weight:700;">상세보기 →</a>
        </div>
        <div style="display:flex;justify-content:space-between;align-items:center;">
          <div>
            <div style="font-weight:700;font-size:14px;color:#1A1F36;">김태훈 트레이너</div>
            <div style="font-size:12px;color:#9DA8C0;margin-top:3px;">4월 9일 12:00</div>
          </div>
          <button onclick="openReviewModal()" style="
            padding:7px 14px;border-radius:99px;border:none;cursor:pointer;
            background:linear-gradient(135deg,#00BFA5,#26D4BB);color:white;
            font-size:12px;font-weight:700;font-family:'Noto Sans KR',sans-serif;
            box-shadow:0 3px 12px rgba(0,191,165,0.3);
          ">리뷰 작성</button>
        </div>
      </div>

      <!-- 멤버십 -->
      <div style="background:linear-gradient(135deg,#00BFA5,#26D4BB);border-radius:20px;padding:20px;box-shadow:0 4px 20px rgba(0,191,165,0.28);">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:10px;">
          <h3 style="font-size:15px;font-weight:800;color:white;">🏆 멤버십</h3>
          <a href="mypage?tab=membership" style="font-size:12px;color:rgba(255,255,255,0.8);text-decoration:underline;font-weight:600;">상세보기</a>
        </div>
        <div style="font-size:14px;color:white;font-weight:600;">VIP 1:1 PT 20회</div>
        <div style="font-size:13px;color:rgba(255,255,255,0.85);margin-top:4px;">남은 횟수: <strong>8회</strong></div>
        <div style="margin-top:12px;background:rgba(255,255,255,0.25);border-radius:99px;height:8px;overflow:hidden;">
          <div style="width:40%;height:100%;background:white;border-radius:99px;"></div>
        </div>
      </div>

    </div>
  </div>

  <!-- 기록 카드 3열 -->
  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:16px;margin-bottom:24px;">

    <!-- 운동 기록 -->
    <div style="background:white;border-radius:20px;padding:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:14px;">
        <h3 style="font-size:15px;font-weight:800;color:#1A1F36;">💪 운동 기록</h3>
        <span style="font-size:11px;color:#9DA8C0;background:#F7F9FC;padding:3px 10px;border-radius:99px;font-weight:600;">오늘</span>
      </div>
      <div style="display:flex;flex-direction:column;gap:8px;margin-bottom:14px;">
        <div style="display:flex;justify-content:space-between;align-items:center;padding:10px 12px;background:#FFF3EE;border-radius:10px;">
          <span style="font-size:13px;font-weight:600;color:#1A1F36;">#1 벤치프레스</span>
          <span style="font-size:13px;color:#FF6B35;font-weight:700;">95kg × 5회</span>
        </div>
        <div style="display:flex;justify-content:space-between;align-items:center;padding:10px 12px;background:#FFF3EE;border-radius:10px;">
          <span style="font-size:13px;font-weight:600;color:#1A1F36;">#2 스쿼트</span>
          <span style="font-size:13px;color:#FF6B35;font-weight:700;">100kg × 5회</span>
        </div>
      </div>
      <button onclick="openWorkoutModal()" style="
        width:100%;padding:10px;border-radius:10px;
        border:2px dashed #E8EDF5;background:white;cursor:pointer;
        font-size:13px;color:#9DA8C0;font-weight:600;
        font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
      " onmouseover="this.style.borderColor='#FF6B35';this.style.color='#FF6B35'"
         onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#9DA8C0'">
        + 기록 추가
      </button>
    </div>

    <!-- 식단 기록 -->
    <div style="background:white;border-radius:20px;padding:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:14px;">
        <h3 style="font-size:15px;font-weight:800;color:#1A1F36;">🥗 식단 기록</h3>
        <span style="font-size:11px;color:#9DA8C0;background:#F7F9FC;padding:3px 10px;border-radius:99px;font-weight:600;">오늘</span>
      </div>
      <div style="padding:10px 12px;background:#E8F8F6;border-radius:10px;margin-bottom:8px;">
        <div style="font-size:13px;font-weight:600;color:#1A1F36;">닭가슴살 200g + 고구마 150g</div>
        <div style="font-size:12px;color:#00897B;margin-top:3px;font-weight:600;">약 580 kcal</div>
      </div>
      <div style="font-size:12px;color:#9DA8C0;margin-bottom:14px;">총 2끼 · 약 1,820 kcal</div>
      <button onclick="openFoodModal()" style="
        width:100%;padding:10px;border-radius:10px;
        border:2px dashed #E8EDF5;background:white;cursor:pointer;
        font-size:13px;color:#9DA8C0;font-weight:600;
        font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
      " onmouseover="this.style.borderColor='#00BFA5';this.style.color='#00BFA5'"
         onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#9DA8C0'">
        + 기록 추가
      </button>
    </div>

    <!-- 인바디 기록 -->
    <div style="background:white;border-radius:20px;padding:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:14px;">
        <h3 style="font-size:15px;font-weight:800;color:#1A1F36;">📊 인바디 기록</h3>
        <span style="font-size:11px;color:#9DA8C0;background:#F7F9FC;padding:3px 10px;border-radius:99px;font-weight:600;">03.15</span>
      </div>
      <div style="display:flex;flex-direction:column;gap:10px;margin-bottom:14px;">
        <div>
          <div style="display:flex;justify-content:space-between;font-size:12px;margin-bottom:4px;">
            <span style="font-weight:600;color:#5A6480;">체중</span><span style="font-weight:700;color:#1A1F36;">75kg</span>
          </div>
          <div style="height:7px;background:#F0F0F0;border-radius:99px;overflow:hidden;">
            <div style="width:75%;height:100%;background:linear-gradient(90deg,#FF6B35,#FFD166);border-radius:99px;"></div>
          </div>
        </div>
        <div>
          <div style="display:flex;justify-content:space-between;font-size:12px;margin-bottom:4px;">
            <span style="font-weight:600;color:#5A6480;">골격근량</span><span style="font-weight:700;color:#1A1F36;">30kg</span>
          </div>
          <div style="height:7px;background:#F0F0F0;border-radius:99px;overflow:hidden;">
            <div style="width:65%;height:100%;background:linear-gradient(90deg,#00BFA5,#26D4BB);border-radius:99px;"></div>
          </div>
        </div>
        <div>
          <div style="display:flex;justify-content:space-between;font-size:12px;margin-bottom:4px;">
            <span style="font-weight:600;color:#5A6480;">체지방량</span><span style="font-weight:700;color:#1A1F36;">12kg</span>
          </div>
          <div style="height:7px;background:#F0F0F0;border-radius:99px;overflow:hidden;">
            <div style="width:30%;height:100%;background:linear-gradient(90deg,#FF4D4D,#FF8C5A);border-radius:99px;"></div>
          </div>
        </div>
      </div>
      <button onclick="openInbodyModal()" style="
        width:100%;padding:10px;border-radius:10px;
        border:2px dashed #E8EDF5;background:white;cursor:pointer;
        font-size:13px;color:#9DA8C0;font-weight:600;
        font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
      " onmouseover="this.style.borderColor='#9333EA';this.style.color='#9333EA'"
         onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#9DA8C0'">
        + 기록 추가
      </button>
    </div>

  </div>

  <!-- 하단 2열: 트레이너 일정 + 헬스장 핫타임 -->
  <div style="display:grid;grid-template-columns:1fr 1fr;gap:24px;">

    <!-- 트레이너 수업 가능 일정 -->
    <div style="background:white;border-radius:20px;padding:24px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
      <h2 style="font-size:16px;font-weight:800;color:#1A1F36;margin-bottom:18px;">🗓 트레이너 수업 가능 일정</h2>
      <div style="overflow-x:auto;">
        <div style="display:grid;grid-template-columns:60px repeat(7,1fr);gap:4px;text-align:center;min-width:400px;">
          <div style="font-size:11px;color:#9DA8C0;font-weight:700;padding:6px;">시간</div>
          <% String[] days = {"월","화","수","목","금","토","일"};
             for(String d : days){ %>
          <div style="font-size:11px;color:#9DA8C0;font-weight:700;padding:6px;"><%= d %></div>
          <% } %>
          <% for(int i=9;i<=21;i+=2){ %>
          <div style="font-size:11px;color:#5A6480;font-weight:600;padding:6px 4px;"><%= i %>:00</div>
          <% for(int j=0;j<7;j++){
               boolean isAvail = (j < 5 && i >= 10 && i <= 18);
               String bg = isAvail ? "background:linear-gradient(135deg,rgba(0,191,165,0.15),rgba(38,212,187,0.1));border:1.5px solid rgba(0,191,165,0.3);" : "background:#F7F9FC;border:1.5px solid #E8EDF5;";
          %>
          <div style="height:36px;border-radius:8px;<%= bg %>transition:all 0.2s;cursor:<%= isAvail ? "pointer" : "default" %>;"
               <% if(isAvail) { %>onmouseover="this.style.background='linear-gradient(135deg,#00BFA5,#26D4BB)';this.style.color='white'"
               onmouseout="this.style.background='linear-gradient(135deg,rgba(0,191,165,0.15),rgba(38,212,187,0.1))'"<% } %>></div>
          <% } } %>
        </div>
      </div>
    </div>

    <!-- 헬스장 핫타임 -->
    <div style="background:white;border-radius:20px;padding:24px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
      <h2 style="font-size:16px;font-weight:800;color:#1A1F36;margin-bottom:16px;">🔥 헬스장 핫타임</h2>
      <div id="hotMessage" style="
        background:linear-gradient(135deg,#FF6B35,#FF8C5A);
        color:white;font-size:13px;padding:12px 16px;
        border-radius:12px;margin-bottom:18px;font-weight:600;
      ">데이터 분석 중...</div>
      <h3 style="font-size:13px;font-weight:700;color:#5A6480;margin-bottom:10px;">요일별 이용자 수</h3>
      <canvas id="dayChart" height="80"></canvas>
      <h3 style="font-size:13px;font-weight:700;color:#5A6480;margin-top:18px;margin-bottom:10px;">시간별 이용자 수</h3>
      <canvas id="timeChart" height="80"></canvas>
    </div>

  </div>

</div><!-- end content -->

<!-- ================================================
     모달들
     ================================================ -->

<!-- 운동 기록 모달 -->
<div id="workoutModal" style="display:none;position:fixed;inset:0;background:rgba(26,31,54,0.5);z-index:1000;align-items:center;justify-content:center;backdrop-filter:blur(4px);">
  <div style="background:white;border-radius:24px;padding:32px;width:100%;max-width:420px;box-shadow:0 8px 32px rgba(0,0,0,0.15);animation:fb_modal_in 0.3s ease;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:24px;">
      <h3 style="font-size:18px;font-weight:800;color:#1A1F36;">💪 운동 기록 추가</h3>
      <button onclick="closeWorkoutModal()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;">✕</button>
    </div>
    <div style="display:flex;flex-direction:column;gap:12px;">
      <input id="name" placeholder="운동명 (예: 벤치프레스)" class="fb-modal-input">
      <input id="weight" placeholder="무게 (kg)" class="fb-modal-input" type="number">
      <input id="reps" placeholder="횟수" class="fb-modal-input" type="number">
    </div>
    <button onclick="saveWorkout()" style="
      width:100%;margin-top:20px;padding:13px;border-radius:99px;border:none;cursor:pointer;
      background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-weight:700;font-size:15px;
      font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 16px rgba(255,107,53,0.3);
    ">저장하기</button>
    <button onclick="closeWorkoutModal()" style="
      width:100%;margin-top:8px;padding:11px;border-radius:99px;border:1.5px solid #E8EDF5;
      background:white;color:#5A6480;font-weight:600;font-size:14px;cursor:pointer;
      font-family:'Noto Sans KR',sans-serif;
    ">닫기</button>
  </div>
</div>

<!-- 식단 모달 -->
<div id="foodModal" style="display:none;position:fixed;inset:0;background:rgba(26,31,54,0.5);z-index:1000;align-items:center;justify-content:center;backdrop-filter:blur(4px);">
  <div style="background:white;border-radius:24px;padding:32px;width:100%;max-width:420px;box-shadow:0 8px 32px rgba(0,0,0,0.15);animation:fb_modal_in 0.3s ease;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:24px;">
      <h3 style="font-size:18px;font-weight:800;color:#1A1F36;">🥗 식단 기록 추가</h3>
      <button onclick="closeFoodModal()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;">✕</button>
    </div>
    <div style="display:flex;flex-direction:column;gap:12px;">
      <input id="foodName" placeholder="음식명" class="fb-modal-input">
      <input id="gram" placeholder="섭취량 (g)" class="fb-modal-input" type="number">
      <div id="result" style="font-size:14px;color:#00BFA5;font-weight:700;min-height:22px;"></div>
    </div>
    <button onclick="calcCalorie()" style="
      width:100%;margin-top:16px;padding:13px;border-radius:99px;border:none;cursor:pointer;
      background:linear-gradient(135deg,#00BFA5,#26D4BB);color:white;font-weight:700;font-size:15px;
      font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 16px rgba(0,191,165,0.3);
    ">칼로리 계산</button>
    <button onclick="closeFoodModal()" style="
      width:100%;margin-top:8px;padding:11px;border-radius:99px;border:1.5px solid #E8EDF5;
      background:white;color:#5A6480;font-weight:600;font-size:14px;cursor:pointer;
      font-family:'Noto Sans KR',sans-serif;
    ">닫기</button>
  </div>
</div>

<!-- 인바디 모달 -->
<div id="inbodyModal" style="display:none;position:fixed;inset:0;background:rgba(26,31,54,0.5);z-index:1000;align-items:center;justify-content:center;backdrop-filter:blur(4px);">
  <div style="background:white;border-radius:24px;padding:32px;width:100%;max-width:420px;box-shadow:0 8px 32px rgba(0,0,0,0.15);animation:fb_modal_in 0.3s ease;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:24px;">
      <h3 style="font-size:18px;font-weight:800;color:#1A1F36;">📊 인바디 기록 추가</h3>
      <button onclick="closeInbodyModal()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;">✕</button>
    </div>
    <div style="display:flex;flex-direction:column;gap:12px;">
      <input placeholder="체중 (kg)" class="fb-modal-input" type="number">
      <input placeholder="골격근량 (kg)" class="fb-modal-input" type="number">
      <input placeholder="체지방량 (kg)" class="fb-modal-input" type="number">
    </div>
    <button style="
      width:100%;margin-top:20px;padding:13px;border-radius:99px;border:none;cursor:pointer;
      background:linear-gradient(135deg,#9333EA,#A855F7);color:white;font-weight:700;font-size:15px;
      font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 16px rgba(147,51,234,0.3);
    ">저장하기</button>
    <button onclick="closeInbodyModal()" style="
      width:100%;margin-top:8px;padding:11px;border-radius:99px;border:1.5px solid #E8EDF5;
      background:white;color:#5A6480;font-weight:600;font-size:14px;cursor:pointer;
      font-family:'Noto Sans KR',sans-serif;
    ">닫기</button>
  </div>
</div>

<!-- 피드백 리스트 모달 -->
<div id="feedbackListModal" style="display:none;position:fixed;inset:0;background:rgba(26,31,54,0.5);z-index:1000;align-items:center;justify-content:center;backdrop-filter:blur(4px);">
  <div style="background:white;border-radius:24px;padding:28px;width:100%;max-width:500px;max-height:90vh;overflow-y:auto;box-shadow:0 8px 32px rgba(0,0,0,0.15);animation:fb_modal_in 0.3s ease;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;">
      <h3 style="font-size:18px;font-weight:800;color:#1A1F36;">💬 트레이너 피드백</h3>
      <button onclick="closeFeedbackListModal()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;">✕</button>
    </div>
    <div id="feedbackListContainer"></div>
  </div>
</div>

<!-- 알림 모달 -->
<div id="notificationModal" style="display:none;position:fixed;inset:0;background:rgba(26,31,54,0.5);z-index:1000;align-items:center;justify-content:center;backdrop-filter:blur(4px);">
  <div style="background:white;border-radius:24px;padding:28px;width:360px;box-shadow:0 8px 32px rgba(0,0,0,0.15);animation:fb_modal_in 0.3s ease;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
      <h3 style="font-size:18px;font-weight:800;color:#1A1F36;">🔔 알림</h3>
      <button onclick="closeNotification()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;">✕</button>
    </div>
    <div id="notificationList" style="max-height:340px;overflow-y:auto;"></div>
    <button onclick="readAllNotification()" style="
      font-size:13px;color:#FF6B35;background:none;border:none;cursor:pointer;
      font-family:'Noto Sans KR',sans-serif;font-weight:700;margin-top:12px;
    ">전체 읽음 표시</button>
  </div>
</div>

<!-- 채팅 목록 모달 -->
<div id="chatModal" style="display:none;position:fixed;inset:0;background:rgba(26,31,54,0.5);z-index:1000;align-items:center;justify-content:center;backdrop-filter:blur(4px);">
  <div style="background:white;border-radius:24px;padding:28px;width:360px;box-shadow:0 8px 32px rgba(0,0,0,0.15);animation:fb_modal_in 0.3s ease;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
      <h3 style="font-size:18px;font-weight:800;color:#1A1F36;">💬 채팅 목록</h3>
      <button onclick="closeChatModal()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;">✕</button>
    </div>
    <div id="chatList" style="max-height:340px;overflow-y:auto;"></div>
  </div>
</div>

<!-- 리뷰 모달 -->
<div id="reviewModal" style="display:none;position:fixed;inset:0;background:rgba(26,31,54,0.5);z-index:1000;align-items:center;justify-content:center;backdrop-filter:blur(4px);">
  <div style="background:white;border-radius:24px;padding:32px;width:440px;box-shadow:0 8px 32px rgba(0,0,0,0.15);animation:fb_modal_in 0.3s ease;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:24px;">
      <h3 style="font-size:18px;font-weight:800;color:#1A1F36;">⭐ 트레이너 리뷰 작성</h3>
      <button onclick="closeReviewModal()" style="width:32px;height:32px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;">✕</button>
    </div>
    <div style="display:flex;flex-direction:column;gap:14px;">
      <div>
        <label style="font-size:13px;font-weight:600;color:#5A6480;display:block;margin-bottom:6px;">별점</label>
        <select id="rating" class="fb-modal-input">
          <option value="5">★★★★★ 최고예요!</option>
          <option value="4">★★★★☆ 좋아요</option>
          <option value="3">★★★☆☆ 보통이에요</option>
          <option value="2">★★☆☆☆ 별로예요</option>
          <option value="1">★☆☆☆☆ 최악이에요</option>
        </select>
      </div>
      <div>
        <label style="font-size:13px;font-weight:600;color:#5A6480;display:block;margin-bottom:6px;">사진 첨부</label>
        <input type="file" id="reviewImage" accept="image/*" class="fb-modal-input">
      </div>
      <div>
        <label style="font-size:13px;font-weight:600;color:#5A6480;display:block;margin-bottom:6px;">리뷰 내용 (최소 20자)</label>
        <textarea id="reviewContent" placeholder="리뷰를 작성해주세요..." class="fb-modal-input" style="height:120px;resize:none;"></textarea>
      </div>
    </div>
    <button onclick="submitReview()" style="
      width:100%;margin-top:20px;padding:13px;border-radius:99px;border:none;cursor:pointer;
      background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-weight:700;font-size:15px;
      font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 16px rgba(255,107,53,0.3);
    ">저장하기</button>
    <button onclick="closeReviewModal()" style="
      width:100%;margin-top:8px;padding:11px;border-radius:99px;border:1.5px solid #E8EDF5;
      background:white;color:#5A6480;font-weight:600;font-size:14px;cursor:pointer;
      font-family:'Noto Sans KR',sans-serif;
    ">닫기</button>
  </div>
</div>

<style>
.fb-modal-input {
  width:100%;padding:12px 16px;border-radius:12px;
  border:2px solid #E8EDF5;background:#F7F9FC;
  color:#1A1F36;font-family:'Noto Sans KR',sans-serif;font-size:14px;
  outline:none;transition:border-color 0.2s,box-shadow 0.2s;box-sizing:border-box;
}
.fb-modal-input:focus {
  border-color:#FF6B35;box-shadow:0 0 0 3px rgba(255,107,53,0.12);background:white;
}
.fb-modal-input::placeholder { color:#9DA8C0; }

@keyframes fb_modal_in {
  from { opacity:0;transform:scale(0.9) translateY(20px); }
  to   { opacity:1;transform:scale(1) translateY(0); }
}

/* 모달 flex display */
[id$="Modal"] { display:none; }
[id$="Modal"].open { display:flex !important; }
</style>

<script>
/* Chart.js 기본 색상 오버라이드 */
Chart.defaults.color = '#9DA8C0';
Chart.defaults.borderColor = '#E8EDF5';

let chart, dayChart, timeChart;
let currentData = [];

function loadChart(type){
  document.getElementById('chart').style.display = 'none';
  document.getElementById('calendar').style.display = 'none';

  // 버튼 상태 초기화
  ['workout','food','inbody'].forEach(t => {
    const btn = document.getElementById('btn-'+t);
    if(btn){
      btn.style.background = 'white';
      btn.style.color = '#5A6480';
      btn.style.boxShadow = 'none';
      btn.style.border = '2px solid #E8EDF5';
    }
  });
  const activeBtn = document.getElementById('btn-'+type);
  if(activeBtn){
    activeBtn.style.background = 'linear-gradient(135deg,#FF6B35,#FF8C5A)';
    activeBtn.style.color = 'white';
    activeBtn.style.boxShadow = '0 3px 12px rgba(255,107,53,0.3)';
    activeBtn.style.border = 'none';
  }

  fetch("chart?type="+type)
  .then(res=>res.json())
  .then(data=>{
    currentData = data;
    if(chart) chart.destroy();
    if(type==='workout') drawWorkoutChart(data);
    else if(type==='food') drawFoodCalendar(data);
    else if(type==='inbody') drawInbodyChart(data);
  }).catch(err=>console.error("차트 로딩 실패:", err));
}

function drawWorkoutChart(data){
  document.getElementById('chart').style.display='block';
  chart = new Chart(document.getElementById('chart'),{
    type:'bar',
    data:{
      labels:data.map(d=>d.date),
      datasets:[{
        label:'운동 볼륨',
        data:data.map(d=>d.value),
        backgroundColor:'rgba(255,107,53,0.15)',
        borderColor:'#FF6B35',
        borderWidth:2,
        borderRadius:8,
      }]
    },
    options:{
      plugins:{legend:{display:false}},
      scales:{
        x:{grid:{display:false}},
        y:{grid:{color:'#F0F0F0'}}
      },
      onClick:(e,elements)=>{
        if(elements.length>0) openFeedbackByDate(data[elements[0].index].date);
      }
    }
  });
}

function drawFoodCalendar(data){
  const cal = document.getElementById('calendar');
  cal.style.display='block';
  cal.innerHTML='';
  if(!data||data.length===0){
    cal.innerHTML="<p style='color:#9DA8C0;font-size:14px;'>식단 데이터 없음</p>";
    return;
  }
  data.forEach(function(d){
	  cal.innerHTML +=
	    '<div style="border:1.5px solid #E8EDF5;border-radius:12px;padding:12px 16px;margin-bottom:8px;background:white;">' +
	      '<div style="font-size:11px;color:#9DA8C0;">' + d.date + '</div>' +
	      '<div style="font-weight:700;color:#1A1F36;margin-top:2px;">' + (d.food || '식단') + '</div>' +
	      '<div style="font-size:13px;color:#00BFA5;margin-top:3px;font-weight:600;">' + (d.calorie || 0) + ' kcal</div>' +
	    '</div>';
	});
}

function drawInbodyChart(data){
  document.getElementById('chart').style.display='block';
  chart = new Chart(document.getElementById('chart'),{
    type:'line',
    data:{
      labels:data.map(d=>d.date),
      datasets:[
        {label:'체중',data:data.map(d=>d.weight||0),borderColor:'#FF6B35',backgroundColor:'rgba(255,107,53,0.08)',tension:0.4,fill:true,pointRadius:4},
        {label:'골격근량',data:data.map(d=>d.muscle||0),borderColor:'#00BFA5',backgroundColor:'rgba(0,191,165,0.08)',tension:0.4,fill:true,pointRadius:4},
        {label:'체지방량',data:data.map(d=>d.fat||0),borderColor:'#9333EA',backgroundColor:'rgba(147,51,234,0.08)',tension:0.4,fill:true,pointRadius:4}
      ]
    },
    options:{scales:{x:{grid:{display:false}},y:{grid:{color:'#F0F0F0'}}}}
  });
}

function loadFeedback(){
  fetch("feedback").then(res=>res.json()).then(list=>{
    const container=document.getElementById("feedbackListContainer");
    container.innerHTML="";
    list.sort((a,b)=>new Date(b.date)-new Date(a.date));
    list.forEach(function(f){
      var img=f.trainerImg||"https://api.dicebear.com/7.x/avataaars/svg?seed=trainer";
      var summary=f.summary?(f.summary):(f.content?f.content.substring(0,40)+"...":"내용 없음");
      container.innerHTML+=
        '<div onclick="openFeedbackModal(\''+f.date+'\',\''+f.trainer+'\',\''+f.content+'\')" '+
        'style="display:flex;align-items:center;gap:12px;padding:14px;border-bottom:1.5px solid #F0F0F0;cursor:pointer;border-radius:12px;transition:background 0.2s;" '+
        'onmouseover="this.style.background=\'#FFF3EE\'" onmouseout="this.style.background=\'white\'">' +
          '<img src="'+img+'" style="width:44px;height:44px;border-radius:50%;object-fit:cover;border:2px solid #E8EDF5;">' +
          '<div style="flex:1;">' +
            '<div style="display:flex;justify-content:space-between;align-items:center;">' +
              '<span style="font-weight:700;font-size:14px;color:#1A1F36;">'+f.trainer+'</span>' +
              '<span style="font-size:11px;color:#9DA8C0;">'+f.date+'</span>' +
            '</div>' +
            '<div style="font-size:13px;color:#5A6480;margin-top:3px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width:320px;">'+summary+'</div>' +
          '</div>' +
        '</div>';
    });
    document.getElementById("feedbackListModal").style.display='flex';
  }).catch(err=>console.error("피드백 불러오기 실패", err));
}

function openFeedbackByDate(date){
  fetch("feedback").then(res=>res.json()).then(list=>{
    const target=list.find(f=>f.date===date);
    if(target) openFeedbackModal(target.date,target.trainer,target.content);
    else alert("해당 날짜 피드백 없음");
  });
}

function loadHotTime(){
  fetch("hotTime").then(res=>res.json()).then(data=>{
    drawDayChart(data.dayData);
    drawTimeChart(data.timeData);
    let maxDay=data.dayData.reduce((a,b)=>a.count>b.count?a:b);
    document.getElementById("hotMessage").innerText="🔥 현재 가장 붐비는 요일은 "+maxDay.day+" 입니다. 혼잡 시간을 피하세요!";
  });
}

function drawDayChart(data){
  if(dayChart) dayChart.destroy();
  dayChart=new Chart(document.getElementById("dayChart"),{
    type:'bar',
    data:{
      labels:data.map(d=>d.day),
      datasets:[{label:'이용자 수',data:data.map(d=>d.count),backgroundColor:'rgba(255,107,53,0.15)',borderColor:'#FF6B35',borderWidth:2,borderRadius:6}]
    },
    options:{plugins:{legend:{display:false}},scales:{x:{grid:{display:false}},y:{grid:{color:'#F0F0F0'}}}}
  });
}

function drawTimeChart(data){
  if(timeChart) timeChart.destroy();
  timeChart=new Chart(document.getElementById("timeChart"),{
    type:'line',
    data:{
      labels:data.map(d=>d.time),
      datasets:[{label:'이용자 수',data:data.map(d=>d.count),borderColor:'#00BFA5',backgroundColor:'rgba(0,191,165,0.1)',fill:true,tension:0.4,pointRadius:3}]
    },
    options:{plugins:{legend:{display:false}},scales:{x:{grid:{display:false}},y:{grid:{color:'#F0F0F0'}}}}
  });
}

function loadNotification(){
  fetch("notification").then(res=>res.json()).then(data=>{
    const countEl=document.getElementById("notiCount");
    if(data.count>0){countEl.style.display="flex";countEl.innerText=data.count;}
    else countEl.style.display="none";
    const box=document.getElementById("notificationList");
    box.innerHTML="";
    data.list.forEach(function(n){
      box.innerHTML+=
        '<div onclick="readNotification('+n.id+',\''+n.url+'\')" '+
        'style="padding:12px;border-bottom:1.5px solid #F0F0F0;cursor:pointer;border-radius:10px;'+
        (n.isRead?'':'background:#FFF3EE;')+
        'transition:background 0.2s;" onmouseover="this.style.background=\'#F7F9FC\'" onmouseout="this.style.background=\''+
        (n.isRead?'white':'#FFF3EE')+'\'">'+
          '<div style="font-size:13px;color:#1A1F36;">'+n.message+'</div>'+
          '<div style="font-size:11px;color:#9DA8C0;margin-top:3px;">'+n.createdAt+'</div>'+
        '</div>';
    });
  });
}

function readNotification(id,url){
  fetch("notification",{method:"POST",headers:{"Content-Type":"application/x-www-form-urlencoded"},body:"action=readOne&id="+id})
  .then(()=>{
    const c=document.getElementById("notiCount");
    const cnt=parseInt(c.innerText);
    if(cnt>1)c.innerText=cnt-1;else c.style.display="none";
    location.href=url;
  });
}

function readAllNotification(){
  fetch("notification",{method:"POST",headers:{"Content-Type":"application/x-www-form-urlencoded"},body:"action=readAll"})
  .then(()=>{document.getElementById("notiCount").style.display="none";loadNotification();});
}

function loadChatList(){
  fetch("messageList").then(res=>res.json()).then(list=>{
    const box=document.getElementById("chatList");
    box.innerHTML="";
    list.forEach(function(c){
      box.innerHTML+=
        '<div onclick="enterChat(\''+c.email+'\')" '+
        'style="display:flex;align-items:center;gap:12px;padding:12px;border-bottom:1.5px solid #F0F0F0;cursor:pointer;border-radius:10px;transition:background 0.2s;" '+
        'onmouseover="this.style.background=\'#F7F9FC\'" onmouseout="this.style.background=\'white\'">'+
          '<div style="width:42px;height:42px;border-radius:50%;background:linear-gradient(135deg,#FF6B35,#00BFA5);display:flex;align-items:center;justify-content:center;color:white;font-weight:700;font-size:16px;flex-shrink:0;">'+
            c.nickname.charAt(0)+'</div>'+
          '<div style="flex:1;min-width:0;">'+
            '<div style="font-weight:700;font-size:14px;color:#1A1F36;">'+c.nickname+'</div>'+
            '<div style="font-size:12px;color:#9DA8C0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">'+c.lastMessage+'</div>'+
          '</div>'+
          (c.unreadCount>0?'<div style="width:20px;height:20px;background:#FF6B35;border-radius:50%;color:white;font-size:11px;font-weight:700;display:flex;align-items:center;justify-content:center;">'+c.unreadCount+'</div>':'')+
        '</div>';
    });
  });
}

function enterChat(email){
  fetch("message",{method:"POST",headers:{"Content-Type":"application/x-www-form-urlencoded"},body:"action=readAll&receiver="+email})
  .then(()=>{location.href="chat.jsp?receiver="+email;});
}

function loadChatCount(){
  fetch("chatCount").then(res=>res.text()).then(count=>{
    const el=document.getElementById("chatCount");
    if(parseInt(count)>0){el.style.display="flex";el.innerText=count;}
    else el.style.display="none";
  });
}

window.onload=function(){
  loadChart('workout');
  loadHotTime();
  loadChatCount();
};

/* 모달 열기/닫기 */
function openWorkoutModal(){ document.getElementById("workoutModal").style.display="flex"; }
function closeWorkoutModal(){ document.getElementById("workoutModal").style.display="none"; }
function openFoodModal(){ document.getElementById("foodModal").style.display="flex"; }
function closeFoodModal(){ document.getElementById("foodModal").style.display="none"; }
function openInbodyModal(){ document.getElementById("inbodyModal").style.display="flex"; }
function closeInbodyModal(){ document.getElementById("inbodyModal").style.display="none"; }
function closeFeedbackListModal(){ document.getElementById("feedbackListModal").style.display="none"; }
function openNotification(){ document.getElementById("notificationModal").style.display="flex"; loadNotification(); }
function closeNotification(){ document.getElementById("notificationModal").style.display="none"; }
function openChatModal(){ document.getElementById("chatModal").style.display="flex"; loadChatList(); }
function closeChatModal(){ document.getElementById("chatModal").style.display="none"; }
function openReviewModal(){ document.getElementById("reviewModal").style.display="flex"; }
function closeReviewModal(){ document.getElementById("reviewModal").style.display="none"; }

function openFeedbackModal(date,trainer,content){
  alert("피드백 - "+trainer+" ("+date+"): "+content);
}

/* 저장 */
function saveWorkout(){
  fetch("workout",{method:"POST",headers:{"Content-Type":"application/x-www-form-urlencoded"},
    body:"name="+document.getElementById("name").value+"&weight="+document.getElementById("weight").value+"&reps="+document.getElementById("reps").value})
  .then(()=>location.reload());
}

function calcCalorie(){
  const name=document.getElementById("foodName").value;
  const gram=document.getElementById("gram").value;
  fetch("food",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({name,gram})})
  .then(res=>res.json())
  .then(data=>{document.getElementById("result").innerText="🔥 칼로리: "+data.calorie+" kcal";});
}

function submitReview(){
  const content=document.getElementById("reviewContent").value;
  if(content.length<20){alert("리뷰는 20자 이상 작성해주세요");return;}
  const formData=new FormData();
  formData.append("rating",document.getElementById("rating").value);
  formData.append("content",content);
  formData.append("trainerId",1);
  const file=document.getElementById("reviewImage").files[0];
  if(file) formData.append("image",file);
  fetch("review",{method:"POST",body:formData}).then(res=>res.text()).then(msg=>{alert(msg);closeReviewModal();});
}
</script>

</body>
</html>
