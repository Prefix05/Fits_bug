<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피츠버그 엘리트 피트니스 - 관리자 모드</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "outline-variant": "#c2c6d6",
                        "on-secondary-fixed-variant": "#304671",
                        "inverse-on-surface": "#f0f1f3",
                        "tertiary-container": "#b75b00",
                        "background": "#f8f9fb",
                        "on-error-container": "#93000a",
                        "primary-container": "#3B82F6",
                        "on-tertiary-fixed-variant": "#723600",
                        "on-surface": "#191c1e",
                        "on-primary-fixed": "#001a42",
                        "surface-container-high": "#e7e8ea",
                        "outline": "#727785",
                        "on-tertiary-fixed": "#311400",
                        "surface-container-lowest": "#ffffff",
                        "surface-container-highest": "#e1e2e4",
                        "on-primary-fixed-variant": "#004395",
                        "tertiary": "#924700",
                        "secondary-fixed-dim": "#b1c6f9",
                        "error": "#ba1a1a",
                        "surface-dim": "#d9dadc",
                        "on-secondary-container": "#405682",
                        "surface-container": "#edeef0",
                        "tertiary-fixed-dim": "#ffb786",
                        "primary": "#3B82F6",
                        "on-secondary": "#ffffff",
                        "on-tertiary": "#ffffff",
                        "on-primary": "#ffffff",
                        "inverse-primary": "#adc6ff",
                        "surface-container-low": "#f3f4f6",
                        "on-tertiary-container": "#fffbff",
                        "surface-tint": "#3B82F6",
                        "secondary": "#495e8a",
                        "primary-fixed": "#d8e2ff",
                        "on-primary-container": "#fefcff",
                        "on-error": "#ffffff",
                        "inverse-surface": "#2e3132",
                        "secondary-fixed": "#d8e2ff",
                        "error-container": "#ffdad6",
                        "surface": "#f8f9fb",
                        "on-surface-variant": "#424754",
                        "surface-bright": "#f8f9fb",
                        "primary-fixed-dim": "#adc6ff",
                        "tertiary-fixed": "#ffdcc6",
                        "secondary-container": "#b6ccff",
                        "on-background": "#191c1e",
                        "surface-variant": "#e1e2e4",
                        "on-secondary-fixed": "#001a42"
                    },
                    "borderRadius": {
                        "DEFAULT": "8px",
                        "lg": "8px",
                        "xl": "1.5rem",
                        "full": "9999px"
                    },
                    "fontFamily": {
                        "headline": ["Inter"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    }
                },
            }
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            vertical-align: middle;
        }
        .glass-nav {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
        }
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
		.modal-backdrop {
    		background: rgba(0, 0, 0, 0.85);
    		backdrop-filter: blur(12px);
		}
</style>
</head>
<body class="bg-background font-body text-on-surface">
<jsp:include page="common/sidebar.jsp"></jsp:include>

<!-- Main Content Area -->
<main class="ml-64 pt-16 min-h-screen bg-surface">
<div class="p-6 space-y-6">
<!-- Hero Section -->
<section>
<div class="relative h-[240px] rounded-xl overflow-hidden shadow-sm">
<img alt="Modern high-end gym interior" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAOmAriJw7C7IRscUaDd8fksRXMSKZHOVB_8-HXCoQq2K9GCjy4GL9h3g5dh6ZAP3acuI7M9g61BPLNElK6ptpJpqpajwYiOszBAt_J0Kh5ptZu1dkKB6DQVunEBmyiEIOfZTgJ3Qa8m3O_3_E6qnm0jIC_fdHGau6Z8PH8qYbhpwnH6HswH70ba6rM_uGIIcqdDqcJkM8uFap5ohS3Gez3PPjLUR3_oxbqCMu3OpdTXLkMLnGnxJx50HZWp5EmYkyXVeJiorZaSXnH"/>
<div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-transparent"></div>
<div class="absolute bottom-6 left-6 flex items-end space-x-4">
<div class="w-20 h-20 bg-surface-container-lowest rounded-xl p-2 shadow-lg flex items-center justify-center">
<span class="text-primary font-black text-xl tracking-tighter italic">FBG</span>
</div>
<div class="text-white pb-1">
<h2 class="text-3xl font-black tracking-tight">${gym.name}<span class="material-symbols-outlined text-primary align-middle ml-2" style='font-variation-settings: "FILL" 1; font-size: 24px;'>check_circle</span></h2>

