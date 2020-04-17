<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<title>주지 육림 - My Page</title>
</head>
<body>
	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	
	<h3 align="center">마이 페이지</h3>
	
	<table border="1" align="center">
	<tr>
	<td><div id="orderList"  align="center" class="a">
		<a href="/mypage/mypageOrder">ORDER LIST</a>
		<p>고객님께서 주문하신 상품의 주문내역을 확인 하실 수 있는 공간입니다.<br>
			구매 하신 상품의 구매 확정 및 리뷰를 남겨보세요.</p>
	</div></td>
	<td><div id="PROFILE"  align="center" class="a">
		<a href="/mypage/mypageMyInfo">PROFILE</a>
		<p>고객님의 개인정보를 관리 할 수 있는 공간입니다.<br>
		 개인정보를 최신으로 유지 하시면 보다 편리한 쇼핑을 즐기실 수 있습니다.</p>
	</div></td>
	</tr>
	
	<tr>
	<td><div id="boardList"  align="center" class="b">
		<a href="/mypage/mypagePost">BOARD</a>
		<p>고객님께서 작성하신 게시물을 관리할 수 있는 공간입니다.<br>
			고객님께서 작성하신 게시글을 한눈에 확인 할 수 있습니다.</p>
	</div></td>
	<td><div id="address"  align="center" class="b">
		<a href="/mypage/mypageAddress">ADDRESS</a>
		<p>고객님께서 자주 이용하는 배송지를 최대 3개 까지 등록하고 관리 할 수 있는 공간입니다.</p>
	</div></td>
	</tr>
	</table>
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>