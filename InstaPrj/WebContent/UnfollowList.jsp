<%@page import="com.model.UnfollowDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.model.UnfollowDAO"%>
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
               <%}else{
               String insta_id = info.getINSTA_ID();
               String user_id = info.getUSER_ID();
            
            UnfollowDAO dao = new UnfollowDAO();
            
            String f4f_ID = request.getParameter("f4fID");
            
            List<String> now_f4f_list = Arrays.asList(f4f_ID.split(" "));
            List<String> past_f4f_list = dao.select(user_id);
            
            int size_date = past_f4f_list.size()-1;
            
            String past_date = past_f4f_list.get(size_date);
            
            if(past_f4f_list != null) {
               System.out.println(user_id+"���� ���� ���� ����Ʈ �ҷ����� ����");

            }
            // ���� ���ȸ���Ʈ�� ���� ���ȸ���Ʈ ��
            past_f4f_list.removeAll(now_f4f_list);
            past_f4f_list.remove(past_date);
               %>
            <div class="titleDiv">@<%= insta_id %> ���� ���ȷο� �м� ���</div>
            <div style="height: 2.5rem;"></div>
            <!-- �� ��¥ -->
            
            <!-- ���ȷο� ��� -->
            <div style="height: 25rem; width: 25rem; margin: auto; border: 0.25rem solid #E95099; border-radius: 1rem; background-color: rgba(255, 255, 255, 0.3);">
                <div style="height: 18.75rem; width: 18.75rem; margin: 3.125rem 3.125rem; font-size: 1.25rem; text-align: left;">
                    <% for(int i = 0; i<past_f4f_list.size(); i++) { %>
                    -@<%=past_f4f_list.get(i) %><br>
                    <% } %>
                </div>
            </div>
            <div style="height: 1rem;"></div>
            <a style="font-size: 1.25rem;">
               <% if(!past_f4f_list.isEmpty()) { %>
                  ���� ������ @<%= insta_id %>����<br>���ȷο��߽��ϴ�.
               <%} else{ %>
                @<%=info.getINSTA_ID() %> ���� <br>
                 ���ȷο� �� ������ �����ϴ�.
            <%}%>
            </a>
            <div style="height: 5rem;"></div>
            <div style="height: 2.5rem;">
                <a href="main.jsp"><input type="button" class="inputBtn" value="Ȩ����"></a>
            </div>
         <%// ����� �� ������ ���ο� ���� ��ϵ��� insert�� �ִ´�
              UnfollowDTO dto = new UnfollowDTO(user_id,now_f4f_list);
              
              // DB�� ����Ǿ��ִ� ���� ���� ����Ʈ�� delete
              int delete_cnt = dao.delete(user_id);
              if(delete_cnt>0){
                 System.out.println(user_id+"�� ���� ���� DELETE ����!");
              }else{
                 System.out.println(user_id+"�� ���� ���� DELETE ����!");
              }
           
              // ũ�Ѹ��� ���� ���� ����Ʈ�� insert
              int insert_cnt = dao.insert(dto);
              
            if(insert_cnt>0){
               System.out.println(user_id+"�� ���ο� ���� INSERT ����!");
            } else{
               System.out.println(user_id+"�� ���ο� ���� INSERT ����!");
            }
         }%>
        </div>
    </div>
</body>
</html>