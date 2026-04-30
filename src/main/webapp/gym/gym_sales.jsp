<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitsbug 매출</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet">
<style>
        body { font-family: 'Inter', sans-serif; -webkit-font-smoothing: antialiased; }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            vertical-align: middle;
        }
        .glass-nav {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
        }
        /* Custom scrollbar for trainer list */
        .custom-scrollbar::-webkit-scrollbar {
            width: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #e1e2e4;
            border-radius: 10px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background: #c2c6d6;
        }
    </style>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "on-tertiary": "#ffffff",
                        "tertiary-container": "#b75b00",
                        "surface-bright": "#f8f9fb",
                        "on-primary-fixed": "#001a42",
                        "surface-tint": "#005ac2",
                        "tertiary-fixed-dim": "#ffb786",
                        "surface-dim": "#d9dadc",
                        "surface-container-high": "#e7e8ea",
                        "surface-container": "#edeef0",
                        "surface-container-low": "#f3f4f6",
                        "error": "#ba1a1a",
                        "surface-container-lowest": "#ffffff",
                        "inverse-on-surface": "#f0f1f3",
                        "outline": "#727785",
                        "secondary": "#495e8a",
                        "background": "#f8f9fb",
                        "on-secondary-fixed-variant": "#304671",
                        "secondary-fixed-dim": "#b1c6f9",
                        "primary": "#3B82F6", 
                        "outline-variant": "#c2c6d6",
                        "tertiary-fixed": "#ffdcc6",
                        "on-primary-fixed-variant": "#004395",
                        "tertiary": "#924700",
                        "secondary-fixed": "#d8e2ff",
                        "inverse-primary": "#adc6ff",
                        "on-error": "#ffffff",
                        "on-background": "#191c1e",
                        "primary-fixed": "#d8e2ff",
                        "surface": "#f8f9fb",
                        "on-secondary": "#ffffff",
                        "secondary-container": "#b6ccff",
                        "on-secondary-container": "#405682",
                        "on-surface-variant": "#424754",
                        "inverse-surface": "#2e3132",
                        "on-surface": "#191c1e",
                        "on-primary": "#ffffff",
                        "error-container": "#ffdad6",
                        "primary-fixed-dim": "#adc6ff",
                        "on-tertiary-fixed-variant": "#723600",
                        "on-tertiary-fixed": "#311400",
                        "on-tertiary-container": "#fffbff",
                        "on-primary-container": "#fefcff",
                        "surface-container-highest": "#e1e2e4",
                        "primary-container": "#3B82F6",
                        "surface-variant": "#e1e2e4",
                        "on-secondary-fixed": "#001a42",
                        "on-error-container": "#93000a"
                    },
                    "borderRadius": {
                        "DEFAULT": "8px", 
                        "lg": "8px",
                        "xl": "1.5rem",
                        "full": "9999px"
                    }
                },
            },
        }
    </script>
</head>
<body class="bg-background">

<jsp:include page="common/sidebar.jsp"></jsp:include>

