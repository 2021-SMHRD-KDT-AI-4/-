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
<script src="https://kit.fontawesome.com/3e7e31d983.js"
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#sidebar").load("./sidebar.jsp");
	});
</script>
<style>
#loading {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	position: fixed;
	display: block;
	opacity: 0.7;
	background-color: #fff;
	z-index: 99;
	text-align: center;
}

#loading-image {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}
</style>
</head>
<body>
	<%
		MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>
	<!-- �޴� ���̵�� ��ư ǥ�� -->
	<input type="checkbox" id="menuicon">
	<label for="menuicon"> <span></span> <span></span> <span></span>
	</label>
	<div class="container">
		<!-- ���̵�� -->
		<div id="sidebar"></div>
		<!-- ���� -->
		<div class="main">
			<div id="lload">
				<img id="loading" src="./img/loading.gif" alt="Loading...">
			</div>
			<div style="height: 2rem;"></div>
			<div class="logoDiv">
				<a href="main.html"><img src="./img/logo.png" height="100%"></a>
			</div>
			<!-- ������ ���� -->
			<div class="titleDiv">���ƿ� ����</div>
			<div style="height: 2rem;"></div>

			<!-- �α��� ������ �� -->
			<%
				if (info == null) {
			%>
			<h3>
				ȸ���� �̿밡���� �����Դϴ�.<br> �α����� �������ּ���!
			</h3>

			<%
				} else {
			%>
			<!-- ���ƿ� ���� form -->
			<!-- http://localhost:9000/likeresult/result -->
			<form id="trans" action="likeService" method="post"
				enctype="multipart/form-data"
				style="width: 22.5rem; margin: 0 auto;">
				<input type="text" name="pred_insta_id" style="display: none;"
					value="<%=info.getINSTA_ID()%>">
				<!-- �̹��� ���ε� �� �̸����� -->
				<div
					style="height: 25rem; width: 25rem; margin: auto; border: 0.25rem solid #E95099;">
					<input id="uploadImg" name="file_name" type="file"
						style="display: none;"> <label for="uploadImg"> <img
						src="./img/upload_image.jpg" id="previewImg" width="100%"
						height="100%">
					</label>
				</div>
				<div style="height: 1.25rem;"></div>
				<!-- ��¥ -->
				<div class="likeInputDiv">
					<div class="likeInputDiv_1">
						<span>��¥</span>
					</div>
					<div class="likeInputDiv_2">
						<input id="upload_day" name="upload_day" class="likeInput"
							type="date">
					</div>
				</div>
				<!-- �ð� -->
				<div class="likeInputDiv">
					<div class="likeInputDiv_1">
						<span>�ð�</span>
					</div>
					<div class="likeInputDiv_2">
						<input id="upload_time" name="upload_time" class="likeInput"
							type="time">
					</div>
				</div>
				<!-- �ؽ��±� -->
				<div class="likeInputDiv">
					<div class="likeInputDiv_1">
						<span>�ؽ��±�</span>
					</div>
					<div class="likeInputDiv_2">
						<input id="hashtag" name="hashtag" class="likeInput" type="text"
							placeholder="#��������Ÿ�׷�">
					</div>
				</div>
				<!-- �����±� �� -->
				<div class="likeInputDiv">
					<div class="likeInputDiv_1">
						<span>�����±� ��</span>
					</div>
					<div class="likeInputDiv_2">
						<input id="account_tag" name="account_tag" class="likeInput"
							type="number" value="0">
					</div>
				</div>
				<!-- ����±� -->
				<div class="likeInputDiv">
					<div class="likeInputDiv_1">
						<span>����±�</span>
					</div>
					<div class="likeInputDiv_2">
						<label style="font-size: 1rem;"><input type="radio"
							value="1" name="place_tag">����</label> <label
							style="font-size: 1rem;"><input type="radio" value="0"
							name="place_tag">����</label>
					</div>
				</div>
				<!-- form ���� -->
				<div style="height: 2.5rem;">
					<input class="inputBtn" type="submit" value="�����ϱ�">
				</div>
			</form>
			<%
				}
			%>
		</div>
	</div>

	<script>
		function predict() {
			var pred_insta_id = $('#pred_insta_id').val();
			var file_name = $('#uploadImg').val();
			var upload_day = $('#upload_day').val();
			var upload_time = $('#upload_time').val();
			var hashtag = $('#hashtag').val();
			var account_tag = $('#account_tag').val();
			var place_tag = $('input[name="place_tag"]:checked').val();

			$('#loading').show();

			$.ajax({

				type : "post",

				data : {
					"pred_insta_id" : pred_insta_id,
					"file_name" : file_name,
					"upload_day" : upload_day,
					"upload_time" : upload_time,
					"hashtag" : hashtag,
					"account_tag" : account_tag,
					"place_tag" : place_tag
				},

				url : "http://localhost:9000/likeresult/result",
				dataType : "text",
				success : function(data) {

					var obj = JSON.parse(data);
					console.log(obj);
					var file_name = obj.file_name;
					console.log("file_name : " + nickname);

				},
				error : function(error) {

					alert(error);
				}
			});
		}
		$(document).ready(function() {

			$('#lload').hide();

			$('#trans').submit(function() {

				$('#lload').show();

				return true;

			});

		});
	</script>
</body>
<script type="text/javascript" src="./js/previewImg.js"></script>
</html>