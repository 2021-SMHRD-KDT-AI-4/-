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
            <div class="logoDiv">
            	<img src="./img/logo.png" height="100%">
            </div>
            <div style="height: 1.25rem;"></div>
            <!-- ������ ���� -->
            <div class="titleDiv">ȸ������</div>
            <div style="height: 3.75rem;"></div>
             

            <!-- ȸ������ form -->
            <form action="JoinService" method="post" style="width: 37.5rem; margin: 0 auto;">
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
                    <div class="joinInputDiv_2"><input class="joinInput" name ="insta_id" type="text" placeholder="�ν�Ÿ�׷� ���̵� �Է��ϼ���."></div>
                    <div class="joinInputDiv_3"><input class="inputBtn" type="button" value="Ȯ��"></div>
                </div>
                <div style="height: 2rem;"></div>
                <!-- �ν�Ÿ�׷� �̹��� �����ؼ� �������� -->
                <img src="./img/sample.jpg" id="joinImg">
                <!-- �ν�Ÿ�׷� �̹��� �̸� input -->
                <input type="text" style="display: none;">
                <div style="height: 1.25rem;"></div>
                <!-- �ν�Ÿ�׷� �̸� -->
                <a id="" style="font-size: 1.25rem;">#kingGodGeneral_��_�ݰ�����</a>
                <div style="height: 2rem;"></div>
                <!-- form ���� -->
                <div style="height: 2.5rem;">
                    <input class="inputBtn" type="submit" value="�����ϱ�">
                </div>
            </form>
            
        </div>
    </div>
    			<script>
				function idCheck() {
					var input = $('#join_id').val();
					
					$.ajax({
						type : "post", // �����͸� ������ ���
						data : {"join_id" : input},  // ������ ������ ������
						url : "IdCheckService",  // ���� ���� �̸�
						dataType : "text",  // ���� ������ ����
						success : function(data){
							
							if(data == true){
								alert("���Ұ�")
								
							}else if(data == false){
								alert("��밡��")
							}else{
								alert("�𸣰ڴ�")
							}
							// data == true (���� �ִ� ���)
							// span(id = 'sp') =>'�Ұ����� id�Դϴ�.'
							
							// data == false (���� ���� ���)
							// span(id = 'sp') =>'������ id�Դϴ�.'
						},
						error : function(data){
							alert("����!");
						}
					})
				}
			</script>
</body>
</html>