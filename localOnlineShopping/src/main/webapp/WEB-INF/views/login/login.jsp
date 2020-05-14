<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style type="text/css">


.btn { font-family: 'Nanum Brush Script', cursive;}
  
.btn:hover{color:#fff;}

.hover1:hover{ box-shadow: 100px 0 0 0 rgba(0,0,0,0.5) inset; } 



.loginContainer{font-family: 'Nanum Brush Script', cursive;}

#logreg-forms{
    width:412px;
    margin:10vh auto;
    background-color:#f3f3f3;
    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
}
#logreg-forms form {
    width: 100%;
    max-width: 410px;
    padding: 15px;
    margin: auto;
}
#logreg-forms .form-control {
    position: relative;
    box-sizing: border-box;
    height: auto;
    padding: 10px;
    font-size: 16px;
}
#logreg-forms .form-control:focus { z-index: 2; }
#logreg-forms .form-signin input[type="email"] {
    margin-bottom: -1px;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
}
#logreg-forms .form-signin input[type="password"] {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}

#logreg-forms .social-login{
    width:390px;
    margin:0 auto;
    margin-bottom: 14px;
}
#logreg-forms .social-btn{
    font-weight: 100;
    color:white;
    width:190px;
    font-size: 0.9rem;
}

#logreg-forms a{
    display: block;
    padding-top:10px;
    color:lightseagreen;
}

#logreg-form .lines{
    width:200px;
    border:1px solid red;
}


#logreg-forms button[type="submit"]{ margin-top:10px; }





</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#regist").click(function() {
			location.href = "/member/join";
		});
		$("#access").click(function() {

			var query = {
				id : $("#id").val(),
				passwd : $("#passwd").val()
			}

			$.ajax({
				url : "/login/loginSelect",
				type : "post",
				data : query,
				success : function(data) {
					if (data == 1) {
						alert("로그인 성공!");
						location.href = "/";
					} else {
						alert("아이디와 비밀번호가 일치하지 않습니다.");
						$("#id").val('');
						$("#passwd").val('');
						$("#id").focus();
					}
				}
			});
		});

	});
</script>
</head>
<body>

	<hr>

	<div class="loginContainer" align="center">
	
		<h3>로그인 페이지</h3>
		
	<div id="logreg-forms">
	<br>
		<form id="loginForm">
			<label for="id" class="labelClass">아이디</label> <input type="text" id="id" name="id" class="form-control"
				placeholder="아이디를 입력해주세요." size="30"><br><br> <label for="passwd" class="labelClass">비밀번호</label>
			<input type="password" id="passwd" name="passwd" class="form-control"
				placeholder="비밀번호를 입력해주세요." size="30"><br><br> <input type="button" class="btn hover1 btn-default"
				id="access" value="로그인"> <input type="button" id="regist" class="btn hover1 btn-default"
				value="회원가입"><br> <a href="/login/find" id="searchId">아이디
				비밀번호 찾기</a>
		</form>
	</div>
	</div>
	<hr>

</body>
</html>