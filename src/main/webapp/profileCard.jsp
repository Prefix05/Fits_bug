<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.MemberDTO, dto.WorkoutPlanDTO" %>
<%
    MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
    WorkoutPlanDTO plan = (WorkoutPlanDTO) request.getAttribute("plan");

    if(loginUser == null){
        return; // 로그인 안하면 카드 안보임
    }
%>

<div style="position:fixed; top:90px; left:20px; z-index:999;">
    <div class="bg-white w-[260px] rounded-xl shadow-lg border p-4">

        <!-- 프로필 이미지 -->
        <div class="flex flex-col items-center">
            <img src="<%= (loginUser.getProfileImage() != null) ? request.getContextPath()+"/upload/"+loginUser.getProfileImage() : "https://via.placeholder.com/100" %>"
                 class="w-20 h-20 rounded-full object-cover mb-3"/>

            <!-- 닉네임 -->
            <div class="text-lg font-bold">
                <%= loginUser.getNickname() %>
            </div>

            <!-- 이메일 -->
            <div class="text-sm text-gray-500">
                <%= loginUser.getEmail() %>
            </div>
        </div>

        <!-- 구분선 -->
        <div class="border-t my-3"></div>

        <!-- 운동 목표 (간략 표시) -->
        <div class="text-sm">
            <span class="text-gray-400">운동 목표</span>
            <div class="font-semibold text-blue-500 mt-1">
                <%= (plan != null) ? plan.getGoal() : "미설정" %>
            </div>
        </div>

    </div>
</div>