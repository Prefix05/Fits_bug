<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>커뮤니티</title>

<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet"/>

<script>
tailwind.config = {
  darkMode: "class",
  theme: {
    extend: {
      colors: {
        "surface-container-lowest": "#ffffff",
        "surface": "#f9f9ff",
        "on-surface": "#191b23",
        "primary": "#0058be",
        "primary-container": "#2170e4",
        "surface-container-low": "#f2f3fd",
        "surface-container-high": "#e6e7f2",
        "surface-container-highest": "#e1e2ec",
        "outline-variant": "#c2c6d6",
        "on-surface-variant": "#424754"
      }
    }
  }
}
</script>

<style>
body { font-family: 'Inter', sans-serif; }
</style>
</head>

<body class="bg-surface text-on-surface flex min-h-screen">

<!-- 사이드바 -->
<aside class="fixed left-0 top-0 h-full w-72 bg-surface-container-low flex flex-col p-6 gap-y-2 hidden md:flex">

<h1 class="text-xl font-black text-primary italic mb-6">핏츠버그</h1>

<nav class="flex flex-col gap-2">
<a class="px-4 py-3 text-slate-500 hover:bg-slate-100 rounded-xl" href="main.jsp">홈</a>

<a class="px-4 py-3 bg-surface-container-lowest text-primary font-semibold rounded-xl">
커뮤니티
</a>

<a class="px-4 py-3 text-slate-500 hover:bg-slate-100 rounded-xl" href="mypage.jsp">
마이페이지
</a>
</nav>

</aside>

<!-- 메인 -->
<main class="flex-1 ml-0 md:ml-72 p-8 flex flex-col gap-8 max-w-4xl mx-auto">

<h2 class="text-2xl font-bold">커뮤니티</h2>

<!-- 글 작성 버튼 -->
<div class="flex justify-end">
<button class="bg-primary text-white px-4 py-2 rounded-full text-sm">
글 작성
</button>
</div>

<!-- 게시글 -->
<div class="bg-white p-6 rounded-xl shadow border">

<div class="flex items-center gap-3 mb-4">
<img src="https://via.placeholder.com/40" class="w-10 h-10 rounded-full"/>
<div>
<p class="font-bold text-sm">강철근</p>
<p class="text-xs text-gray-400">2시간 전</p>
</div>
</div>

<img src="https://via.placeholder.com/600x400" class="rounded-lg mb-4"/>

<p class="text-sm mb-3">
데드리프트 180kg 성공🔥
</p>

<div class="flex gap-2 text-sm text-blue-500">
<span>#오운완</span>
<span>#헬스</span>
</div>

</div>

</main>

</body>
</html>