<main class="pt-24 px-8 pb-12 ml-[260px]">
<div class="max-w-[1400px] mx-auto space-y-6">

    <!-- Page Header -->
    <div class="flex justify-between items-end mb-8">
        <div>
            <h2 class="text-3xl font-extrabold text-on-surface tracking-tight">매출 상세 내역</h2>
            <p class="text-on-surface-variant mt-1">헬스장 이용권 및 PT 결제 매출을 확인합니다.</p>
        </div>
    </div>

    <!-- Top Section -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6">

        <!-- Revenue Trend -->
        <div class="lg:col-span-8 bg-surface-container-lowest rounded-lg shadow-sm border border-outline-variant/15 overflow-hidden">
            <div class="px-6 py-5 border-b border-surface-container flex items-center justify-between">
                <h3 class="font-bold text-on-surface">기간 별 매출 추이</h3>

                <div class="flex items-center gap-2">
                    <span class="text-xs text-on-surface-variant">
                        ${startDate} ~ ${endDate}
                    </span>
                </div>
            </div>

            <div class="p-6 h-[400px] flex flex-col justify-end">
				
                <!-- 간단 막대 차트 -->
                <div class="flex-1 flex items-end justify-between gap-4 px-2">
                    <c:forEach var="chart" items="${salesChartList}">
                        <div class="flex-1 flex flex-col items-center gap-2 group cursor-pointer">
                            <div class="w-full bg-primary/20 hover:bg-primary/40 transition-colors rounded-t-sm relative"
                                 style="height:${empty chart.percent ? 0 : chart.percent * 1.5}px;">
                                <div class="hidden group-hover:block absolute -top-8 left-1/2 -translate-x-1/2 bg-inverse-surface text-inverse-on-surface text-[9px] px-2 py-1 rounded shadow-lg whitespace-nowrap">
                                    ₩<fmt:formatNumber value="${chart.sales}" pattern="#,###"/>
                                </div>
                            </div>
                            <div class="text-[10px] text-on-surface-variant font-medium">
                                ${chart.label}
                            </div>
                        </div>
                    </c:forEach> 

                    <c:if test="${empty salesChartList}">
                        <div class="w-full h-full flex items-center justify-center text-sm text-on-surface-variant">
                            조회된 매출 추이 데이터가 없습니다.
                        </div>
                    </c:if>
                </div>

                <!-- Summary -->
                <div class="mt-6 pt-4 border-t border-surface-container flex flex-wrap justify-between items-center gap-y-4">
                    <div class="flex flex-wrap items-center gap-x-6 gap-y-1">

                        <div class="flex flex-col">
                            <span class="text-[10px] font-bold text-on-surface-variant uppercase">총 매출액</span>
                            <span class="font-bold text-xl text-on-surface">
                                ₩<fmt:formatNumber value="${empty salesSummary ? 0 : salesSummary.totalSales}" pattern="#,###"/>
                            </span>
                        </div>

                        <div class="flex flex-col border-l border-outline-variant/30 pl-6">
                            <span class="text-[10px] font-bold text-on-surface-variant uppercase">헬스장 이용권 매출</span>
                            <span class="font-bold text-sm text-on-surface">
                                ₩<fmt:formatNumber value="${empty salesSummary ? 0 : salesSummary.gymSales}" pattern="#,###"/>
                            </span>
                        </div>

                        <div class="flex flex-col border-l border-outline-variant/30 pl-6">
                            <span class="text-[10px] font-bold text-on-surface-variant uppercase">PT 매출</span>
                            <span class="font-bold text-sm text-on-surface">
                                ₩<fmt:formatNumber value="${empty salesSummary ? 0 : salesSummary.ptSales}" pattern="#,###"/>
                            </span>
                        </div>

                        <div class="flex flex-col border-l border-outline-variant/30 pl-6">
                            <span class="text-[10px] font-bold text-on-surface-variant uppercase">결제 수수료</span>
                            <span class="font-bold text-sm text-on-surface">
                                ₩<fmt:formatNumber value="${empty salesSummary ? 0 : salesSummary.totalFee}" pattern="#,###"/>
                            </span>
                        </div>

                        <div class="flex flex-col border-l border-outline-variant/30 pl-6">
                            <span class="text-[10px] font-bold text-on-surface-variant uppercase">순 매출</span>
                            <span class="font-bold text-sm text-on-surface">
                                ₩<fmt:formatNumber value="${empty salesSummary ? 0 : salesSummary.netSales}" pattern="#,###"/>
                            </span>
                        </div>
                    </div>

                    <div class="text-xs font-semibold text-emerald-600 flex items-center gap-1">
                        <span class="material-symbols-outlined text-sm">trending_up</span>
                        전월 대비 ${salesSummary.growthRate}% 증가
                    </div>
                </div>
            </div>
        </div>

        <!-- Top Trainers -->
        <div class="lg:col-span-4 bg-surface-container-lowest rounded-lg shadow-sm border border-outline-variant/15 flex flex-col h-[486px]">
            <div class="px-6 py-5 border-b border-surface-container">
                <h3 class="font-bold text-on-surface">최고 매출 트레이너 순위</h3>
                <p class="text-[10px] font-bold text-on-surface-variant uppercase tracking-wider mt-0.5">
                    PT 결제 매출 기준
                </p>
            </div>

            <div class="flex-1 overflow-y-auto p-4 space-y-3 custom-scrollbar">
                <c:forEach var="trainer" items="${topTrainerList}" varStatus="status">
                    <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-surface-container transition-colors
                        ${status.first ? 'bg-primary/[0.04] border-l-4 border-primary' : ''}">

                        <div class="w-6 h-6 flex items-center justify-center rounded-full text-[10px] font-bold shrink-0
                            ${status.first ? 'bg-primary text-white' : 'bg-surface-variant text-on-surface-variant'}">
                            ${status.count}
                        </div>

                        <c:choose>
    						<c:when test="${empty trainer.profileImg}">
        						<img alt="Trainer" class="w-10 h-10 rounded-full object-cover shrink-0"
             						 src="${pageContext.request.contextPath}/img/default_profile.png">
    						</c:when>
    						<c:otherwise>
        						<img alt="Trainer" class="w-10 h-10 rounded-full object-cover shrink-0"
             					 	 src="${trainer.profileImg}">
    						</c:otherwise>
						</c:choose>

                        <div class="flex-1 min-w-0">
                            <div class="text-xs font-bold text-on-surface truncate">
                                ${trainer.trainerName}
                            </div>
                        </div>

                        <div class="text-right shrink-0">
                            <div class="text-xs font-bold ${status.first ? 'text-primary' : 'text-on-surface'}">
                                ₩<fmt:formatNumber value="${trainer.totalSales}" pattern="#,###"/>
                            </div>
                            <div class="text-[9px] font-medium text-on-surface-variant">
                                ${trainer.sessionCount} 세션
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty topTrainerList}">
                    <div class="text-sm text-on-surface-variant text-center py-10">
                        조회된 트레이너 매출이 없습니다.
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Filter -->
    <form action="${pageContext.request.contextPath}/gym/sales" method="get"
          class="bg-surface-container-lowest p-5 rounded-lg shadow-sm border border-outline-variant/15 grid grid-cols-1 gap-4 items-end md:grid-cols-12">

        <div class="space-y-1.5 md:col-span-2">
            <label class="text-[11px] font-bold text-on-surface-variant uppercase ml-1">시작일</label>
            <input name="startDate" type="date"
                   value="${startDate}"
                   class="w-full bg-surface-container-low border-none rounded-lg text-sm py-2.5 px-3 focus:ring-2 focus:ring-primary/20">
        </div>

        <div class="space-y-1.5 md:col-span-2">
            <label class="text-[11px] font-bold text-on-surface-variant uppercase ml-1">종료일</label>
            <input name="endDate" type="date"
                   value="${endDate}"
                   class="w-full bg-surface-container-low border-none rounded-lg text-sm py-2.5 px-3 focus:ring-2 focus:ring-primary/20">
        </div>

        <div class="space-y-1.5 md:col-span-2">
            <label class="text-[11px] font-bold text-on-surface-variant uppercase ml-1">이용권 종류</label>
            <select name="membershipType"
                    class="w-full bg-surface-container-low border-none rounded-lg text-sm py-2.5 focus:ring-2 focus:ring-primary/20">
                <option value="">전체</option>
                <option value="day" ${membershipType == 'day' ? 'selected' : ''}>일일권</option>
                <option value="month" ${membershipType == 'month' ? 'selected' : ''}>월 이용권</option>
                <option value="pt" ${membershipType == 'pt' ? 'selected' : ''}>PT 이용권</option>
            </select>
        </div>

        <div class="space-y-1.5 md:col-span-2">
            <label class="text-[11px] font-bold text-on-surface-variant uppercase ml-1">담당 트레이너</label>
            <select name="trainerId"
                    class="w-full bg-surface-container-low border-none rounded-lg text-sm py-2.5 focus:ring-2 focus:ring-primary/20">
                <option value="">전체 트레이너</option>
                <c:forEach var="trainer" items="${trainerList}">
                    <option value="${trainer.trainerId}" ${trainerId == trainer.trainerId ? 'selected' : ''}>
                        ${trainer.trainerName}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="space-y-1.5 md:col-span-2">
            <label class="text-[11px] font-bold text-on-surface-variant uppercase ml-1">결제 상태</label>
            <select name="status"
                    class="w-full bg-surface-container-low border-none rounded-lg text-sm py-2.5 focus:ring-2 focus:ring-primary/20">
                		<option value="">전체</option>
						<option value="결제완료" ${status == '결제완료' ? 'selected' : ''}>결제완료</option>
						<option value="취소요청" ${status == '취소요청' ? 'selected' : ''}>취소요청</option>
						<option value="취소완료" ${status == '취소완료' ? 'selected' : ''}>취소완료</option>
						<option value="환불요청" ${status == '환불요청' ? 'selected' : ''}>환불요청</option>
						<option value="환불완료" ${status == '환불완료' ? 'selected' : ''}>환불완료</option>
					</select>
        </div>

        <div class="space-y-1.5 md:col-span-1">
            <label class="text-[11px] font-bold text-on-surface-variant uppercase ml-1">회원명</label>
            <input name="keyword" type="text"
                   value="${keyword}"
                   placeholder="검색"
                   class="w-full bg-surface-container-low border-none rounded-lg text-sm py-2.5 px-3 focus:ring-2 focus:ring-primary/20">
        </div>

        <div class="md:col-span-1">
            <button type="submit"
                    class="bg-primary text-white text-sm font-bold py-2.5 rounded-lg hover:opacity-90 transition-colors w-full shadow-sm">
                적용
            </button>
        </div>
    </form>

    <!-- Revenue Table -->
    <div class="bg-surface-container-lowest rounded-lg shadow-sm overflow-hidden border border-outline-variant/15">
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-surface-container-low/50 border-b border-surface-container">
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider">회원명</th>
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider">이용권 구분</th>
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider">이용권 종류</th>
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider">담당 트레이너</th>
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider">결제일</th>
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider">상태</th>
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider">처리일</th>
						<th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider">사유</th>
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider text-right">결제금액</th>
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider text-right">수수료</th>
                        <th class="px-6 py-4 text-xs font-bold text-on-surface-variant uppercase tracking-wider text-right">순매출</th>
                    </tr>
                </thead>

                <tbody class="divide-y divide-surface-container">
                    <c:forEach var="sales" items="${salesList}">
                        <tr class="hover:bg-surface-container-low/30 transition-colors">

                            <td class="px-6 py-4">
                                <span class="text-sm font-semibold text-on-surface">
                                    ${sales.memberName}
                                </span>
                            </td>

                            <td class="px-6 py-4">
                                <c:choose>
                                    <c:when test="${fn:toLowerCase(sales.membershipType) == 'pt'}">
                                        <span class="px-2 py-1 bg-blue-100 text-blue-700 text-[10px] font-bold rounded-full uppercase">
                                            PT
                                        </span>
                                    </c:when>
                                    <c:when test="${fn:toLowerCase(sales.membershipType) == 'month'}">
                                        <span class="px-2 py-1 bg-surface-container-high text-on-surface-variant text-[10px] font-bold rounded-full uppercase">
                                            MONTH
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="px-2 py-1 bg-surface-container-high text-on-surface-variant text-[10px] font-bold rounded-full uppercase">
                                            DAY
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td class="px-6 py-4 text-sm text-on-surface-variant">
                                <c:choose>
                                    <c:when test="${fn:toLowerCase(sales.membershipType) == 'pt'}">
                                        PT ${sales.typeRep}회권
                                    </c:when>
                                    <c:when test="${fn:toLowerCase(sales.membershipType) == 'month'}">
                                        헬스장 ${sales.typeRep}개월 이용권
                                    </c:when>
                                    <c:otherwise>
                                        헬스장 ${sales.typeRep}일 이용권
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td class="px-6 py-4 text-sm text-on-surface-variant">
                                ${empty sales.trainerName ? '-' : sales.trainerName}
                            </td>

                            <td class="px-6 py-4 text-sm text-on-surface-variant">
                                <fmt:formatDate value="${sales.paymentDate}" pattern="yyyy.MM.dd"/>
                            </td>

							<td class="px-6 py-4">
								<c:choose>
									<c:when test="${sales.status == '결제완료'}">
										<span class="px-2 py-1 bg-emerald-100 text-emerald-700 text-[10px] font-bold rounded-full">결제완료</span>
									</c:when>

									<c:when test="${sales.status == '취소요청'}">
										<span class="px-2 py-1 bg-orange-100 text-orange-700 text-[10px] font-bold rounded-full">취소요청 </span>
									</c:when>

									<c:when test="${sales.status == '취소완료'}">
										<span class="px-2 py-1 bg-red-100 text-red-700 text-[10px] font-bold rounded-full">취소완료 </span>
									</c:when>

									<c:when test="${sales.status == '환불요청'}">
										<span class="px-2 py-1 bg-yellow-100 text-yellow-700 text-[10px] font-bold rounded-full">환불요청 </span>
									</c:when>

									<c:when test="${sales.status == '환불완료'}">
										<span class="px-2 py-1 bg-purple-100 text-purple-700 text-[10px] font-bold rounded-full">환불완료 </span>
									</c:when>

									<c:otherwise>
										<span class="px-2 py-1 bg-gray-100 text-gray-700 text-[10px] font-bold rounded-full">${sales.status} </span>
									</c:otherwise>
								</c:choose>
							</td>
							
							<td class="px-6 py-4 text-sm text-on-surface-variant whitespace-nowrap">
    							<c:choose>
        							<c:when test="${empty sales.canceledAt}">
            							-
        							</c:when>
        							<c:otherwise>
            							<fmt:formatDate value="${sales.canceledAt}" pattern="yyyy.MM.dd HH:mm"/>
        							</c:otherwise>
    							</c:choose>
							</td>

