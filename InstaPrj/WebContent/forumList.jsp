<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
<% MemberDTO info = (MemberDTO)session.getAttribute("info");%>
  
  <% 
  BoardDAO dao = new BoardDAO();
  ArrayList<BoardDTO> list = dao.showBoard();
  %>
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
            <div style="height: 4rem;"></div>
            <!-- 페이지 제목 -->
            <div class="titleDiv">[ 인스타그램 포럼 ]</div> 
            <div style="height: 2.5rem;"></div>
            <div style="height: 3rem; text-align: right; margin-right: 5rem">
            	<a href="forumWrite.jsp"><input type="button" class="inputBtn" value="글쓰기"></a>
            </div>
            <div style="height: 2.5rem;"></div>

            <!-- 리스트 -->
           
            <div class="forumListContainer"> 
            <% for(int i=0; i<list.size(); i++){ %>
                <div class="forumListItem">
                    <a href="forumView.jsp?num=<%=list.get(i).getNum()%>"><img class="forumListImg" src="./img/<%=list.get(i).getFilename() %>"></a><br>
                    <a style="color:white;" class="forumListTxt"href="forumView.jsp?num=<%=list.get(i).getNum()%>"><%= list.get(i).getTitle() %></a><br>
                    <span class="forumListTxt"><%= list.get(i).getWriter() %></span>
                </div>
                <%} %>
            </div>
            
        </div>
    </div>
</body>
</html>