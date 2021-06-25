<%@page import="com.model.ResultDTO"%>
<%@page import="com.model.ResultDAO"%>
<%@page import="com.model.LikeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.LikeDAO"%>
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
               
              request.setCharacterEncoding("EUC-KR");
              String insta_id = info.getINSTA_ID();
              
              
              ResultDAO dao = new ResultDAO();
              ArrayList<ResultDTO> list = dao.view(insta_id);
              
              // System.out.println(list.get(1).getFile_name());
               
            //String pred = request.getParameter("pred");%>
            <div class="titleDiv">@<%= insta_id %> ���� ���ƿ� �м�</div>
            <div style="height: 1.25rem;"></div>
            <div id="likeReultDiv">
                <div id="likeResultDiv1">
                    <div style="width: 25rem;">
                        <!-- ��� �̹��� -->
                        <div id="likeResultImg">
                            <img id="resultImg" src="./likeimg/<%=list.get(0).getFile_name() %>" style="max-width: 100%; height: 100%; border: 0.25rem solid #E95099; border-radius: 1rem;">
                        </div>
                        <div style="height: 3rem;"></div>
                        <!-- ��� �� -->
                        <div id="likeResultTxt">
                            ���ƿ� ���� <span id="resultTxtLike" class="txtPink"><%=list.get(0).getResult_like() %>��</span>�� �����Ǹ�<br>��︮�� �ؽ��±״�<br>
                            <span id="resultTxtHash" class="txtPink"><%= list.get(0).getRec_hash_tag() %></span><br>�Դϴ�.
                        </div>
                    </div>
                </div>
                <div id="likeResultList">
                <% for (int i = 0; i < list.size(); i++){ %>
                    <div class="likeResultListItem">
                    	<div style="text-align: center;">
                        	<img id="img<%= i %>" class="likeResultListImg" src="./likeimg/<%=list.get(i).getFile_name() %>"><br>
                    	</div>
                        <div class="likeResultListTxt">
                            ��¥ : <%=list.get(i).getUpload_day() %><br>
                            �ð� : <%=list.get(i).getUpload_time() %><br>
                            �����±� : <%=list.get(i).getAccount_tag() %><br>
                            ����±� : <%=list.get(i).getPlace_tag() %><br>
                            �ؽ��±�<br>
                            <span id="txtHash<%= i %>" class="txtHash"><%= list.get(i).getRec_hash_tag() %></span><br>
                            ���ƿ� �� : <span id="txtLike<%= i %>" class="txtLike"><%=list.get(i).getResult_like() %>��</span>
                        </div>
                    </div>
                    
                    <%} %>
                    
                </div>
            </div>
      <% } %>
        </div>
    </div>
</body>
<script type="text/javascript" src="./js/selectItem.js"></script>
</html>