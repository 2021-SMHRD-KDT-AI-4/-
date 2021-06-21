<%@page import="com.model.MemberDTO"%>
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
    
    <style>
	h1 { font-size: 350%;
	    text-align: center; 
	    margin-top: 7%;
	    }
	button{ font-size:130%;
	      margin-left:80%;}
	table{
	  border-collapse: collapse;
	  text-align: left;
	  margin: auto;
	  line-height: 1.5;
	  width: 60%;
	  font-size: 15pt;
	}
	</style>
  </head>
  <body>
 
  <% MemberDTO info = (MemberDTO)session.getAttribute("info");%>
   
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
			<!-- 로그인 안했을 때 -->
            <%if(info == null) {
            	System.out.println("로그인 안했을 때");%>
            
            <h1 id="colorlib-logo"><a href="Login.jsp">로그인</a>
            <h1 id="colorlib-logo"><a href="Join.jsp">회원가입</a></h1>
         <% }else{  
	         System.out.println("로그인 안했을 때");%>
            <!-- 로그인 했을때  -->
            <h1 class="mb-4"><%= info.getINSTA_ID() %></h1>
            <a href="LogoutService">로그아웃</a>
         <% } %>
            
            <nav id="colorlib-main-menu" role="navigation">

               <table frame=void style='border-left:0;border-right:0;border-bottom:0;border-top:0'  >
               <tr>
                   <td><i class="fas fa-home fa-2x"></i> </td>
                   <td class="colorlib-active"><a href="Main.jsp">Main</a></td>
               </tr>
               <tr>
                   <td><i class="fas fa-heart fa-2x"></i> </td>
                   <td><a href="Like.jsp">Like</a></td>
               </tr>
               <tr>
                   <td><i class="fas fa-heart-broken fa-2x"></i> </td>
                   <td><a href="Unfollow.jsp">Unfollow</a></td>
               </tr>
               <tr>
                   <td><i class="fas fa-comment-alt fa-2x"></i> </td>
                   <td><a href="BoardList.jsp">FORUM</a></td>
               </tr>
           </table>
           </nav>
		</div>   
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<div class="hero-wrap js-fullheight" style="background-image: url(images/background.jpeg);" data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div class="js-fullheight d-flex justify-content-center align-items-center">
					<div class="col-md-8 text text-center">
						<div class="desc"> 
		                         <h1>게시물 작성하기!</h1> 
		                         <form action="BoardWriteService"  method="post" enctype = "multipart/form-data">
						            <div class="write_title">
						            
						            <table border="1" width="600" height="500" >
						               <tr>
						                  <td><input type="text" name="title" placeholder="제목" size="20" style="width:100%; border: 0;"></td>
						               </tr>
						               <tr>
						                  <td><p name="writer"><%= info.getUSER_ID() %></p></td>
						               </tr>
						               <tr>
						               <td><textarea name="content" rows="13" placeholder="내용" style="width:100%; border: 0;"></textarea></textarea></td>
						               </tr>
						               <tr>
						               	<td><input type="file" name = "filename"></td>
						               <tr>
						               	<td><input type="reset">
						               	<input type ="submit">
						               	</td>
						               </tr>
						            </table>
						            </div>
						            </form>
						</div>
					</div>
				</div>
			</div>
		</div>
		

  <script>
  	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}
  	
  </script>
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