<div class="flex items-center space-x-4 text-[11px] font-medium text-white/90">
<span class="flex items-center"><span class="material-symbols-outlined text-xs mr-1">call</span>${gym.phoneNum}</span>
<span class="flex items-center"><span class="material-symbols-outlined text-xs mr-1 text-yellow-400" style='font-variation-settings: "FILL" 1;'>star</span>${gym.rating}(${gym.reviewCount}개 후기)</span>
</div>
<p class="text-[11px] font-medium text-white/90 mt-1">${gym.description}</p>
</div>
</div>
</div>
</section>
<div class="grid grid-cols-12 gap-6 items-start">
<!-- Left Column -->
<div class="col-span-8 space-y-6">
<div class="grid grid-cols-2 gap-6">
<!-- Gallery -->
<c:if test="${not empty gym.file }">
	<c:set var="images" value="${fn:split(gym.file, ',')}" /> 
	
	<section class="bg-surface-container-lowest p-5 rounded-xl shadow-sm border border-outline-variant/15">
		<h3 class="text-sm font-bold tracking-tight mb-3">센터 갤러리</h3>
		
		<div class="grid grid-cols-2 gap-2">
			<c:forEach var="img" items="${images}" varStatus="status">
				<div class="aspect-video rounded-lg overflow-hidden border border-outline-variant/10">
					<img alt="Gym gallery image"  
						 src="${pageContext.request.contextPath}/galleryImages/${img}"
	 					 onclick="openLightbox(${status.index})"
     					 class="w-full h-full object-cover hover:scale-105 transition-transform cursor-pointer"/>
				</div>
			</c:forEach>
		</div>
	</section>
</c:if>
<!-- Notice -->
<section class="bg-surface-container-lowest p-5 rounded-xl shadow-sm border border-outline-variant/15">
	<div class="flex justify-between items-center mb-3">
		<h3 class="text-sm font-bold tracking-tight">공지사항</h3>
		<a href="${pageContext.request.contextPath}/gym/notice?gymId=${gym.id}" class="text-[10px] font-bold text-primary">전체보기</a>
	</div>
	<div class="space-y-1.5">
		<c:choose>
			<c:when test="${not empty noticeList}">
				<c:forEach var="notice" items="${noticeList}">
					<a href="${pageContext.request.contextPath}/gym/noticeDetail?id=${notice.id}"
					   class="flex justify-between items-center p-2 rounded hover:bg-surface-container-low transition-colors group cursor-pointer border-b border-outline-variant/5 last:border-0">
							<div class="flex items-center space-x-2">
								<span class="w-1.5 h-1.5 rounded-full bg-primary"></span>
								<span class="text-xs font-medium text-on-surface truncate max-w-[150px]">${notice.title}</span>
							</div>
							<span class="text-[10px] text-outline">${notice.createdAt}</span>
					</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="text-xs text-outline p-2">
                    등록된 공지사항이 없습니다.
                </div>
			</c:otherwise>
		</c:choose>
	</div>
</section>
</div>

