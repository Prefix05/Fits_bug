<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.member.MemberDTO"%>
<%
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

    if(loginUser == null){
        response.sendRedirect("login.jsp");
        return;
    }

    String sender = loginUser.getEmail(); // 🔥 로그인 사용자
    String receiver = "trainer1"; // 테스트용 (나중에 동적으로 바꿔)
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

<!-- 사이드바 -->
<%-- <jsp:include page="sidebar.jsp" /> --%>

<div class="ml-72 p-6 flex gap-6">

    <!-- 채팅 -->
    <div class="bg-white p-4 rounded shadow w-96">
        <div id="chatBox" class="h-64 overflow-y-scroll border p-2 mb-2"></div>

        <input id="msgInput" class="border w-full p-2" placeholder="메시지 입력">

        <button onclick="sendMsg()" class="bg-blue-500 text-white w-full mt-2 py-2">
            보내기
        </button>
    </div>

    <!-- 🔥 트레이너 카드 -->
    <div id="trainerCard" class="bg-white p-4 rounded shadow w-64">
        
        <div class="flex flex-col items-center">
            <img id="trainerImg" class="w-20 h-20 rounded-full mb-2">

            <h3 id="trainerName" class="font-bold"></h3>

            <!-- 진행상황 -->
            <p id="sessionText" class="text-sm text-gray-500 mt-2"></p>

            <!-- 게이지 -->
            <div class="w-full bg-gray-200 h-2 rounded mt-2">
                <div id="sessionBar" class="bg-green-500 h-2 rounded"></div>
            </div>

            <!-- 버튼 -->
            <button onclick="goFeedback()"
                class="mt-4 bg-blue-500 text-white px-3 py-1 rounded text-sm">
                최신 피드백 보기
            </button>
            
             <!-- 🔥 다음 수업 -->
			<div class="mt-4 w-full text-center border-t pt-3">
    			<p class="text-sm text-gray-500">다음 수업</p>
    			<p id="nextClassTime" class="font-bold text-blue-500 mt-1">
       	 			불러오는 중...
   				</p>

			</div>
        </div>

    </div>

</div>

<script>
let sender = "<%=sender%>";
let receiver = "<%=receiver%>";
let nextTime = null;

function loadChat(){
	fetch("message?sender=" + sender + "&receiver=" + receiver)
    .then(res=>res.json())
    .then(data=>{

        const box = document.getElementById("chatBox");
        box.innerHTML = "";

        data.forEach(function(m){
        	box.innerHTML +=
        	    '<div class="' + (m.sender === sender ? 'text-right' : 'text-left') + '">' +
        	        '<div class="inline-block bg-gray-200 p-2 rounded mb-1">' +
        	            m.content +
        	        '</div>' +
        	    '</div>';
        });

        box.scrollTop = box.scrollHeight;
    });
}

function sendMsg(){

    const msg = document.getElementById("msgInput").value;

    fetch("message", {
        method:"POST",
        headers:{"Content-Type":"application/x-www-form-urlencoded"},
        body:`sender=${sender}&receiver=${receiver}&content=${msg}`
    })
    .then(()=>{
        document.getElementById("msgInput").value="";
        loadChat();
    });
}

// 🔥 처음 로드
loadChat();

// 🔥 2초마다 자동 갱신
setInterval(loadChat, 2000);

// 알림 아이콘 숫자 연결
function loadUnread(){
    fetch("unread?user="+sender)
    .then(res=>res.text())
    .then(cnt=>{
        document.getElementById("msgBadge").innerText = cnt;
    });
}

// 트레이너 정보 불러오기
function loadTrainer(){

 fetch("trainerInfo?trainerEmail=" + receiver)
 .then(res=>res.json())
 .then(data=>{

     document.getElementById("trainerImg").src = data.profile;
     document.getElementById("trainerName").innerText = data.nickname;

     document.getElementById("sessionText").innerText =
         "진행중 (" + data.done + "/" + data.total + "회)";

     // 🔥 게이지 계산
     var percent = 0;
     if(data.total > 0){
         percent = (data.done / data.total) * 100;
     }

     document.getElementById("sessionBar").style.width = percent + "%";
 });
}

function loadNextClass(){

    fetch("nextClass?email=" + sender + "&trainerEmail=" + receiver)
    .then(res=>res.json())
    .then(data=>{

        if(!data.time){
            document.getElementById("nextClassTime").innerText = "예약 없음";
            return;
        }

        nextTime = new Date(data.time);
        updateCountdown();
    })
    .catch(() => {
        document.getElementById("nextClassTime").innerText = "불러오기 실패";
    });
}

function updateCountdown(){

    if(!nextTime) return;

    const now = new Date();
    const diff = nextTime - now;

    if(diff <= 0){
        document.getElementById("nextClassTime").innerText = "수업 시작됨";
        return;
    }

    const days = Math.floor(diff / (1000 * 60 * 60 * 24));
    const hours = Math.floor((diff / (1000 * 60 * 60)) % 24);
    const minutes = Math.floor((diff / (1000 * 60)) % 60);

    let text = "";

    if(days > 0){
        text += "D-" + days + " ";
    }else{
        text += "오늘 ";
    }

    text += hours + "시간 " + minutes + "분 후";

    document.getElementById("nextClassTime").innerText = text;
}

// 🔥 1분마다 갱신
setInterval(updateCountdown, 60000);

//🔥 피드백 이동
function goFeedback(){
	location.href = "<%=request.getContextPath()%>/mypage?tab=feedback";
}

//🔥 최초 실행
loadTrainer();
loadNextClass();

document.getElementById("msgInput").addEventListener("keypress", function(e){
    if(e.key === "Enter"){
        sendMsg();
    }
});
</script>

</body>
</html>