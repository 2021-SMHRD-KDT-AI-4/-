<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="com.model.BoardDAO"%>
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
    
    <STYLE>
	   table {font-size: 15pt;
	         
	         margin:auto;}
	 </STYLE>
  </head>
  <body>
  <% MemberDTO info = (MemberDTO)session.getAttribute("info");%>

<% 
  int num = Integer.parseInt(request.getParameter("num"));
  BoardDAO dao = new BoardDAO();
  BoardDTO dto = dao.showOne(num);
  %>
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
			<div class="hero-wrap js-fullheight" style="background-image: url(images/background.jpeg);" data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div class="js-fullheight d-flex justify-content-center align-items-center">
					<div class="col-md-8 text text-center">
						<div class="desc">
							<form action="BoardDeleteService?num=<%= dto.getNum() %>&writer=<%=dto.getWriter() %>" method="post">
								<h2>게시물 확인하기</h2>
								<table border="1px">
									<tr>
										<td>글제목</td>
										<td><%= dto.getTitle() %></td>
									</tr>
									<tr>
										<td>작성자</td>
										<td><%= dto.getWriter() %></td>
									</tr>
									<tr>
										<td>날짜</td>
										<td><%= dto.getDay() %></td>
									</tr>
									<tr>
										<td>사진</td>
										<td><img src="img/<%=dto.getFilename()%>"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><%= dto.getContent() %></td>
									</tr>
									<tr>
										<td colspan="2"> 
										<!-- 
										by.창현	
										button 으로 삭제 단 작성자만 삭제할 수 있음 
										작성자가 본인이 아닐때 빈페이지 나오니까 alert 로 자기가 쓴 게시물 아니라는걸 알려줘야함!
										 -->
											<button type="button" onclick="location.href='BoardDeleteService?num=<%= dto.getNum() %>&writer=<%=dto.getWriter() %>'">게시물삭제</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

   	
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
</div>
</body>
</html>
