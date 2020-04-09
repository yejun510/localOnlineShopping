<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
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
			<li id="login"><a href="#">LOGIN</a></li>
			<li id="join"><a href="#">JOIN</a></li>
			<li id="mypage"><a href="#">MYPAGE</a></li>
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