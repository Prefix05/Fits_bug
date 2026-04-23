<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Step2</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet"/>

<style>
body { font-family: 'Public Sans', sans-serif; }
</style>
</head>

<body class="bg-slate-50 h-screen flex relative">

<!-- 모달 -->
<div class="absolute inset-0 bg-slate-900/60 flex items-center justify-center">

<div class="bg-white rounded-2xl shadow-2xl w-full max-w-lg flex flex-col">

<!-- header -->
<div class="px-8 pt-8 pb-4 text-center">
<h2 class="text-2xl font-bold text-blue-600">맞춤형 운동 계획 생성</h2>

<div class="flex mt-4">
<div class="flex-1 h-2 bg-blue-600 rounded"></div>
<div class="flex-1 h-2 bg-blue-600 rounded"></div>
<div class="flex-1 h-2 bg-gray-200 rounded"></div>
</div>

<p class="text-sm mt-2">단계 2 / 3</p>
</div>

<!-- form 시작 -->
<form action="step3" method="post">

<div class="px-8 py-4 space-y-8">

<!-- 키 몸무게 -->
<div>
<h3 class="font-semibold mb-4">Q3. 현재 체형 정보를 입력해주세요.</h3>

<div class="grid grid-cols-2 gap-4">
<input name="height" placeholder="키(cm)" class="p-3 border rounded-xl"/>
<input name="weight" placeholder="몸무게(kg)" class="p-3 border rounded-xl"/>
</div>
</div>

<!-- 식단 -->
<div>
<h3 class="font-semibold mb-4">Q4. 현재 식단 관리를 하고 계신가요?</h3>

<label class="block border p-3 rounded-xl mb-2">
<input type="radio" name="diet" value="strict"/> 철저한 식단(관리중)
</label>

<label class="block border p-3 rounded-xl mb-2">
<input type="radio" name="diet" value="protein" checked/> 단백질 위주 식사
</label>

<label class="block border p-3 rounded-xl">
<input type="radio" name="diet" value="normal"/> 일반식(관리안함)
</label>

</div>

</div>

<!-- footer -->
<div class="p-6 flex justify-between">

<button type="button" onclick="history.back()" class="px-6 py-3 border rounded-xl">
이전
</button>

<button type="submit" class="px-8 py-3 bg-blue-600 text-white rounded-xl">
다음 단계
</button>

</div>

</form>

</div>
</div>

</body>
</html>