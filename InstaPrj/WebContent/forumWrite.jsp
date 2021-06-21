<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>forumList</title>
    <link rel="stylesheet" href="./css/style1.css">
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
            	<a href="main.html"><img src="./img/logo.png" height="100%"></a>
            </div>
            <div style="height: 2rem;"></div>
            <!-- 페이지 제목 -->
            <div class="titleDiv">게시물 작성</div> 
            <div style="height: 1rem;"></div>
            
            <!-- forumWrite form -->
            <form action="BoardWriteService" method="post" style="width: 25rem; margin: 0 auto;" enctype = "multipart/form-data">
                <!-- 이미지 업로드 및 미리보기 -->
                <div style="height: 25rem; width: 25rem; margin: auto; border: 0.25rem solid #E95099;">
                    <input name="filename"id="uploadImg" type="file" style="display: none;">
                    <label for="uploadImg">
                        <img src="./img/upload_image.jpg" id="previewImg" width="100%" height="100%">
                    </label>
                </div>
                <div style="height: 1.25rem;"></div> 
                <!-- 제목 -->
                <div class="forumInputDiv">
                    <div class="forumInputDiv_1"><a>제목</a></div>
                    <div class="forumInputDiv_2"><input name="title" class="forumInput" type="text"></div>
                </div>
                <!-- 내용 -->
                <div class="forumInputTADiv">
                    <div class="forumInputDiv_1"><a>내용</a></div>
                    <div class="forumInputTADiv_2"><textarea name="content" class="forumInputTA" rows="12.5rem" cols="15rem"></textarea></div>
                </div>
                <div style="height: 1.25rem;"></div>
                <!-- form 제출 -->
                <div style="height: 2.5rem;">
                    <input class="inputBtn" type="submit" value="등록하기">
                </div>
            </form>

        </div>
    </div>
</body>
<script type="text/javascript" src="./js/previewImg.js"></script>
</html>