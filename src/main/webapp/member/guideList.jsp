<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*,dto.member.ExerciseGuideDTO" %>

<%
List<ExerciseGuideDTO> list = (List<ExerciseGuideDTO>) request.getAttribute("guideList");

if(list == null) {
    list = new ArrayList<>();

    ExerciseGuideDTO e1 = new ExerciseGuideDTO();
    e1.setName("스쿼트");
    e1.setDescription("하체 근력과 코어를 동시에 강화하는 대표 운동입니다.");
    e1.setMuscle("하체");
    e1.setDifficulty("초급");
    e1.setThumbnail("https://via.placeholder.com/320x160?text=Squat");
    e1.setGifUrl("https://via.placeholder.com/220x145?text=GIF");
    e1.setYoutubeUrl("https://www.youtube.com/embed/dummy1");
    list.add(e1);

    ExerciseGuideDTO e2 = new ExerciseGuideDTO();
    e2.setName("벤치프레스");
    e2.setDescription("가슴 근육을 집중적으로 발달시키는 상체 운동입니다.");
    e2.setMuscle("가슴");
    e2.setDifficulty("중급");
    e2.setThumbnail("https://via.placeholder.com/320x160?text=Bench");
    e2.setGifUrl("https://via.placeholder.com/220x145?text=GIF");
    e2.setYoutubeUrl("https://www.youtube.com/embed/dummy2");
    list.add(e2);

    ExerciseGuideDTO e3 = new ExerciseGuideDTO();
    e3.setName("데드리프트");
    e3.setDescription("전신 근력을 사용하는 대표 복합 운동입니다.");
    e3.setMuscle("등");
    e3.setDifficulty("고급");
    e3.setThumbnail("https://via.placeholder.com/320x160?text=Deadlift");
    e3.setGifUrl("https://via.placeholder.com/220x145?text=GIF");
    e3.setYoutubeUrl("https://www.youtube.com/embed/dummy3");
    list.add(e3);
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>운동 가이드</title>

<style>
body { font-family: sans-serif; background:#f7f9fc; }
.ex-card {
  background:white; border-radius:12px; padding:12px;
  border:1px solid #ddd; cursor:pointer;
}
.filter-chip {
  padding:6px 12px; border-radius:20px;
  border:1px solid #ccc; cursor:pointer;
}
.filter-chip.active { background:#ff6b35; color:white; }
</style>
</head>

<body>

<h2>운동 가이드</h2>

<!-- ================= 필터 ================= -->
<div>

<!-- 부위 -->
<%
String[] muscles = {"전체","가슴","등","어깨","팔","복근","하체"};
for(String m : muscles){
%>
<button class="filter-chip <%= m.equals("전체") ? "active" : "" %>"
        onclick="filterMuscle('<%= m %>', this)">
    <%= m %>
</button>
<%
}
%>

<br><br>

<!-- 난이도 -->
<%
String[] levels = {"전체","초급","중급","고급"};
for(String l : levels){
%>
<button class="filter-chip <%= l.equals("전체") ? "active" : "" %>"
        onclick="filterLevel('<%= l %>', this)">
    <%= l %>
</button>
<%
}
%>

</div>

<br>

<!-- ================= 리스트 ================= -->
<div id="container" style="display:grid;grid-template-columns:repeat(3,1fr);gap:10px;">

<%
for(ExerciseGuideDTO e : list){
%>
<div class="ex-card"
     data-muscle="<%= e.getMuscle() %>"
     data-level="<%= e.getDifficulty() %>"
     onclick="showDetail(
        '<%= e.getName().replace("'", "\\'") %>',
        '<%= e.getDescription().replace("'", "\\'") %>'
     )">

    <h3><%= e.getName() %></h3>
    <p><%= e.getMuscle() %> / <%= e.getDifficulty() %></p>

</div>
<%
}
%>

</div>

<!-- ================= 상세 ================= -->
<div id="detail" style="margin-top:20px;"></div>

<script>

let currentFilter = { muscle:'전체', level:'전체' };

function filterMuscle(val, el){
    currentFilter.muscle = val;

    document.querySelectorAll('.filter-chip').forEach(b=>{
        if(["전체","가슴","등","어깨","팔","복근","하체"].includes(b.innerText)){
            b.classList.remove("active");
        }
    });

    el.classList.add("active");
    applyFilter();
}

function filterLevel(val, el){
    currentFilter.level = val;

    document.querySelectorAll('.filter-chip').forEach(b=>{
        if(["전체","초급","중급","고급"].includes(b.innerText)){
            b.classList.remove("active");
        }
    });

    el.classList.add("active");
    applyFilter();
}

function applyFilter(){
    document.querySelectorAll('.ex-card').forEach(card=>{

        let muscle = card.dataset.muscle;
        let level = card.dataset.level;

        let mOk = currentFilter.muscle === '전체' || muscle === currentFilter.muscle;
        let lOk = currentFilter.level === '전체' || level === currentFilter.level;

        card.style.display = (mOk && lOk) ? '' : 'none';
    });
}

function showDetail(name, desc){
    document.getElementById("detail").innerHTML =
        "<h3>"+name+"</h3><p>"+desc+"</p>";
}

</script>

</body>
</html>