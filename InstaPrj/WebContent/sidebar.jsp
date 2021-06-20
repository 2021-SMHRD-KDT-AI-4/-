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
            <div style="height: 12rem;"></div>
            
            <!-- ID / PW �α���â -->
            <!-- �α��� �������� -->
            <% if(info== null){ %>
            <div id="loginDiv">
                <!-- �α��� Form -->
                <form action="LoginService" method="post">
                    <div id="loginInputDiv">
                        <input class="inputUserIdPw" name= "user_id" type="text" placeholder="���̵� �Է����ּ���.">
                        <input class="inputUserIdPw" name="user_pw" type="password" placeholder="��й�ȣ�� �Է����ּ���.">
                    </div>
                    <!-- �α��� ��ư -->
                    <div id="loginBtnDiv">
                        <input id="loginBtn" type="submit" value="LOGIN">
                    </div>
                </form>
                
            </div>
            <!-- ȸ������ ��ư -->
            <div style="height: 2rem; font-size: 1rem;">
                <a href="join.jsp">ȸ������</a>
            </div>
            <% }else{ %>
            
            <!-- �α��� ������ -->
            <div id="loginDiv"><div style="height: 2rm;"><br></div>
                <a id="">@<%= info.getINSTA_ID()  %></a></div>
            <div style="height: 2rem; font-size: 1rem;">
                <input id="logoutBtn" type="button" value="LOGOUT" onclick="location.href='LogoutService'">
            </div>
			<%} %>
            <div style="height: 3rem;"></div>
            <div style="height: 2.5rem; font-size: 1.75rem; font-family: 'GmarketSansTTFBold';"><u>MENU</u></div>
            <div style="height: 3.25rem;"></div>
            
            <!-- �޴� ����Ʈ -->
            <div class="menuListDiv">
                <div class="menuList"><i class="fas fa-home"></i> HOME</div>
                <div class="menuList"><i class="fas fa-heart"></i> LIKE</div>
                <div class="menuList"><i class="fas fa-heartbeat"></i> LIKE RESULT</div>
                <div class="menuList"><i class="fas fa-heart-broken"></i> UNFOLLOW</div>
                <div class="menuList"><i class="fas fa-comments"></i><a href="forumList.jsp"> FORUM</a></div>
            </div>
        </div>

</body>
</html>