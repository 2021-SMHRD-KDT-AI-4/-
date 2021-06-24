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
<% MemberDTO info = (MemberDTO)session.getAttribute("info"); %>
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
            <div style="height: 7.5rem;"></div>
            <!-- ���� �ΰ� -->
            <div class="logoDiv">
               <img src="./img/logo.png" height="100%">
            </div>
            <div style="height: 8.25rem;"></div>
            <!-- ���� ������ �̹��� -->
            <% if (info == null){ %>
            <div style="height: 18.75rem;"><img id="mainImg" src="./img/maininstalogo4.jpg"></div>
            <%}else{ %>
            <div style="height: 18.75rem;"><img id="mainImg" src="./profileImg/<%=info.getINSTA_ID() %>.png"></div>
            <%} %>
            <div style="height: 1.5rem;"></div>
            <!-- ���� �ν�Ÿ ���̵� -->
            <% if(info == null){ %>
            <div style="height: 1.5rem; font-size: 1.5rem;"><sapn id="">�α��������ּ���~</sapn></div>
            <div style="height: 2rem;"></div>
            <%}else{ %>
            <div style="height: 1.5rem; font-size: 1.5rem;"><span id="">@<%=info.getINSTA_ID() %></span></div>
            <div style="height: 2rem;"></div>
            <%} %>
            <!-- ���� �λ�� -->
            <div style="height: 2.5rem; font-size: 2.5rem;">#��������_����_��_ȯ���մϴ�</div>
            <div style="height: 2.5rem;"></div>
            <!-- ���� �λ��2 -->
            <div style="height: 1rem; font-size: 1rem; color: #cfcfcf;">��ſ� �Ϸ� ��������</div>
        </div>
    </div>
</body>
</html>