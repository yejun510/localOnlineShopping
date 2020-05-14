<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style type="text/css">

	
.btn { font-family: 'Nanum Brush Script', cursive;}
  
.btn:hover{color:#fff;}

.hover1:hover{ box-shadow: 100px 0 0 0 rgba(0,0,0,0.5) inset; } 


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


.find{
	font-family: 'Nanum Brush Script', cursive;
	height: 488.6px;
	
}



.hClass{
	font-family: 'Nanum Brush Script', cursive;
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
	<hr>
	<h2 align="center" class="hClass">아이디 비밀번호 찾기</h2>
	
		<div align="center">
		<div id="logreg-forms" class="find findclass">
			<form class="findLayOut">
			
			<h3>아이디 찾기</h3><br>
			<label for="nameId" class="labelClass">이름</label>&nbsp;&nbsp;&nbsp;<input type="text" id="nameId" name="nameId" placeholder="이름을 입력해주세요." class="form-control"><br><br>
			<label for="emailId" class="labelClass">이메일</label>&nbsp;&nbsp;&nbsp;<input type="email" id="emailId" name="emailId" placeholder="이메일을 입력해주세요" class="form-control"><br><br>
	        <input type="button" id="searchId" value="아이디 찾기" class="btn hover1 btn-default">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="regist" value="회원가입" class="btn hover1 btn-default"><br><br>
	   
	     	</form>
		</div>
	
		<div id="logreg-forms" class="find">
			<form class="findLayOut">
			<h3>비밀번호 찾기</h3><br>
			<label for="namePass" class="labelClass">이름</label>&nbsp;&nbsp;&nbsp;<input type="text" id="namePass" name="namePass" placeholder="이름을 입력해주세요." class="form-control"><br><br>
			<label for="id" class="labelClass">아이디</label>&nbsp;&nbsp;&nbsp;<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요." class="form-control"><br><br>
			<label for="emailPass" class="labelClass">이메일</label>&nbsp;&nbsp;&nbsp;<input type="email" id="emailPass" name="emailPass" placeholder="아이디를 입력해주세요." class="form-control"><br>
			<br>
			<input type="button" id="searchPass" value="비밀번호 찾기" class="btn hover1 btn-default"><br><br>
			</form>
		</div>
		</div>
	
	<hr>
	
</body>
</html>