<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
	#serchId{
		font-size: 70%;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#regist").click(function(){
			location.href="/member/join";
		});
		$("#access").click(function(){

			var query = {id : $("#id").val(),
						 passwd : $("#passwd").val()}
			
			$.ajax({
				url: "/login/loginSelect",
				type: "post",
				data: query,
				success : function(data){
					if(data == 1){
						alert("로그인 성공!");
						location.href="/";
					}else{
						alert("아이디와 비밀번호가 일치하지 않습니다.");
						$("#id").val('');
						$("#passwd").val('');
					}
				}
			});
		});
		
	});
</script>
</head>
<body>
	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	<hr>
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인 페이지</h3><br>
	<br>
	<br>
	
	<form id="loginForm">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="id">아이디</label>
	<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요."><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="passwd">비밀번호</label>
	<input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요."><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" id="access" value="로그인">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" id="regist" value="회원가입"><br>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/login/find" id="searchId">아이디 비밀번호 찾기</a>	
	</form>
	
	<hr>
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>