<!-- Reviews -->
<section id="reviewSection" class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/15 flex flex-col h-[420px]">
	<div class="flex justify-between items-center mb-4 flex-shrink-0">
		<h3 class="text-sm font-bold tracking-tight">리뷰 및 평점</h3>
		<div class="flex items-center space-x-2">
			<span class="text-lg font-black text-primary">${gym.rating}</span>
			<div class="flex text-yellow-400 scale-75 origin-right">
				<c:forEach begin="1" end="5" var="i">
					<c:choose>
						<c:when test="${i <= gym.rating}">
							<span class="material-symbols-outlined" style='font-variation-settings: "FILL" 1;'>star</span>
						</c:when>
						<c:otherwise>
							<span class="material-symbols-outlined" style='font-variation-settings: "FILL" 0;'>star</span>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 리뷰 작성 영역 (여기 추가) -->
	<c:if test="${not empty sessionScope.loginUser}">
    	<div class="mb-6 p-4 bg-surface-container-low rounded-lg border border-outline-variant/10">
        
        	<!-- 별점 -->
        	<div class="flex items-center space-x-1 text-yellow-400">
            	<c:forEach begin="1" end="5" var="i">
                	<span onclick="setStar(${i})"
                      	  class="material-symbols-outlined cursor-pointer">star</span>
            	</c:forEach>
            	<span class="text-[10px] ml-2">평점을 선택해주세요</span>
        	</div>

        	<!-- 내용 -->
        	<textarea id="reviewContent"
                  	  class="w-full mt-2 p-3 bg-white border rounded"
                  	  placeholder="리뷰를 작성해주세요"
                  	  rows="3"></textarea>

        	<!-- 버튼 -->
        	<div class="flex justify-between mt-2">
            	<button class="w-8 h-8 border rounded">
                	📷
            	</button>

            	<button onclick="submitReview()"
                    	class="bg-primary text-white px-4 py-2 rounded text-xs font-bold">
                	리뷰 등록
            	</button>
        	</div>
    	</div>
	</c:if>
	<div id="reviewList" class="grid grid-cols-2 gap-4">
	<c:choose>
		<c:when test="${not empty reviewList}">
			<c:forEach var="review" items="${reviewList}">
				<div class="bg-surface-container-low p-4 rounded-lg">
					<div class="flex justify-between items-start mb-2">
						<div class="flex items-center space-x-2">
							<span class="material-symbols-outlined text-outline-variant text-2xl">account_circle</span>
							<div>
								<div class="text-[11px] font-bold">${review.clientName}</div>
								<div class="text-[9px] text-outline">${review.createdAt}</div>
							</div>
						</div>
						
						<div class="flex items-center">
							<div class="flex text-yellow-400 scale-75 origin-right mr-1">
								<c:forEach begin="1" end="${review.star}">
									<span class="material-symbols-outlined" style='font-variation-settings: "FILL" 1;'>star</span>
								</c:forEach>
								<c:forEach begin="${review.star + 1}" end="5">
									<span class="material-symbols-outlined" style='font-variation-settings: "FILL" 0;'>star</span>
								</c:forEach>
							</div>
							
							<c:if test="${not empty sessionScope.loginUser or not empty sessionScope.loginGym}"> 
								<div class="flex items-center space-x-1.5 ml-2">
									<button class="text-outline hover:text-error transition-colors" title="신고하기" onclick="reportReview('${review.reviewNum}')">
										<span class="material-symbols-outlined text-sm">report</span>
									</button>
								</div>
							</c:if>
							
							<c:if test="${sessionScope.loginUser.id == review.clientId}">
    							<div class="flex items-center space-x-1.5 ml-2">
        							<button onclick="editReview(${review.reviewNum})">
            							<span class="material-symbols-outlined text-sm">edit</span>
        							</button>
        							<button onclick="deleteReview(${review.reviewNum})">
            							<span class="material-symbols-outlined text-sm">delete</span>
        							</button>
    							</div>
							</c:if>
						</div>
					</div>
					<p class="text-[11px] text-on-surface-variant line-clamp-2 leading-relaxed">${review.comment}</p>
				</div>
			</c:forEach>
		</c:when>
		
		<c:otherwise>
			<div class="col-span-2 text-xs text-outline p-4 text-center">
                    등록된 리뷰가 없습니다.
           </div>
		</c:otherwise>
	</c:choose>
</div>
<button id="reviewMoreBtn" onclick="location.href='${pageContext.request.contextPath}/review/list?gymId=${gym.id}'" class="w-full mt-4 py-1.5 text-[10px] font-bold text-primary hover:bg-primary/5 rounded">리뷰 ${gym.reviewCount}개 모두 보기</button>
</section>

