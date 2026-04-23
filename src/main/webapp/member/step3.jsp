<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Step3</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@400;700&display=swap" rel="stylesheet"/>

<style>
body { font-family: 'Public Sans', sans-serif; }
</style>
</head>

<body class="bg-slate-50 h-screen flex relative">

<div class="absolute inset-0 bg-slate-900/60 flex items-center justify-center">

<div class="bg-white rounded-2xl shadow-2xl w-full max-w-md">

<!-- header -->
<div class="p-6 text-center">
<h2 class="text-xl font-bold text-blue-500">맞춤형 운동 계획 생성</h2>

<div class="flex mt-3">
<div class="flex-1 h-2 bg-blue-500"></div>
<div class="flex-1 h-2 bg-blue-500"></div>
<div class="flex-1 h-2 bg-blue-500"></div>
</div>

<p class="text-sm mt-2">단계 3 / 3</p>
</div>

<form action="completeSignup" method="post">

<div class="p-6">

<h3 class="font-bold mb-4">Q5. 1주일 기준 목표 운동 횟수는 몇 회인가요?</h3>

<label class="block border p-4 rounded-xl mb-3">
<input type="radio" name="workout" value="1-2"/> 1~2회(가볍게 꾸준히)
</label>

<label class="block border p-4 rounded-xl mb-3">
<input type="radio" name="workout" value="3-4" checked/> 3~4회(일반적인 목표)
</label>

<label class="block border p-4 rounded-xl">
<input type="radio" name="workout" value="5+"/> 5회 이상(본격적인 몸만들기)
</label>

<div class="mt-6 p-4 bg-blue-50 rounded-xl text-sm">
맞춤형 분석 준비 완료.입력해주신 정보를 바탕으로 최적의 운동 프로그램과 추천 트레이너를 찾아드릴게요!
</div>

</div>

<div class="p-6 flex gap-4">
<button type="button" onclick="history.back()" class="w-1/2 border py-3 rounded-xl">
이전
</button>

<button type="submit" class="w-1/2 bg-blue-500 text-white py-3 rounded-xl">
시작하기
</button>
</div>

</form>

</div>
</div>

</body>
</html>