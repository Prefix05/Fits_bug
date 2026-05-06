<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, dto.member.TrainerDTO" %>
<%
List<TrainerDTO> list = (List<TrainerDTO>) request.getAttribute("trainerList");
if (list == null) list = new ArrayList<>();
String contextPath = request.getContextPath();

if (list.isEmpty()) {
%>
<div style="grid-column:1/-1;text-align:center;padding:60px 20px;">
  <div style="font-size:50px;margin-bottom:16px;">🏋️</div>
  <div style="font-size:18px;font-weight:800;color:#1A1F36;margin-bottom:8px;">등록된 트레이너가 없습니다</div>
  <div style="font-size:14px;color:#9DA8C0;">검색 조건을 변경해보세요</div>
</div>
<%
} else {
  for (TrainerDTO t : list) {
%>
<div class="trainer-card"
     onclick="location.href='<%=contextPath%>/member/trainerDetail?trainerId=<%=t.getId()%>'">

  <div style="position:relative;overflow:hidden;height:220px;">
    <img src="<%=t.getProfileImg() != null ? t.getProfileImg() : ""%>"
         style="width:100%;height:100%;object-fit:cover;transition:transform 0.3s;"
         onerror="this.src='https://api.dicebear.com/7.x/avataaars/svg?seed=<%=t.getName()%>'"
         alt="<%=t.getName()%>">
    <span style="position:absolute;top:10px;left:10px;padding:5px 12px;border-radius:99px;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:11px;font-weight:800;">
      <%=t.getSpecialty() != null ? t.getSpecialty() : ""%>
    </span>
    <div style="position:absolute;bottom:10px;left:10px;background:rgba(255,255,255,0.95);backdrop-filter:blur(6px);padding:4px 12px;border-radius:99px;box-shadow:0 2px 8px rgba(0,0,0,0.12);">
      <span style="color:#FFD166;font-size:13px;">★</span>
      <span style="font-size:13px;font-weight:800;color:#1A1F36;"><%=String.format("%.1f",t.getRating())%></span>
    </div>
    <% if (t.getSimilarity() > 0) { %>
    <div style="position:absolute;bottom:10px;right:10px;background:rgba(0,191,165,0.9);color:white;padding:4px 10px;border-radius:99px;font-size:11px;font-weight:700;">
      매칭 <%=String.format("%.0f",t.getSimilarity()*100)%>%
    </div>
    <% } %>
  </div>

  <div style="padding:16px 18px 18px;">
    <h3 style="font-size:15px;font-weight:800;color:#1A1F36;margin-bottom:4px;"><%=t.getName()%></h3>
    <% if (t.getCareer() != null && !t.getCareer().isEmpty()) { %>
    <p style="font-size:12px;color:#9DA8C0;margin-bottom:10px;">📍 <%=t.getCareer()%></p>
    <% } %>
    <div style="display:flex;justify-content:space-between;align-items:center;padding:10px 12px;background:#F7F9FC;border-radius:10px;margin-bottom:12px;">
      <span style="font-size:12px;color:#9DA8C0;font-weight:600;">10회 패키지</span>
      <span style="font-size:15px;font-weight:900;color:#1A1F36;"><%=String.format("%,d",(int)t.getPrice10())%>원</span>
    </div>
    <button style="width:100%;padding:10px;border-radius:12px;border:none;cursor:pointer;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:13px;font-weight:700;font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 12px rgba(255,107,53,0.3);transition:all 0.2s;"
            onmouseover="this.style.transform='translateY(-1px)'" onmouseout="this.style.transform='none'">
      상세보기 →
    </button>
  </div>
</div>
<% } } %>
