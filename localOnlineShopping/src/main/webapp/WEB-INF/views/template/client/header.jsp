<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	a{text-decoration: none;
		color: black; }
	ul, li{list-style: none; margin: 0; padding: 0;
	}
	#h_menu > li{display: inline-block; background:#FFD8D8; text-align:center;}
	#h_menu > li ul.submenu{display: none; position: absolute;}
	#h_menu > li:hover ul.submenu { display:block; background:#FFD8D8; }
	
	#out{
		cursor: pointer;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#logOut").click(function(){
		var result = confirm("정말로 로그아웃 하시겠습니까?");
			if(result){
				$("#out").attr("href","/login/logOut");
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<header>
	<a href="/"><img src="../resources/img/log.jpg"></a> 
	 
		
	<div>
		<ul id="h_menu">
			<li id="shop">SHOP
				<ul id="shop_sub" class="submenu">
					<li><a href="#">소 고기</a></li>
					<li><a href="#">돼지 고기</a></li>
				</ul>
			</li>
			<c:if test="${id == null or id == '' }"> <!-- 로그인 이전 -->
			<li id="login"><a href="/login/loginForm">LOGIN</a></li></c:if>
			
			<c:if test="${id != null and id != '' }"><!-- 로그인 이후 -->
			<li id="logOut"><a id="out">LOGOUT</a></li></c:if>
			<c:if test="${id == null or id == '' }">
			<li id="join"><a href="/member/join">JOIN</a></li></c:if>
			<c:if test="${id != null and id != '' }">
			<li id="mypage"><a href="/mypage/mypage">MYPAGE</a></li></c:if>
			<li id="cart"><a href="#">CART</a></li>
			<li id="community"><a href="#">COMMUNITY</a>
				<ul id="community_sub" class="submenu">
					<li><a href="#">공지 사항</a></li>
					<li><a href="#">기업 정보</a></li>
					<li><a href="#">문의 게시판</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</header>
	<hr>
</body>
</html>