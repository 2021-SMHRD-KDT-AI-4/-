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
	<% MemberDTO info = (MemberDTO)session.getAttribute("info");%>
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
            <div style="height: 2rem;"></div>
            <div class="logoDiv">
            	<a href="main.jsp"><img src="./img/logo.png" height="100%"></a>
            </div>
            <div style="height: 2rem;"></div>
            <!-- 페이지 제목 -->
            <%if(info == null) { %>
            	<h3>회원만 이용가능한 서비스입니다.<br> 로그인을 진행해주세요!</h3>
            
         	<% } else { 
         	String pred = request.getParameter("pred");%>
            <div class="titleDiv">@<%= pred %>님의 좋아요 분석</div>
            <div style="height: 1.25rem;"></div>
            <div id="likeReultDiv">
                <div id="likeResultDiv1">
                    <div style="width: 25rem;">
                        <!-- 결과 이미지 -->
                        <div id="likeResultImg">
                            <img id="resultImg" src="./img/sample.jpg" width="100%" height="100%">
                        </div>
                        <div style="height: 3rem;"></div>
                        <!-- 결과 글 -->
                        <div id="likeResultTxt">
                            좋아요 수는 <span id="resultTxtLike" class="txtPink">86개</span>로 예측되며<br>어울리는 해시태그는<br><span id="resultTxtHash" class="txtPink">#전지전능 #전연지 #박진희 #조영택 #김세나 #이창현</span><br>입니다.
                        </div>
                    </div>
                </div>
                <div id="likeResultList">
                    <div class="likeResultListItem">
                        <img id="img0" class="likeResultListImg" src="./img/iu1.jpg"><br>
                        <div class="likeResultListTxt">
                            날짜 : 21/06/20<br>
                            시간 : 19:00<br>
                            계정태그 : 2개<br>
                            장소태그 : 있음<br>
                            해시태그<br>
                            <span id="txtHash0" class="txtHash">#조영택 #호구 #인증</span><br>
                            좋아요 수 : <span id="txtLike0" class="txtLike">999개</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img1" class="likeResultListImg" src="./img/iu2.jpg"><br>
                        <div class="likeResultListTxt">
                            날짜 : 21/06/20<br>
                            시간 : 19:00<br>
                            계정태그 : 2개<br>
                            장소태그 : 있음<br>
                            해시태그<br>
                            <span id="txtHash1" class="txtHash">#전지전능 #전연지 #박진희 #조영택 #김세나 #이창현</span><br>
                            좋아요 수 : <span id="txtLike1" class="txtLike">86개</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img2" class="likeResultListImg" src="./img/iu3.jpg"><br>
                        <div class="likeResultListTxt">
                            날짜 : 21/06/20<br>
                            시간 : 19:00<br>
                            계정태그 : 2개<br>
                            장소태그 : 있음<br>
                            해시태그<br>
                            <span id="txtHash2" class="txtHash">#아이유 #여신 #사랑해요</span><br>
                            좋아요 수 : <span id="txtLike2" class="txtLike">1004개</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img3" class="likeResultListImg" src="./img/iu4.jpg"><br>
                        <div class="likeResultListTxt">
                            날짜 : 21/06/20<br>
                            시간 : 19:00<br>
                            계정태그 : 2개<br>
                            장소태그 : 있음<br>
                            해시태그<br>
                            <span id="txtHash3" class="txtHash">#하이 #하이 #이하이</span><br>
                            좋아요 수 : <span id="txtLike3" class="txtLike">77개</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img4" class="likeResultListImg" src="./img/iu5.jpg"><br>
                        <div class="likeResultListTxt">
                            날짜 : 21/06/20<br>
                            시간 : 19:00<br>
                            계정태그 : 2개<br>
                            장소태그 : 있음<br>
                            해시태그<br>
                            <span id="txtHash4" class="txtHash">#일상 #일상스타그램 #셀카 #셀피</span><br>
                            좋아요 수 : <span id="txtLike4" class="txtLike">1234개</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img5" class="likeResultListImg" src="./img/iu6.jpg"><br>
                        <div class="likeResultListTxt">
                            날짜 : 21/06/20<br>
                            시간 : 19:00<br>
                            계정태그 : 2개<br>
                            장소태그 : 있음<br>
                            해시태그<br>
                            <span id="txtHash5" class="txtHash">#전연지 #공차 #효과 #3분</span><br>
                            좋아요 수 : <span id="txtLike5" class="txtLike">-9999개</span>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
		<% } %>
        </div>
    </div>
</body>
<script type="text/javascript" src="./js/selectItem.js"></script>
</html>