<!DOCTYPE html>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.model.UnfollowDTO"%>
<%@page import="com.model.UnfollowDAO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	   table {font-size: 10pt;
	         
	         margin:auto;}
	 </STYLE>
  </head>
  <body>
	<% MemberDTO info = (MemberDTO)session.getAttribute("info");
	
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
							<% if(info != null) {
								String insta_id = info.getINSTA_ID();
								String user_id = info.getUSER_ID();
								
								UnfollowDAO dao = new UnfollowDAO();
								
								String f4f_ID = request.getParameter("f4fID");
								
								List<String> now_f4f_list = Arrays.asList(f4f_ID.split(" "));
								List<String> past_f4f_list = dao.select(user_id);
								
								int size_date = past_f4f_list.size()-1;
								
								String past_date = past_f4f_list.get(size_date);
								
								if(past_f4f_list != null) {
									System.out.println(user_id+"님의 이전 맞팔 리스트 불러오기 성공");
	
								}
								// 이전 맞팔리스트와 현재 맞팔리스트 비교
								past_f4f_list.removeAll(now_f4f_list);
								past_f4f_list.remove(past_date);
							%>
					              <div class="card">
					                <div class="card-body">
					                  <h4 class="card-title">@<%=info.getINSTA_ID() %>님의 언팔로우 분석 결과</h4>
					                  <p class="card-description">
					                    <code><%= past_date.split(" ")[0]%></code>와 비교 했을 때
					                  </p>
					                  
					                  <table class="table">
					                    <tbody>
					                    <% for(int i = 0; i<past_f4f_list.size(); i++) { %>
					                      <tr>
					                        <td><%=past_f4f_list.get(i) %></td>
					                      </tr>
					                    <% } %>
					                    </tbody>
					                  </table>
					                  
					                  <p class="card-description">
					                  
					                  	<% if(!past_f4f_list.isEmpty()) { %>
					                  	위의 계정이 @<%=info.getINSTA_ID() %> 님을 <br>
					                  	언팔로우 했습니다.
					                  	<%} else{ %>
					                  	@<%=info.getINSTA_ID() %> 님을 <br>
					                  	언팔로우 한 계정이 없습니다.
					                  	<%}%>
					                  	
					                  </p>
					                  
					                  <button onclick="location.href = 'Main.jsp'">HOME</button>
					                </div>
					              </div>
					        <%
					        	// 출력한 후 값들은 새로운 맞팔 목록들은 insert에 넣는다
					        	UnfollowDTO dto = new UnfollowDTO(user_id,now_f4f_list);
						        
					        	// DB에 저장되어있던 과거 맞팔 리스트를 delete
					        	int delete_cnt = dao.delete(user_id);
					        	if(delete_cnt>0){
					        		System.out.println(user_id+"의 이전 맞팔 DELETE 성공!");
					        	}else{
					        		System.out.println(user_id+"의 이전 맞팔 DELETE 실패!");
					        	}
					        
					        	// 크롤링한 현재 맞팔 리스트를 insert
					        	int insert_cnt = dao.insert(dto);
					        	
								if(insert_cnt>0){
									System.out.println(user_id+"의 새로운 맞팔 INSERT 성공!");
								} else{
									System.out.println(user_id+"의 새로운 맞팔 INSERT 실패!");
								}
								
								
							} else{ %>
								<h3>로그인을 먼저 진행한 후 이용해주세요</h3>
							<%} %>
					        </div>
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