
<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Elen - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    
    <script src="https://kit.fontawesome.com/d999958cb1.js" crossorigin="anonymous"></script>
    
       
  </head>
  <body>
  
  <% MemberDTO info = (MemberDTO)session.getAttribute("info");
  System.out.println(info);
  	%>
   
   <div id="colorlib-page">
         <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
         <aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
            <!-- 로그인 안했을 때 -->
            <%if(info == null) {
            	System.out.println("로그인 안했을 때");%>
            
            <h1 id="colorlib-logo"><a href="Login.html">로그인</a>
            <h1 id="colorlib-logo"><a href="Join.html">회원가입</a></h1>
         <% }else{  
	         System.out.println("로그인 안했을 때");%>
            <!-- 로그인 했을때  -->
            <h1 class="mb-4"><%= info.getINSTA_ID() %></h1>
            <a href="LogoutService">로그아웃</a>
         <% } %>
            
            <nav id="colorlib-main-menu" role="navigation">
               <table border="1" frame=void style='border-left:0;border-right:0;border-bottom:0;border-top:0'  >
               <tr>
                   <td><i class="fas fa-home fa-2x"></i> </td>
                   <td class="colorlib-active"><a href="Main.html">Main</a></td>
               </tr>
               <tr>
                   <td><i class="fas fa-heart fa-2x"></i> </td>
                   <td><a href="Like.html">Like</a></td>
               </tr>
               <tr>
                   <td><i class="fas fa-heart-broken fa-2x"></i> </td>
                   <td><a href="Unfollow.html">Unfollow</a></td>
               </tr>
               <tr>
                   <td><i class="fas fa-comment-alt fa-2x"></i> </td>
                   <td><a href="notice.html">notice</a></td>
               </tr>
           </table>
         </nav>
         <div class="colorlib-footer">
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
           Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
            <ul>
               <li><a href="#"><i class="icon-facebook"></i></a></li>
               <li><a href="#"><i class="icon-twitter"></i></a></li>
               <li><a href="#"><i class="icon-instagram"></i></a></li>
               <li><a href="#"><i class="icon-linkedin"></i></a></li>
            </ul>
         </div>
      </aside> <!-- END COLORLIB-ASIDE -->
      <div id="colorlib-main">
         <div class="hero-wrap js-fullheight" style="background-image: url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="js-fullheight d-flex justify-content-center align-items-center">
               <div class="col-md-8 text text-center">
                  <div class="img mb-4" style="background-image: url(images/author.jpg);"></div>
                  <div class="desc">
                     <h2 class="subheading"></h2>
                     <!-- 로그인 안했을때 -->
                     <% if(info == null){ %>
                        <!-- 로그인 안했을때  -->
                        <a href="#menu">로그인</a>
                     <% }else { %>
                        <!-- 로그인 했을 때 -->
                        <h1 class="mb-4"><%= info.getUSER_ID() %>님 환영합니다.</h1>
                        <p class="mb-4">즐거운 하루 보내세요</p>
                     <% } %>
                     <p><a href="#" class="btn-custom">More About Me <span class="ion-ios-arrow-forward"></span></a></p>
                  </div>
               </div>
            </div>
         </div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>