<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>핏츠버그 - 맞춤 플랜 설정 (3/3)</title>
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800;900&family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Noto Sans KR','Nunito',sans-serif;background:rgba(26,31,54,0.65);min-height:100vh;display:flex;align-items:center;justify-content:center;backdrop-filter:blur(8px);}
.radio-card{display:flex;align-items:center;gap:14px;padding:16px 18px;border:2px solid #E8EDF5;border-radius:14px;cursor:pointer;transition:all 0.2s;background:white;}
.radio-card:hover{border-color:#FF6B35;background:#FFF9F7;}
.radio-card:has(input:checked){border-color:#FF6B35;background:#FFF3EE;box-shadow:0 0 0 3px rgba(255,107,53,0.08);}
@keyframes fb_modal_in{from{opacity:0;transform:scale(0.9) translateY(20px);}to{opacity:1;transform:scale(1) translateY(0);}}
@keyframes fb_float{0%,100%{transform:translateY(0);}50%{transform:translateY(-8px);}}
</style>
</head>
<body>

<div style="background:white;border-radius:28px;width:100%;max-width:480px;margin:20px;box-shadow:0 24px 80px rgba(0,0,0,0.2);overflow:hidden;animation:fb_modal_in 0.3s ease;">

  <!-- 헤더 -->
  <div style="background:linear-gradient(135deg,#FF6B35,#FF8C5A,#00BFA5);padding:28px 32px;">
    <div style="display:flex;align-items:center;gap:12px;margin-bottom:18px;">
      <div style="width:38px;height:38px;border-radius:50%;background:rgba(255,255,255,0.25);display:flex;align-items:center;justify-content:center;font-size:18px;">🐾</div>
      <span style="font-size:16px;font-weight:800;color:white;">맞춤형 운동 플랜 설정</span>
    </div>
    <!-- 스텝 바 (완료) -->
    <div style="display:flex;gap:6px;margin-bottom:8px;">
      <div style="flex:1;height:6px;background:white;border-radius:99px;"></div>
      <div style="flex:1;height:6px;background:white;border-radius:99px;"></div>
      <div style="flex:1;height:6px;background:white;border-radius:99px;"></div>
    </div>
    <div style="font-size:12px;color:rgba(255,255,255,0.85);font-weight:600;">단계 3 / 3 · 마지막 단계! 거의 다 왔어요 🎉</div>
  </div>

  <!-- 폼 -->
  <form action="step3" method="post" style="padding:28px 32px;display:flex;flex-direction:column;gap:22px;">

    <!-- Q5 주간 운동 횟수 -->
    <div>
      <div style="font-size:15px;font-weight:800;color:#1A1F36;margin-bottom:5px;">Q5. 1주일에 몇 번 운동하실 건가요? 📅</div>
      <div style="font-size:13px;color:#9DA8C0;margin-bottom:14px;">현실적인 목표를 세워야 오래 지속할 수 있어요!</div>
      <div style="display:flex;flex-direction:column;gap:8px;">

        <label class="radio-card">
          <input type="radio" name="workout" value="1-2" style="accent-color:#FF6B35;width:18px;height:18px;flex-shrink:0;">
          <div style="font-size:22px;flex-shrink:0;">🚶</div>
          <div>
            <div style="font-size:14px;font-weight:700;color:#1A1F36;">주 1~2회 · 가볍게 꾸준히</div>
            <div style="font-size:12px;color:#9DA8C0;margin-top:2px;">바쁜 일상 속 건강 유지가 목표예요</div>
          </div>
        </label>

        <label class="radio-card">
          <input type="radio" name="workout" value="3-4" checked style="accent-color:#FF6B35;width:18px;height:18px;flex-shrink:0;">
          <div style="font-size:22px;flex-shrink:0;">🏃</div>
          <div>
            <div style="font-size:14px;font-weight:700;color:#1A1F36;">주 3~4회 · 일반적인 목표</div>
            <div style="font-size:12px;color:#9DA8C0;margin-top:2px;">체형 변화와 체력 향상을 원해요</div>
          </div>
        </label>

        <label class="radio-card">
          <input type="radio" name="workout" value="5+" style="accent-color:#FF6B35;width:18px;height:18px;flex-shrink:0;">
          <div style="font-size:22px;flex-shrink:0;">💪</div>
          <div>
            <div style="font-size:14px;font-weight:700;color:#1A1F36;">주 5회+ · 본격적인 몸 만들기</div>
            <div style="font-size:12px;color:#9DA8C0;margin-top:2px;">확실한 근육량 증가·바디프로필을 원해요</div>
          </div>
        </label>

      </div>
    </div>

    <!-- 완료 안내 박스 -->
    <div style="background:linear-gradient(135deg,#E8F8F6,#F0FBF9);border:1.5px solid rgba(0,191,165,0.25);border-radius:16px;padding:18px;display:flex;gap:14px;align-items:flex-start;">
      <div style="font-size:28px;flex-shrink:0;animation:fb_float 3s ease-in-out infinite;">🐾</div>
      <div>
        <div style="font-size:14px;font-weight:800;color:#00897B;margin-bottom:4px;">핏불 분석 준비 완료!</div>
        <div style="font-size:13px;color:#5A9E98;line-height:1.6;">입력하신 정보를 바탕으로 최적의 운동 프로그램과 추천 트레이너를 찾아드릴게요!</div>
      </div>
    </div>

    <!-- 버튼 -->
    <div style="display:flex;gap:10px;">
      <button type="button" onclick="history.back()" style="flex:1;padding:13px;border-radius:99px;border:1.5px solid #E8EDF5;background:white;color:#5A6480;font-size:14px;font-weight:700;cursor:pointer;font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;" onmouseover="this.style.background='#F7F9FC'" onmouseout="this.style.background='white'">
        ← 이전
      </button>
      <button type="submit" style="flex:2;padding:13px;border-radius:99px;border:none;cursor:pointer;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:15px;font-weight:800;font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 16px rgba(255,107,53,0.3);transition:all 0.2s;display:flex;align-items:center;justify-content:center;gap:8px;" onmouseover="this.style.transform='translateY(-1px)'" onmouseout="this.style.transform='none'">
        🚀 시작하기!
      </button>
    </div>

  </form>
</div>

</body>
</html>
