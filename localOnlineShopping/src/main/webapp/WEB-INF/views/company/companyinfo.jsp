<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>기업정보</title>
<style>
	#includeAside{
		float: left;
	}
	#companyPage{
	text-decoration: underline;
		font-size: 20px;
	}
</style>
</head>
<body>
	<div id="includeAside">
		<jsp:include page="../template/client/aside1.jsp"/>
	</div>
	<div id="context" align="center">
		<p id="p1">(주)주지육림</p>
		<br>
		<br>
		<p>경영진: 김기남</p>
		<img src="../resources/images/lee.jpg">
		
		<p>설립일: 2020년 4월 9일 </p>
	</div>
		

</body>
</html>