<!-- Membership -->
<section class="bg-surface-container-lowest p-5 rounded-xl shadow-sm border border-outline-variant/15">
	<h3 class="text-sm font-bold tracking-tight mb-4">멤버십 요금</h3>

		<div class="grid grid-cols-5 gap-3">
			<c:choose>
				<c:when test="${not empty membershipList}">
					<c:forEach var="m" items="${membershipList}">
						<c:choose>
							<c:when test="${m.type eq 'month' and m.typeRep == 3}">
								<div class="p-3 rounded-lg bg-primary text-white shadow-lg relative overflow-hidden">
									<div class="absolute top-0 right-0 bg-white text-primary text-[7px] font-black px-1.5 py-0.5 rounded-bl uppercase">Best</div>
									<p class="text-[9px] font-bold text-white/80 mb-1 uppercase tracking-widest">
										<c:choose>
											<c:when test="${m.type eq 'day'}">${m.typeRep} Day</c:when>
											<c:when test="${m.type eq 'month' and m.typeRep == 12}">Annual</c:when>
											<c:when test="${m.type eq 'month'}">${m.typeRep} Months</c:when>
										</c:choose>
									</p>
									
									<p class="text-base font-black tracking-tighter mb-1">₩${m.price}</p>
									<p class="text-[9px] text-white/70">인기 패키지</p>
								</div>
							</c:when>
							
							<c:otherwise>
								<div class="p-3 rounded-lg bg-surface-container-low border border-outline-variant/10">
									<p class="text-[9px] font-bold text-on-surface-variant mb-1 uppercase tracking-widest">
										<c:choose>
											<c:when test="${m.type eq 'day'}">${m.typeRep} Day</c:when>
											<c:when test="${m.type eq 'month' and m.typeRep == 12}">Annual</c:when>
											<c:when test="${m.type eq 'month'}">${m.typeRep} Months</c:when>
										</c:choose>
									</p>
									
									<p class="text-base font-black tracking-tighter mb-1">₩${m.price}</p>
									
									<p class="text-[9px] text-outline">
										<c:choose>
										<c:when test="${m.type eq 'day'}">1회 이용권</c:when>
										<c:when test="${m.type eq 'month'}">정기 이용권</c:when>
										</c:choose>
									</p>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>			
				</c:when>
				<c:otherwise>
					<div class="col-span-5 text-xs text-outline p-4 text-center">
                    	등록된 멤버십 정보가 없습니다.
                	</div>
				</c:otherwise>
			</c:choose>
		</div>
</section>			
</div>
<!-- Right Column -->
<div class="col-span-4 space-y-6">
<!-- Facility & Hours -->
<div class="bg-surface-container-lowest p-5 rounded-xl shadow-sm border border-outline-variant/15">
<h4 class="text-[10px] font-bold text-on-surface-variant mb-4 uppercase tracking-widest">시설 정보</h4>
<div class="grid grid-cols-2 gap-2 mb-6">
<div class="flex items-center p-2 rounded bg-surface-container-low">
<span class="material-symbols-outlined text-primary text-lg mr-2">lock</span>
<span class="text-[10px] font-semibold">락커</span>
</div>
<div class="flex items-center p-2 rounded bg-surface-container-low">
<span class="material-symbols-outlined text-primary text-lg mr-2">shower</span>
<span class="text-[10px] font-semibold">샤워실</span>
</div>
<div class="flex items-center p-2 rounded bg-surface-container-low">
<span class="material-symbols-outlined text-primary text-lg mr-2">local_parking</span>
<span class="text-[10px] font-semibold">주차</span>
</div>
<div class="flex items-center p-2 rounded bg-surface-container-low">
<span class="material-symbols-outlined text-primary text-lg mr-2">apparel</span>
<span class="text-[10px] font-semibold">운동복</span>
</div>
</div>
<div class="pt-4 border-t border-outline-variant/10">
	<h4 class="text-[10px] font-bold text-on-surface-variant mb-3 uppercase tracking-widest">운영 시간</h4>
	<div class="space-y-2 text-[10px]">
		<div class="flex justify-between border-b border-outline-variant/5 pb-1">
			<span>평일 (월-금)</span>
			<span class="font-bold">${schedule.availableWeekdayStart} - ${schedule.availableWeekdayEnd}</span>
		</div>
		<div class="flex justify-between border-b border-outline-variant/5 pb-1">
			<span>토·일·공휴일</span>
			<span class="font-bold">${schedule.availableWeekendStart} - ${schedule.availableWeekendEnd}</span>
		</div>
	</div>
</div>
</div>

