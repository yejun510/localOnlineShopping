<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>aside 태그</title>
<style>
	ul {text-align: center; list-style: none; padding-left: 0px;}
	#title {text-align: center;}
	#subtitle {text-align: center;}
	#content2 {height: 70%; }
	.c{
		text-decoration: none;
		color: black;
	}

</style>
</head>
<body id="asidebody">
<form id="aside" method="POST">
	<h3 id="title">MENU</h3>
	<br>
	<h4 id="subtitle">SHOP</h4>
	<ul id="content1">
 	   <li><a href="/product/productListBeef.do" id="beefPage" class="c">쇠고기</a></li>
 	   <li><a href="/product/productListPork.do" id="porkPage" class="c">돼지고기</a></li>
	</ul>
		<h4 id="subtitle">COMMUNITY</h4>
	<ul id="content2">
		<li><a href="/board/boardList.do" id="boardPage" class="c">문의사항</a></li>
		<li><a href="/notice/noticeList.do" id="noticePage" class="c">공지사항</a></li>
		<li><a href="/company/companyinfo.do" id="companyPage" class="c">기업정보</a></li>
	</ul>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</form> 
</body>
</html>