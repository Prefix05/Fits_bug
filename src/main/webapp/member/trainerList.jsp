<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, dto.TrainerDTO" %>
<%
List<TrainerDTO> list = (List<TrainerDTO>) request.getAttribute("trainerList.jsp");
if(list == null) {
    list = new ArrayList<>();

    TrainerDTO t1 = new TrainerDTO();
    t1.setTrainerId(1);
    t1.setName("김트레이너");
    t1.setSpecialty("근력");
    t1.setCareer("스포애니");
    t1.setRating(4.8);
    t1.setSimilarity(0.92);
    t1.setPrice10(300000);
    t1.setPrice1(40000);
    t1.setProfileImg("https://images.unsplash.com/photo-1550345332-09e3ac987658");
    list.add(t1);

    TrainerDTO t2 = new TrainerDTO();
    t2.setTrainerId(2);
    t2.setName("이코치");
    t2.setSpecialty("다이어트");
    t2.setCareer("커브스");
    t2.setRating(4.6);
    t2.setSimilarity(0.85);
    t2.setPrice10(280000);
    t2.setPrice1(35000);
    t2.setProfileImg("https://images.unsplash.com/photo-1599058917765-a780eda07a3e");
    list.add(t2);

    TrainerDTO t3 = new TrainerDTO();
    t3.setTrainerId(3);
    t3.setName("박PT");
    t3.setSpecialty("체형교정");
    t3.setCareer("");
    t3.setRating(4.9);
    t3.setSimilarity(0.78);
    t3.setPrice10(350000);
    t3.setPrice1(50000);
    t3.setProfileImg("https://images.unsplash.com/photo-1605296867304-46d5465a13f1");
    list.add(t3);

    TrainerDTO t4 = new TrainerDTO();
    t4.setTrainerId(4);
    t4.setName("최트레이너");
    t4.setSpecialty("벌크업");
    t4.setCareer("피트니스랩");
    t4.setRating(4.7);
    t4.setSimilarity(0.88);
    t4.setPrice10(320000);
    t4.setPrice1(45000);
    t4.setProfileImg("https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b");
    list.add(t4);
}

String keyword  = request.getParameter("keyword");
String category = request.getParameter("category");
String sort     = request.getParameter("sort");

