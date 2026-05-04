<%@ page import="java.util.*,dto.member.ExerciseGuideDTO" %>
<%
List<ExerciseGuideDTO> list = (List<ExerciseGuideDTO>) request.getAttribute("exerciseList");

for(ExerciseGuideDTO e : list){
%>

<div class="ex-card"
     data-muscle="<%= e.getMuscle() %>"
     data-level="<%= e.getDifficulty() %>"

     onclick="showDetail(
       '<%= e.getName() %>',
       '<%= e.getGifUrl() %>',
       '<%= e.getDescription() %>',
       '<%= e.getYoutubeUrl() %>',
       '<%= e.getMuscle() %>',
       '<%= e.getDifficulty() %>',
       this
     )">

    <img src="<%= e.getThumbnail() %>" style="width:100%;height:160px;object-fit:cover;">

    <div style="padding:10px">
        <b><%= e.getName() %></b><br>
        <small><%= e.getMuscle() %> | <%= e.getDifficulty() %></small>
    </div>

</div>

<% } %>