<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">  
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>like</title>
<link rel="stylesheet" href="./css/style1.css">
<script src="https://kit.fontawesome.com/3e7e31d983.js"
   crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#sidebar").load("./sidebar.jsp");
   });
</script>
<style>
#loading {
   width: 100%;
   height: 100%;
   top: 0px;
   left: 0px;
   position: fixed;
   display: block;
   opacity: 0.7;
   background-color: #fff;
   z-index: 99;
   text-align: center;
}

#loading-image {
   position: absolute;
   top: 50%;
   left: 50%;
   z-index: 100;
}
</style>
</head>
<body>
   <%
      MemberDTO info = (MemberDTO) session.getAttribute("info");
   %>
   <!-- 메뉴 사이드바 버튼 표시 -->
   <input type="checkbox" id="menuicon">
   <label for="menuicon"> <span></span> <span></span> <span></span>
   </label>
   <div class="container">
      <!-- 사이드바 -->
      <div id="sidebar"></div>
      <!-- 메인 -->
      <div class="main">
         <div id="lload">
            <img id="loading" src="./img/loading.gif" alt="Loading...">
         </div>
         <div style="height: 2rem;"></div>
         <div class="logoDiv">
            <a href="main.html"><img src="./img/logo.png" height="100%"></a>
         </div>
         <div style="height: 2rem;"></div>
         <!-- 페이지 제목 -->
         <%
            if (info == null) {
         %>
         <h3>
            회원만 이용가능한 서비스입니다.<br> 로그인을 진행해주세요!
         </h3>
         <%
            } else {
         String insta_id = info.getINSTA_ID();
         %>
         <div class="titleDiv">
            @<%=insta_id%>
            님의 언팔로우 분석
         </div>
         <div style="height: 2.5rem;"></div>

         <!-- 언팔로우 서비스 설명 -->
         <div
            style="height: 25rem; width: 25rem; margin: auto; border: 0.25rem solid #E95099; border-radius: 1rem; background-color: rgba(255, 255, 255, 0.3);">
            <div
               style="height: 18.75rem; width: 18.75rem; margin: 3.125rem 3.125rem; text-align: left;">
               <span>가장 최근의 팔로우 목록과 현재의 팔로우 목록을 비교하여 언팔로우한 계정을 분석해 드립니다. </span>
            </div>
         </div>
         <div style="height: 5rem;"></div>
         <div style="height: 2.5rem;">
            <button id="trans" class="inputBtn"
            onclick="location.href = 'http://localhost:9000/inforum/Unfollow?insta_id=<%=insta_id%>'" style="font-size: 1.4rem">분석하기</button>
         </div>
         <%
            }
         %>
      </div>
   </div>
   <script>
   $(document).ready(function() {

        $('#lload').hide();
      $('#trans').on('click', function() {
         $("#lload").show();
      })
   })

      function setThumbnail(event) {
         var reader = new FileReader();

         reader.onload = function(event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            document.querySelector("div#image_container").appendChild(img);
         };

         reader.readAsDataURL(event.target.files[0]);
      }
   </script>
</body>
</html>