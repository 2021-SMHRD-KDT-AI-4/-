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
            	<a href="main.jsp"><img src="./img/logo.png" height="100%"></a>
            </div>
            <div style="height: 2rem;"></div>
            <!-- ������ ���� -->
            <%if(info == null) { %>
            	<h3>ȸ���� �̿밡���� �����Դϴ�.<br> �α����� �������ּ���!</h3>
            
         	<% } else { 
         	String pred = request.getParameter("pred");%>
            <div class="titleDiv">@<%= pred %>���� ���ƿ� �м�</div>
            <div style="height: 1.25rem;"></div>
            <div id="likeReultDiv">
                <div id="likeResultDiv1">
                    <div style="width: 25rem;">
                        <!-- ��� �̹��� -->
                        <div id="likeResultImg">
                            <img id="resultImg" src="./img/sample.jpg" width="100%" height="100%">
                        </div>
                        <div style="height: 3rem;"></div>
                        <!-- ��� �� -->
                        <div id="likeResultTxt">
                            ���ƿ� ���� <span id="resultTxtLike" class="txtPink">86��</span>�� �����Ǹ�<br>��︮�� �ؽ��±״�<br><span id="resultTxtHash" class="txtPink">#�������� #������ #������ #������ #�輼�� #��â��</span><br>�Դϴ�.
                        </div>
                    </div>
                </div>
                <div id="likeResultList">
                    <div class="likeResultListItem">
                        <img id="img0" class="likeResultListImg" src="./img/iu1.jpg"><br>
                        <div class="likeResultListTxt">
                            ��¥ : 21/06/20<br>
                            �ð� : 19:00<br>
                            �����±� : 2��<br>
                            ����±� : ����<br>
                            �ؽ��±�<br>
                            <span id="txtHash0" class="txtHash">#������ #ȣ�� #����</span><br>
                            ���ƿ� �� : <span id="txtLike0" class="txtLike">999��</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img1" class="likeResultListImg" src="./img/iu2.jpg"><br>
                        <div class="likeResultListTxt">
                            ��¥ : 21/06/20<br>
                            �ð� : 19:00<br>
                            �����±� : 2��<br>
                            ����±� : ����<br>
                            �ؽ��±�<br>
                            <span id="txtHash1" class="txtHash">#�������� #������ #������ #������ #�輼�� #��â��</span><br>
                            ���ƿ� �� : <span id="txtLike1" class="txtLike">86��</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img2" class="likeResultListImg" src="./img/iu3.jpg"><br>
                        <div class="likeResultListTxt">
                            ��¥ : 21/06/20<br>
                            �ð� : 19:00<br>
                            �����±� : 2��<br>
                            ����±� : ����<br>
                            �ؽ��±�<br>
                            <span id="txtHash2" class="txtHash">#������ #���� #����ؿ�</span><br>
                            ���ƿ� �� : <span id="txtLike2" class="txtLike">1004��</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img3" class="likeResultListImg" src="./img/iu4.jpg"><br>
                        <div class="likeResultListTxt">
                            ��¥ : 21/06/20<br>
                            �ð� : 19:00<br>
                            �����±� : 2��<br>
                            ����±� : ����<br>
                            �ؽ��±�<br>
                            <span id="txtHash3" class="txtHash">#���� #���� #������</span><br>
                            ���ƿ� �� : <span id="txtLike3" class="txtLike">77��</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img4" class="likeResultListImg" src="./img/iu5.jpg"><br>
                        <div class="likeResultListTxt">
                            ��¥ : 21/06/20<br>
                            �ð� : 19:00<br>
                            �����±� : 2��<br>
                            ����±� : ����<br>
                            �ؽ��±�<br>
                            <span id="txtHash4" class="txtHash">#�ϻ� #�ϻ�Ÿ�׷� #��ī #����</span><br>
                            ���ƿ� �� : <span id="txtLike4" class="txtLike">1234��</span>
                        </div>
                    </div>
                    <div class="likeResultListItem">
                        <img id="img5" class="likeResultListImg" src="./img/iu6.jpg"><br>
                        <div class="likeResultListTxt">
                            ��¥ : 21/06/20<br>
                            �ð� : 19:00<br>
                            �����±� : 2��<br>
                            ����±� : ����<br>
                            �ؽ��±�<br>
                            <span id="txtHash5" class="txtHash">#������ #���� #ȿ�� #3��</span><br>
                            ���ƿ� �� : <span id="txtLike5" class="txtLike">-9999��</span>
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