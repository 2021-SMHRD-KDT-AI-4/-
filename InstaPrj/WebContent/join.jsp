<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>join</title>
    <link rel="stylesheet" href="./css/style1.css">
    <script src="https://kit.fontawesome.com/3e7e31d983.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">   
		$(document).ready(function() {
			$("#sidebar").load("./sidebar.html");
		});
	</script>
</head>
<body>
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
            <div style="height: 7.5rem;"></div>
            <div class="logoDiv">
            	<img src="./img/logo.png" height="100%">
            </div>
            <div style="height: 1.25rem;"></div>
            <!-- 페이지 제목 -->
            <div class="titleDiv">회원가입</div>
            <div style="height: 3.75rem;"></div>
             

            <!-- 회원가입 form -->
            <form action="JoinService" method="post" style="width: 37.5rem; margin: 0 auto;">
                <!-- 이메일 -->
                <div class="joinInputDiv">
                    <div class="joinInputDiv_1"><a>아이디</a></div>
                    <div class="joinInputDiv_2"><input id = "join_id" class="joinInput" name="user_id" type="text" placeholder="아이디를 입력하세요."></div>
                    <div class="joinInputDiv_3">  <input class="inputBtn" type="button" value="중복확인" onclick='idCheck()'></div>           
                   
                </div>
                <!-- 비밀번호 -->
                <div class="joinInputDiv">
                    <div class="joinInputDiv_1"><a>비밀번호</a></div>
                    <div class="joinInputDiv_2"><input class="joinInput" name="user_pw" type="password" placeholder="비밀번호를 입력하세요."></div>
                    <div class="joinInputDiv_3"></div>
                </div>
                <!-- 인스타그램 아이디 -->
                <div class="joinInputDiv">
                    <div class="joinInputDiv_1"><a>인스타그램 아이디</a></div>
                    <div class="joinInputDiv_2"><input class="joinInput" name ="insta_id" type="text" placeholder="인스타그램 아이디를 입력하세요."></div>
                    <div class="joinInputDiv_3"><input class="inputBtn" type="button" value="확인"></div>
                </div>
                <div style="height: 2rem;"></div>
                <!-- 인스타그램 이미지 추출해서 가져오기 -->
                <img src="./img/sample.jpg" id="joinImg">
                <!-- 인스타그램 이미지 이름 input -->
                <input type="text" style="display: none;">
                <div style="height: 1.25rem;"></div>
                <!-- 인스타그램 이름 -->
                <a id="" style="font-size: 1.25rem;">#kingGodGeneral_님_반가워요</a>
                <div style="height: 2rem;"></div>
                <!-- form 제출 -->
                <div style="height: 2.5rem;">
                    <input class="inputBtn" type="submit" value="가입하기">
                </div>
            </form>
            
        </div>
    </div>
    			<script>
				function idCheck() {
					var input = $('#join_id').val();
					
					$.ajax({
						type : "post", // 데이터를 보내는 방식
						data : {"join_id" : input},  // 서버를 보내는 데이터
						url : "IdCheckService",  // 서버 파일 이름
						dataType : "text",  // 응답 데이터 형식
						success : function(data){
							
							if(data == true){
								alert("사용불가")
								
							}else if(data == false){
								alert("사용가능")
							}else{
								alert("모르겠다")
							}
							// data == true (값이 있는 경우)
							// span(id = 'sp') =>'불가능한 id입니다.'
							
							// data == false (값이 없는 경우)
							// span(id = 'sp') =>'가능한 id입니다.'
						},
						error : function(data){
							alert("실패!");
						}
					})
				}
			</script>
</body>
</html>