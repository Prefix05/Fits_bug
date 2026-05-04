<%@ page import="java.util.*, dto.ExerciseDTO" %>
<%
List<ExerciseDTO> list = (List<ExerciseDTO>) request.getAttribute("exerciseList");
for(ExerciseDTO e : list) {
%>

<div class="bg-white p-3">
    <img src="<%=e.getThumbnail()%>" class="w-full h-40">
    <h3><%=e.getName()%></h3>
</div>

<% } %>