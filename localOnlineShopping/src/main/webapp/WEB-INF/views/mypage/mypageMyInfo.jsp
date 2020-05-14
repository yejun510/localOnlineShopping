<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.btn { font-family: 'Nanum Brush Script', cursive;}
  
	.btn:hover{color:#fff;}

	.hover1:hover{ box-shadow: 100px 0 0 0 rgba(0,0,0,0.5) inset; }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#modify").click(function(){
			location.href = "/mypage/mypageMyInfoUpdate";
		})
	});
</script>
<title>주지육림 - PROFILE</title>
</head>
<body>
	
	
	<h3 align="center">PROFILE</h3>
	<br>
	<br>
	<table align="center" class="table table-striped table-bordered">
		<tr>
			<td><label>아이디</label></td>
			<td><label>${member.id }</label></td>
		</tr>
		<tr>
			<td><label>이름</label></td>
			<td><label>${member.name }</label></td>
		</tr>
		<tr>
			<td><label>핸드폰 번호</label></td>
			<td><label>${member.tel }</label></td>
		</tr>
		<tr>
			<td><label>이메일</label></td>
			<td><label>${member.email }</label></td>
		</tr>
		<tr>
			<td><label>주소</label></td>
			<td><label>${member.address }</label></td>
		</tr>
		<tr>
			<td><label>배송지1</label></td>
			<td><label>${member.s_address1 }</label></td>
		</tr>
		<tr>
			<td><label>배송지2</label></td>
			<td><label>${member.s_address2 }</label></td>
		</tr>
		<tr>
			<td><label>배송지3</label></td>
			<td><label>${member.s_address3 }</label></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="button" id="modify" value="회원정보 수정" class="btn hover1 btn-default"></td>
		</tr>
	</table>
	
</body>
</html>