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
         $("#sidebar").load("./sidebar.jsp");
      });
   </script>
</head>
<body>
<% MemberDTO info = (MemberDTO)session.getAttribute("info");
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
            <% if(info == null) {%>
               <h3>ȸ���� �̿밡���� �����Դϴ�.<br> �α����� �������ּ���!</h3>
            <%} else { 
                String insta_id = info.getINSTA_ID(); %>
            <div class="titleDiv">@<%= insta_id %> ���� ���ȷο� �м�</div>
            <div style="height: 2.5rem;"></div>
            
            <!-- ���ȷο� ���� ���� -->
            <div style="height: 25rem; width: 25rem; margin: auto; border: 0.25rem solid #E95099; background-color: rgba(255, 255, 255, 0.3);">
                <div style="height: 18.75rem; width: 18.75rem; margin: 3.125rem 3.125rem; text-align: left;">
                    <a>���� �ֱ��� �ȷο� ��ϰ� ������ �ȷο� ����� ���Ͽ� ���ȷο��� ������ �м��� �帳�ϴ�. </a>
                </div>  
            </div>
            <div style="height: 5rem;"></div>
            <div style="height: 2.5rem;">
               <button onclick="location.href = 'http://localhost:9000/inforum/Unfollow?insta_id=<%=insta_id%>'">�м��ϱ�</button>
            </div>
         <% }%>
        </div>
    </div>
     <script>
     function setThumbnail(event){
      var reader = new FileReader();
      
      reader.onload = function(event){
         var img = document.createElement("img");
         img.setAttribute("src", event.target.result);
         document.querySelector("div#image_container").appendChild(img);
      };
      
      reader.readAsDataURL(event.target.files[0]);
   }
     
  </script>
</body>
</html>