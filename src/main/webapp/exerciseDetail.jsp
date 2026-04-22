<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 상세 페이지</title>
<style>
.container {
    display: flex;
}

.sidebar {
    width: 220px;
    background: #f7f8fa;
    padding: 20px;
}

.content {
    flex: 1;
    padding: 30px;
}

.card-container {
    display: flex;
    gap: 20px;
}

.card {
    width: 250px;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    cursor: pointer;
}

.modal {
    position: fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background: rgba(0,0,0,0.5);
}

.modal-content {
    width: 700px;
    margin: 100px auto;
    background: white;
    padding: 30px;
    border-radius: 16px;
}
</style>
</head>
<body>
<div class="modal">

    <div class="modal-content">

        <h2>${exercise.name}</h2>

        <div class="top-section">
            <img src="${exercise.imageUrl}">
        </div>

        <div class="desc">
            ${exercise.description}
        </div>

        <div class="target">
            타겟 근육: ${exercise.target}
        </div>

        <button onclick="showVideo()">영상으로 보기</button>
        <button onclick="startRecord()">기록 시작</button>

        <!-- 유튜브 -->
        <div id="videoBox" style="display:none;">
            <iframe width="100%" height="300"
                src="https://www.youtube.com/embed/${exercise.videoUrl}"
                frameborder="0" allowfullscreen>
            </iframe>
        </div>

    </div>
</div>

<script>
function showVideo(){
    document.getElementById("videoBox").style.display = "block";
}
</script>
</body>
</html>