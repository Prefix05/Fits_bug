<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, dto.member.GymDTO" %>
<%
List<GymDTO> list = (List<GymDTO>) request.getAttribute("gymList");
GymDTO g1 = new GymDTO();
g1.setGymId(1);
g1.setName("핏츠 강남 PT 센터");
g1.setImage("https://images.unsplash.com/photo-1571902943202-507ec2618e8f");
g1.setSpecialty("다이어트");
g1.setRating(4.8);
g1.setDistance(0.8);
g1.setScore(9.2);
g1.setPrice(120000);
list.add(g1);

GymDTO g2 = new GymDTO();
g2.setGymId(2);
g2.setName("바디핏 크로스핏 박스");
g2.setImage("https://images.unsplash.com/photo-1534438327276-14e5300c3a48");
g2.setSpecialty("크로스핏");
g2.setRating(4.6);
g2.setDistance(1.4);
g2.setScore(8.7);
g2.setPrice(99000);
list.add(g2);

GymDTO g3 = new GymDTO();
g3.setGymId(3);
g3.setName("핏불 체형교정 스튜디오");
g3.setImage("https://images.unsplash.com/photo-1517836357463-d25dfeac3438");
g3.setSpecialty("체형교정");
g3.setRating(4.9);
g3.setDistance(0.5);
g3.setScore(9.8);
g3.setPrice(150000);
list.add(g3);

GymDTO g4 = new GymDTO();
g4.setGymId(4);
g4.setName("서울 재활 트레이닝 센터");
g4.setImage("https://images.unsplash.com/photo-1571019613914-85f342c6a1f6");
g4.setSpecialty("재활");
g4.setRating(4.7);
g4.setDistance(2.1);
g4.setScore(8.9);
g4.setPrice(110000);
list.add(g4);

GymDTO g5 = new GymDTO();
g5.setGymId(5);
g5.setName("머슬업 벌크업 짐");
g5.setImage("https://images.unsplash.com/photo-1534438327276-9d5b3a2a1f7b");
g5.setSpecialty("근력");
g5.setRating(4.5);
g5.setDistance(3.2);
g5.setScore(8.3);
g5.setPrice(89000);
list.add(g5);

