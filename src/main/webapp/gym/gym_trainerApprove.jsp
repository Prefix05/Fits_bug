<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitsbug - 트레이너 등록</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            "colors": {
                "error": "#ba1a1a",
                "surface-bright": "#f8f9fb",
                "on-background": "#191c1e",
                "secondary": "#495e8a",
                "tertiary": "#924700",
                "background": "#f8f9fb",
                "on-surface-variant": "#424754",
                "surface-container": "#edeef0",
                "secondary-fixed-dim": "#b1c6f9",
                "outline-variant": "#c2c6d6",
                "surface-container-high": "#e7e8ea",
                "primary-fixed": "#d8e2ff",
                "on-primary-fixed": "#001a42",
                "primary-fixed-dim": "#adc6ff",
                "on-secondary-container": "#405682",
                "on-tertiary": "#ffffff",
                "on-secondary-fixed-variant": "#304671",
                "on-primary-container": "#fefcff",
                "inverse-on-surface": "#f0f1f3",
                "inverse-surface": "#2e3132",
                "surface": "#f8f9fb",
                "on-tertiary-fixed-variant": "#723600",
                "inverse-primary": "#adc6ff",
                "on-surface": "#191c1e",
                "on-error-container": "#93000a",
                "on-error": "#ffffff",
                "on-primary-fixed-variant": "#004395",
                "tertiary-fixed": "#ffdcc6",
                "on-tertiary-container": "#fffbff",
                "error-container": "#ffdad6",
                "secondary-fixed": "#d8e2ff",
                "on-secondary-fixed": "#001a42",
                "on-primary": "#ffffff",
                "surface-container-lowest": "#ffffff",
                "surface-dim": "#d9dadc",
                "tertiary-fixed-dim": "#ffb786",
                "tertiary-container": "#b75b00",
                "secondary-container": "#b6ccff",
                "surface-variant": "#e1e2e4",
                "surface-tint": "#005ac2",
                "primary-container": "#2170e4",
                "primary": "#0058be",
                "on-secondary": "#ffffff",
                "surface-container-highest": "#e1e2e4",
                "outline": "#727785",
                "surface-container-low": "#f3f4f6",
                "on-tertiary-fixed": "#311400"
            },
            "borderRadius": {
                "DEFAULT": "0.25rem",
                "lg": "0.5rem",
                "xl": "0.75rem",
                "full": "9999px"
            },
            "fontFamily": {
                "headline": ["Inter"],
                "body": ["Inter"],
                "label": ["Inter"]
            }
          }
        }
      }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .active-pill {
            background: linear-gradient(135deg, #0058be 0%, #2170e4 100%);
        }
        .glass-nav { background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(20px); }
    </style>
</head>

<body class="bg-surface text-on-surface font-body selection:bg-primary-fixed selection:text-on-primary-fixed">
<jsp:include page="common/sidebar.jsp"></jsp:include>

<!-- Main Content Canvas -->
<main class="ml-64 mt-16 p-8 min-h-screen bg-surface">
<div class="max-w-4xl mx-auto">

<!-- Page Header -->
<div class="mb-10">
<h2 class="text-3xl font-black tracking-tight text-on-surface mb-2" style="">트레이너 등록 승인 대기</h2>
<p class="text-on-surface-variant text-sm font-medium" style=""><br/></p>
</div>

<!-- Content List -->
<div class="space-y-6">
<c:choose>
	<c:when test="${empty trainerList}">
		<div class="bg-surface-container-lowest rounded-xl p-10 text-center">
			<p class="text-on-surface-variant font-bold">
                승인 대기 중인 트레이너가 없습니다.
            </p>
        </div>
	</c:when>
	
	<c:otherwise>
		<c:forEach var="trainer" items="${trainerList}">
			<div class="bg-surface-container-lowest rounded-xl p-6 flex flex-col md:flex-row items-center gap-6 group transition-all duration-300 hover:translate-y-[-2px] hover:shadow-xl hover:shadow-on-surface/5">
			
				<img src="${pageContext.request.contextPath}/gym/trainerProfileImgs/${trainer.profileImg}"
					 onerror="this.src='${pageContext.request.contextPath}/img/profile_img.jpg'"
					 class="w-20 h-20 rounded-full object-cover"/>
				<div class="flex-1 text-center md:text-left flex flex-col justify-center">
						<h3 class="text-xl font-extrabold tracking-tight" style="">${trainer.name} 트레이너</h3>
             	</div>
             	
 				<form action="${pageContext.request.contextPath}/gym/trainerApprove" method="post"
                      class="flex flex-row md:flex-col gap-2 w-full md:w-32">
                    <input type="hidden" name="trainerId" value="${trainer.id}">
                    <button type="submit"
                            class="flex-1 active-pill text-on-primary py-2.5 rounded-lg text-xs font-black transition-all active:scale-95">
                        승인
                    </button>
                </form>            
            </div>
		</c:forEach>
	</c:otherwise>
</c:choose>
</div>
</div>
</main>
</body>
</html>