if (keyword  == null) keyword  = "";
if (category == null) category = "전체";
if (sort     == null) sort     = "recommend";
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
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
body {
  font-family: 'Noto Sans KR', 'Nunito', sans-serif;
  background: #F7F9FC;
  display: flex;
  min-height: 100vh;
}
::-webkit-scrollbar { width: 6px; }
::-webkit-scrollbar-thumb { background: #FF6B35; border-radius: 99px; }

/* ── 트레이너 카드 ── */
.trainer-card {
  background: white;
  border-radius: 20px;
  overflow: hidden;
  border: 1.5px solid #E8EDF5;
  box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  transition: all 0.25s ease;
}
.trainer-card:hover {
  box-shadow: 0 10px 32px rgba(0,0,0,0.13);
  transform: translateY(-4px);
  border-color: rgba(255,107,53,0.3);
}

/* ── 카테고리 칩 ── */
.cat-chip {
  padding: 8px 18px;
  border-radius: 99px;
  font-size: 13px;
  font-weight: 700;
  cursor: pointer;
  border: 1.5px solid #E8EDF5;
  background: white;
  color: #5A6480;
  transition: all 0.2s;
  font-family: 'Noto Sans KR', sans-serif;
  text-decoration: none;
  display: inline-block;
  white-space: nowrap;
}
.cat-chip:hover  { border-color: #FF6B35; color: #FF6B35; }
.cat-chip.active {
  background: linear-gradient(135deg, #FF6B35, #FF8C5A);
  color: white;
  border-color: transparent;
  box-shadow: 0 3px 12px rgba(255,107,53,0.3);
}

/* ── 검색 인풋 ── */
.fb-search {
  flex: 1;
  padding: 13px 20px 13px 48px;
  border-radius: 99px;
  border: 2px solid #E8EDF5;
  background: white;
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 14px;
  color: #1A1F36;
  outline: none;
  transition: all 0.2s;
  box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}
.fb-search:focus { border-color: #FF6B35; box-shadow: 0 0 0 3px rgba(255,107,53,0.12); }
.fb-search::placeholder { color: #C4CEDE; }

/* ── 정렬 셀렉트 ── */
.fb-select {
  padding: 13px 18px;
  border-radius: 99px;
  border: 2px solid #E8EDF5;
  background: white;
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 14px;
  color: #1A1F36;
  outline: none;
  cursor: pointer;
  transition: all 0.2s;
  min-width: 130px;
}
.fb-select:focus { border-color: #FF6B35; }

/* ── 로딩 스피너 ── */
.fb-spinner {
  width: 36px; height: 36px;
  border-radius: 50%;
  border: 3px solid #E8EDF5;
  border-top-color: #FF6B35;
  animation: spin 0.8s linear infinite;
}
@keyframes spin { to { transform: rotate(360deg); } }

/* ── 적합도 게이지 ── */
.similarity-bar {
  height: 5px;
  background: #F0F0F0;
  border-radius: 99px;
  overflow: hidden;
}
.similarity-fill {
  height: 100%;
  background: linear-gradient(90deg, #FF6B35, #FFD166);
  border-radius: 99px;
}
</style>
</head>

<body>

<!-- 사이드바 -->
<jsp:include page="sidebar.jsp" />

<!-- 메인 -->
<div style="flex:1; margin-left:260px; padding:32px 36px; max-width:calc(100vw - 260px);">

  <!-- 헤더 -->
  <div style="margin-bottom:28px;">
    <h1 style="font-size:26px;font-weight:900;color:#1A1F36;letter-spacing:-0.5px;">트레이너 찾기 🏋️</h1>
    <p style="font-size:14px;color:#9DA8C0;margin-top:4px;">나에게 딱 맞는 트레이너를 AI가 추천해드려요!</p>
  </div>

  <!-- 검색 + 필터 섹션 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:20px 24px;margin-bottom:24px;">

    <!-- 검색창 + 정렬 -->
    <form id="searchForm" method="get" action="trainerList" style="display:flex;gap:10px;margin-bottom:16px;">
      <div style="position:relative;flex:1;">
        <span class="material-symbols-outlined" style="position:absolute;left:18px;top:50%;transform:translateY(-50%);font-size:20px;color:#9DA8C0;">search</span>
        <input type="text" name="keyword" id="keyword"
               value="<%= keyword %>"
               placeholder="트레이너 이름, 전문분야 검색..."
               class="fb-search">
      </div>
      <select name="sort" id="sort" class="fb-select">
        <option value="recommend" <%= sort.equals("recommend") ? "selected" : "" %>>⭐ 추천순</option>
        <option value="rating"    <%= sort.equals("rating")    ? "selected" : "" %>>🏆 평점순</option>
        <option value="price"     <%= sort.equals("price")     ? "selected" : "" %>>💰 가격순</option>
      </select>
    </form>

    <!-- 카테고리 칩 -->
    <div style="display:flex;gap:8px;flex-wrap:wrap;align-items:center;">
      <span style="font-size:12px;font-weight:700;color:#9DA8C0;margin-right:4px;">전문분야</span>
      <%
      String[] cats = {"전체","다이어트","근력","체형교정","재활","필라테스","벌크업"};
      for(String c : cats) {
      %>
      <a href="trainerList?category=<%= c %>&keyword=<%= keyword %>&sort=<%= sort %>"
         class="cat-chip <%= c.equals(category) ? "active" : "" %>">
        <%= c %>
      </a>
      <% } %>
    </div>

  </div>

  <!-- AI 추천 안내 배너 -->
  <div style="background:linear-gradient(135deg,#FFF3EE,#FFEEE5);border:1.5px solid rgba(255,107,53,0.2);border-radius:16px;padding:14px 20px;margin-bottom:20px;display:flex;align-items:center;gap:14px;">
    <div style="font-size:32px;flex-shrink:0;">🐾</div>
    <div>
      <div style="font-size:14px;font-weight:800;color:#FF6B35;margin-bottom:2px;">핏불 AI 맞춤 추천!</div>
      <div style="font-size:13px;color:#5A6480;">내 운동 목표와 수준에 꼭 맞는 트레이너를 자동으로 분석해드려요. 적합도가 높을수록 나와 잘 맞아요!</div>
    </div>
  </div>

  <!-- 결과 카운트 + 스피너 -->
  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
    <div style="font-size:14px;color:#5A6480;font-weight:600;">
      총 <span id="countText" style="color:#FF6B35;font-weight:900;">0</span>명 트레이너
    </div>
    <div id="spinner" style="display:none;" class="fb-spinner"></div>
  </div>

  <!-- 카드 그리드 -->
  <div id="trainerContainer" style="display:grid;grid-template-columns:repeat(4,1fr);gap:18px;">

  <% if(list != null) { for(TrainerDTO t : list) {
     int similarityPct = (int)(t.getSimilarity() * 100);
  %>
  <div class="trainer-card">

    <!-- 이미지 영역 -->
    <div style="position:relative;overflow:hidden;">
      <img src="<%= t.getProfileImg() %>"
           style="width:100%;height:210px;object-fit:cover;transition:transform 0.3s ease;"
           onmouseover="this.style.transform='scale(1.05)'"
           onmouseout="this.style.transform='scale(1)'"
           onerror="this.src='https://api.dicebear.com/7.x/avataaars/svg?seed=<%= t.getName() %>'"
           alt="<%= t.getName() %>">

      <!-- 전문분야 뱃지 -->
      <div style="position:absolute;top:10px;left:10px;">
        <span style="padding:5px 12px;border-radius:99px;background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;font-size:11px;font-weight:800;">
          <%= t.getSpecialty() %>
        </span>
      </div>

      <!-- 평점 -->
      <div style="position:absolute;bottom:10px;left:10px;background:rgba(255,255,255,0.95);backdrop-filter:blur(6px);padding:5px 12px;border-radius:99px;display:flex;align-items:center;gap:4px;box-shadow:0 2px 8px rgba(0,0,0,0.12);">
        <span style="color:#FFD166;font-size:13px;">★</span>
        <span style="font-size:13px;font-weight:800;color:#1A1F36;"><%= t.getRating() %></span>
      </div>

      <!-- 적합도 뱃지 (높으면 강조) -->
      <% if(similarityPct >= 80) { %>
      <div style="position:absolute;top:10px;right:10px;background:linear-gradient(135deg,#FFD166,#FF8C5A);padding:5px 12px;border-radius:99px;box-shadow:0 2px 8px rgba(0,0,0,0.1);">
        <span style="font-size:11px;font-weight:800;color:white;">🔥 강추</span>
      </div>
      <% } %>
    </div>

    <!-- 카드 내용 -->
    <div style="padding:16px 18px 18px;">

      <!-- 이름 + 소속 -->
      <h3 style="font-size:16px;font-weight:900;color:#1A1F36;margin-bottom:4px;">
        <%= t.getName() %> 트레이너
      </h3>
      <p style="font-size:12px;color:#9DA8C0;margin-bottom:12px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
        <%= (t.getCareer() == null || t.getCareer().equals(""))
            ? "개인 트레이너"
            : t.getCareer() + " 소속" %>
      </p>

      <!-- 적합도 게이지 -->
      <div style="margin-bottom:12px;">
        <div style="display:flex;justify-content:space-between;font-size:11px;margin-bottom:5px;">
          <span style="font-weight:700;color:#9DA8C0;">AI 추천 적합도</span>
          <span style="font-weight:900;color:#FF6B35;"><%= similarityPct %>%</span>
        </div>
        <div class="similarity-bar">
          <div class="similarity-fill" style="width:<%= similarityPct %>%;"></div>
        </div>
      </div>

      <!-- 가격 -->
      <div style="background:#F7F9FC;border-radius:12px;padding:10px 14px;margin-bottom:14px;">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:4px;">
          <span style="font-size:12px;color:#9DA8C0;font-weight:600;">10회 패키지</span>
          <span style="font-size:15px;font-weight:900;color:#1A1F36;"><%= String.format("%,d", (int)t.getPrice10()) %>원</span>
        </div>
        <div style="display:flex;justify-content:space-between;align-items:center;">
          <span style="font-size:12px;color:#9DA8C0;font-weight:600;">1회 체험</span>
          <span style="font-size:13px;font-weight:700;color:#5A6480;"><%= String.format("%,d", (int)t.getPrice1()) %>원</span>
        </div>
      </div>

      <!-- 상세보기 버튼 -->
      <a href="trainerDetail?trainerId=<%= t.getTrainerId() %>" style="
        display:flex;align-items:center;justify-content:center;gap:6px;
        width:100%;padding:11px;border-radius:12px;
        background:linear-gradient(135deg,#FF6B35,#FF8C5A);
        color:white;text-decoration:none;font-size:13px;font-weight:800;
        box-shadow:0 4px 14px rgba(255,107,53,0.3);transition:all 0.2s;
      " onmouseover="this.style.transform='translateY(-1px)'" onmouseout="this.style.transform='none'">
        <span class="material-symbols-outlined" style="font-size:16px;">badge</span>
        상세보기 & PT 신청
      </a>

    </div>
  </div>
  <% } } %>

  </div><!-- end trainerContainer -->

  <!-- 빈 상태 -->
  <div id="emptyState" style="display:none;text-align:center;padding:80px 20px;">
    <div style="font-size:60px;margin-bottom:16px;">🔍</div>
    <div style="font-size:18px;font-weight:800;color:#1A1F36;margin-bottom:8px;">조건에 맞는 트레이너가 없어요</div>
    <div style="font-size:14px;color:#9DA8C0;">다른 키워드나 카테고리로 찾아보세요!</div>
  </div>

</div><!-- end content -->

<script>
var debounceTimer;

/* ── 카운트 업데이트 ── */
function updateCount() {
  var cards = document.querySelectorAll('#trainerContainer .trainer-card');
  document.getElementById('countText').innerText = cards.length;
  document.getElementById('emptyState').style.display = cards.length === 0 ? 'block' : 'none';
}

/* ── 검색 debounce ── */
document.getElementById('keyword').addEventListener('input', function() {
  clearTimeout(debounceTimer);
  debounceTimer = setTimeout(fetchData, 400);
});

/* ── 정렬 변경 ── */
document.getElementById('sort').addEventListener('change', fetchData);

/* ── fetch ── */
function fetchData() {
  var keyword = document.getElementById('keyword').value;
  var sort    = document.getElementById('sort').value;
  var spinner = document.getElementById('spinner');

  var url = 'trainerList?ajax=true' +
    '&keyword=' + encodeURIComponent(keyword) +
    '&sort=' + encodeURIComponent(sort);

  spinner.style.display = 'block';

  fetch(url)
    .then(function(res) { return res.text(); })
    .then(function(html) {
      document.getElementById('trainerContainer').innerHTML = html;
      spinner.style.display = 'none';
      updateCount();
    })
    .catch(function() { spinner.style.display = 'none'; });
}

/* 초기화 */
window.onload = function() { updateCount(); };
</script>

</body>
</html>
