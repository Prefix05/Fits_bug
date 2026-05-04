<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, dto.SupportDTO"%>
<%  List<SupportDTO> list = (List<SupportDTO>) request.getAttribute("list"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>핏츠버그 - 고객센터</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800;900&family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Noto Sans KR','Nunito',sans-serif;background:#F7F9FC;display:flex;min-height:100vh;}
.fb-inp{width:100%;padding:13px 18px;border-radius:14px;border:2px solid #E8EDF5;background:#F7F9FC;font-family:'Noto Sans KR',sans-serif;font-size:14px;color:#1A1F36;outline:none;transition:all 0.2s;}
.fb-inp:focus{border-color:#FF6B35;box-shadow:0 0 0 3px rgba(255,107,53,0.12);background:white;}
.fb-inp::placeholder{color:#C4CEDE;}
.faq-item{border:1.5px solid #E8EDF5;border-radius:14px;overflow:hidden;margin-bottom:10px;transition:all 0.2s;}
.faq-q{display:flex;justify-content:space-between;align-items:center;padding:16px 20px;cursor:pointer;background:white;font-weight:700;font-size:14px;color:#1A1F36;transition:background 0.2s;}
.faq-q:hover{background:#FFF3EE;}
.faq-a{display:none;padding:14px 20px;background:#F7F9FC;font-size:14px;color:#5A6480;line-height:1.7;border-top:1.5px solid #E8EDF5;}
.faq-item.open .faq-a{display:block;}
.faq-item.open .faq-q{background:#FFF3EE;color:#FF6B35;}
.faq-arrow{transition:transform 0.3s;}
.faq-item.open .faq-arrow{transform:rotate(180deg);}
</style>
</head>
<body>
<jsp:include page="sidebar.jsp"/>

<main style="flex:1;margin-left:260px;padding:32px 36px;display:flex;gap:28px;max-width:calc(100vw - 260px);">

<!-- ── 메인 컬럼 ── -->
<div style="flex:1;min-width:0;display:flex;flex-direction:column;gap:24px;">

  <!-- 헤더 -->
  <div>
    <h2 style="font-size:26px;font-weight:900;color:#1A1F36;letter-spacing:-0.5px;">고객센터 🎧</h2>
    <p style="font-size:14px;color:#9DA8C0;margin-top:4px;">핏불 팀이 빠르게 도와드릴게요!</p>
  </div>

  <!-- 빠른 분류 카드 -->
  <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:14px;">
    <% String[][] quickCards = {
      {"💳","결제 문의","결제·환불 관련"},
      {"👤","계정 문의","로그인·비밀번호"},
      {"🔧","서비스 오류","버그·오작동 신고"},
      {"🚨","신고하기","부적절 게시물 신고"}
    };
    for(String[] c : quickCards){ %>
    <div onclick="selectType('<%=c[0].equals("🚨") ? "신고" : "문의"%>')"
         style="background:white;border:1.5px solid #E8EDF5;border-radius:16px;padding:18px;text-align:center;cursor:pointer;transition:all 0.2s;"
         onmouseover="this.style.borderColor='#FF6B35';this.style.background='#FFF3EE';this.style.transform='translateY(-2px)'"
         onmouseout="this.style.borderColor='#E8EDF5';this.style.background='white';this.style.transform='none'">
      <div style="font-size:28px;margin-bottom:8px;"><%= c[0] %></div>
      <div style="font-size:13px;font-weight:800;color:#1A1F36;"><%= c[1] %></div>
      <div style="font-size:11px;color:#9DA8C0;margin-top:3px;"><%= c[2] %></div>
    </div>
    <% } %>
  </div>

  <!-- 문의 작성 폼 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:28px;">
    <div style="display:flex;align-items:center;gap:12px;margin-bottom:22px;">
      <div style="width:40px;height:40px;border-radius:12px;background:linear-gradient(135deg,#FF6B35,#FF8C5A);display:flex;align-items:center;justify-content:center;font-size:18px;">✏️</div>
      <div>
        <h3 style="font-size:16px;font-weight:800;color:#1A1F36;">문의 · 신고 작성</h3>
        <p style="font-size:12px;color:#9DA8C0;margin-top:2px;">상세히 작성할수록 빠른 처리가 가능해요</p>
      </div>
    </div>

    <form action="support" method="post" style="display:flex;flex-direction:column;gap:14px;">
      <div>
        <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">문의 유형</label>
        <select name="type" id="typeSelect" class="fb-inp" style="cursor:pointer;">
          <option value="문의">💳 결제 문의</option>
          <option value="문의">👤 계정 문의</option>
          <option value="문의">🔧 서비스 오류</option>
          <option value="신고">🚨 신고하기</option>
        </select>
      </div>
      <div>
        <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">제목</label>
        <input name="title" class="fb-inp" placeholder="문의 제목을 입력하세요">
      </div>
      <div>
        <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">내용</label>
        <textarea name="content" class="fb-inp" style="min-height:130px;resize:vertical;" placeholder="문의 내용을 자세히 작성해주세요. 스크린샷이나 오류 메시지가 있다면 함께 적어주세요."></textarea>
      </div>
      <button type="submit" style="align-self:flex-end;padding:12px 30px;border-radius:99px;border:none;cursor:pointer;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:14px;font-weight:800;font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 16px rgba(255,107,53,0.3);transition:all 0.2s;" onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform='none'">
        🚀 제출하기
      </button>
    </form>
  </div>

  <!-- 문의 내역 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:28px;">
    <h3 style="font-size:16px;font-weight:800;color:#1A1F36;margin-bottom:18px;">📋 나의 문의 내역</h3>

    <% if(list != null && !list.isEmpty()){
        for(SupportDTO s : list){ %>
    <div style="display:flex;justify-content:space-between;align-items:center;padding:16px;border-radius:14px;border:1.5px solid #E8EDF5;margin-bottom:10px;transition:all 0.2s;"
         onmouseover="this.style.background='#FFF9F7';this.style.borderColor='rgba(255,107,53,0.2)'"
         onmouseout="this.style.background='white';this.style.borderColor='#E8EDF5'">
      <div>
        <div style="display:flex;align-items:center;gap:8px;margin-bottom:6px;">
          <% if("신고".equals(s.getType())){ %>
          <span style="padding:3px 10px;border-radius:99px;background:linear-gradient(135deg,#FF4D4D,#FF6B35);color:white;font-size:11px;font-weight:800;">🚨 신고</span>
          <% } else { %>
          <span style="padding:3px 10px;border-radius:99px;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:11px;font-weight:800;">💬 문의</span>
          <% } %>
          <span style="font-size:12px;color:#9DA8C0;"><%= s.getType() %></span>
        </div>
        <div style="font-weight:700;font-size:14px;color:#1A1F36;margin-bottom:3px;"><%= s.getTitle() %></div>
        <div style="font-size:12px;color:#9DA8C0;"><%= s.getCreatedAt() %></div>
      </div>
      <span style="padding:6px 16px;border-radius:99px;font-size:12px;font-weight:700;
        background:<%= "답변완료".equals(s.getStatus()) ? "#E8F8F6" : "#F7F9FC" %>;
        color:<%= "답변완료".equals(s.getStatus()) ? "#00897B" : "#9DA8C0" %>;">
        <%= "답변완료".equals(s.getStatus()) ? "✔ 답변 완료" : "⏳ 처리 중" %>
      </span>
    </div>
    <% } } else { %>
    <div style="text-align:center;padding:48px 20px;color:#9DA8C0;">
      <div style="font-size:48px;margin-bottom:12px;">📭</div>
      <div style="font-size:15px;font-weight:600;">아직 문의 내역이 없어요</div>
      <div style="font-size:13px;margin-top:6px;">궁금한 점이 있으면 언제든지 문의해주세요!</div>
    </div>
    <% } %>
  </div>

</div>

<!-- ── 사이드 패널 ── -->
<aside style="width:270px;flex-shrink:0;display:flex;flex-direction:column;gap:16px;">

  <!-- 운영 안내 -->
  <div style="background:linear-gradient(135deg,#FF6B35,#FF8C5A);border-radius:20px;padding:22px;box-shadow:0 4px 20px rgba(255,107,53,0.25);">
    <div style="font-size:24px;margin-bottom:10px;">⏰</div>
    <div style="font-size:15px;font-weight:900;color:white;margin-bottom:8px;">운영시간 안내</div>
    <div style="font-size:13px;color:rgba(255,255,255,0.9);line-height:1.8;">
      평일 09:00 – 18:00<br>
      점심 12:00 – 13:00<br>
      <span style="font-size:12px;opacity:0.75;">주말 · 공휴일 휴무</span>
    </div>
    <div style="margin-top:14px;padding:10px 14px;background:rgba(255,255,255,0.2);border-radius:10px;font-size:12px;color:rgba(255,255,255,0.9);font-weight:700;">
      📧 support@fitsbug.co.kr
    </div>
  </div>

  <!-- FAQ -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:22px;">
    <h3 style="font-size:15px;font-weight:800;color:#1A1F36;margin-bottom:16px;">💡 자주 묻는 질문</h3>

    <% String[][] faqs = {
      {"결제 취소는 어떻게 하나요?","마이페이지 → 결제 내역에서 취소 신청이 가능합니다. 수업 7일 전까지 전액 환불됩니다."},
      {"트레이너 변경이 가능한가요?","고객센터를 통해 담당 트레이너 변경 신청이 가능합니다."},
      {"비밀번호를 잊었어요","로그인 페이지의 '비밀번호 찾기'를 이용해 이메일로 재설정할 수 있습니다."},
      {"PT 일정 변경은 어떻게 해요?","담당 트레이너와 채팅을 통해 일정을 협의해주세요."}
    };
    for(String[] faq : faqs){ %>
    <div class="faq-item" onclick="toggleFaq(this)">
      <div class="faq-q">
        <span><%= faq[0] %></span>
        <span class="material-symbols-outlined faq-arrow" style="font-size:18px;color:#9DA8C0;">expand_more</span>
      </div>
      <div class="faq-a"><%= faq[1] %></div>
    </div>
    <% } %>
  </div>

  <!-- 핏불 응원 -->
  <div style="background:linear-gradient(135deg,#E8F8F6,#F0FBF9);border:1.5px solid rgba(0,191,165,0.2);border-radius:20px;padding:22px;text-align:center;">
    <div style="font-size:36px;margin-bottom:8px;">🐾</div>
    <div style="font-size:14px;font-weight:800;color:#00897B;margin-bottom:6px;">핏불이 함께해요!</div>
    <div style="font-size:13px;color:#5A9E98;line-height:1.5;">문제가 생겨도 걱정 마세요.<br>핏불 팀이 빠르게 해결해드릴게요!</div>
  </div>

</aside>
</main>

<script>
function toggleFaq(el){ el.classList.toggle('open'); }
function selectType(val){
  const sel = document.getElementById('typeSelect');
  if(!sel) return;
  for(let i=0;i<sel.options.length;i++){
    if(sel.options[i].value === val){ sel.selectedIndex=i; break; }
  }
  sel.scrollIntoView({behavior:'smooth',block:'center'});
  sel.focus();
}
</script>
</body>
</html>
