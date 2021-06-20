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
	<title>main</title>
    <link rel="stylesheet" href="./css/style1.css">
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
        <div class="sidebar">
            <div style="height: 12rem;"></div>
            <div id="loginDiv">
                <div id="loginInputDiv">
                    <!-- ID / PW �α���â -->
                    <input class="inputUserIdPw" type="text" placeholder="�̸����� �Է����ּ���.">
                    <input class="inputUserIdPw" type="password" placeholder="��й�ȣ�� �Է����ּ���.">
                </div>
                <div id="loginBtnDiv">
                    <!-- �α��� ��ư -->
                    <input id="loginBtn" type="submit" value="LOGIN">
                </div>
            </div>
            <!-- ȸ������ ��ư -->
            <div style="height: 2rem; font-size: 1rem;">
                <a href="">ȸ������</a>
            </div>
            <div style="height: 3rem;"></div>
            <div style="height: 2.5rem; font-size: 1.75rem; font-family: 'GmarketSansTTFBold';"><u>MENU</u></div>
            <div style="height: 3.25rem;"></div>
            <!-- �޴� ����Ʈ -->
            <div class="menuListDiv">
                <div class="menuList">HOME</div>
                <div class="menuList">LIKE</div>
                <div class="menuList">LIKE RESULT</div>
                <div class="menuList">UNFOLLOW</div>
                <div class="menuList">FORUM</div>
            </div>
        </div>
        <!-- ���� -->
        <div class="main">
            <div style="height: 7.5rem;"></div>
            <div class="logoDiv">
            	<img src="./img/logo.png" height="100%">
            </div>
            <div style="height: 1.25rem;"></div>
            <!-- ������ ���� -->
            <div class="titleDiv">Forum List</div>
            <div style="height: 2.5rem;"></div>
            <!-- ����Ʈ -->
            <% for(int i=0; i<list.size(); i++){ %>
            <div class="forumListContainer">
                <div class="forumListItem">
                    <img class="forumListImg" src="./img/<%=list.get(i).getFilename() %>"><br>
                    <a  class="forumListTxt"href="BoardView.jsp?num=<%=list.get(i).getNum()%>"><%= list.get(i).getTitle() %></a><br>
                    <a class="forumListTxt"><%= list.get(i).getWriter() %></a>
                </div>
                <%} %>
                
            </div>
            
        </div><input type="submit">
    </div>
</body>
</html>