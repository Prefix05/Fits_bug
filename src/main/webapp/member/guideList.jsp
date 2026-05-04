<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, dto.ExerciseDTO" %>
<%
List<ExerciseDTO> list = (List<ExerciseDTO>) request.getAttribute("guideList");
if(list == null) {
    list = new ArrayList<>();

    ExerciseDTO e1 = new ExerciseDTO();
    e1.setName("스쿼트");
    e1.setDescription("하체 근력과 코어를 동시에 강화하는 대표 운동입니다.");
    e1.setMuscle("하체");
    e1.setDifficulty("초급");
    e1.setThumbnail("https://via.placeholder.com/320x160?text=Squat");
    e1.setGifUrl("https://via.placeholder.com/220x145?text=GIF");
    e1.setYoutubeUrl("https://www.youtube.com/embed/dummy1");
    list.add(e1);

    ExerciseDTO e2 = new ExerciseDTO();
    e2.setName("벤치프레스");
    e2.setDescription("가슴 근육을 집중적으로 발달시키는 상체 운동입니다.");
    e2.setMuscle("가슴");
    e2.setDifficulty("중급");
    e2.setThumbnail("https://via.placeholder.com/320x160?text=Bench");
    e2.setGifUrl("https://via.placeholder.com/220x145?text=GIF");
    e2.setYoutubeUrl("https://www.youtube.com/embed/dummy2");
    list.add(e2);

    ExerciseDTO e3 = new ExerciseDTO();
    e3.setName("데드리프트");
    e3.setDescription("전신 근력을 사용하는 대표 복합 운동입니다.");
    e3.setMuscle("등");
    e3.setDifficulty("고급");
    e3.setThumbnail("https://via.placeholder.com/320x160?text=Deadlift");
    e3.setGifUrl("https://via.placeholder.com/220x145?text=GIF");
    e3.setYoutubeUrl("https://www.youtube.com/embed/dummy3");
    list.add(e3);

    ExerciseDTO e4 = new ExerciseDTO();
    e4.setName("풀업");
    e4.setDescription("등과 팔 근력을 동시에 키우는 맨몸 운동입니다.");
    e4.setMuscle("등");
    e4.setDifficulty("중급");
    e4.setThumbnail("https://via.placeholder.com/320x160?text=Pull+Up");
    e4.setGifUrl("https://via.placeholder.com/220x145?text=GIF");
    e4.setYoutubeUrl("https://www.youtube.com/embed/dummy4");
    list.add(e4);
}
%>
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>핏츠버그 - 운동 가이드</title>
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
::-webkit-scrollbar-thumb { background: #00BFA5; border-radius: 99px; }

/* ── 운동 카드 ── */
.ex-card {
  background: white;
  border-radius: 18px;
  overflow: hidden;
  border: 1.5px solid #E8EDF5;
  box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  cursor: pointer;
  transition: all 0.25s ease;
}
.ex-card:hover {
  box-shadow: 0 8px 28px rgba(0,0,0,0.12);
  transform: translateY(-4px);
  border-color: rgba(255,107,53,0.3);
}
.ex-card.selected {
  border-color: #FF6B35;
  box-shadow: 0 0 0 3px rgba(255,107,53,0.15), 0 8px 28px rgba(0,0,0,0.12);
}

/* ── 난이도 뱃지 ── */
.badge-easy   { background: #E8F8F6; color: #00897B; }
.badge-normal { background: #FFF9E6; color: #B7791F; }
.badge-hard   { background: #FFF3EE; color: #FF4D1F; }

/* ── 필터 칩 ── */
.filter-chip {
  padding: 7px 18px;
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
.filter-chip:hover  { border-color: #FF6B35; color: #FF6B35; }
.filter-chip.active {
  background: linear-gradient(135deg, #FF6B35, #FF8C5A);
  color: white;
  border-color: transparent;
  box-shadow: 0 3px 12px rgba(255,107,53,0.3);
}

/* ── 하단 상세 패널 ── */
.detail-panel {
  position: fixed;
  bottom: 0; left: 260px; right: 0;
  background: white;
  border-top: 2px solid #E8EDF5;
  box-shadow: 0 -8px 32px rgba(0,0,0,0.12);
  padding: 24px 36px;
  transform: translateY(100%);
  transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  z-index: 200;
}
.detail-panel.show { transform: translateY(0); }

/* ── 유튜브 모달 ── */
.modal-overlay {
  display: none;
  position: fixed;
  inset: 0;
  background: rgba(26,31,54,0.6);
  z-index: 1000;
  align-items: center;
  justify-content: center;
  backdrop-filter: blur(6px);
}
.modal-overlay.open { display: flex; }
@keyframes fb_modal_in {
  from { opacity: 0; transform: scale(0.9) translateY(20px); }
  to   { opacity: 1; transform: scale(1) translateY(0); }
}

/* ── 입력 ── */
.fb-search {
  width: 100%;
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

/* 스켈레톤 로딩 */
@keyframes shimmer {
  0%   { background-position: -400px 0; }
  100% { background-position: 400px 0; }
}
.skeleton {
  background: linear-gradient(90deg, #F0F0F0 25%, #E8E8E8 50%, #F0F0F0 75%);
  background-size: 400px 100%;
  animation: shimmer 1.4s infinite;
  border-radius: 10px;
}
</style>
</head>

<body>

<!-- 사이드바 -->
<jsp:include page="sidebar.jsp" />

<!-- 메인 -->
<div style="flex:1; margin-left:260px; padding:32px 36px; max-width:calc(100vw - 260px);">

  <!-- 페이지 헤더 -->
  <div style="margin-bottom:28px;">
    <h1 style="font-size:26px;font-weight:900;color:#1A1F36;letter-spacing:-0.5px;">운동 가이드 💪</h1>
    <p style="font-size:14px;color:#9DA8C0;margin-top:4px;">올바른 자세와 방법으로 효과적인 운동을 시작해보세요!</p>
  </div>

  <!-- 검색 + 필터 행 -->
  <div style="background:white;border-radius:20px;border:1.5px solid #E8EDF5;box-shadow:0 2px 8px rgba(0,0,0,0.05);padding:20px 24px;margin-bottom:24px;">
    <!-- 검색창 -->
    <div style="position:relative;margin-bottom:16px;">
      <span class="material-symbols-outlined" style="position:absolute;left:18px;top:50%;transform:translateY(-50%);font-size:20px;color:#9DA8C0;">search</span>
      <input id="keyword" placeholder="운동명, 부위, 난이도 검색..." class="fb-search">
    </div>

    <!-- 부위 필터 칩 -->
    <div style="display:flex;gap:8px;flex-wrap:wrap;align-items:center;">
      <span style="font-size:12px;font-weight:700;color:#9DA8C0;margin-right:4px;">부위</span>
      <% String[] muscles = {"전체","가슴","등","어깨","팔","복근","하체","유산소"};
         for(String m : muscles){ %>
      <button class="filter-chip <%= m.equals("전체") ? "active" : "" %>"
              onclick="filterMuscle('<%= m %>', this)"><%= m %></button>
      <% } %>

      <div style="width:1.5px;height:24px;background:#E8EDF5;margin:0 8px;"></div>
      <span style="font-size:12px;font-weight:700;color:#9DA8C0;margin-right:4px;">난이도</span>
      <% String[] levels = {"전체","초급","중급","고급"};
         for(String l : levels){ %>
      <button class="filter-chip <%= l.equals("전체") ? "active" : "" %>"
              onclick="filterLevel('<%= l %>', this)"><%= l %></button>
      <% } %>
    </div>
  </div>

  <!-- 결과 카운트 -->
  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
    <div style="font-size:14px;color:#5A6480;font-weight:600;">
      총 <span id="countText" style="color:#FF6B35;font-weight:900;">0</span>개 운동
    </div>
    <div style="display:flex;gap:8px;">
      <button onclick="setView('grid')" id="btn-grid" style="width:34px;height:34px;border-radius:8px;border:1.5px solid #E8EDF5;background:white;cursor:pointer;display:flex;align-items:center;justify-content:center;transition:all 0.2s;" onmouseover="this.style.borderColor='#FF6B35'" onmouseout="this.style.borderColor='#E8EDF5'">
        <span class="material-symbols-outlined" style="font-size:18px;color:#5A6480;">grid_view</span>
      </button>
      <button onclick="setView('list')" id="btn-list" style="width:34px;height:34px;border-radius:8px;border:1.5px solid #E8EDF5;background:white;cursor:pointer;display:flex;align-items:center;justify-content:center;transition:all 0.2s;" onmouseover="this.style.borderColor='#FF6B35'" onmouseout="this.style.borderColor='#E8EDF5'">
        <span class="material-symbols-outlined" style="font-size:18px;color:#5A6480;">view_list</span>
      </button>
    </div>
  </div>

  <!-- 카드 그리드 -->
  <div id="container" style="display:grid;grid-template-columns:repeat(4,1fr);gap:18px;padding-bottom:200px;">

    <% if(list != null) { for(ExerciseDTO e : list) {
       String diffClass = "초급".equals(e.getDifficulty()) ? "badge-easy" : "고급".equals(e.getDifficulty()) ? "badge-hard" : "badge-normal";
       String diffEmoji = "초급".equals(e.getDifficulty()) ? "🌱" : "고급".equals(e.getDifficulty()) ? "🔥" : "⚡";
    %>
    <div class="ex-card"
         onclick="showDetail(
           '<%= e.getName() %>',
           '<%= e.getGifUrl() %>',
           '<%= e.getDescription() %>',
           '<%= e.getYoutubeUrl() %>',
           '<%= e.getMuscle() %>',
           '<%= e.getDifficulty() %>',
           this
         )">
      <!-- 썸네일 -->
      <div style="position:relative;overflow:hidden;">
        <img src="<%= e.getThumbnail() %>"
             style="width:100%;height:160px;object-fit:cover;transition:transform 0.3s ease;"
             onmouseover="this.style.transform='scale(1.05)'"
             onmouseout="this.style.transform='scale(1)'"
             onerror="this.src='https://via.placeholder.com/320x160?text=운동'"
             alt="<%= e.getName() %>">
        <!-- 난이도 뱃지 (이미지 위) -->
        <div style="position:absolute;top:10px;right:10px;">
          <span style="padding:4px 10px;border-radius:99px;font-size:11px;font-weight:800;backdrop-filter:blur(6px);background:rgba(255,255,255,0.92);"
                class="<%= diffClass %>">
            <%= diffEmoji %> <%= e.getDifficulty() %>
          </span>
        </div>
      </div>

      <!-- 내용 -->
      <div style="padding:14px 16px 16px;">
        <!-- 부위 태그 -->
        <div style="margin-bottom:8px;">
          <span style="font-size:11px;font-weight:700;color:#5A6480;background:#F7F9FC;border:1.5px solid #E8EDF5;padding:3px 10px;border-radius:99px;">
            💪 <%= e.getMuscle() %>
          </span>
        </div>
        <h3 style="font-size:15px;font-weight:800;color:#1A1F36;margin-bottom:6px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
          <%= e.getName() %>
        </h3>
        <p style="font-size:12px;color:#9DA8C0;line-height:1.5;overflow:hidden;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;">
          <%= e.getDescription() %>
        </p>

        <!-- 하단 버튼 -->
        <div style="display:flex;gap:8px;margin-top:12px;">
          <button onclick="event.stopPropagation();openModal('<%= e.getYoutubeUrl() %>')" style="
            flex:1;padding:7px;border-radius:10px;border:none;cursor:pointer;
            background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;
            font-size:12px;font-weight:700;font-family:'Noto Sans KR',sans-serif;
            display:flex;align-items:center;justify-content:center;gap:4px;
            transition:all 0.2s;
          " onmouseover="this.style.transform='translateY(-1px)'" onmouseout="this.style.transform='none'">
            <span class="material-symbols-outlined" style="font-size:14px;">play_circle</span>
            영상
          </button>
          <button onclick="event.stopPropagation();addRecord('<%= e.getName() %>')" style="
            flex:1;padding:7px;border-radius:10px;border:1.5px solid #E8EDF5;cursor:pointer;
            background:white;color:#5A6480;
            font-size:12px;font-weight:700;font-family:'Noto Sans KR',sans-serif;
            display:flex;align-items:center;justify-content:center;gap:4px;
            transition:all 0.2s;
          " onmouseover="this.style.borderColor='#00BFA5';this.style.color='#00BFA5'" onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#5A6480'">
            <span class="material-symbols-outlined" style="font-size:14px;">add_circle</span>
            기록
          </button>
        </div>
      </div>
    </div>
    <% } } %>

  </div>

  <!-- 빈 상태 -->
  <div id="emptyState" style="display:none;text-align:center;padding:80px 20px;">
    <div style="font-size:60px;margin-bottom:16px;">🔍</div>
    <div style="font-size:18px;font-weight:800;color:#1A1F36;margin-bottom:8px;">검색 결과가 없어요</div>
    <div style="font-size:14px;color:#9DA8C0;">다른 키워드나 필터로 검색해보세요!</div>
  </div>

</div><!-- end content -->

<!-- ── 하단 상세 패널 ── -->
<div id="detailBox" class="detail-panel">
  <div style="display:flex;gap:24px;align-items:flex-start;">

    <!-- GIF -->
    <div style="flex-shrink:0;border-radius:16px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.12);">
      <img id="gif" style="width:220px;height:145px;object-fit:cover;display:block;" alt="운동 GIF"
           onerror="this.src='https://via.placeholder.com/220x145?text=GIF'">
    </div>

    <!-- 정보 -->
    <div style="flex:1;min-width:0;">
      <div style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">
        <h2 id="detailTitle" style="font-size:20px;font-weight:900;color:#1A1F36;"></h2>
        <span id="detailDiffBadge" style="padding:4px 12px;border-radius:99px;font-size:12px;font-weight:800;"></span>
        <span id="detailMuscleBadge" style="padding:4px 12px;border-radius:99px;background:#F7F9FC;border:1.5px solid #E8EDF5;font-size:12px;font-weight:700;color:#5A6480;"></span>
      </div>
      <p id="detailDesc" style="font-size:14px;color:#5A6480;line-height:1.7;margin-bottom:16px;overflow:hidden;display:-webkit-box;-webkit-line-clamp:3;-webkit-box-orient:vertical;"></p>

      <div style="display:flex;gap:10px;align-items:center;">
        <button id="detailVideoBtn" onclick="openModalCurrent()" style="
          padding:10px 24px;border-radius:99px;border:none;cursor:pointer;
          background:linear-gradient(135deg,#FF6B35,#FF8C5A);color:white;
          font-size:14px;font-weight:700;font-family:'Noto Sans KR',sans-serif;
          box-shadow:0 4px 14px rgba(255,107,53,0.3);
          display:flex;align-items:center;gap:6px;transition:all 0.2s;
        " onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform='none'">
          <span class="material-symbols-outlined" style="font-size:18px;">play_circle</span>
          영상으로 보기
        </button>
        <button id="detailRecordBtn" onclick="addRecordCurrent()" style="
          padding:10px 24px;border-radius:99px;border:1.5px solid #E8EDF5;cursor:pointer;
          background:white;color:#5A6480;font-size:14px;font-weight:700;
          font-family:'Noto Sans KR',sans-serif;transition:all 0.2s;
          display:flex;align-items:center;gap:6px;
        " onmouseover="this.style.borderColor='#00BFA5';this.style.color='#00BFA5'" onmouseout="this.style.borderColor='#E8EDF5';this.style.color='#5A6480'">
          <span class="material-symbols-outlined" style="font-size:18px;">add_circle</span>
          기록 추가
        </button>
        <button onclick="closeDetail()" style="
          margin-left:auto;width:36px;height:36px;border-radius:50%;border:1.5px solid #E8EDF5;
          background:white;cursor:pointer;display:flex;align-items:center;justify-content:center;
          transition:all 0.2s;
        " onmouseover="this.style.background='#FEE2E2';this.style.borderColor='#EF4444'" onmouseout="this.style.background='white';this.style.borderColor='#E8EDF5'">
          <span class="material-symbols-outlined" style="font-size:18px;color:#5A6480;">close</span>
        </button>
      </div>
    </div>

    <!-- 핏불 미니 응원 -->
    <div style="flex-shrink:0;text-align:center;padding:12px 16px;background:linear-gradient(135deg,#FFF3EE,#FFEEE5);border-radius:16px;border:1.5px solid rgba(255,107,53,0.15);">
      <div style="font-size:32px;margin-bottom:6px;">🐾</div>
      <div style="font-size:12px;font-weight:800;color:#FF6B35;">화이팅!</div>
    </div>

  </div>
</div>

<!-- ── 유튜브 모달 ── -->
<div id="modal" class="modal-overlay">
  <div style="background:white;border-radius:24px;padding:28px;width:100%;max-width:660px;box-shadow:0 16px 60px rgba(0,0,0,0.2);animation:fb_modal_in 0.3s ease;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
      <h3 id="modalTitle" style="font-size:17px;font-weight:800;color:#1A1F36;"></h3>
      <button onclick="closeModal()" style="width:34px;height:34px;border-radius:50%;border:none;background:#F7F9FC;color:#5A6480;cursor:pointer;font-size:18px;display:flex;align-items:center;justify-content:center;transition:all 0.2s;" onmouseover="this.style.background='#FEE2E2';this.style.color='#EF4444'" onmouseout="this.style.background='#F7F9FC';this.style.color='#5A6480'">✕</button>
    </div>
    <div style="border-radius:16px;overflow:hidden;box-shadow:0 4px 16px rgba(0,0,0,0.1);">
      <iframe id="youtube" width="100%" height="340" frameborder="0" allowfullscreen style="display:block;"></iframe>
    </div>
    <button onclick="closeModal()" style="width:100%;margin-top:16px;padding:12px;border-radius:99px;border:1.5px solid #E8EDF5;background:white;color:#5A6480;font-size:14px;font-weight:600;cursor:pointer;font-family:'Noto Sans KR',sans-serif;">닫기</button>
  </div>
</div>

<script>
var currentYoutubeUrl = '';
var currentExName = '';
var currentFilter = { muscle: '전체', level: '전체' };

/* ── 카드 수 업데이트 ── */
function updateCount() {
  var cards = document.querySelectorAll('#container .ex-card');
  var visible = 0;
  cards.forEach(function(c) { if (c.style.display !== 'none') visible++; });
  document.getElementById('countText').innerText = visible;
  document.getElementById('emptyState').style.display = visible === 0 ? 'block' : 'none';
}

/* ── 상세 패널 ── */
function showDetail(name, gif, desc, yt, muscle, diff, el) {
  currentYoutubeUrl = yt;
  currentExName = name;

  document.getElementById('detailTitle').innerText = name;
  document.getElementById('gif').src = gif || 'https://via.placeholder.com/220x145?text=GIF';
  document.getElementById('detailDesc').innerText = desc;
  document.getElementById('modalTitle').innerText = name;

  var diffClass = diff === '초급' ? 'badge-easy' : diff === '고급' ? 'badge-hard' : 'badge-normal';
  var diffEmoji = diff === '초급' ? '🌱' : diff === '고급' ? '🔥' : '⚡';
  var badge = document.getElementById('detailDiffBadge');
  badge.innerText = diffEmoji + ' ' + diff;
  badge.className = diffClass;
  badge.style.cssText = 'padding:4px 12px;border-radius:99px;font-size:12px;font-weight:800;';

  document.getElementById('detailMuscleBadge').innerText = '💪 ' + muscle;

  /* 선택 카드 강조 */
  document.querySelectorAll('.ex-card').forEach(function(c) { c.classList.remove('selected'); });
  if (el) el.classList.add('selected');

  document.getElementById('detailBox').classList.add('show');
}

function closeDetail() {
  document.getElementById('detailBox').classList.remove('show');
  document.querySelectorAll('.ex-card').forEach(function(c) { c.classList.remove('selected'); });
}

function openModalCurrent() { openModal(currentYoutubeUrl); }
function addRecordCurrent() { addRecord(currentExName); }

/* ── 유튜브 모달 ── */
function openModal(url) {
  document.getElementById('modal').classList.add('open');
  document.getElementById('youtube').src = url || '';
}
function closeModal() {
  document.getElementById('modal').classList.remove('open');
  document.getElementById('youtube').src = '';
}

/* ── 기록 추가 ── */
function addRecord(name) {
  location.href = 'exerciseDetail?name=' + encodeURIComponent(name);
}

/* ── 뷰 전환 ── */
function setView(type) {
  var container = document.getElementById('container');
  if (type === 'grid') {
    container.style.gridTemplateColumns = 'repeat(4,1fr)';
  } else {
    container.style.gridTemplateColumns = '1fr';
  }
}

/* ── 필터 ── */
function filterMuscle(val, el) {
  currentFilter.muscle = val;
  document.querySelectorAll('.filter-chip').forEach(function(c) {
    if (['전체','가슴','등','어깨','팔','복근','하체','유산소'].includes(c.innerText.trim())) {
      c.classList.remove('active');
    }
  });
  el.classList.add('active');
  applyFilter();
}

function filterLevel(val, el) {
  currentFilter.level = val;
  document.querySelectorAll('.filter-chip').forEach(function(c) {
    if (['전체','초급','중급','고급'].includes(c.innerText.trim())) {
      c.classList.remove('active');
    }
  });
  el.classList.add('active');
  applyFilter();
}

function applyFilter() {
  var kw = document.getElementById('keyword').value.trim().toLowerCase();
  document.querySelectorAll('#container .ex-card').forEach(function(card) {
    var name   = (card.querySelector('h3') ? card.querySelector('h3').innerText : '').toLowerCase();
    var muscle = card.dataset.muscle || '';
    var level  = card.dataset.level  || '';
    var muscleOk = currentFilter.muscle === '전체' || muscle.includes(currentFilter.muscle);
    var levelOk  = currentFilter.level  === '전체' || level  === currentFilter.level;
    var kwOk     = kw === '' || name.includes(kw) || muscle.toLowerCase().includes(kw) || level.toLowerCase().includes(kw);
    card.style.display = (muscleOk && levelOk && kwOk) ? '' : 'none';
  });
  updateCount();
}

/* ── AJAX 검색 ── */
var searchTimer;
document.getElementById('keyword').addEventListener('input', function() {
  clearTimeout(searchTimer);
  var kw = this.value;
  searchTimer = setTimeout(function() {
    fetch('guideList?ajax=true&keyword=' + encodeURIComponent(kw))
      .then(function(res) { return res.text(); })
      .then(function(html) {
        document.getElementById('container').innerHTML = html;
        updateCount();
      });
  }, 400);
});

/* 초기화 */
window.onload = function() { updateCount(); };
</script>

</body>
</html>