<!-- Trainer -->
<div class="bg-surface-container-lowest p-5 rounded-xl shadow-sm border border-outline-variant/15">
	<div class="flex justify-between items-center mb-4">
		<h4 class="text-[10px] font-bold text-on-surface-variant uppercase tracking-widest">트레이너</h4>
		<span class="bg-secondary-container text-on-secondary-container px-1.5 py-0.5 rounded text-[8px] font-bold">${trainerCount}명</span>
	</div>
	<div class="flex -space-x-2 mb-4">
		<c:choose>
			<c:when test="${not empty trainerList}">
				<c:forEach var="trainer" items="${trainerList}" begin="0" end="2">
					<img class="w-8 h-8 rounded-full border-2 border-white object-cover" 
						 src="${pageContext.request.contextPath}/profileImages/${trainer.profileImg}"
						 alt="${trainer.name}"/>
				</c:forEach>
				<c:if test="${trainerCount > 3}">
					<div class="w-8 h-8 rounded-full border-2 border-white bg-surface-container flex items-center justify-center text-[8px] font-bold text-on-surface-variant">
						+${trainerCount - 3}
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
                <div class="text-[10px] text-outline">
                    등록된 트레이너가 없습니다.
                </div>
            </c:otherwise>
		</c:choose>
	</div>

<button onclick="openTrainerModal()" 
		class="w-full bg-surface-container-low text-on-surface py-2 rounded font-bold text-[10px] hover:bg-surface-container transition-colors">
			트레이너 보기
</button>
</div>

<!-- Map -->
<div class="bg-surface-container-lowest p-5 rounded-xl shadow-sm border border-outline-variant/15" >
<div class="flex items-center text-[10px] font-bold text-on-surface mb-2">
<span class="material-symbols-outlined text-primary mr-1 text-lg">location_on</span>
                        ${gym.address}
                    </div>
<div class="h-40 rounded-lg bg-surface-container-high overflow-hidden relative">
<div id="map" class="w-full h-full"></div>
<div class="absolute inset-0 flex items-center justify-center">
<span class="material-symbols-outlined text-primary text-2xl" style='font-variation-settings: "FILL" 1;'>location_on</span>
</div>
</div>
</div>

</div>
</div>
</div>

</main>
<div id="lightbox-modal" style="display:none;"
     class="fixed inset-0 z-[100] flex items-center justify-center p-4 modal-backdrop">

  <!-- 닫기 버튼 -->
  <button onclick="closeLightbox()"
          class="absolute top-6 right-6 text-white text-4xl">✕</button>
  
  <button onclick="prevImage()" class="absolute left-6 top-1/2 -translate-y-1/2 text-white text-4xl">❮</button>

  <!-- 이미지 -->
  <img id="lightbox-img" class="max-w-full max-h-[80vh] object-contain rounded-lg shadow-2xl">
  
  <button onclick="nextImage()" class="absolute top-1/2 right-6 -translate-y-1/2 text-white text-4xl">❯</button>
</div>

<c:if test="${not empty gym.file}">
<script>

const galleryImages =[
	<c:forEach var="img" items="${images}" varStatus="status">
		"${pageContext.request.contextPath}/galleryImages/${img}"<c:if test="${!status.last}">,</c:if>
	</c:forEach>
];

let currentIndex = 0;

function openLightbox(index) {
	currentIndex = index;
    document.getElementById("lightbox-modal").style.display = "flex";
    document.getElementById("lightbox-img").src = galleryImages[currentIndex];
}

function closeLightbox() {
    document.getElementById("lightbox-modal").style.display = "none";
}

function nextImage(){
	currentIndex++;
	if(currentIndex >= galleryImages.length) currentIndex = 0;
	document.getElementById("lightbox-img").src = galleryImages[currentIndex];
}

function prevImage(){
	currentIndex--;
	if(currentIndex < 0) currentIndex = galleryImages.length - 1;
	document.getElementById("lightbox-img").src = galleryImages[currentIndex];
}
</script>
</c:if>


