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
               <a href="main.jsp"><img src="./img/logo.png" height="100%"></a>
            </div>
            <div style="height: 2rem;"></div>
            <!-- 페이지 제목 -->
                      <%if(info == null) { %>
               <h3>회원만 이용가능한 서비스입니다.<br> 로그인을 진행해주세요!</h3>
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
               System.out.println(user_id+"님의 이전 맞팔 리스트 불러오기 성공");

            }
            // 이전 맞팔리스트와 현재 맞팔리스트 비교
            past_f4f_list.removeAll(now_f4f_list);
            past_f4f_list.remove(past_date);
               %>
            <div class="titleDiv">@<%= insta_id %> 님의 언팔로우 분석 결과</div>
            <div style="height: 2.5rem;"></div>
            <!-- 비교 날짜 -->
            
            <!-- 언팔로우 결과 -->
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
                  위의 계정이 @<%= insta_id %>님을<br>언팔로우했습니다.
               <%} else{ %>
                @<%=info.getINSTA_ID() %> 님을 <br>
                 언팔로우 한 계정이 없습니다.
            <%}%>
            </a>
            <div style="height: 5rem;"></div>
            <div style="height: 2.5rem;">
                <a href="main.jsp"><input type="button" class="inputBtn" value="홈으로"></a>
            </div>
         <%// 출력한 후 값들은 새로운 맞팔 목록들은 insert에 넣는다
              UnfollowDTO dto = new UnfollowDTO(user_id,now_f4f_list);
              
              // DB에 저장되어있던 과거 맞팔 리스트를 delete
              int delete_cnt = dao.delete(user_id);
              if(delete_cnt>0){
                 System.out.println(user_id+"의 이전 맞팔 DELETE 성공!");
              }else{
                 System.out.println(user_id+"의 이전 맞팔 DELETE 실패!");
              }
           
              // 크롤링한 현재 맞팔 리스트를 insert
              int insert_cnt = dao.insert(dto);
              
            if(insert_cnt>0){
               System.out.println(user_id+"의 새로운 맞팔 INSERT 성공!");
            } else{
               System.out.println(user_id+"의 새로운 맞팔 INSERT 실패!");
            }
         }%>
        </div>
    </div>
</body>
</html>