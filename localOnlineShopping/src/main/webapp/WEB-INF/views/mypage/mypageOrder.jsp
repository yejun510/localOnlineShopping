<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.btn { font-family: 'Nanum Brush Script', cursive;}
  
.btn:hover{color:#fff;}

.hover1:hover{ box-shadow: 100px 0 0 0 rgba(0,0,0,0.5) inset; } 
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		if(${listBtn == '1'}){
			$("#order-contain").hide();
			$("#confirm").attr("value","주문내역");
		}else{
			$("#order-contain").show();
			$("#confirm-contain").hide();
			$("#confirm").attr("value","구매내역");
		}
		$("#confirm").click(function(){
			if($("#confirm").attr("value") == '구매내역'){
				$("#confirm-contain").show();
				$("#order-contain").hide();
				$("#listBtn").val('1');
				goPage(1);
			}else{
				$("#order-contain").show();
				$("#confirm-contain").hide();
				$("#listBtn").val('0');
				goPage(1);
			}
		});
		
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
			var status = $(this).parent().parent().prev().prev().val();
			var num = $(this).parent().parent().prev().val();
			$("#status").attr("value", status);
			$("#num2").val(num);
			if($("#status").val() != '입금 전'){
				var check = confirm("정말로 구매를 확정하시겠습니까?");
				if(check){
					$("#buyForm").submit();
				}
			}else{
				alert("입금 전 상태에서는 구매를 확정할 수 없습니다.")
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
	function goPage(page){
		$("#page").val(page);
		$("#page2").val(page);
		$("#pageForm").attr({
			"method":"get",
			"action":"/mypage/mypageOrder"
		});
		$("#pageForm").submit();
	}
</script>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>

	
	<form id="pageForm">
		<input type="hidden" id="page" name="page" value="${dvo.page }">
		<input type="hidden" id="page2" name="page2" value="${page2 }">
		<input type="hidden" id="listBtn" name="listBtn" value="${listBtn }">
	</form>
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
	
	<div style="border: 1px solid" id="order-contain">
	<h3 align="center">주문 내역</h3>
		<table align="center" class="table table-striped table-bordered">
			<tr>
				<th>상품 이미지</th>
				<th>주문 번호</th>
				<th>상품명</th>
				<th>주문 날짜</th>
				<th>배송희망 날짜</th>
				<th>배송 주소</th>
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
						
						<input type="hidden" id="o_status" value="${d_list.o_status }"/>
						<input type="hidden" value="${d_list.o_serialnum }"/>
						<tr>
							<td><img src="/uploadStorage/product/${d_list.o_image }" width="100px" height="100px"></td>
							<td>${d_list.o_num}</td>
							<td>${d_list.o_product }</td>
							<td>${d_list.o_date }</td>
							<td>${d_list.o_delivery }</td>
							<td>${d_list.o_address }</td>
							<td>${d_list.o_quantity }</td>
							<td>${d_list.o_price }</td>
							<td>${d_list.o_totalprice }</td>
							<td>${d_list.o_paymethod }</td>
							<td>${d_list.o_status }</td>
							<td><input type="button" value="구매확정" class="buying btn hover1 btn-default"></td>
							<td><input type="button" value="주문 취소" class="cancel btn hover1 btn-default"></td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="12">주문 하신 상품이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
		</table>
		<div align="center">
			<tag:paging page="${param.page }" total="${total }" list_size="5"/>
		</div>
	</div>
		<br><br>
	<input type="button" id="confirm" value="구매확정 내역" class="btn btn-success">
		<br><br>
	<div style="border: 1px solid" id="confirm-contain">
	<h3 align="center">구매확정 내역</h3>
		<table align="center" class="table table-striped table-bordered">
			<tr>
				<th>상품 이미지</th>
				<th>주문 번호</th>
				<th>상품 명</th>
				<th>주문 날짜</th>
				<th>배송희망 날짜</th>
				<th>배송 주소</th>
				<th>수량</th>
				<th>상품 단가 금액</th>
				<th>총 상품 금액</th>
				<th>결제 수단</th>
				<th>주문 처리 상태</th>
				<th>리뷰 작성</th>
			</tr>
			<c:choose>
				<c:when test="${not empty list2 }">
					<c:forEach var="d_list" items="#{list2 }">
						<input type="hidden" value="${d_list.p_num }"/>
						<input type="hidden" value="${d_list.o_serialnum }"/>
						<tr>
							<td><img src="/uploadStorage/product/${d_list.o_image }" width="100px" height="100px">
							<input type="hidden" value="${d_list.o_confirm}"></td>
							<td>${d_list.o_num}</td>
							<td>${d_list.o_product }</td>
							<td>${d_list.o_date }</td>
							<td>${d_list.o_delivery }</td>
							<td>${d_list.o_address }</td>
							<td>${d_list.o_quantity }</td>
							<td>${d_list.o_price }</td>
							<td>${d_list.o_totalprice }</td>
							<td>${d_list.o_paymethod }</td>
							<td>${d_list.o_status }</td>
							<td><input type="button" value="리뷰 작성" class="review btn hover1 btn-default"></td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="12">주문 하신 상품이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
		</table>
		<div align="center">
			<tag:paging page="${page2 }" total="${total2 }" list_size="5"/>
		</div>
	</div>
	
</body>
</html>