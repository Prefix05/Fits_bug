<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!-- 🔹 사이드바 -->
<aside
	class="h-full w-64 fixed left-0 top-0 bg-slate-50 dark:bg-slate-950 flex flex-col p-5 z-50 border-r border-surface-container-highest">

	<!-- 🔹 상단 영역 -->
	<div class="flex flex-col">

		<!-- 로고 -->
		<div
			class="text-2xl font-black text-blue-600 dark:text-blue-500 italic mb-4 flex items-center gap-2">
			<img class="w-8 h-8 rounded-full" alt="Fitbull Logo"
				src="${contextPath}/resources/images/logo.png"
				onerror="this.src='https://lh3.googleusercontent.com/aida-public/AB6AXuCveWQWdmN7R9sHZYJtczW7JlQkSJksW17FyrAjX0sIqVNoO7rUvZ5aVmTxr--s6QdrpYaJkNs9Aj3Lm4Z9ICG1waBV-yEKtgQqf7a77X3bEMweDYmiRv_2wprNj_xs__Vqyh2f5bVQr3QkuYOxRdXb5jfED0ktJFxf9r0RpjFrb6By02eTD3KzReErGiYzzhFyCBXRSRYqsQM2VKkdk7mWWO2R5jjBRMjcPYzPyBozh6wbh3bLzhw8KrRNIyipW0rhClHJNWthxiM'" />
			<span>핏츠버그</span>
		</div>

		<!-- 프로필 -->
		<div
			class="flex items-center gap-3 p-3 bg-white rounded-xl shadow-sm border mb-6">
			<div class="w-10 h-10 rounded-full bg-gray-300"></div>
			<div class="flex flex-col">
				<span class="text-sm font-semibold">사용자 이름</span> <span
					class="text-xs text-gray-500">회원</span>
			</div>
		</div>

		<!-- 메뉴 -->
		<nav class="flex flex-col gap-2"> 

			<div class="flex flex-col">
					<a href="${contextPath}/gym/dashboard"
   					   class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
						<span class="material-symbols-outlined">home</span>
    					<span class="text-sm">홈</span>
					</a>
					<a href="${contextPath}/gym/schedule"
   					   class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
						<span class="material-symbols-outlined">calendar_today</span>
    					<span class="text-sm">스케줄</span>
					</a> 
					
					<a href="${contextPath}/gym/memberManage"
   					   class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
						<span class="material-symbols-outlined">group</span>
    					<span class="text-sm">회원</span>

					</a>

					<div class="flex flex-col">

						<button type="button" onclick="toggleTrainerMenu()"
							class="flex items-center gap-3 px-4 py-2 text-sm text-slate-500 hover:text-blue-600 hover:bg-blue-50 rounded-lg w-full text-left">
							<span class="material-symbols-outlined">fitness_center</span>
							<span>트레이너</span> <span id="trainerArrow"
								class="material-symbols-outlined ml-auto text-base transition-transform">
								expand_more </span>
						</button>

						<div id="trainerMenu" class="hidden flex flex-col ml-5 mt-1 gap-1">

							<a href="${contextPath}/gym/trainer"
								class="px-4 py-2 text-sm text-slate-500 hover:text-blue-600 hover:bg-blue-50 rounded-lg">
								<span class="material-symbols-outlined">group</span>
								트레이너 관리 </a> <a href="${contextPath}/gym/trainerPending"
								class="gap-3 px-4 py-2 text-sm text-slate-500 hover:text-blue-600 hover:bg-blue-50 rounded-lg">
								<span class="material-symbols-outlined">person_add</span>
								트레이너 등록 </a>

						</div>
					</div>

					<a href="${contextPath}/gym/sales"
   					   class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
						<span class="material-symbols-outlined">bar_chart</span>
    					<span class="text-sm">매출</span>

					</a> 
					
					<a href="${contextPath}/gym/notice"
   					   class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
						<span class="material-symbols-outlined">campaign</span>
    					<span class="text-sm">공지사항</span>

					</a>
					 
					 <a href="${contextPath}/gym/infoEdit"
   					    class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
						<span class="material-symbols-outlined">edit_square</span>
    					<span class="text-sm">정보수정</span>
					</a>

				<div class="my-3 border-t-2 border-outline-variant/40 mx-2"></div>

			    <a href="${contextPath}/member/guide" class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
			    	<span class="material-symbols-outlined">fitness_center</span>
			    	<span>운동 가이드</span>
    			</a>
    			
			    <a href="${contextPath}/member/trainerList" class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
      				<span class="material-symbols-outlined">badge</span>
      				<span>트레이너</span>
    			</a>
    			
   				<a href="${contextPath}/member/gymList" class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
      				<span class="material-symbols-outlined">store</span>
      				<span>헬스장</span>
    			</a>
    			
    			<a href="${contextPath}/member/community" 
    			    class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
      				<span class="material-symbols-outlined">groups</span>
      				<span>커뮤니티</span>
    			</a>


			</div>

		</nav>
	</div>

	<!-- 🔹 하단 영역 -->
	<div class="mt-auto flex flex-col gap-2 pt-4 border-t border-slate-200">

		<!-- 고객센터 (하단 고정) -->
		<a href="${contextPath}/support.jsp"
			class="flex items-center gap-3 px-4 py-2 rounded-xl text-slate-500 hover:bg-blue-50">
			<span class="material-symbols-outlined">support_agent</span> <span
			class="text-sm">고객센터</span>
		</a>

		<!-- 로그아웃 -->
		<button onclick="location.href='${contextPath}/login.jsp'"
			class="bg-blue-600 text-white py-2 rounded-xl text-sm font-bold">
			로그아웃</button>

	</div>

</aside>

<!-- 🔹 우측 상단 아이콘 -->
<div class="fixed top-4 right-6 flex items-center gap-4 z-50">

	<!-- 알림 -->
	<button
		class="relative p-2 rounded-full bg-white shadow hover:bg-gray-100">
		<span class="material-symbols-outlined text-[22px]">
			notifications </span> <span
			class="absolute -top-1 -right-1 w-4 h-4 bg-red-500 text-white text-[10px] flex items-center justify-center rounded-full">
			3 </span>
	</button>

	<!-- 메시지 -->
	<button
		class="relative p-2 rounded-full bg-white shadow hover:bg-gray-100">
		<span class="material-symbols-outlined text-[22px]"> mail </span> <span
			class="absolute -top-1 -right-1 w-4 h-4 bg-blue-500 text-white text-[10px] flex items-center justify-center rounded-full">
			5 </span>
	</button>

</div>

<script>
	function toggleMenu() {
		const menu = document.getElementById("menu");
		const arrow = document.getElementById("arrow");

		menu.classList.toggle("hidden");
		arrow.classList.toggle("rotate-180");
	}

	function toggleTrainerMenu() {
		const trainerMenu = document.getElementById("trainerMenu");
		const trainerArrow = document.getElementById("trainerArrow");

		trainerMenu.classList.toggle("hidden");
		trainerArrow.classList.toggle("rotate-180");
	}
</script>