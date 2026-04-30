<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>핏츠버그 - 헬스장 회원가입</title>
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800;900&family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Noto Sans KR','Nunito',sans-serif;background:#F7F9FC;min-height:100vh;display:flex;}
.form-side{width:52%;display:flex;flex-direction:column;justify-content:center;padding:60px 56px;overflow-y:auto;}
.brand-side{flex:1;background:linear-gradient(145deg,#00897B 0%,#00BFA5 50%,#26D4BB 100%);position:relative;overflow:hidden;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:60px 48px;}
.brand-side::before{content:'';position:absolute;width:500px;height:500px;border-radius:50%;background:rgba(255,255,255,0.07);top:-100px;right:-80px;}
.fb-inp{width:100%;padding:13px 18px;border-radius:14px;border:2px solid #E8EDF5;background:#F7F9FC;font-family:'Noto Sans KR',sans-serif;font-size:14px;color:#1A1F36;outline:none;transition:all 0.2s;}
.fb-inp:focus{border-color:#00BFA5;box-shadow:0 0 0 3px rgba(0,191,165,0.15);background:white;}
.fb-inp::placeholder{color:#C4CEDE;}
@media(max-width:768px){.brand-side{display:none;}.form-side{width:100%;padding:40px 28px;}}
</style>
</head>
<body>

<!-- ── 왼쪽: 폼 ── -->
<div class="form-side">

  <a href="login.jsp" style="display:flex;align-items:center;gap:10px;text-decoration:none;margin-bottom:32px;">
    <div style="width:40px;height:40px;border-radius:50%;background:linear-gradient(135deg,#FF6B35,#00BFA5);display:flex;align-items:center;justify-content:center;font-size:18px;">🐾</div>
    <span style="font-family:'Nunito',sans-serif;font-size:22px;font-weight:900;background:linear-gradient(135deg,#FF6B35,#00BFA5);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;">핏츠버그</span>
  </a>

  <!-- 역할 탭 -->
  <div style="display:flex;gap:8px;margin-bottom:28px;">
    <button onclick="location.href='join.jsp'" style="padding:10px 22px;border-radius:99px;border:2px solid #E8EDF5;background:white;color:#5A6480;font-size:14px;font-weight:700;cursor:pointer;font-family:'Noto Sans KR',sans-serif;">🏃 일반 회원</button>
    <button onclick="location.href='trainerJoin.jsp'" style="padding:10px 22px;border-radius:99px;border:2px solid #E8EDF5;background:white;color:#5A6480;font-size:14px;font-weight:700;cursor:pointer;font-family:'Noto Sans KR',sans-serif;">🏋️ 트레이너</button>
    <button style="padding:10px 22px;border-radius:99px;border:none;background:linear-gradient(135deg,#00BFA5,#26D4BB);color:white;font-size:14px;font-weight:700;cursor:pointer;font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 14px rgba(0,191,165,0.3);">🏢 헬스장</button>
  </div>

  <h1 style="font-size:28px;font-weight:900;color:#1A1F36;margin-bottom:6px;">헬스장 입점 신청 🏢</h1>
  <p style="font-size:14px;color:#9DA8C0;margin-bottom:28px;">핏츠버그 파트너 헬스장으로 더 많은 회원을 만나보세요!</p>

  <form action="gymJoin" method="post" style="display:flex;flex-direction:column;gap:14px;max-width:440px;">

    <div>
      <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">아이디 (이메일)</label>
      <input name="username" class="fb-inp" placeholder="관리자 이메일 주소" autocomplete="email">
    </div>
    <div>
      <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">비밀번호</label>
      <input name="password" type="password" class="fb-inp" placeholder="비밀번호 (8자 이상)" autocomplete="new-password">
    </div>
    <div>
      <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">헬스장 이름 / 상호명</label>
      <input name="gymName" class="fb-inp" placeholder="예: 더 프라임 휘트니스 강남점">
    </div>
    <div>
      <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">헬스장 주소</label>
      <input name="address" class="fb-inp" placeholder="예: 서울특별시 강남구 테헤란로 123">
    </div>
    <div>
      <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">대표 연락처</label>
      <input name="phone" class="fb-inp" placeholder="02-0000-0000 또는 010-0000-0000">
    </div>
    <div>
      <label style="font-size:13px;font-weight:700;color:#5A6480;display:block;margin-bottom:7px;">대표자 이름</label>
      <input name="ceo" class="fb-inp" placeholder="사업자 등록상 대표자명">
    </div>

    <button type="submit" style="margin-top:6px;width:100%;padding:14px;border:none;border-radius:99px;cursor:pointer;background:linear-gradient(135deg,#00BFA5,#26D4BB);color:white;font-family:'Noto Sans KR',sans-serif;font-size:16px;font-weight:800;box-shadow:0 6px 20px rgba(0,191,165,0.35);transition:all 0.2s;" onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform='none'">
      🚀 입점 신청하기
    </button>

    <p style="text-align:center;font-size:14px;color:#9DA8C0;">
      이미 계정이 있으신가요? <a href="login.jsp" style="color:#00BFA5;font-weight:700;text-decoration:none;">로그인하기 →</a>
    </p>

  </form>
</div>

<!-- ── 오른쪽: 브랜드 ── -->
<div class="brand-side">
  <div style="position:relative;z-index:1;text-align:center;margin-bottom:32px;">
    <div style="font-size:60px;margin-bottom:16px;">🏢</div>
    <div style="font-family:'Nunito',sans-serif;font-size:32px;font-weight:900;color:white;letter-spacing:-0.5px;margin-bottom:8px;">헬스장 파트너</div>
    <div style="font-size:14px;color:rgba(255,255,255,0.85);line-height:1.6;">핏츠버그와 함께 더 많은 회원을<br>효율적으로 유치하세요</div>
  </div>

  <div style="position:relative;z-index:1;display:flex;flex-direction:column;gap:12px;width:100%;max-width:300px;">
    <% String[][] bens={{"📈","회원 유입 증가","검색 노출 최적화로 신규 회원 유치"},{"🗓","예약 시스템 제공","PT 수업 예약을 자동으로 관리"},{"📊","데이터 대시보드","이용자 통계와 혼잡도 분석 제공"},{"✅","인증 헬스장 뱃지","사업자 인증으로 신뢰도 강화"}}; for(String[] b: bens){ %>
    <div style="background:rgba(255,255,255,0.15);backdrop-filter:blur(8px);border:1.5px solid rgba(255,255,255,0.25);border-radius:14px;padding:14px 18px;display:flex;align-items:center;gap:14px;">
      <div style="font-size:22px;flex-shrink:0;"><%= b[0] %></div>
      <div>
        <div style="font-size:13px;font-weight:800;color:white;"><%= b[1] %></div>
        <div style="font-size:11px;color:rgba(255,255,255,0.75);margin-top:2px;"><%= b[2] %></div>
      </div>
    </div>
    <% } %>
  </div>

  <div style="position:relative;z-index:1;margin-top:22px;background:rgba(255,255,255,0.15);backdrop-filter:blur(8px);border-radius:14px;padding:14px 20px;text-align:center;">
    <div style="font-size:22px;font-weight:900;color:white;">200+</div>
    <div style="font-size:12px;color:rgba(255,255,255,0.8);font-weight:600;">파트너 헬스장 운영 중</div>
  </div>
</div>

</body>
</html>
