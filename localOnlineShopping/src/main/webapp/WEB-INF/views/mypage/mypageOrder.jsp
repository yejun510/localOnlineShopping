<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".cancel").click(function(){
			var status = $(this).parent().parent().prev().prev().val();
			var num = $(this).parent().parent().prev().val();
			
			$("#status").attr("value", status);
			$("#num").attr("value",num);
			
			if($("#status").val() == '입금 전' || $("#status").val() == '입금 확인' ){
				
				var check = confirm("정말로 주문을 취소하시겠습니까?");
				if(check){
					
				$("#deleteForm").attr({
					"action": "/mypage/deleteOrder",
					"method": "post"
				});
				$("#deleteForm").submit();
				
				}
			}else{
				alert("주문 취소는 '입금 전' 또는 '입금 확인'상태에서만 가능합니다");
			}
		});
		
		$(".buying").click(function(){
			var num = $(this).parent().parent().prev().val();
			$("#num2").val(num);
			var check = confirm("정말로 구매를 확정하시겠습니까?");
			
			if(check){
				$("#buyForm").submit();
			}
			
		});
		
		$(".review").click(function(){
			var o_num = $(this).parent().parent().prev().val();
			var p_num1 = $(this).parent().parent().prev().prev().val();
			var check = confirm("정말로 리뷰를 작성하시겠습니까?");
			if(check){
				var query = {o_serialnum: o_num};
					
				$.ajax({
					url: "/mypage/searchReview",
					type: "get",
					data: query,
					success: function(data){
						if(data == 1){
							$("#num3").val(o_num);
							$("#p_num").val(p_num1);
							$("#reviewForm").attr({
								"action" : "/mypage/mypageReview",
								"method" : "get"
							});
							$("#reviewForm").submit();
						}else{
							alert("이미 리뷰를 작성했습니다.");
						}
					}
				});
				
				
			}
		});
		
	});
</script>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>

	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	
	<form id="deleteForm">
		<input type="hidden" id="status" name="o_status">
		<input type="hidden" id="num" name="o_serialnum"> 
	</form>
	
	<form id="buyForm" action="/mypage/buyOrder" method="post">
		<input type="hidden" id="num2" name="o_serialnum">	
	</form>
	
	<form id="reviewForm">
		<input type="hidden" id="p_num" name="p_num">
		<input type="hidden" id="num3" name="o_serialnum">
	</form>
	
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
			
		
			<c:choose>
				<c:when test="${not empty list }">
					<c:forEach var="d_list" items="#{list }">
						<c:if test="${d_list.o_status != '구매 확정' }">
						<input type="hidden" id="o_status" value="${d_list.o_status }"/>
						<input type="hidden" value="${d_list.o_serialnum }"/>
						<tr>
							<td>${d_list.o_image }</td>
							<td>${d_list.o_serialnum}</td>
							<td>${d_list.o_product }</td>
							<td>${d_list.o_date }</td>
							<td>${d_list.o_delivery }</td>
							<td>${d_list.o_quantity }</td>
							<td>${d_list.o_price }</td>
							<td>${d_list.o_totalprice }</td>
							<td>${d_list.o_paymethod }</td>
							<td>${d_list.o_status }</td>
							<td><input type="button" value="구매확정" class="buying"></td>
							<td><input type="button" value="주문 취소" class="cancel"></td>
						</tr>
						</c:if>
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
				<th>상품 단가 금액</th>
				<th>총 상품 금액</th>
				<th>결제 수단</th>
				<th>주문 처리 상태</th>
				<th>리뷰 작성</th>
			</tr>
			<c:choose>
				<c:when test="${not empty list }">
					<c:forEach var="d_list" items="#{list }">
						<c:if test="${d_list.o_status == '구매 확정' }">
						<input type="hidden" value="${d_list.p_num }"/>
						<input type="hidden" value="${d_list.o_serialnum }"/>
						<tr>
							<td>${d_list.o_image }</td>
							<td>${d_list.o_serialnum}</td>
							<td>${d_list.o_product }</td>
							<td>${d_list.o_date }</td>
							<td>${d_list.o_quantity }</td>
							<td>${d_list.o_price }</td>
							<td>${d_list.o_totalprice }</td>
							<td>${d_list.o_paymethod }</td>
							<td>${d_list.o_status }</td>
							<td><input type="button" value="리뷰 작성" class="review"></td>
						</tr>
						</c:if>
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
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>