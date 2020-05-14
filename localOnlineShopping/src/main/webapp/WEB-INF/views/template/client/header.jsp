<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />

<meta charset="UTF-8">
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

#out, #shop, #cart {
	cursor: pointer;
}

.menu {
	position: relative;
	height: 44px;
	background: #2b2f3a;
	width: auto;
}

.menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
	line-height: 1;
}

.menu>ul {
	position: relative;
	display: block;
	background: #ffffff;
	width: 100%;
	z-index: 500;
}

.menu:after, .menu>ul:after {
	content: ".";
	display: block;
	clear: both;
	visibility: hidden;
	line-height: 0;
	height: 0;
}

.menu.align-right>ul>li {
	float: right;
}

.menu.align-center ul {
	text-align: center;
}

.menu.align-center ul ul {
	text-align: left;
}

.menu>ul>li {
	display: inline-block;
	position: relative;
	margin: 0;
	padding: 0;
}

.menu>ul>#menu-button {
	display: none;
}

.menu ul li a {
	display: block;
	font-family: Droid Serif, sans-serif;
	text-decoration: none;
}

.menu>ul>li>a {
	font-size: 14px;
	font-weight: bold;
	padding: 15px 20px;
	color: #2b2f3a;
	text-transform: uppercase;
	-webkit-transition: color 0.25s ease-out;
	-moz-transition: color 0.25s ease-out;
	-ms-transition: color 0.25s ease-out;
	-o-transition: color 0.25s ease-out;
	transition: color 0.25s ease-out;
}

.menu>ul>li.sub>a {
	padding-right: 32px;
}

.menu>ul>li:hover>a {
	color: #DAD9FF;
	font-size: 1.2em;
}

.menu li.sub::after {
	display: block;
	content: "";
	position: absolute;
	width: 0;
	height: 0;
}

.menu>ul>li.sub::after {
	right: 10px;
	top: 20px;
	border: 5px solid transparent;
	border-top-color: #7a8189;
}

.menu>ul>li:hover::after {
	border-top-color: #ffffff;
}

.menu ul ul {
	position: absolute;
	left: -9999px;
	top: 70px;
	opacity: 0;
	-webkit-transition: opacity .3s ease, top .25s ease;
	-moz-transition: opacity .3s ease, top .25s ease;
	-ms-transition: opacity .3s ease, top .25s ease;
	-o-transition: opacity .3s ease, top .25s ease;
	transition: opacity .3s ease, top .25s ease;
	z-index: 1000;
}

.menu ul ul ul {
	top: 37px;
	padding-left: 5px;
}

.menu ul ul li {
	position: relative;
}

.menu>ul>li:hover>ul {
	left: auto;
	top: 44px;
	opacity: 1;
}

.menu.align-right>ul>li:hover>ul {
	left: auto;
	right: 0;
	opacity: 1;
}

.menu ul ul li:hover>ul {
	left: 170px;
	top: 0;
	opacity: 1;
}

.menu.align-right ul ul li:hover>ul {
	left: auto;
	right: 170px;
	top: 0;
	opacity: 1;
	padding-right: 5px;
}

.menu ul ul li a {
	width: 130px;
	border-bottom: 1px solid #eeeeee;
	padding: 10px 20px;
	font-size: 12px;
	color: #000000;
	background: #ffffff;
	-webkit-transition: all .35s ease;
	-moz-transition: all .35s ease;
	-ms-transition: all .35s ease;
	-o-transition: all .35s ease;
	transition: all .35s ease;
	font-family: 'Nanum Brush Script', cursive;
}

.menu.align-right ul ul li a {
	text-align: right;
}

.menu ul ul li:hover>a {
	background: #f2f2f2;
	color: #8c9195;
}

.menu ul ul li:last-child>a, .menu ul ul li.last>a {
	border-bottom: 0;
}

.menu>ul>li>ul::after {
	content: '';
	border: 6px solid transparent;
	width: 0;
	height: 0;
	border-bottom-color: #ffffff;
	position: absolute;
	top: -12px;
	left: 30px;
}

.menu.align-right>ul>li>ul::after {
	left: auto;
	right: 30px;
}

.menu ul ul li.sub::after {
	border: 4px solid transparent;
	border-left-color: #9ea2a5;
	right: 10px;
	top: 12px;
	-moz-transition: all .2s ease;
	-ms-transition: all .2s ease;
	-o-transition: all .2s ease;
	transition: all .2s ease;
	-webkit-transition: -webkit-transform 0.2s ease, right 0.2s ease;
}

.menu.align-right ul ul li.sub::after {
	border-left-color: transparent;
	border-right-color: #9ea2a5;
	right: auto;
	left: 10px;
}

.menu ul ul li.sub:hover::after {
	border-left-color: #ffffff;
	right: -5px;
	-webkit-transform: rotateY(180deg);
	-ms-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

.menu.align-right ul ul li.sub:hover::after {
	border-right-color: #ffffff;
	border-left-color: transparent;
	left: -5px;
	-webkit-transform: rotateY(180deg);
	-ms-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

.cont {
	width: 100%;
	float: left;
	margin-top: 0px;
	margin-left: 0px;
}

.navtemp {
	width: 1200px;
	float: right;
	align-items: flex-end;
	margin-top: 0px;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#logOut").click(function() {
			var result = confirm("정말로 로그아웃 하시겠습니까?");
			if (result) {
				$("#out").attr("href", "/login/logOut");
			}
		});
		
		$("#cart").click(function(){
			if(${id == null or id == ''}){
				alert("로그인 해주세요.");
				$("#cart").attr("href", "#");
			}else{
				$("#cart").attr("href", "/cart/cartList.do");
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>

	<header>
		<div class="cont">

			<a href="/"> <img src="../resources/img/logo.jpg" align="top"
				width="200px" height="100px">
			</a>


			<div class="navtemp menu" align="center">
				<ul id="h_menu">
					<li id="shop"><a href="#">SHOP</a>
						<ul id="shop_sub">
							<li><a href="/product/productListBeef.do">소 고기</a></li>
							<li><a href="/product/productListPork.do">돼지 고기</a></li>
						</ul></li>
					<c:if test="${id == null or id == '' }">
						<!-- 로그인 이전 -->
						<li id="login"><a href="/login/loginForm">LOGIN</a></li>
					</c:if>

					<c:if test="${id != null and id != '' }">
						<!-- 로그인 이후 -->
						<li id="logOut"><a id="out">LOGOUT</a></li>
					</c:if>
					<c:if test="${id == null or id == '' }">
						<li id="join"><a href="/member/join">JOIN</a></li>
					</c:if>
					<c:if test="${id != null and id != '' }">
						<li id="mypage"><a href="/mypage/mypage">MYPAGE</a></li>
					</c:if>
					<li><a id="cart">CART</a></li>
					<li id="community"><a href="#">COMMUNITY</a>
						<ul id="community_sub" class="submenu">
							<li><a href="/notice/noticeList.do">공지 사항</a></li>
							<li><a href="/company/companyinfo.do">기업 정보</a></li>
							<li><a href="/board/boardList">문의 게시판</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</header>

</body>
</html>