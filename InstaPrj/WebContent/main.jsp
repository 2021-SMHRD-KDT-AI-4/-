<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>main</title>
    <link rel="stylesheet" href="./css/style1.css" />
    <script src="https://kit.fontawesome.com/3e7e31d983.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">   
      $(document).ready(function() {
         $("#sidebar").load("./sidebar.jsp");
      });
   </script>
</head>
<body>
<% MemberDTO info = (MemberDTO)session.getAttribute("info"); %>
    <!-- 메뉴 사이드바 버튼 표시 -->
    <input type="checkbox" id="menuicon">
    <label for="menuicon">
        <span></span>
        <span></span>
        <span></span>
    </label>
    <div class="container">
        <!-- 사이드바 -->
        <div id="sidebar"></div>
        <!-- 메인 -->
        <div class="main">
            <div style="height: 7.5rem;"></div>
            <!-- 메인 로고 -->
            <div class="logoDiv">
               <img src="./img/logo.png" height="100%">
            </div>
            <div style="height: 8.25rem;"></div>
            <!-- 메인 프로필 이미지 -->
            <% if (info == null){ %>
            <div style="height: 18.75rem;"><img id="mainImg" src="./img/maininstalogo4.jpg"></div>
            <%}else{ %>
            <div style="height: 18.75rem;"><img id="mainImg" src="./profileImg/<%=info.getINSTA_ID() %>.png"></div>
            <%} %>
            <div style="height: 1.5rem;"></div>
            <!-- 메인 인스타 아이디 -->
            <% if(info == null){ %>
            <div style="height: 1.5rem; font-size: 1.5rem;"><sapn id="">로그인을해주세요~</sapn></div>
            <div style="height: 2rem;"></div>
            <%}else{ %>
            <div style="height: 1.5rem; font-size: 1.5rem;"><span id="">@<%=info.getINSTA_ID() %></span></div>
            <div style="height: 2rem;"></div>
            <%} %>
            <!-- 메인 인사글 -->
            <div style="height: 2.5rem; font-size: 2.5rem;">#인포럼에_오신_걸_환영합니다</div>
            <div style="height: 2.5rem;"></div>
            <!-- 메인 인사글2 -->
            <div style="height: 1rem; font-size: 1rem; color: #cfcfcf;">즐거운 하루 보내세요</div>
        </div>
    </div>
</body>
</html>