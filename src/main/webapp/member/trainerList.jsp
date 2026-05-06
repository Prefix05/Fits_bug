<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, dto.member.TrainerDTO" %>
<%

List<TrainerDTO> list = (List<TrainerDTO>) request.getAttribute("trainerList");
if (list == null) list = new ArrayList<>();

String keyword  = request.getParameter("keyword");
String category = request.getParameter("category");
String sort     = request.getParameter("sort");

if (keyword  == null) keyword  = "";
if (category == null) category = "전체";
if (sort     == null) sort     = "recommend";
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>핏츠버그 - 트레이너 찾기</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800;900&family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Noto Sans KR','Nunito',sans-serif;background:#F7F9FC;display:flex;min-height:100vh;}
::-webkit-scrollbar{width:6px;}
::-webkit-scrollbar-thumb{background:#FF6B35;border-radius:99px;}
.trainer-card{background:white;border-radius:20px;overflow:hidden;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.06);transition:all 0.25s ease;}
.trainer-card:hover{box-shadow:0 10px 32px rgba(0,0,0,0.13);transform:translateY(-4px);border-color:rgba(255,107,53,0.3);}
.cat-chip{padding:8px 18px;border-radius:99px;font-size:13px;font-weight:700;cursor:pointer;border:1.5px solid #E8EDF5;background:white;color:#5A6480;transition:all 0.2s;font-family:'Noto Sans KR',sans-serif;display:inline-block;white-space:nowrap;}
.cat-chip:hover{border-color:#FF6B35;color:#FF6B35;}
.cat-chip.active{background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;border-color:transparent;box-shadow:0 3px 12px rgba(255,107,53,0.3);}
.fb-search{flex:1;padding:13px 20px 13px 48px;border-radius:99px;border:2px solid #E8EDF5;background:white;font-family:'Noto Sans KR',sans-serif;font-size:14px;color:#1A1F36;outline:none;transition:all 0.2s;box-shadow:0 2px 8px rgba(0,0,0,0.05);}
.fb-search:focus{border-color:#FF6B35;box-shadow:0 0 0 3px rgba(255,107,53,0.12);}
.fb-search::placeholder{color:#C4CEDE;}
.fb-select{padding:13px 18px;border-radius:99px;border:2px solid #E8EDF5;background:white;font-family:'Noto Sans KR',sans-serif;font-size:14px;color:#1A1F36;outline:none;cursor:pointer;transition:all 0.2s;min-width:120px;}
.fb-select:focus{border-color:#FF6B35;}
.spinner{display:none;width:32px;height:32px;border-radius:50%;border:3px solid #E8EDF5;border-top-color:#FF6B35;animation:spin 0.8s linear infinite;margin:0 auto;}
@keyframes spin{to{transform:rotate(360deg);}}
</style>
</head>
<body>
<jsp:include page="sidebar.jsp"/>

<div style="flex:1;margin-left:260px;padding:32px 36px;max-width:calc(100vw - 260px);">

  <!-- 헤더 -->
  <div style="margin-bottom:28px;display:flex;justify-content:space-between;align-items:flex-end;">
    <div>
      <h1 style="font-size:26px;font-weight:900;color:#1A1F36;letter-spacing:-.5px;">트레이너 찾기 🏋️</h1>
      <p style="font-size:14px;color:#9DA8C0;margin-top:4px;">나에게 딱 맞는 트레이너를 찾아보세요!</p>
    </div>
  </div>

  <!-- 검색 + 정렬 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:20px 24px;margin-bottom:24px;">
    <div style="display:flex;gap:10px;margin-bottom:16px;">
      <div style="position:relative;flex:1;">
        <span class="material-symbols-outlined" style="position:absolute;left:18px;top:50%;transform:translateY(-50%);font-size:20px;color:#9DA8C0;">search</span>
        <input type="text" id="keyword" value="<%=keyword%>" placeholder="트레이너명, 전문 분야 검색..." class="fb-search"
               oninput="debounce(fetchData,400)">
      </div>
      <select id="sort" class="fb-select" onchange="fetchData()">
        <option value="recommend" <%=sort.equals("recommend")?"selected":""%>>⭐ 추천순</option>
        <option value="rating"    <%=sort.equals("rating")   ?"selected":""%>>🏆 평점순</option>
        <option value="price"     <%=sort.equals("price")    ?"selected":""%>>💰 가격순</option>
      </select>
    </div>
    <!-- 카테고리 칩 -->
    <div style="display:flex;gap:8px;flex-wrap:wrap;">
      <% String[] cats = {"전체","근력","다이어트","체형교정","벌크업","재활","필라테스","크로스핏"};
         for (String c : cats) { %>
      <button class="cat-chip <%=c.equals(category)?"active":""%>"
              onclick="setCategory('<%=c%>',this)"><%=c%></button>
      <% } %>
    </div>
  </div>

  <!-- 결과 카운트 + 스피너 -->
  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
    <div style="font-size:14px;color:#5A6480;font-weight:600;">
      총 <span id="countText" style="color:#FF6B35;font-weight:900;"><%=list.size()%></span>명의 트레이너
    </div>
    <div class="spinner" id="spinner"></div>
  </div>

  <!-- 카드 그리드 -->
  <div id="trainerContainer" style="display:grid;grid-template-columns:repeat(4,1fr);gap:18px;">
    <%
    if (list.isEmpty()) {
    %>
    <div style="grid-column:1/-1;text-align:center;padding:80px 20px;">
      <div style="font-size:50px;margin-bottom:16px;">🏋️</div>
      <div style="font-size:18px;font-weight:800;color:#1A1F36;margin-bottom:8px;">등록된 트레이너가 없습니다</div>
      <div style="font-size:14px;color:#9DA8C0;">검색 조건을 변경하거나 나중에 다시 시도해주세요</div>
    </div>
    <%
    } else {
      for (TrainerDTO t : list) {
    %>
    <div class="trainer-card"
         onclick="location.href='<%=contextPath%>/member/trainerDetail?trainerId=<%=t.getId()%>'">

      <!-- 이미지 -->
      <div style="position:relative;overflow:hidden;height:220px;">
        <img src="<%=t.getProfileImg() != null ? t.getProfileImg() : ""%>"
             style="width:100%;height:100%;object-fit:cover;transition:transform 0.3s;"
             onmouseover="this.style.transform='scale(1.05)'"
             onmouseout="this.style.transform='scale(1)'"
             onerror="this.src='https://api.dicebear.com/7.x/avataaars/svg?seed=<%=t.getName()%>'"
             alt="<%=t.getName()%>">

        <!-- 전문 분야 뱃지 -->
        <span style="position:absolute;top:10px;left:10px;padding:5px 12px;border-radius:99px;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:11px;font-weight:800;">
          <%=t.getSpecialty() != null ? t.getSpecialty() : ""%>
        </span>

        <!-- 평점 -->
        <div style="position:absolute;bottom:10px;left:10px;background:rgba(255,255,255,0.95);backdrop-filter:blur(6px);padding:4px 12px;border-radius:99px;display:flex;align-items:center;gap:4px;box-shadow:0 2px 8px rgba(0,0,0,0.12);">
          <span style="color:#FFD166;font-size:13px;">★</span>
          <span style="font-size:13px;font-weight:800;color:#1A1F36;"><%=String.format("%.1f",t.getRating())%></span>
        </div>

        <!-- 매칭률 -->
        <% if (t.getSimilarity() > 0) { %>
        <div style="position:absolute;bottom:10px;right:10px;background:rgba(0,191,165,0.9);color:white;padding:4px 10px;border-radius:99px;font-size:11px;font-weight:700;">
          매칭 <%=String.format("%.0f",t.getSimilarity()*100)%>%
        </div>
        <% } %>
      </div>

      <!-- 카드 내용 -->
      <div style="padding:16px 18px 18px;">
        <h3 style="font-size:15px;font-weight:800;color:#1A1F36;margin-bottom:4px;"><%=t.getName()%></h3>
        <% if (t.getCareer() != null && !t.getCareer().isEmpty()) { %>
        <p style="font-size:12px;color:#9DA8C0;margin-bottom:10px;">📍 <%=t.getCareer()%></p>
        <% } %>

        <!-- 가격 -->
        <div style="display:flex;justify-content:space-between;align-items:center;padding:10px 12px;background:#F7F9FC;border-radius:10px;margin-bottom:12px;">
          <span style="font-size:12px;color:#9DA8C0;font-weight:600;">10회 패키지</span>
          <span style="font-size:15px;font-weight:900;color:#1A1F36;"><%=String.format("%,d",(int)t.getPrice10())%>원</span>
        </div>

        <!-- 상세보기 버튼 -->
        <button style="width:100%;padding:10px;border-radius:12px;border:none;cursor:pointer;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:13px;font-weight:700;font-family:'Noto Sans KR',sans-serif;box-shadow:0 4px 12px rgba(255,107,53,0.3);transition:all 0.2s;"
                onmouseover="this.style.transform='translateY(-1px)'" onmouseout="this.style.transform='none'">
          상세보기 →
        </button>
      </div>
    </div>
    <% } } %>
  </div>

</div>

<script>
let currentCategory = '<%=category%>';
let debounceTimer;

function debounce(fn, delay) {
  clearTimeout(debounceTimer);
  debounceTimer = setTimeout(fn, delay);
}

function setCategory(c, el) {
  currentCategory = c;
  document.querySelectorAll('.cat-chip').forEach(b => b.classList.remove('active'));
  el.classList.add('active');
  fetchData();
}

function fetchData() {
  const kw   = document.getElementById('keyword').value;
  const sort = document.getElementById('sort').value;
  const sp   = document.getElementById('spinner');
  sp.style.display = 'block';

  const url = '<%=contextPath%>/member/trainerList?ajax=true'
    + '&keyword='  + encodeURIComponent(kw)
    + '&sort='     + encodeURIComponent(sort)
    + '&category=' + encodeURIComponent(currentCategory);

  fetch(url)
    .then(r => r.text())
    .then(html => {
      document.getElementById('trainerContainer').innerHTML = html;
      sp.style.display = 'none';
      const cards = document.querySelectorAll('#trainerContainer .trainer-card');
      document.getElementById('countText').innerText = cards.length;
    })
    .catch(() => { sp.style.display = 'none'; });
}
</script>
</body>
</html>