<td class="px-6 py-4 text-sm text-on-surface-variant max-w-[220px] truncate">
    ${empty sales.reason ? '-' : sales.reason}
</td>

									<td class="px-6 py-4 text-sm font-bold text-on-surface text-right">
                                ₩<fmt:formatNumber value="${sales.paymentPrice}" pattern="#,###"/>
                            </td>

                            <td class="px-6 py-4 text-sm text-on-surface-variant text-right">
                                ₩<fmt:formatNumber value="${sales.paymentFee}" pattern="#,###"/>
                            </td>

                            <td class="px-6 py-4 text-sm font-bold text-primary text-right">
                                ₩<fmt:formatNumber value="${sales.netPrice}" pattern="#,###"/>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty salesList}">
                        <tr>
                            <td colspan="11" class="px-6 py-10 text-center text-sm text-on-surface-variant">
                                조회된 매출 내역이 없습니다.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <div class="px-6 py-4 border-t border-surface-container flex items-center justify-between bg-white">
            <p class="text-xs text-on-surface-variant">
                총 ${totalCount}건
            </p>

            <div class="flex items-center gap-2">
            	<c:if test="${totalPage > 0}">
                	<c:forEach var="page" begin="1" end="${totalPage}">
                    	<a href="${pageContext.request.contextPath}/gym/sales?page=${page}&startDate=${startDate}&endDate=${endDate}&membershipType=${membershipType}&trainerId=${trainerId}&status=${status}&keyword=${keyword}"
                       	   class="w-8 h-8 text-xs font-bold rounded flex items-center justify-center
                       		${page == currentPage ? 'bg-primary text-white' : 'bg-surface-container text-on-surface-variant'}">
                        	${page}
                    	</a>
                	</c:forEach>
                </c:if>
            </div>
        </div>
    </div>

</div>
</main>

</body>
</html>