<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>sidebar</title>
    <link rel="stylesheet" href="./css/style1.css" />
    <script src="https://kit.fontawesome.com/3e7e31d983.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<% MemberDTO info = (MemberDTO)session.getAttribute("info"); %>
        <!-- ���̵�� -->
        <div class="sidebar">
            <div style="height: 4rem;"></div>
            
            <!-- ID / PW �α���â -->
            <!-- �α��� �������� -->
            <% if(info== null){ %>
            <!-- �α��� Form -->
            <form action="LoginService" method="post">
	            <div id="loginDiv">
	                <div id="loginInputDiv">
                        <div id=loginInputDiv2>
                            <input class="inputUserIdPw" name= "user_id" type="text" placeholder="���̵�">
                        </div>
                        <div id=loginInputDiv2>
                            <input class="inputUserIdPw" name="user_pw" type="password" placeholder="��й�ȣ">
                        </div>
	                </div>
	                <!-- �α��� ��ư -->
	                <div id="loginBtnDiv">
	                    <input id="loginBtn" type="submit" value="LOGIN">
	                </div>
            	</div>
            </form>
            <!-- ȸ������ ��ư -->
            <div style="height: 0.4rem;"></div>
            <div style="height: 2rem; font-size: 1rem;">
                <a href="join.jsp">ȸ������</a>
            </div>
            <% }else{ %>
            
            <!-- �α��� ������ -->
            <div id="loginDiv">
            	<div></div>
            	<div style="height: 2rem; margin: auto; font-size: 2.0rem"><span id="">@<%= info.getINSTA_ID()  %></span></div>
            	<div></div>
            </div>
            <div style="height: 2rem; font-size: 1rem;">
                <input id="logoutBtn" type="button" value="LOGOUT" onclick="location.href='LogoutService'">
            </div>
			<%} %>
            <div style="height: 3rem;"></div>
            <div style="height: 2.5rem; font-size: 1.75rem; font-family: 'GmarketSansTTFBold';"><u>MENU</u></div>
            <div style="height: 3.25rem;"></div>
            
            <!-- �޴� ����Ʈ -->
            <div class="menuListDiv">
                <div class="menuList"><i class="fas fa-home"></i><a href="main.jsp"> HOME</a></div>
                <div class="menuList"><i class="fas fa-heart"></i><a href="like.jsp"> LIKE</a></div>
                <div class="menuList"><i class="fas fa-heartbeat"></i><a href="likeResult.jsp"> LIKE RESULT</a></div>
                <div class="menuList"><i class="fas fa-heart-broken"></i><a href="unfollow.jsp"> UNFOLLOW</a></div>
                <div class="menuList"><i class="fas fa-comments"></i><a href="forumList.jsp"> FORUM</a></div>
            </div>
        </div>

</body>
</html>