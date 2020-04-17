<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#emailId,#emailPass{
		width: 250px;
	}
	#borderId{
		border: thin;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#searchId").click(function(){
			var query = {name : $("#nameId").val(), email : $("#emailId").val()};
			$.ajax({
				url: "/mail/sendId",
				type: "post",
				data: query,
				success: function(data){
					if(data == 1){
						alert("해당 아이디가 이메일로 발송되었습니다.");
					}else{
						alert("등록된 아이디 또는 이메일이 없습니다.");
					}
				}
			});
		});
		
		$("#searchPass").click(function(){
			var query = {name : $("#namePass").val(), id : $("#id").val(), email : $("#emailPass").val()};
			
			$.ajax({
				url: "/mail/sendPass",
				type: "post",
				data: query,
				success: function(data){
					if(data == 1){
						alert("해당 비밀번호가 이메일로 발송되었습니다.");
						location.href="/login/loginForm";
					}else{
						alert("등록된 이름또는 아이디 또는 이메일이 없습니다.");
					}
				}
			});
		});
		
		$("#regist").click(function(){
			location.href = "/member/join";
		});
	});
</script>
<title>아이디/비밀번호 찾기</title>
</head>
<body>
	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	<hr>
	<h2>아이디 비밀번호 찾기</h2>
	<br>
	<br>
		<div id="borderId" style="border: 1px solid" align="center">
			<h3>아이디 찾기</h3><br>
			<label for="nameId">이름</label>&nbsp;&nbsp;&nbsp;<input type="text" id="nameId" name="nameId" placeholder="이름을 입력해주세요."><br>
			<label for="emailId">이메일</label>&nbsp;&nbsp;&nbsp;<input type="email" id="emailId" name="emailId" placeholder="이메일을 입력해주세요"><br>
	     <input type="button" id="searchId" value="아이디 찾기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="regist" value="회원가입"><br><br>
		</div><br>
	
		<div id="borderPass" style="border: 1px solid" align="center">
			<h3>비밀번호 찾기</h3><br>
			<label for="namePass">이름</label>&nbsp;&nbsp;&nbsp;<input type="text" id="namePass" name="namePass" placeholder="이름을 입력해주세요."><br>
			<label for="id">아이디</label>&nbsp;&nbsp;&nbsp;<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요."><br>
			<label for="emailPass">이메일</label>&nbsp;&nbsp;&nbsp;<input type="email" id="emailPass" name="emailPass" placeholder="아이디를 입력해주세요."><br>
			<br>
			<input type="button" id="searchPass" value="비밀번호 찾기"><br><br>
		</div>
	
	<hr>
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>