GymDTO g6 = new GymDTO();
g6.setGymId(6);
g6.setName("요가 & 필라테스 스튜디오");
g6.setImage("https://images.unsplash.com/photo-1554284126-aa88f22d8b74");
g6.setSpecialty("필라테스");
g6.setRating(4.9);
g6.setDistance(1.0);
g6.setScore(9.5);
g6.setPrice(130000);
list.add(g6);

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
<title>핏츠버그 - 헬스장 찾기</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700;800;900&family=Noto+Sans+KR:wght@400;500;700;900&display=swap" rel="stylesheet">
<!-- 카카오 지도 API -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_KEY"></script>
<style>
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
body {
  font-family: 'Noto Sans KR', 'Nunito', sans-serif;
  background: #F7F9FC;
  display: flex;
  min-height: 100vh;
}
::-webkit-scrollbar { width: 6px; }
::-webkit-scrollbar-thumb { background: #00BFA5; border-radius: 99px; }

/* ── 헬스장 카드 ── */
.gym-card {
  background: white;
  border-radius: 20px;
  overflow: hidden;
  border: 1.5px solid #E8EDF5;
  box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  transition: all 0.25s ease;
}
.gym-card:hover {
  box-shadow: 0 10px 32px rgba(0,0,0,0.13);
  transform: translateY(-4px);
  border-color: rgba(0,191,165,0.3);
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
  white-space: nowrap;
}
.cat-chip:hover  { border-color: #00BFA5; color: #00BFA5; }
.cat-chip.active {
  background: linear-gradient(135deg, #00BFA5, #26D4BB);
  color: white;
  border-color: transparent;
  box-shadow: 0 3px 12px rgba(0,191,165,0.3);
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
.fb-search:focus { border-color: #00BFA5; box-shadow: 0 0 0 3px rgba(0,191,165,0.12); }
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
  min-width: 120px;
}
.fb-select:focus { border-color: #00BFA5; }

/* ── 로딩 스피너 ── */
.fb-spinner {
  display: none;
  width: 36px; height: 36px;
  border-radius: 50%;
  border: 3px solid #E8EDF5;
  border-top-color: #00BFA5;
  animation: spin 0.8s linear infinite;
}
@keyframes spin { to { transform: rotate(360deg); } }

/* ── 평점 별 ── */
.star-full  { color: #FFD166; }
.star-empty { color: #E8EDF5; }
</style>
</head>

<body>

<!-- 사이드바 -->
<jsp:include page="sidebar.jsp" />

<!-- 메인 -->
<div style="flex:1; margin-left:260px; padding:32px 36px; max-width:calc(100vw - 260px);">

  <!-- 헤더 -->
  <div style="margin-bottom:28px;">
    <h1 style="font-size:26px;font-weight:900;color:#1A1F36;letter-spacing:-0.5px;">헬스장 찾기 🏢</h1>
    <p style="font-size:14px;color:#9DA8C0;margin-top:4px;">내 주변 파트너 헬스장을 찾아보세요!</p>
  </div>

  <!-- 검색 + 필터 섹션 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:20px 24px;margin-bottom:24px;">

    <!-- 검색창 + 정렬 -->
    <form id="searchForm" style="display:flex;gap:10px;margin-bottom:16px;">
      <div style="position:relative;flex:1;">
        <span class="material-symbols-outlined" style="position:absolute;left:18px;top:50%;transform:translateY(-50%);font-size:20px;color:#9DA8C0;">search</span>
        <input type="text" id="keyword" value="<%= keyword %>"
               placeholder="헬스장 이름, 주소로 검색..." class="fb-search">
      </div>
      <select id="sort" class="fb-select">
        <option value="recommend" <%= sort.equals("recommend") ? "selected" : "" %>>⭐ 추천순</option>
        <option value="distance"  <%= sort.equals("distance")  ? "selected" : "" %>>📍 거리순</option>
        <option value="rating"    <%= sort.equals("rating")    ? "selected" : "" %>>🏆 평점순</option>
      </select>
    </form>

    <!-- 카테고리 칩 -->
    <div style="display:flex;gap:8px;flex-wrap:wrap;align-items:center;">
      <span style="font-size:12px;font-weight:700;color:#9DA8C0;margin-right:4px;">전문분야</span>
      <% String[] cats = {"전체","다이어트","근력","체형교정","재활","필라테스","크로스핏"};
         for(String c : cats){ %>
      <button class="cat-chip <%= c.equals(category) ? "active" : "" %>"
              onclick="setCategory('<%= c %>', this)"><%= c %></button>
      <% } %>
    </div>

  </div>

  <!-- 내 위치 안내 바 -->
  <div id="locationBar" style="display:none;background:linear-gradient(135deg,#E8F8F6,#F0FBF9);border:1.5px solid rgba(0,191,165,0.2);border-radius:14px;padding:12px 18px;margin-bottom:18px;display:flex;align-items:center;gap:10px;">
    <span class="material-symbols-outlined" style="font-size:20px;color:#00BFA5;">location_on</span>
    <span style="font-size:13px;font-weight:600;color:#00897B;">내 위치 기준으로 가까운 헬스장을 표시하고 있어요</span>
    <div class="fb-spinner" id="locSpinner"></div>
  </div>

  <!-- 결과 카운트 + 뷰 전환 -->
  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
    <div style="font-size:14px;color:#5A6480;font-weight:600;">
      총 <span id="countText" style="color:#00BFA5;font-weight:900;">0</span>개 헬스장
    </div>
    <div id="spinner" class="fb-spinner" style="display:none;"></div>
  </div>

  <!-- 카드 그리드 -->
  <div id="gymContainer" style="display:grid;grid-template-columns:repeat(4,1fr);gap:18px;">

  <% if(list != null) { for(GymDTO g : list) { %>
  <div class="gym-card">
    <!-- 이미지 -->
    <div style="position:relative;overflow:hidden;">
      <img src="<%= g.getImage() %>"
           style="width:100%;height:200px;object-fit:cover;transition:transform 0.3s ease;"
           onmouseover="this.style.transform='scale(1.05)'"
           onmouseout="this.style.transform='scale(1)'"
           onerror="this.src='https://via.placeholder.com/400x200?text=헬스장'"
           alt="<%= g.getName() %>">

      <!-- 전문분야 뱃지 -->
      <div style="position:absolute;top:10px;left:10px;">
        <span style="padding:5px 12px;border-radius:99px;background:linear-gradient(135deg,#00BFA5,#26D4BB);color:white;font-size:11px;font-weight:800;backdrop-filter:blur(4px);">
          <%= g.getSpecialty() %>
        </span>
      </div>

      <!-- 평점 -->
      <div style="position:absolute;bottom:10px;left:10px;background:rgba(255,255,255,0.95);backdrop-filter:blur(6px);padding:5px 12px;border-radius:99px;display:flex;align-items:center;gap:4px;box-shadow:0 2px 8px rgba(0,0,0,0.12);">
        <span style="color:#FFD166;font-size:13px;">★</span>
        <span style="font-size:13px;font-weight:800;color:#1A1F36;"><%= g.getRating() %></span>
      </div>

      <!-- 거리 -->
      <div style="position:absolute;bottom:10px;right:10px;background:rgba(255,255,255,0.95);backdrop-filter:blur(6px);padding:5px 12px;border-radius:99px;box-shadow:0 2px 8px rgba(0,0,0,0.12);">
        <span style="font-size:12px;font-weight:700;color:#5A6480;">📍 <%= String.format("%.2f", g.getDistance()) %>km</span>
      </div>
    </div>

    <!-- 카드 내용 -->
    <div style="padding:16px 18px 18px;">
      <h3 style="font-size:15px;font-weight:800;color:#1A1F36;margin-bottom:6px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
        <%= g.getName() %>
      </h3>

      <!-- 추천 점수 게이지 -->
      <div style="margin-bottom:10px;">
        <div style="display:flex;justify-content:space-between;font-size:11px;margin-bottom:4px;">
          <span style="font-weight:600;color:#9DA8C0;">추천 점수</span>
          <span style="font-weight:800;color:#00BFA5;"><%= String.format("%.1f", g.getScore()) %></span>
        </div>
        <div style="height:5px;background:#F0F0F0;border-radius:99px;overflow:hidden;">
          <div style="width:<%= Math.min(100, (int)(g.getScore()*10)) %>%;height:100%;background:linear-gradient(90deg,#00BFA5,#26D4BB);border-radius:99px;"></div>
        </div>
      </div>

      <!-- 이용권 가격 -->
      <div style="display:flex;justify-content:space-between;align-items:center;padding:10px 12px;background:#F7F9FC;border-radius:10px;margin-bottom:12px;">
        <span style="font-size:12px;color:#9DA8C0;font-weight:600;">월 이용권</span>
        <span style="font-size:15px;font-weight:900;color:#1A1F36;"><%= String.format("%,d", (int)g.getPrice()) %>원</span>
      </div>

      <!-- 상세보기 버튼 -->
      <a href="gymDetail?gymId=<%= g.getGymId() %>" style="
        display:flex;align-items:center;justify-content:center;gap:6px;
        width:100%;padding:10px;border-radius:12px;
        background:linear-gradient(135deg,#00BFA5,#26D4BB);
        color:white;text-decoration:none;font-size:13px;font-weight:700;
        box-shadow:0 4px 12px rgba(0,191,165,0.3);transition:all 0.2s;
      " onmouseover="this.style.transform='translateY(-1px)'" onmouseout="this.style.transform='none'">
        <span class="material-symbols-outlined" style="font-size:16px;">store</span>
        상세보기
      </a>
    </div>
  </div>
  <% } } %>

  </div><!-- end gymContainer -->

  <!-- 빈 상태 -->
  <div id="emptyState" style="display:none;text-align:center;padding:80px 20px;">
    <div style="font-size:60px;margin-bottom:16px;">🏋️</div>
    <div style="font-size:18px;font-weight:800;color:#1A1F36;margin-bottom:8px;">주변에 헬스장이 없어요</div>
    <div style="font-size:14px;color:#9DA8C0;">다른 검색어나 카테고리로 찾아보세요!</div>
  </div>

</div>

<script>
var lat = null;
var lng = null;
var currentCategory = '<%= category %>';
var debounceTimer;

/* ── 위치 가져오기 ── */
navigator.geolocation.getCurrentPosition(function(pos) {
  lat = pos.coords.latitude;
  lng = pos.coords.longitude;
  document.getElementById('locationBar').style.display = 'flex';
  fetchData();
}, function() {
  fetchData();
});

/* ── 카운트 업데이트 ── */
function updateCount() {
  var cards = document.querySelectorAll('#gymContainer .gym-card');
  document.getElementById('countText').innerText = cards.length;
  document.getElementById('emptyState').style.display = cards.length === 0 ? 'block' : 'none';
}

/* ── 카테고리 선택 ── */
function setCategory(c, el) {
  currentCategory = c;
  document.querySelectorAll('.cat-chip').forEach(function(btn) { btn.classList.remove('active'); });
  el.classList.add('active');
  fetchData();
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

  var url = 'gymList?ajax=true' +
    '&keyword=' + encodeURIComponent(keyword) +
    '&sort=' + encodeURIComponent(sort) +
    '&category=' + encodeURIComponent(currentCategory) +
    (lat != null ? '&lat=' + lat + '&lng=' + lng : '');

  spinner.style.display = 'block';

  fetch(url)
    .then(function(res) { return res.text(); })
    .then(function(html) {
      document.getElementById('gymContainer').innerHTML = html;
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