<!-- Modal Backdrop -->
<div id="trainerModal" style="display: none;" class="fixed inset-0 bg-[#191c1e]/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
	<!-- Modal Card - Reduced max-width and optimized padding -->
	<div class="bg-surface-container-lowest w-full max-w-md rounded-lg shadow-2xl overflow-hidden flex flex-col max-h-[80vh]">
		<!-- Modal Header - Reduced vertical padding -->
		<div class="flex items-center justify-between px-5 py-3 border-b border-outline-variant/15">
			<div class="flex items-center gap-2">
				<span class="material-symbols-outlined text-primary text-xl" data-icon="groups">groups</span>
				<h2 class="text-lg font-bold tracking-tight text-on-surface">트레이너 목록</h2>
			</div>
			<button onclick="closeTrainerModal()" class="p-1.5 hover:bg-surface-container-low rounded-full transition-colors group">
				<span class="material-symbols-outlined text-on-surface-variant group-hover:text-on-surface text-xl" data-icon="close">close</span>
			</button>
		</div>

		<!-- Modal Content (Scrollable List) -->
		<div class="flex-1 overflow-y-auto custom-scrollbar">
			<c:choose>
				<c:when test="${not empty trainerList}">
					<c:forEach var="trainer" items="${trainerList}" varStatus="status">
						<!-- Trainer Item 1 - Reduced padding, smaller image -->
						<div class="flex items-center gap-4 p-4 hover:bg-surface-container-low/50 transition-colors cursor-pointer group">
							<div class="relative shrink-0">
								<img class="w-12 h-12 rounded-full object-cover border-2 border-primary-container/20 group-hover:border-primary transition-colors" 
									 alt="${trainer.name}" 
									 src="${pageContext.request.contextPath}/profileImages/${trainer.profileImg}"/>
							</div>
							<div class="flex-1 min-w-0">
								<div class="flex justify-between items-baseline mb-0.5">
									<h3 class="font-bold text-base text-on-surface truncate">${trainer.name}
										<c:if test="${not empty trainer.memberCount}">
											<span class="text-xs font-normal text-on-surface-variant ml-1">(${trainer.memberCount}명)</span>
										</c:if>
									</h3>
									<p class="text-[10px] font-semibold text-primary uppercase tracking-wider shrink-0">${trainer.mainSpecial}</p>
								</div>
								<div class="flex flex-wrap gap-1.5 mt-1">
									<c:forEach var="tag" items="${trainer.advList}">
										<span class="px-1.5 py-0.5 rounded text-[9px] font-medium bg-secondary-container/30 text-on-secondary-container">
											${tag}
										</span>
									</c:forEach>
								</div>
							</div>
						</div>
						<c:if test="${!status.last}">
							<div class="h-px bg-outline-variant/10 mx-4"></div>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
    				<div class="p-4 text-sm text-outline text-center">
        				등록된 트레이너가 없습니다.
    				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<script>
function openTrainerModal() {
    document.getElementById("trainerModal").style.display = "flex";
}

function closeTrainerModal() {
    document.getElementById("trainerModal").style.display = "none";
}
</script>

<script>
function reportReview(reviewNum) {
    location.href = '${pageContext.request.contextPath}/review/report?reviewNum=' + reviewNum;
}
</script>

<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=c23c434dad386bee2955934ab6cb494d&libraries=services"></script>
<script>
    var gymName = "${gym.name}";
    var gymAddress = "${gym.address}";

    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780),
        level: 3
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var geocoder = new kakao.maps.services.Geocoder();

    geocoder.addressSearch(gymAddress, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var x = result[0].x;
            var y = result[0].y;
            var coords = new kakao.maps.LatLng(y, x);

            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            map.setCenter(coords);
        }
    });
</script>

<script>
let selectedStar = 0;

function setStar(star){
    selectedStar = star;
    alert("별점 선택: " + star);
}

function submitReview(){
    const content = document.getElementById("reviewContent").value;

    if(selectedStar === 0){
        alert("별점을 선택하세요");
        return;
    }
    if(content.trim() === ""){
        alert("내용 입력하세요");
        return;
    }

    location.href = "/review/write?star=" + selectedStar + "&content=" + content;
}

function editReview(id){
    location.href = "/review/edit?reviewNum=" + id;
}

function deleteReview(id){
    if(confirm("삭제하시겠습니까?")){
        location.href = "/review/delete?reviewNum=" + id;
    }
}
</script>
</body>
</html>