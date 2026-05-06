<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, dto.member.ExerciseGuideDTO, dto.member.UserDTO" %>

<%
// ── 운동 목록 ──────────────────────────────────────────────
List<ExerciseGuideDTO> list = (List<ExerciseGuideDTO>) request.getAttribute("exerciseList");

if (list == null) {
    list = new ArrayList<>();

    ExerciseGuideDTO e1 = new ExerciseGuideDTO();
    e1.setExerciseId(1); e1.setName("벤치 프레스"); e1.setMuscle("가슴"); e1.setType("근력"); e1.setDifficulty("초급");
    e1.setDescription("가슴 근육(대흉근)을 발달시키는 가장 대표적인 상체 운동입니다. 올바른 자세를 유지하며 꾸준히 수행하는 것이 중요합니다.");
    e1.setKeyPoint("견갑을 고정하고 바벨이 수직으로 움직이도록 조절하세요.|팔꿈치가 너무 벌어지지 않게 70도를 유지합니다.|바벨을 가슴 중앙에 천천히 내리고 폭발적으로 밀어 올리세요.");
    e1.setThumbnail("https://media.giphy.com/media/3o6ZsYQDPB2VMKGerK/giphy.gif");
    e1.setGifUrl("https://media.giphy.com/media/3o6ZsYQDPB2VMKGerK/giphy.gif");
    e1.setYoutubeUrl("https://www.youtube.com/embed/rT7DgCr-3pg");
    list.add(e1);

    ExerciseGuideDTO e2 = new ExerciseGuideDTO();
    e2.setExerciseId(2); e2.setName("런닝머신"); e2.setMuscle("전신"); e2.setType("유산소"); e2.setDifficulty("중급");
    e2.setDescription("런닝머신은 심폐 지구력을 향상시키고 칼로리 소모에 효과적인 유산소 운동입니다. 올바른 자세를 유지하며 꾸준히 수행하는 것이 중요합니다.");
    e2.setKeyPoint("시선은 전면을 향하고, 가슴을 펴고 어깨의 힘을 뺍니다.|발뒤꿈치부터 착지하며 부드럽게 발을 굴립니다.|팔은 90도 각도로 자연스럽게 앞뒤로 흔듭니다.");
    e2.setThumbnail("https://media.giphy.com/media/26FLdmIp6wJr91JAI/giphy.gif");
    e2.setGifUrl("https://media.giphy.com/media/26FLdmIp6wJr91JAI/giphy.gif");
    e2.setYoutubeUrl("https://www.youtube.com/embed/kVnyY17VS9Y");
    list.add(e2);

    ExerciseGuideDTO e3 = new ExerciseGuideDTO();
    e3.setExerciseId(3); e3.setName("스쿼트"); e3.setMuscle("하체"); e3.setType("근력"); e3.setDifficulty("중급");
    e3.setDescription("하체 근육 발달과 코어 안정성에 필수적인 운동입니다. 무릎과 고관절을 함께 사용하는 복합 운동입니다.");
    e3.setKeyPoint("무릎이 발끝 앞으로 너무 나가지 않게 주의하세요.|허리를 곧게 유지하며 힙 드라이브를 사용합니다.|내려갈 때 천천히, 올라올 때 폭발적으로 수행하세요.");
    e3.setThumbnail("https://media.giphy.com/media/l0HlHFRbmaZtBRhXG/giphy.gif");
    e3.setGifUrl("https://media.giphy.com/media/l0HlHFRbmaZtBRhXG/giphy.gif");
    e3.setYoutubeUrl("https://www.youtube.com/embed/gsNoPYwWXeM");
    list.add(e3);

    ExerciseGuideDTO e4 = new ExerciseGuideDTO();
    e4.setExerciseId(4); e4.setName("플랭크"); e4.setMuscle("전신"); e4.setType("근력"); e4.setDifficulty("초급");
    e4.setDescription("코어 근육 전체를 강화하는 정적 운동입니다. 짧은 시간에 효과적으로 복근과 전신 근지구력을 향상시킵니다.");
    e4.setKeyPoint("몸이 일직선이 되도록 엉덩이가 올라가거나 내려가지 않게 합니다.|시선은 바닥을 향하고 목의 긴장을 풀어주세요.|복부에 힘을 주고 호흡을 멈추지 마세요.");
    e4.setThumbnail("https://media.giphy.com/media/l0ExlqOorhEuGDOoo/giphy.gif");
    e4.setGifUrl("https://media.giphy.com/media/l0ExlqOorhEuGDOoo/giphy.gif");
    e4.setYoutubeUrl("https://www.youtube.com/embed/pSHjTRCQxIw");
    list.add(e4);

    ExerciseGuideDTO e5 = new ExerciseGuideDTO();
    e5.setExerciseId(5); e5.setName("데드리프트"); e5.setMuscle("등"); e5.setType("근력"); e5.setDifficulty("고급");
    e5.setDescription("전신 근력을 사용하는 대표적인 복합 다관절 운동입니다. 등, 하체, 코어를 동시에 강화합니다.");
    e5.setKeyPoint("허리가 굽지 않도록 복압을 유지하는 것이 가장 중요합니다.|바는 항상 몸에 가깝게 유지하며 올립니다.|무릎과 엉덩이를 동시에 펴면서 일어서세요.");
    e5.setThumbnail("https://media.giphy.com/media/xT9DPpf0zTqRASyzFS/giphy.gif");
    e5.setGifUrl("https://media.giphy.com/media/xT9DPpf0zTqRASyzFS/giphy.gif");
    e5.setYoutubeUrl("https://www.youtube.com/embed/op9kVnSso6Q");
    list.add(e5);

    ExerciseGuideDTO e6 = new ExerciseGuideDTO();
    e6.setExerciseId(6); e6.setName("숄더 프레스"); e6.setMuscle("어깨"); e6.setType("근력"); e6.setDifficulty("중급");
    e6.setDescription("어깨 근육(삼각근)의 전체적인 볼륨을 키워주는 운동입니다. 상체 안정성과 어깨 강화에 효과적입니다.");
    e6.setKeyPoint("팔꿈치가 너무 뒤로 빠지지 않게 하며 수직으로 밀어 올립니다.|코어에 힘을 주어 허리가 과도하게 꺾이지 않도록 합니다.|동작의 최상단에서 완전히 팔꿈치를 펴지 않아도 됩니다.");
    e6.setThumbnail("https://media.giphy.com/media/xT9DPv4AacN0jPobvy/giphy.gif");
    e6.setGifUrl("https://media.giphy.com/media/xT9DPv4AacN0jPobvy/giphy.gif");
    e6.setYoutubeUrl("https://www.youtube.com/embed/qEwKCR5JCog");
    list.add(e6);
}

UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>운동 가이드 - FITSBURGH</title>
<style>
*{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Segoe UI',sans-serif;background:#f4f6fa;color:#222;}
.page-wrap{padding:32px 36px;max-width:1100px;}
h2.section-title{font-size:22px;font-weight:700;margin-bottom:16px;}

/* 필터 */
.filter-row{display:flex;gap:8px;flex-wrap:wrap;margin-bottom:10px;}
.chip{padding:6px 14px;border-radius:20px;border:1.5px solid #ddd;background:#fff;font-size:13px;cursor:pointer;transition:all .18s;}
.chip:hover{border-color:#ff6b35;color:#ff6b35;}
.chip.active{background:#ff6b35;color:#fff;border-color:#ff6b35;font-weight:600;}

/* 검색 */
.search-input{padding:9px 16px;border-radius:22px;border:1.5px solid #ddd;font-size:14px;outline:none;width:280px;margin-bottom:16px;}
.search-input:focus{border-color:#2563eb;}

/* 카드 그리드 */
.card-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:14px;margin-bottom:28px;}
@media(max-width:900px){.card-grid{grid-template-columns:repeat(2,1fr);}}
.ex-card{background:#fff;border-radius:14px;border:2px solid transparent;overflow:hidden;cursor:pointer;transition:all .18s;box-shadow:0 2px 8px rgba(0,0,0,.07);}
.ex-card:hover{transform:translateY(-3px);box-shadow:0 6px 18px rgba(0,0,0,.12);}
.ex-card.selected{border-color:#2563eb;box-shadow:0 0 0 3px rgba(37,99,235,.15);}
.card-thumb{position:relative;width:100%;padding-bottom:63%;background:#e9eef5;overflow:hidden;}
.card-thumb img{position:absolute;inset:0;width:100%;height:100%;object-fit:cover;}
.gif-badge{position:absolute;bottom:8px;right:8px;background:rgba(0,0,0,.55);color:#fff;font-size:11px;font-weight:700;padding:2px 7px;border-radius:4px;}
.card-body{padding:12px 14px 14px;}
.card-name{font-size:15px;font-weight:700;margin-bottom:8px;}
.tag-row{display:flex;gap:6px;flex-wrap:wrap;}
.tag{font-size:12px;padding:3px 9px;border-radius:12px;background:#f0f0f0;color:#555;font-weight:500;}
.tag.근력{background:#fff0e8;color:#e06030;} .tag.유산소{background:#e8f0ff;color:#3060d0;}
.tag.초급{background:#edfff1;color:#2d9f50;} .tag.중급{background:#fff8e1;color:#b07000;} .tag.고급{background:#ffe8e8;color:#cc3333;}
.tag.가슴{background:#fce8ff;color:#9030b0;} .tag.등{background:#e8fff0;color:#208050;}
.tag.하체{background:#e8f4ff;color:#2060a0;} .tag.어깨{background:#fff4e8;color:#b07030;}
.tag.전신{background:#f0e8ff;color:#6030b0;} .tag.복근{background:#ffeef0;color:#c03050;}

/* ── 상세 패널 ── */
#detail-panel{display:none;background:#fff;border-radius:16px;box-shadow:0 4px 20px rgba(0,0,0,.1);overflow:hidden;margin-bottom:28px;border:1px solid #e8eaf0;animation:slideDown .25s ease;}
@keyframes slideDown{from{opacity:0;transform:translateY(-10px);}to{opacity:1;transform:translateY(0);}}

.detail-top{display:grid;grid-template-columns:1fr 1fr;gap:0;}
@media(max-width:700px){.detail-top{grid-template-columns:1fr;}}

/* 왼쪽 (어두운 배경) */
.detail-left{background:#1a1a2e;display:flex;flex-direction:column;}
.gif-wrap{position:relative;width:100%;padding-bottom:65%;background:#0d0d1a;overflow:hidden;}
.gif-wrap img{position:absolute;inset:0;width:100%;height:100%;object-fit:contain;}
.gif-label{position:absolute;bottom:10px;right:12px;background:rgba(0,0,0,.6);color:#fff;font-size:13px;font-weight:700;padding:3px 10px;border-radius:5px;}
.target-wrap{padding:18px 22px 22px;}
.target-title{font-size:13px;font-weight:700;color:#9ca3af;text-transform:uppercase;letter-spacing:1px;margin-bottom:12px;}
.muscle-figs{display:flex;gap:12px;justify-content:center;align-items:flex-end;}

/* 오른쪽 (밝은 배경) */
.detail-right{padding:28px 30px;display:flex;flex-direction:column;justify-content:space-between;min-height:420px;}
.d-name{font-size:20px;font-weight:800;color:#111;margin-bottom:6px;}
.d-tags{display:flex;gap:7px;margin-bottom:20px;flex-wrap:wrap;}
.sec-title{font-size:14px;font-weight:700;color:#111;margin-bottom:7px;}
.sec-desc{font-size:14px;line-height:1.8;color:#444;margin-bottom:20px;}
.kp-list{list-style:none;margin-bottom:24px;}
.kp-list li{font-size:14px;color:#333;line-height:1.65;padding:6px 0 6px 22px;position:relative;border-bottom:1px solid #f2f2f2;}
.kp-list li:last-child{border-bottom:none;}
.kp-list li::before{content:"•";position:absolute;left:0;color:#2563eb;font-weight:900;font-size:18px;line-height:1.4;}
.btn-row{display:flex;gap:12px;}
.btn-video{flex:1;padding:13px;border:2px solid #d0d5e0;background:#fff;border-radius:10px;font-size:14px;font-weight:600;color:#333;cursor:pointer;transition:all .18s;}
.btn-video:hover{border-color:#2563eb;color:#2563eb;}
.btn-start{flex:1;padding:13px;background:#2563eb;color:#fff;border:none;border-radius:10px;font-size:14px;font-weight:700;cursor:pointer;transition:background .18s;}
.btn-start:hover{background:#1a4fc8;}
</style>
</head>
<body>
<div style="display:flex;">
  <jsp:include page="/member/sidebar.jsp"/>
  <main style="flex:1;overflow-y:auto;">
  <div class="page-wrap">

    <h2 class="section-title">운동 가이드</h2>

    <!-- 검색 -->
    <input class="search-input" type="text" id="searchInput" placeholder="🔍 운동명 검색..." oninput="applyFilter()">

    <!-- 부위 필터 -->
    <div class="filter-row" id="muscleFilter">
      <% for (String m : new String[]{"전체","가슴","등","어깨","팔","전신","하체","복근"}) { %>
        <button class="chip <%=m.equals("전체")?"active":""%>" onclick="setMuscle('<%=m%>',this)"><%=m%></button>
      <% } %>
    </div>

    <!-- 난이도 필터 -->
    <div class="filter-row" style="margin-top:8px;" id="levelFilter">
      <% for (String lv : new String[]{"전체","초급","중급","고급"}) { %>
        <button class="chip <%=lv.equals("전체")?"active":""%>" onclick="setLevel('<%=lv%>',this)"><%=lv%></button>
      <% } %>
    </div>

    <br>

    <!-- ── 상세 패널 ──────────────────────────────────────── -->
    <div id="detail-panel">
      <div class="detail-top">

        <!-- 왼쪽: GIF + Target Muscles -->
        <div class="detail-left">
          <div class="gif-wrap">
            <img id="d-gif" src="" alt="운동 GIF">
            <span class="gif-label">GIF</span>
          </div>
          <div class="target-wrap">
            <p class="target-title">Target Muscles</p>
            <div class="muscle-figs" id="muscle-figs"></div>
          </div>
        </div>

        <!-- 오른쪽: 설명 + 핵심 포인트 -->
        <div class="detail-right">
          <div>
            <div class="d-name" id="d-name"></div>
            <div class="d-tags" id="d-tags"></div>
            <div class="sec-title">운동 설명</div>
            <p class="sec-desc" id="d-desc"></p>
            <div class="sec-title">핵심 자세 포인트</div>
            <ul class="kp-list" id="d-keypoints"></ul>
          </div>
          <div class="btn-row">
            <button class="btn-video" onclick="watchVideo()">📹 영상으로 보기</button>
            <button class="btn-start" onclick="startRecord()">기록 시작</button>
          </div>
        </div>

      </div>
    </div>

    <!-- ── 카드 그리드 ──────────────────────────────────────── -->
    <div class="card-grid" id="card-grid">
    <%
    for (ExerciseGuideDTO e : list) {
        String kp = e.getKeyPoint() != null ? e.getKeyPoint() : "";
        String[] kpArr = kp.split("\\|");
        StringBuilder kpJson = new StringBuilder("[");
        for (int ki = 0; ki < kpArr.length; ki++) {
            kpJson.append("\"")
                  .append(kpArr[ki].trim().replace("\\","\\\\").replace("\"","\\\"").replace("'","\\'"))
                  .append("\"");
            if (ki < kpArr.length - 1) kpJson.append(",");
        }
        kpJson.append("]");

        String nm  = e.getName()       != null ? e.getName()       : "";
        String dsc = e.getDescription()!= null ? e.getDescription().replace("'","\\'").replace("\r\n","\\n").replace("\n","\\n") : "";
        String gif = e.getGifUrl()     != null ? e.getGifUrl()     : "";
        String thb = e.getThumbnail()  != null ? e.getThumbnail()  : "";
        String yt  = e.getYoutubeUrl() != null ? e.getYoutubeUrl() : "";
        String mus = e.getMuscle()     != null ? e.getMuscle()     : "";
        String typ = e.getType()       != null ? e.getType()       : "";
        String dif = e.getDifficulty() != null ? e.getDifficulty() : "";
    %>
      <div class="ex-card"
           data-id="<%=e.getExerciseId()%>"
           data-muscle="<%=mus%>" data-level="<%=dif%>" data-name="<%=nm%>"
           onclick="showDetail('<%=nm%>','<%=gif%>','<%=dsc%>','<%=yt%>','<%=mus%>','<%=typ%>','<%=dif%>',<%=kpJson%>,this)">
        <div class="card-thumb">
          <img src="<%=thb%>" alt="<%=nm%>" onerror="this.style.background='#dde';this.style.display='block'">
          <span class="gif-badge">GIF</span>
        </div>
        <div class="card-body">
          <div class="card-name"><%=nm%></div>
          <div class="tag-row">
            <span class="tag <%=mus%>"><%=mus%></span>
            <span class="tag <%=typ%>"><%=typ%></span>
            <span class="tag <%=dif%>"><%=dif%></span>
          </div>
        </div>
      </div>
    <% } %>
    </div>

  </div>

  <!-- 로그인 배너 -->
  <% if (loginUser == null) { %>
  <div style="position:fixed;bottom:0;left:0;right:0;background:#2563eb;color:#fff;
              padding:13px 24px;display:flex;align-items:center;justify-content:center;
              gap:14px;font-size:14px;z-index:999;">
    <span>로그인 후 더 많은 기능을 이용하세요</span>
    <a href="<%=contextPath%>/member/login"
       style="background:#fff;color:#2563eb;padding:6px 18px;border-radius:6px;font-weight:700;text-decoration:none;">
      로그인
    </a>
  </div>
  <% } %>
  </main>
</div>

<!-- 영상 모달 -->
<div id="video-modal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,.78);
     z-index:9999;align-items:center;justify-content:center;" onclick="closeVideoOutside(event)">
  <div style="background:#000;border-radius:14px;overflow:hidden;max-width:720px;width:90%;position:relative;">
    <button onclick="closeVideo()"
            style="position:absolute;top:10px;right:12px;background:rgba(255,255,255,.15);border:none;
                   color:#fff;font-size:24px;cursor:pointer;border-radius:50%;width:34px;height:34px;line-height:34px;text-align:center;">×</button>
    <iframe id="yt-frame" width="100%" height="405" src="" frameborder="0" allowfullscreen style="display:block;"></iframe>
  </div>
</div>

<script>
let curFilter = { muscle:'전체', level:'전체' };
let curYtUrl  = '';
let selCard   = null;

function setMuscle(v,el){
    curFilter.muscle = v;
    document.querySelectorAll('#muscleFilter .chip').forEach(b=>b.classList.remove('active'));
    el.classList.add('active'); applyFilter();
}
function setLevel(v,el){
    curFilter.level = v;
    document.querySelectorAll('#levelFilter .chip').forEach(b=>b.classList.remove('active'));
    el.classList.add('active'); applyFilter();
}
function applyFilter(){
    const kw = document.getElementById('searchInput').value.trim().toLowerCase();
    document.querySelectorAll('.ex-card').forEach(c=>{
        const mOk  = curFilter.muscle==='전체' || c.dataset.muscle===curFilter.muscle;
        const lOk  = curFilter.level==='전체'  || c.dataset.level===curFilter.level;
        const kwOk = !kw || (c.dataset.name||'').toLowerCase().includes(kw);
        c.style.display = (mOk&&lOk&&kwOk)?'':'none';
    });
}

/* ── showDetail ──────────────────────────────────────────── */
function showDetail(name, gifUrl, desc, ytUrl, muscle, type, diff, keypoints, cardEl) {
    // 카드 하이라이트
    if (selCard) selCard.classList.remove('selected');
    cardEl.classList.add('selected');
    selCard = cardEl;
    curYtUrl = ytUrl;

    // GIF
    document.getElementById('d-gif').src = gifUrl || '';

    // 이름
    document.getElementById('d-name').textContent = name;

    // 태그
    document.getElementById('d-tags').innerHTML =
        `<span class="tag ${muscle}">${muscle}</span>
         <span class="tag ${type}">${type}</span>
         <span class="tag ${diff}">${diff}</span>`;

    // 설명
    document.getElementById('d-desc').textContent = desc;

    // 핵심 자세 포인트
    const kpEl = document.getElementById('d-keypoints');
    kpEl.innerHTML = '';
    (Array.isArray(keypoints) ? keypoints : []).forEach(kp => {
        if (!kp.trim()) return;
        const li = document.createElement('li');
        li.textContent = kp.trim();
        kpEl.appendChild(li);
    });

    // Target Muscles SVG
    document.getElementById('muscle-figs').innerHTML =
        buildFront(muscle) + buildBack(muscle);

    // 패널 표시 + 스크롤
    const panel = document.getElementById('detail-panel');
    panel.style.display = 'block';
    setTimeout(() => panel.scrollIntoView({ behavior:'smooth', block:'start' }), 50);
}

/* ── 근육 SVG ─────────────────────────────────────────────── */
const HL = {
    '가슴': { f:['chest'],        b:[] },
    '등':   { f:[],               b:['back','lat'] },
    '어깨': { f:['shoulder'],     b:['shoulder'] },
    '팔':   { f:['bicep'],        b:['tricep'] },
    '하체': { f:['quad','calf'],  b:['hamstring','glute','calf'] },
    '전신': { f:['chest','shoulder','bicep','quad','abs'], b:['back','lat','glute','hamstring'] },
    '복근': { f:['abs'],          b:[] },
};
const ON='#3b82f6', OFF='#374151';

function fA(muscle, ids){ // front active check
    const f = (HL[muscle]||{f:[]}).f;
    return ids.some(id => f.includes(id)) ? ON : OFF;
}
function bA(muscle, ids){ // back active check
    const b = (HL[muscle]||{b:[]}).b;
    return ids.some(id => b.includes(id)) ? ON : OFF;
}

function buildFront(muscle) {
    return `<div style="text-align:center;">
      <p style="color:#9ca3af;font-size:11px;margin-bottom:4px;font-weight:600;letter-spacing:.5px;">FRONT</p>
      <svg viewBox="0 0 100 200" width="95" height="185" xmlns="http://www.w3.org/2000/svg">
        <ellipse cx="50" cy="14" rx="11" ry="12" fill="#4b5563"/>
        <rect x="46" y="25" width="8" height="6" fill="#4b5563"/>
        <path d="M30 31 Q50 27 70 31 L68 80 Q50 84 32 80 Z" fill="#374151"/>
        <ellipse cx="43" cy="44" rx="10" ry="9" fill="${fA(muscle,['chest'])}"/>
        <ellipse cx="57" cy="44" rx="10" ry="9" fill="${fA(muscle,['chest'])}"/>
        <rect x="44" y="55" width="12" height="21" rx="3" fill="${fA(muscle,['abs'])}"/>
        <ellipse cx="27" cy="35" rx="8" ry="7" fill="${fA(muscle,['shoulder'])}"/>
        <ellipse cx="73" cy="35" rx="8" ry="7" fill="${fA(muscle,['shoulder'])}"/>
        <rect x="17" y="42" width="9" height="24" rx="4" fill="${fA(muscle,['bicep'])}"/>
        <rect x="74" y="42" width="9" height="24" rx="4" fill="${fA(muscle,['bicep'])}"/>
        <rect x="15" y="67" width="8" height="18" rx="3" fill="#374151"/>
        <rect x="77" y="67" width="8" height="18" rx="3" fill="#374151"/>
        <path d="M32 80 Q50 86 68 80 L66 98 Q50 102 34 98 Z" fill="#374151"/>
        <rect x="33" y="98" width="15" height="38" rx="6" fill="${fA(muscle,['quad'])}"/>
        <rect x="52" y="98" width="15" height="38" rx="6" fill="${fA(muscle,['quad'])}"/>
        <ellipse cx="40" cy="138" rx="7" ry="5" fill="#374151"/>
        <ellipse cx="60" cy="138" rx="7" ry="5" fill="#374151"/>
        <rect x="34" y="143" width="12" height="30" rx="5" fill="${fA(muscle,['calf'])}"/>
        <rect x="54" y="143" width="12" height="30" rx="5" fill="${fA(muscle,['calf'])}"/>
        <ellipse cx="40" cy="176" rx="8" ry="4" fill="#374151"/>
        <ellipse cx="60" cy="176" rx="8" ry="4" fill="#374151"/>
      </svg>
    </div>`;
}

function buildBack(muscle) {
    return `<div style="text-align:center;">
      <p style="color:#9ca3af;font-size:11px;margin-bottom:4px;font-weight:600;letter-spacing:.5px;">BACK</p>
      <svg viewBox="0 0 100 200" width="95" height="185" xmlns="http://www.w3.org/2000/svg">
        <ellipse cx="50" cy="14" rx="11" ry="12" fill="#4b5563"/>
        <rect x="46" y="25" width="8" height="6" fill="#4b5563"/>
        <path d="M30 31 Q50 27 70 31 L68 56 Q50 60 32 56 Z" fill="${bA(muscle,['back'])}"/>
        <path d="M32 56 Q50 60 68 56 L66 80 Q50 84 34 80 Z" fill="${bA(muscle,['back'])}"/>
        <path d="M30 38 Q20 52 22 72 L32 70 L32 38 Z" fill="${bA(muscle,['lat'])}"/>
        <path d="M70 38 Q80 52 78 72 L68 70 L68 38 Z" fill="${bA(muscle,['lat'])}"/>
        <ellipse cx="27" cy="35" rx="8" ry="7" fill="${bA(muscle,['shoulder'])}"/>
        <ellipse cx="73" cy="35" rx="8" ry="7" fill="${bA(muscle,['shoulder'])}"/>
        <rect x="17" y="42" width="9" height="24" rx="4" fill="${bA(muscle,['tricep'])}"/>
        <rect x="74" y="42" width="9" height="24" rx="4" fill="${bA(muscle,['tricep'])}"/>
        <rect x="15" y="67" width="8" height="18" rx="3" fill="#374151"/>
        <rect x="77" y="67" width="8" height="18" rx="3" fill="#374151"/>
        <path d="M32 80 Q50 86 68 80 L66 102 Q50 108 34 102 Z" fill="#374151"/>
        <ellipse cx="41" cy="93" rx="11" ry="10" fill="${bA(muscle,['glute'])}"/>
        <ellipse cx="59" cy="93" rx="11" ry="10" fill="${bA(muscle,['glute'])}"/>
        <rect x="33" y="103" width="15" height="33" rx="6" fill="${bA(muscle,['hamstring'])}"/>
        <rect x="52" y="103" width="15" height="33" rx="6" fill="${bA(muscle,['hamstring'])}"/>
        <ellipse cx="40" cy="138" rx="7" ry="5" fill="#374151"/>
        <ellipse cx="60" cy="138" rx="7" ry="5" fill="#374151"/>
        <rect x="34" y="143" width="12" height="30" rx="5" fill="${bA(muscle,['calf'])}"/>
        <rect x="54" y="143" width="12" height="30" rx="5" fill="${bA(muscle,['calf'])}"/>
        <ellipse cx="40" cy="176" rx="8" ry="4" fill="#374151"/>
        <ellipse cx="60" cy="176" rx="8" ry="4" fill="#374151"/>
      </svg>
    </div>`;
}

/* ── 영상 모달 ────────────────────────────────────────────── */
function watchVideo() {
    if (!curYtUrl) { alert('영상 정보가 없습니다.'); return; }
    document.getElementById('yt-frame').src = curYtUrl + '?autoplay=1';
    document.getElementById('video-modal').style.display = 'flex';
}
function closeVideo() {
    document.getElementById('yt-frame').src = '';
    document.getElementById('video-modal').style.display = 'none';
}
function closeVideoOutside(e) {
    if (e.target === document.getElementById('video-modal')) closeVideo();
}

/* ── 기록 시작 ────────────────────────────────────────────── */
function startRecord() {
    <% if (loginUser == null) { %>
    if (confirm('기록 시작은 로그인 후 이용 가능합니다.\n로그인 페이지로 이동할까요?')) {
        location.href = '<%=contextPath%>/member/login';
    }
    <% } else { %>
    location.href = '<%=contextPath%>/member/main';
    <% } %>
}
</script>
</body>
</html>
