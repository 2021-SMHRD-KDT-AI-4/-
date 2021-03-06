<%@page import="com.model.BoardDTO"%>
<%@page import="com.model.BoardDAO"%>
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
<% MemberDTO info = (MemberDTO)session.getAttribute("info");
 int num = Integer.parseInt(request.getParameter("num"));
  BoardDAO dao = new BoardDAO();
  BoardDTO dto = dao.showOne(num);%>
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
            <div style="height: 4rem;"></div>
            <!-- 페이지 제목 -->
            <div class="titleDiv"><%= dto.getTitle() %></div>
            <div style="height: 2.5rem;"></div>
            <div style="width: 25rem; text-align: left; margin: 0 auto;">
                <span style="font-size: 1.2rem;"> 
                    작성일자 : <%= dto.getDay() %><br>
                    작성자 : <%= dto.getWriter() %>
                </span>
                <div style="height: 1.5rem;"></div>
                <div style="text-align: center">
	                <img src="./img/<%= dto.getFilename() %>" style="max-width: 25rem; height: 25rem; border: 0.25rem solid #E95099; border-radius: 1rem;">
                </div>
                <div style="height: 1.0rem;"></div>
                <span style="font-size: 1.5rem;">
                   <%= dto.getContent() %>
                </span>
            </div>
            <div style="height: 1.5rem;"></div>
            <div style="height: 2.5rem;">
                <a href="forumList.jsp"><input type="button" value="목록으로" class="inputBtn"></a>
                <input type="button" value="삭제하기" class="inputBtn" onclick="location.href='BoardDeleteService?num=<%=num%>'">
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="./js/previewImg.js"></script>
</html>