<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ============================================================
     핏불 신고 모달 (reportModal.jsp)
     ============================================================ -->
<div id="reportModal" style="
  display:none; position:fixed; inset:0; z-index:2000;
  background:rgba(26,31,54,0.55); align-items:center; justify-content:center;
  backdrop-filter:blur(6px);
">
  <div style="
    background:white; border-radius:24px; width:100%; max-width:420px;
    box-shadow:0 12px 40px rgba(0,0,0,0.16);
    animation:fb_modal_in 0.3s ease;
    font-family:'Noto Sans KR','Nunito',sans-serif;
    overflow:hidden;
  ">

    <!-- 상단 아이콘 헤더 -->
    <div style="background:linear-gradient(135deg,#FF4D4D,#FF6B35);padding:28px;text-align:center;">
      <div style="font-size:40px;margin-bottom:8px;">🚨</div>
      <h2 style="font-size:20px;font-weight:900;color:white;margin-bottom:4px;">신고 사유 선택</h2>
      <p style="font-size:13px;color:rgba(255,255,255,0.85);">부적절한 게시글을 신고해 주세요</p>
    </div>

    <!-- 폼 -->
    <form action="report" method="post" style="padding:24px 28px;">
      <input type="hidden" name="postId" id="reportPostId">

      <div style="display:flex;flex-direction:column;gap:10px;margin-bottom:20px;">

        <% String[][] reasons = {{"광고","📢 광고 / 홍보"},{"음란물","🔞 음란물"},{"욕설","💬 욕설 / 비방"},{"개인정보","🔒 개인정보 노출"},{"기타","📝 기타"}}; %>
        <% for(String[] r : reasons){ %>
        <label style="
          display:flex;align-items:center;gap:14px;padding:14px 18px;
          border-radius:12px;border:1.5px solid #E8EDF5;cursor:pointer;
          transition:all 0.2s;
        " onmouseover="this.style.background='#FFF3EE';this.style.borderColor='#FF6B35'" onmouseout="this.style.background='white';this.style.borderColor='#E8EDF5'">
          <input type="radio" name="reason" value="<%= r[0] %>" required style="accent-color:#FF6B35;width:16px;height:16px;" <%= r[0].equals("기타") ? "onclick=\"toggleEtc(true)\"" : "onclick=\"toggleEtc(false)\"" %>>
          <span style="font-size:14px;font-weight:600;color:#1A1F36;"><%= r[1] %></span>
        </label>
        <% } %>

        <!-- 기타 텍스트 -->
        <textarea id="etcBox" name="detail" style="
          display:none;width:100%;padding:12px 16px;border-radius:12px;border:2px solid #E8EDF5;
          font-family:'Noto Sans KR',sans-serif;font-size:14px;color:#1A1F36;
          resize:none;outline:none;min-height:80px;box-sizing:border-box;transition:border-color 0.2s;
        " placeholder="신고 사유를 자세히 입력해주세요..." onfocus="this.style.borderColor='#FF6B35'" onblur="this.style.borderColor='#E8EDF5'"></textarea>
      </div>

      <!-- 버튼 -->
      <div style="display:flex;gap:10px;">
        <button type="button" onclick="closeModal()" style="
          flex:1;padding:13px;border-radius:99px;border:1.5px solid #E8EDF5;
          background:white;color:#5A6480;font-size:14px;font-weight:700;cursor:pointer;
          font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
        " onmouseover="this.style.background='#F7F9FC'" onmouseout="this.style.background='white'">
          취소
        </button>
        <button type="submit" style="
          flex:1;padding:13px;border-radius:99px;border:none;cursor:pointer;
          background:linear-gradient(135deg,#FF4D4D,#FF6B35);color:white;
          font-size:14px;font-weight:800;font-family:'Noto Sans KR',sans-serif;
          box-shadow:0 4px 14px rgba(255,77,77,0.35);transition:all 0.2s;
        " onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform='none'">
          신고하기
        </button>
      </div>
    </form>

  </div>
</div>

<script>
function toggleEtc(show) {
  const el = document.getElementById('etcBox');
  if (el) el.style.display = show ? 'block' : 'none';
}
</script>
