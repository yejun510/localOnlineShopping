<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>로그인 페이지</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!-- [if It IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		$("#loginBtn").click(function(){
			if (!chkSubmit($('#adminID'), "아이디를")){
				return;
			}else if(!chkSubmit($('#adminPasswd'), "비밀번호를")){
				return;
			}else{	
			var query = {
					adminId : $("#adminID").val(),
					adminPass : $("#adminPasswd").val()
			};
			$.ajax({
				url: "/admin/loginCheck",
				type: "post",
				data: query,
				success : function(data){
					if(data == 1){
						alert("로그인을 성공했습니다.");
						location.href = "/admin";
					}else{
						alert("입력하신 아이디 또는 비밀번호가 틀렸습니다. \n확인후 다시 입력해 주세요");
					}
				}
			});
			}
		});
	});
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="well">
			<c:if test="${adminID == null or adminID == ''}">
				<form id="loginForm" class="form-horizontal">
					
					<div class="form-group">
						<label for="adminID" class="col-sm-4 control-label">아 이 디</label>
						<div class="col-sm-4">
							<input type="text" id="adminID" name="adminID" class="form-control" placeholder="ID">
						</div>
						<p class="form-control-static error"></p>
					</div>
					
					<div class="form-group">
						<label for="adminPasswd" class="col-sm-4 control-label">비밀번호</label>
						<div class="col-sm-4">
							<input type="password" id="adminPasswd" name="adminPasswd" class="form-control" placeholder="Password">
						</div>
						<p class="form-control-static error"></p>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-6">
							<input type="button" value="로그인" id="loginBtn" class="btn btn-default" />
						</div>
					</div>
					
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>