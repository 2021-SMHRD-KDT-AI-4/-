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
	<style> #loading { width: 100%; height: 100%; top: 0px; left: 0px; position: fixed; display: block; opacity: 0.7; background-color: #fff; z-index: 99; text-align: center; } #loading-image { position: absolute; top: 50%; left: 50%; z-index: 100; } </style>

</head>
<body>
<div id="loading" style="display:none"><img id="loading-image" src="./img/sample.jpg" alt="Loading..." /></div>

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
            <div class="titleDiv">회원가입</div>
            <div style="height: 3.75rem;"></div>
             

            <!-- 회원가입 form -->
            <form action="http://localhost:9000/joinservice/crawling" method="post" style="width: 37.5rem; margin: 0 auto;">
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
                    <div class="joinInputDiv_2"><input class="joinInput" id="insta_id" name ="insta_id" type="text" placeholder="인스타그램 아이디를 입력하세요."></div>
                    <div class="joinInputDiv_3"><input class="inputBtn" type="button" value="확인"  onclick="crawlingNickImg()"></div>
                </div>
                <div style="height: 2rem;"></div>
                <!-- 인스타그램 이미지 추출해서 가져오기 -->
                <img src="./profileImg/noPhoto.png" id="joinImg">
         
                <!-- 인스타그램 이미지 이름 input -->
                <input type="text" style="display: none;">
                <div style="height: 1.25rem;"></div>
                <!-- 인스타그램 이름 -->
                <a id="welcomNick" style="font-size: 1.25rem;">@inforum_가입을_환영합니다!</a>
                <div style="height: 2rem;"></div>
                <!-- form 제출 -->
                <div style="height: 2.5rem;">
                    <input class="inputBtn" type="submit" value="가입하기">
                </div>
            </form>
            
        </div>
    </div>
    	<script>
			function idCheck(){
				var join_id = $('#join_id').val();
				console.log(join_id);
				
				$.ajax({
					type : "post",  //데이터 보내는 방식
					data : {"join_id" : join_id}, //서버로 보내는 데이타
					url : "IdCheckService", //서버 파일 이름
					dataType : "text" , //응답 데이터 형식
					success : function(data){
						if(data=='true'){
							alert("사용할 수 없는 id입니다");
						}else{
							console.log(data);
							alert("사용 가능한 id입니다");
						}
					},
					error : function(){
						alert("실패!");
					}
				});
				
			}
			
			function crawlingNickImg(){
				var insta_id = $('#insta_id').val();
				$('#loading').show();
				
				$.ajax({
					
					type : "post",
					// 인스타아이디를 플라스크서버에 전달
					data : {"insta_id" : insta_id},
					url : "http://localhost:9000/joinservice/flaskimgcrawling",
					dataType : "text",
					success: function(data) {
						
						var obj = JSON.parse(data);
						console.log(obj);
						var nickname = obj.nickname;
						console.log("nickname : "+nickname);
						// 프로필으로 사진 변경
						var imgsrc = './profileImg/'+insta_id+'.png';
						$('#joinImg').attr('src','./profileImg/'+insta_id+'.png');
						// 인스타그램 이름 띄우기
						$('#welcomNick').html(nickname+"님_반갑습니다!");
						$('#loading').hide();
						
					},
					error:function(data){
						alert("실패!");
					}
				});	
			}
			
			function crwalingF4F(){
				var insta_id = $('#insta_id').val();
				alert("submit : "+input_id);
				
				$.ajax({
					type : "get",
					data : {"insta_id" : insta_id},
					url : "http://localhost:9000/joinservice/crawling",
					dataType : "text",
					success: function(data) {
						alert("성공!")
					},
					error:function(data){
						alert("실패!")
					}
				});
				
			}
				
			
		</script>

</body>
</html>