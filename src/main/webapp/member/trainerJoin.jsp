<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>트레이너 회원가입</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet"/>

</head>

<body class="bg-surface-container-low min-h-screen flex">

<div class="flex w-full min-h-screen">

<!-- LEFT -->
<div class="w-full lg:w-1/2 flex flex-col justify-center px-16">

<form action="trainerJoin" method="post" class="space-y-6">

<!-- 아이디 -->
<input name="id" placeholder="아이디" class="w-full border p-3 rounded">

<!-- 비밀번호 -->
<input name="password" type="password" placeholder="비밀번호" class="w-full border p-3 rounded">

<!-- 이름 -->
<input name="name" placeholder="이름" class="w-full border p-3 rounded">

<!-- 주민번호 -->
<div class="flex gap-2">
<input name="ssn1" placeholder="앞자리" class="w-1/2 border p-3 rounded">
<input name="ssn2" placeholder="뒤자리" class="w-1/2 border p-3 rounded">
</div>

<!-- 주소 -->
<input name="address" placeholder="주소" class="w-full border p-3 rounded">

<!-- 연락처 -->
<input name="phone" placeholder="전화번호" class="w-full border p-3 rounded">

<button class="w-full bg-orange-500 text-white p-3 rounded">
회원가입 완료
</button>

</form>

</div>

</div>

</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>트레이너 회원가입</title>

<script src="https://cdn.tailwindcss.com?plugins=forms"></script>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet"/>

<style>
body { font-family: 'Inter', sans-serif; }
.gradient-btn {
    background: linear-gradient(135deg, #ff6b00 0%, #a04100 100%);
}
</style>
</head>

<body class="bg-gray-100 min-h-screen flex">

<div class="w-full lg:w-1/2 flex flex-col justify-center px-10">

<h1 class="text-3xl font-bold mb-6">트레이너 회원가입</h1>

<form action="trainerJoin" method="post" class="space-y-4">

<input name="username" placeholder="아이디" class="w-full p-3 border rounded" required>
<input name="password" type="password" placeholder="비밀번호" class="w-full p-3 border rounded" required>
<input name="nickname" placeholder="이름/닉네임" class="w-full p-3 border rounded" required>

<input name="ssn1" placeholder="주민번호 앞자리" class="w-full p-3 border rounded" required>
<input name="ssn2" placeholder="주민번호 뒷자리" class="w-full p-3 border rounded" required>

<input name="address" placeholder="주소" class="w-full p-3 border rounded" required>
<input name="phone" placeholder="전화번호" class="w-full p-3 border rounded" required>

<button class="w-full gradient-btn text-white p-3 rounded">
회원가입 완료
</button>

</form>

</div>
<!-- RIGHT -->
<div class="hidden md:block md:w-1/2 relative bg-slate-900">

<div class="absolute inset-0 bg-cover bg-center"
style="background-image:url('https://lh3.googleusercontent.com/aida-public/AB6AXuB4xtK3O5GT-5y9CJWlerii7aPWu5pK2KpFABJoNUPBmWVpOM3ZZw3eo9Zc3rfDLQ3UTyTLxFoHlUv9ic3PlfPMyPDCTKay-OSiqBMOHkAwVlrFbXlWvZ9TewuneJr5SA5Nkuwf7HnGThq2pRv8mE6kPaJv6-Sz7BkpA2lhNxSXxyKjuLSBS8p2aA3B55XeCzp55qSCtGXTyRq13GNepQFUW97RODytT8ZVvM7pDLH_HYb6_cf460V4VvsX80AVIspKkLoiqazqgu4')">
</div>

<div class="absolute inset-0 bg-gradient-to-t from-black/80"></div>

<div class="absolute bottom-16 left-16 right-16 text-white">
<blockquote class="text-2xl mb-6">
"최고의 트레이닝은 완벽한 환경에서 시작됩니다."
</blockquote>

<div class="flex items-center gap-4">
<div class="w-12 h-12 rounded-full overflow-hidden">
<img src="https://lh3.googleusercontent.com/aida-public/AB6AXuAZH_DaK1hIp-0yJ7yo3Uh_us8thyfxrvb8Wdsxu2PAUJy2spSNxjEEY2QHlKbk-_wcXcYkAFsNPYwDJp9rg8xuUCvpMtaWXzQU2-dG06jHTCbEDIfsycoPPjjuHuIGm58xm_5OzY5c4bS5gLV6I0LexkvW_I2N9fTN1xjKzbxcNzwjj4bO8ld3NH2oOAW2dfG5hlACfYJCzIA_nvyh7QFPG8Qm-y5pcEch0FZ593uyHxRTHPbNc2_UHqmvRYJv-qLoHn-1IOdSRCA"/>
</div>
<div>
<div class="font-bold">Sarah Jenkins</div>
<div class="text-sm text-slate-300">Lead Trainer</div>
</div>
</div>

</div>
</div>

</body>
</html>