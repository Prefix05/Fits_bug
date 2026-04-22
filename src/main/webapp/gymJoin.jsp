<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>헬스장 회원가입</title>

<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;900&display=swap" rel="stylesheet"/>

<style>
body { font-family: 'Inter', sans-serif; }
</style>
</head>

<body class="bg-gray-100 min-h-screen flex">

<div class="w-full lg:w-1/2 flex flex-col px-10 py-10">

<h1 class="text-3xl font-bold mb-6">헬스장 회원가입</h1>

<form action="gymJoin" method="post" class="space-y-4">

<input name="username" placeholder="아이디" class="w-full p-3 border rounded" required>

<input name="password" type="password" placeholder="비밀번호" class="w-full p-3 border rounded" required>

<input name="gymName" placeholder="헬스장 이름 / 상호명" class="w-full p-3 border rounded" required>

<input name="address" placeholder="주소" class="w-full p-3 border rounded" required>

<input name="phone" placeholder="연락처" class="w-full p-3 border rounded" required>

<input name="ceo" placeholder="대표자 이름" class="w-full p-3 border rounded" required>

<button class="w-full bg-orange-600 text-white p-3 rounded">
회원가입 완료
</button>

</form>

</div>

</body>
</html>