<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-slate-100 min-h-screen">

<div class="max-w-5xl mx-auto px-6 py-10">

    <div class="bg-white rounded-2xl shadow overflow-hidden">

    <c:choose>
        <c:when test="${not empty gym.backgroundImg}">
            <img src="${gym.backgroundImg}" class="w-full h-80 object-cover">
        </c:when>
        <c:when test="${not empty gym.file}">
            <img src="${gym.file}" class="w-full h-80 object-cover">
        </c:when>
        <c:otherwise>
            <div class="w-full h-80 bg-slate-200 flex items-center justify-center text-slate-500">
                이미지 없음
            </div>
        </c:otherwise>
    </c:choose>

    <div class="p-8">

        <div class="flex justify-between items-start mb-4">
            <div>
                <h1 class="text-3xl font-bold mb-2">${gym.name}</h1>
                <p class="text-slate-600">
                    ${gym.address} ${gym.addressDetail}
                </p>
            </div>

            <div class="text-right">
                <div class="text-yellow-500 text-xl font-bold">
                    ★ ${gym.rating}
                </div>
                <div class="text-sm text-slate-500">
                    리뷰 ${gym.reviewCount}개
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 my-8">

            <div class="border rounded-xl p-4">
                <p class="text-sm text-slate-500 mb-1">전화번호</p>
                <p class="font-semibold">${gym.phoneNum}</p>
            </div>

            <div class="border rounded-xl p-4">
                <p class="text-sm text-slate-500 mb-1">편의시설</p>
                <p class="font-semibold">${gym.facility}</p>
            </div>

        </div>

        <div class="mb-8">
            <h2 class="text-xl font-bold mb-3">헬스장 소개</h2>
            <p class="text-slate-700 leading-relaxed">
                ${gym.description}
            </p>
        </div>

        <div class="flex gap-3">
            <a href="${contextPath}/payment/membership?gymId=${gym.id}"
               class="px-6 py-3 rounded-xl bg-blue-600 text-white font-semibold">
                이용권 구매
            </a>

            <a href="${contextPath}/review/list?gymId=${gym.id}"
               class="px-6 py-3 rounded-xl border border-slate-300 font-semibold">
                리뷰 보기
            </a>
        </div>

    </div>
</div>

</div>

</body>
</html>