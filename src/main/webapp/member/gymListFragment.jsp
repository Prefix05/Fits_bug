<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, dto.member.GymDTO" %>
<%
List<GymDTO> list = (List<GymDTO>) request.getAttribute("gymList");
for(GymDTO g : list) {
%>

<div class="bg-white rounded-2xl shadow p-4">
    <img src="<%=g.getImage()%>" class="w-full h-40 object-cover">

    <h3><%=g.getName()%></h3>
    <p>거리: <%=g.getDistance()%> km</p>
</div>

<% } %>