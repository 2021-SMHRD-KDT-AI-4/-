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
	
    <script src="https://kit.fontawesome.com/d999958cb1.js" crossorigin="anonymous"></script>
  
  </head>
  
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
			<h1 id="colorlib-logo"><a href="login.html">로그인<span></span></a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<table frame=void style='border-left:0;border-right:0;border-bottom:0;border-top:0'  >
				<table  frame=void style='border-left:0;border-right:0;border-bottom:0;border-top:0'  >
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
				<!-- 목록창 왼쪽 하단 -->
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
							<h2 class="subheading"></h2>
							<!-- 로그인창 -->
							<form action="JoinService" method="post">
								<table>
									<tr>
										<td><h3>회원가입</h3></td>
									</tr>
									<tr>
										<td><input id="input_id" type="text" name="email" placeholder="이메일을 입력하세요"></td>
										<td><input type="button" value="ID중복체크" onclick="idcheck()">
											<span id="sp"></span></td>
									</tr>
									<tr>
										<td><input type="password" name="pw" placeholder="비밀번호를 입력하세요"></td>
										<td align="center"><input type="submit" value="JoinUs" class="button fit"></td>
									</tr>
									<tr>
										<td><input type="text"  name="SNSIns" placeholder="인스타그램 아이디를 입력하세요"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  
  <script>
				function idcheck(){
					var input = $('#input_id').val();
					
					$.ajax({
						type : "post",  //데이터 보내는 방식
						data : {"USER_ID" : input}, //서버로 보내는 데이타
						url : "IdCheckService", //서버 파일 이름
						dataType : "text" , //응답 데이터 형식
						success : function(data){
							if(data=='true'){
								alert("사용할 수 없는 id입니다");
							}else{
								console.log(data);
								alert("사용 가능한 id입니다");
							}
						},
						error : function(){
							alert("실패!");
						}
					});
					
				}
			</script>
    
  </body>
</html>