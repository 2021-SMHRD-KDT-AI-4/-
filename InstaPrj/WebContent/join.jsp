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
            <div class="titleDiv">ȸ������</div>
            <div style="height: 3.75rem;"></div>
             

            <!-- ȸ������ form -->
            <form action="http://localhost:9000/joinservice/crawling" method="post" style="width: 37.5rem; margin: 0 auto;">
                <!-- �̸��� -->
                <div class="joinInputDiv">
                    <div class="joinInputDiv_1"><a>���̵�</a></div>
                    <div class="joinInputDiv_2"><input id = "join_id" class="joinInput" name="user_id" type="text" placeholder="���̵� �Է��ϼ���."></div>
                    <div class="joinInputDiv_3">  <input class="inputBtn" type="button" value="�ߺ�Ȯ��" onclick='idCheck()'></div>           
                   
                </div>
                <!-- ��й�ȣ -->
                <div class="joinInputDiv">
                    <div class="joinInputDiv_1"><a>��й�ȣ</a></div>
                    <div class="joinInputDiv_2"><input class="joinInput" name="user_pw" type="password" placeholder="��й�ȣ�� �Է��ϼ���."></div>
                    <div class="joinInputDiv_3"></div>
                </div>
                <!-- �ν�Ÿ�׷� ���̵� -->
                <div class="joinInputDiv">
                    <div class="joinInputDiv_1"><a>�ν�Ÿ�׷� ���̵�</a></div>
                    <div class="joinInputDiv_2"><input class="joinInput" id="insta_id" name ="insta_id" type="text" placeholder="�ν�Ÿ�׷� ���̵� �Է��ϼ���."></div>
                    <div class="joinInputDiv_3"><input class="inputBtn" type="button" value="Ȯ��"  onclick="crawlingNickImg()"></div>
                </div>
                <div style="height: 2rem;"></div>
                <!-- �ν�Ÿ�׷� �̹��� �����ؼ� �������� -->
                <img src="./profileImg/noPhoto.png" id="joinImg">
         
                <!-- �ν�Ÿ�׷� �̹��� �̸� input -->
                <input type="text" style="display: none;">
                <div style="height: 1.25rem;"></div>
                <!-- �ν�Ÿ�׷� �̸� -->
                <a id="welcomNick" style="font-size: 1.25rem;">@inforum_������_ȯ���մϴ�!</a>
                <div style="height: 2rem;"></div>
                <!-- form ���� -->
                <div style="height: 2.5rem;">
                    <input class="inputBtn" type="submit" value="�����ϱ�">
                </div>
            </form>
            
        </div>
    </div>
    	<script>
			function idCheck(){
				var join_id = $('#join_id').val();
				console.log(join_id);
				
				$.ajax({
					type : "post",  //������ ������ ���
					data : {"join_id" : join_id}, //������ ������ ����Ÿ
					url : "IdCheckService", //���� ���� �̸�
					dataType : "text" , //���� ������ ����
					success : function(data){
						if(data=='true'){
							alert("����� �� ���� id�Դϴ�");
						}else{
							console.log(data);
							alert("��� ������ id�Դϴ�");
						}
					},
					error : function(){
						alert("����!");
					}
				});
				
			}
			
			function crawlingNickImg(){
				var insta_id = $('#insta_id').val();
				$('#loading').show();
				
				$.ajax({
					
					type : "post",
					// �ν�Ÿ���̵� �ö�ũ������ ����
					data : {"insta_id" : insta_id},
					url : "http://localhost:9000/joinservice/flaskimgcrawling",
					dataType : "text",
					success: function(data) {
						
						var obj = JSON.parse(data);
						console.log(obj);
						var nickname = obj.nickname;
						console.log("nickname : "+nickname);
						// ���������� ���� ����
						var imgsrc = './profileImg/'+insta_id+'.png';
						$('#joinImg').attr('src','./profileImg/'+insta_id+'.png');
						// �ν�Ÿ�׷� �̸� ����
						$('#welcomNick').html(nickname+"��_�ݰ����ϴ�!");
						$('#loading').hide();
						
					},
					error:function(data){
						alert("����!");
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
						alert("����!")
					},
					error:function(data){
						alert("����!")
					}
				});
				
			}
				
			
		</script>

</body>
</html>