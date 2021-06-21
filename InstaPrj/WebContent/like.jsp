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
    <script src="https://kit.fontawesome.com/3e7e31d983.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">   
		$(document).ready(function() {
			$("#sidebar").load("./sidebar.html");
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
            	<a href="main.html"><img src="./img/logo.png" height="100%"></a>
            </div>
            <!-- 페이지 제목 -->
            <div class="titleDiv">좋아요 예측</div>
            <div style="height: 2rem;"></div>

						<!-- 로그인 안했을 때 -->
            <%if(info == null) { %>
            	<h3>회원만 이용가능한 서비스입니다.<br> 로그인을 진행해주세요!</h3>
            
         	<% } else { %>
	            <!-- 좋아요 예측 form -->
	            <form action="likeservice" method="post" enctype = "multipart/form-data" style="width: 22.5rem; margin: 0 auto;">
	                <!-- 이미지 업로드 및 미리보기 -->
	                <div style="height: 25rem; width: 25rem; margin: auto; border: 0.25rem solid #E95099;">
	                    <input id="uploadImg" name="file_name" type="file" style="display: none;">
	                    <label for="uploadImg">
	                        <img src="./img/upload_image.jpg" id="previewImg" width="100%" height="100%">
	                    </label>
	                </div>
	                <div style="height: 1.25rem;"></div>
	                <!-- 날짜 -->
	                <div class="likeInputDiv">
	                    <div class="likeInputDiv_1"><a>날짜</a></div>
	                    <div class="likeInputDiv_2"><input name="upload_day" class="likeInput" type="date"></div>
	                </div>
	                <!-- 시간 -->
	                <div class="likeInputDiv">
	                    <div class="likeInputDiv_1"><a>시간</a></div>
	                    <div class="likeInputDiv_2"><input name="upload_time" class="likeInput" type="time"></div>
	                </div>
	                <!-- 해시태그 -->
	                <div class="likeInputDiv">
	                    <div class="likeInputDiv_1"><a>해시태그</a></div>
	                    <div class="likeInputDiv_2"><input name="hashtag" lass="likeInput" type="text" placeholder="#인포럼스타그램"></div>
	                </div>
	                <!-- 계정태그 수 -->
	                <div class="likeInputDiv">
	                    <div class="likeInputDiv_1"><a>계정태그 수</a></div>
	                    <div class="likeInputDiv_2"><input name="account_tag" class="likeInput" type="number" value="0"></div>
	                </div>
	                <!-- 장소태그 -->
	                <div class="likeInputDiv">
	                    <div class="likeInputDiv_1"><a>장소태그</a></div>
	                    <div class="likeInputDiv_2">
	                        <label style="font-size: 1rem;"><input type="radio" value="1" name="place_tag">있음</label>
	                        <label style="font-size: 1rem;"><input type="radio" value="0" name="place_tag">없음</label>
	                    </div>
	                </div>
	                <!-- form 제출 -->
	                <div style="height: 2.5rem;">
	                    <input class="inputBtn" type="submit" value="예측하기">
	                </div>
	            </form>
			<% }%>
        </div>
    </div>
</body>
<script type="text/javascript" src="./js/previewImg.js"></script>
</html>