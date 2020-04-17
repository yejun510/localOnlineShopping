<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#o_quantity{
		width: 70px;
	}
	#o_status{
		width: 70px;
	}
	#o_paymethod{
		width: 70px;
	}
	#o_totalprice{
		width: 70px;
	}
	#o_price{
		width: 70px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">

	
</script>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>

	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	
	<fieldset>
	<h3 align="center">주문 내역</h3>
		<table align="center" border="1">
			<tr>
				<th>상품 이미지</th>
				<th>주문 번호</th>
				<th>상품명</th>
				<th>주문 날짜</th>
				<th>배송희망 날짜</th>
				<th>수량</th>
				<th>상품 단가 금액</th>
				<th>총 금액</th>
				<th>결제 수단</th>
				<th>주문 처리 상태</th>
				<th>구매 확정</th>
				<th>주문 취소</th>
			</tr>
			
			<c:set var="a" value="1"/>
			<c:choose>
				<c:when test="${not empty list }">
					<c:forEach var="d_list" items="#{list }">
						<tr data-num="${d_list.o_serialnum }">
							<td><input type="text" name="o_image" id="o_image${a }" value="${d_list.o_image }" readonly="readonly" style="border: 0;"></td>
							<td><input type="text" name="o_serialnum" id="o_serialnum${a }" value="${d_list.o_serialnum}" readonly="readonly" style="border: 0;"></td>
							<td><input type="text" name="o_product" id="o_product${a }" value="${d_list.o_product }" readonly="readonly" style="border: 0;"></td>
							<td><input type="text" name="o_date" id="o_date${a }" value="${d_list.o_date }" readonly="readonly" style="border: 0;"></td>
							<td><input type="text" name="o_delivery" id="o_delivery${a }" value="${d_list.o_delivery }" readonly="readonly" style="border: 0;"></td>
							<td><input type="text" name="o_quantity" id="o_quantity${a }" value="${d_list.o_quantity }" readonly="readonly" style="border: 0;"></td>
							<td><input type="text" name="o_price" id="o_price${a }" value="${d_list.o_price }" readonly="readonly" style="border: 0;"></td>
							<td><input type="text" name="o_totalprice" id="o_totalprice${a }" value="${d_list.o_totalprice }" readonly="readonly" style="border: 0;"></td>
							<td><input type="text" name="o_paymethod" id="o_paymethod${a }" value="${d_list.o_paymethod }" readonly="readonly" style="border: 0;"></td>
							<td><input type="text" name="o_status" id="o_status${a }" value="${d_list.o_status }" readonly="readonly" style="border: 0;"></td>
							<td><input type="button" value="구매확정" id="buying${a }"></td>
							<td><input type="button" value="주문 취소" id="cancel${a }"></td>
						</tr>
						${a }
						<c:set var="a" value="${a+1 }"/>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="12">주문 하신 상품이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
		</table>
	</fieldset>
	<br>
	<br>
	
	<fieldset>
	<h3 align="center">구매확정 내역</h3>
		<table align="center" border="1">
			<tr>
				<th>상품 이미지</th>
				<th>주문 번호</th>
				<th>상품 명</th>
				<th>주문 날짜</th>
				<th>수량</th>
				<th>금액</th>
				<th>결제 수단</th>
				<th>주문 처리 상태</th>
				<th>리뷰 작성</th>
			</tr>
		</table>
	</fieldset>
	<a href="/mypage/mypageReview">리뷰작성 페이지</a>
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>