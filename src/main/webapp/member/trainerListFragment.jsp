<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, dto.member.TrainerDTO" %>
<%
List<TrainerDTO> list = (List<TrainerDTO>) request.getAttribute("trainerList");
for(TrainerDTO t : list) {
%>

<div class="bg-white rounded-2xl shadow hover:shadow-xl transition overflow-hidden">
    <div class="relative">
        <img src="<%=t.getProfileImg()%>" class="w-full h-52 object-cover">

        <span class="absolute top-3 left-3 bg-pink-500 text-white text-xs px-3 py-1 rounded-full">
            <%=t.getSpecialty()%>
        </span>

        <div class="absolute bottom-3 left-3 bg-white px-2 py-1 rounded-full text-sm shadow">
            ⭐ <%=t.getRating()%>
        </div>
    </div>

    <div class="p-4">
        <h3 class="font-bold text-lg"><%=t.getName()%></h3>

        <p class="text-xs text-blue-500">
            추천 적합도: <%=String.format("%.2f", t.getSimilarity()*100)%>%
        </p>
    </div>
</div>

<% } %>