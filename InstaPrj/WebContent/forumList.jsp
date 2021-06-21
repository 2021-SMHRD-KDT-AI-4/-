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
    <!-- �޴� ���̵�� ��ư ǥ�� -->
    <input type="checkbox" id="menuicon">
    <label for="menuicon">
        <span></span>
        <span></span>
        <span></span>
    </label>  
    <div class="container">
        <!-- ���̵�� -->
        <div id="sidebar"></div>
        <!-- ���� -->
        <div class="main">
            <div style="height: 2rem;"></div>
            <div class="logoDiv">
            	<a href="main.html"><img src="./img/logo.png" height="100%"></a>
            </div>
            <div style="height: 2rem;"></div>
            <!-- ������ ���� -->
            <div class="titleDiv">�ν�Ÿ�׷� ����</div> 
            <div style="height: 2.5rem;"></div>
            <!-- ����Ʈ -->
           <% for(int i=0; i<list.size(); i++){ %>
            <div class="forumListContainer"> 
                <div class="forumListItem">
                    <img class="forumListImg" src="./img/<%=list.get(i).getFilename() %>"><br>
                    <a  class="forumListTxt"href="forumView.jsp?num=<%=list.get(i).getNum()%>"><%= list.get(i).getTitle() %></a><br>
                    <a class="forumListTxt"><%= list.get(i).getWriter() %></a>
                </div>
                <%} %>
            </div>
            <div style="height: 2.5rem;">
            	<a href="forumWrite.jsp"><input type="button" class="inputBtn" value="�۾���"></a>
            </div>
            
        </div>
    </div>
</body>
</html>