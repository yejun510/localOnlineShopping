<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소고기 상품 상세보기</title>
<style type="text/css">
	#includeAside{
		float: left;
	}
	
	.table{
		width: 500px;
	}
	#detailTable{
		margin-top: 100px;
	}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var sell_price;

	var amount;


	function add() {
		hm = document.form.amount;

		sum = document.form.sum;

		hm.value++;

		var all = $("#amount").val() * $("#price").val();

		sum.value = all;

	}

	function del() {
		hm = document.form.amount;

		sum = document.form.sum;

		if (hm.value > 1) {
			hm.value--;

			var all = $("#amount").val() * $("#price").val();

			sum.value = all;

		}

	}

	function change() {
		hm = document.form.amount;

		sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;

		}

		var all = $("#amount").val() * $("#price").val();

	}

	$(function() {
		
		$(".modify").click(function(){
			$("#r_num").val($(this).parent().parent().prev().prev().prev().prev().attr("data-num"));
			var check = confirm("정말 수정하시겠습니까?");
			if(check){
				$("#reviewForm").attr({
					"action" : "/review/reviewUpdateForm",
					"method" : "get"
				});
				$("#reviewForm").submit();
			}
		});
		
		$(".del").click(function(){
			$("#r_num").val($(this).parent().parent().prev().prev().prev().prev().attr("data-num"));
			$("#r_image").val($(this).parent().parent().prev().prev().prev().attr("data-num"));
			$("#p_num").val($(this).parent().parent().prev().prev().attr("data-num"));
			
			var check = confirm("정말 삭제하시겠습니까?");
			if(check){
				$("#reviewForm").attr({
					"action" : "/review/reviewDelete",
					"method" : "post"
				});
				$("#reviewForm").submit();
			}
		})

		$("#cartBtn").click(function() {
			 var qua = $("#amount").val();
			$("#c_quantity").val(qua);
			 var total = $("#sum").val();
			 $("#c_totalprice").val(total);
			$("#c_data").attr({
				"action" : "/cart/insert.do"

			});

			$("#c_data").submit();

		});
		

	});
	
	$(function () {
		
		$("#buyBtn").click(function () {
			
			
			 var qua = $("#amount").val();
			 	
				$("#p_quantity").val(qua);
				 var total = $("#sum").val();
				 $("#p_totalprice").val(total);
			$("#buy_data").attr({
				"action" : "/product/productBuying"
			});
			
			$("#buy_data").submit();

		});
	});
	$(function () {

		$("#fileImage").attr({
			src:"/uploadStorage/product/${beef.p_file}",
			width:"450px",
			height:"200px"
	});	
});
</script>

<style type="text/css">

</style>
</head>
<body>
	<div id="includeAside" class="col-md-1">
		<jsp:include page="../template/client/aside1.jsp"/>
	</div>
			
		<form name="buy_data" id="buy_data" method="post">
			<input type="hidden" name="p_num" value="${detail.p_num}" />
			<input type="hidden" name="p_name" value="${detail.p_name}" />
			<input type="hidden" name="p_price" value="${detail.p_price}" />
			<input type="hidden" name="p_weight" value="${detail.p_weight}" />
			<input type="hidden" name="p_image" value="${detail.p_file}" />
			<input type="hidden" name="p_quantity" id="p_quantity"/>
			<input type="hidden" name="p_totalprice" id="p_totalprice"/>
		</form>
		<form name="c_data" id="c_data" method="post">
			<input type="hidden" name="p_num" value="${detail.p_num}" />
			<input type="hidden" name="c_name" value="${detail.p_name}" />
			<input type="hidden" name="p_weight" value="${detail.p_weight}" />
			<input type="hidden" name="c_price" value="${detail.p_price}" />
			<input type="hidden" name="c_image" value="${detail.p_file}" />
			<input type="hidden" name="c_quantity" id="c_quantity"/>
			<input type="hidden" name="c_totalprice" id="c_totalprice"/>
		</form>

		<%--===============================상세 정보 보여주기 시작=================================== --%>
	
		<div class="col-md-3" ></div>
		<div class="col-md-4">
		<h3 align="center">상품 상세 보기</h3>
		<div align="center"><img src="/uploadStorage/product/${detail.p_file}" width="400px" height="400px"></div>
		<div align="center">${detail.p_detail }</div>
		
		
		
		
		
			<h3 align="center">상품 후기</h3>
			<form id="reviewForm">
				<input type="hidden" name="r_image" id="r_image"/>
				<input type="hidden" name="r_num" id="r_num">
				<input type="hidden" name="p_num" id="p_num">
			</form>
				<table class="table" align="center">
					<c:choose>
						<c:when test="${not empty reviewList}">
						<c:forEach var="review" items="${reviewList}" varStatus="status">
							<input type="hidden" value="${review.p_num }"/>
							<input type="hidden" value="${review.r_image }"/>
							<tr class="tac" data-num = "${review.r_num}">
								<td rowspan="4" height="40px" width="500px">${review.r_content}</td>
								<td>${review.r_writer}</td>
							</tr>
							<tr data-num = "${review.r_image }">
								<td>${review.r_satisfaction }</td>
							</tr>
							<tr data-num = "${review.p_num }">
								<td><c:if test="${review.r_image != null }"><img src="/uploadStorage/review/${review.r_image}" width="100px" height="100px"></c:if></td>
							</tr>
							<tr>
								<td>${review.r_date}</td>
							</tr>
							<c:if test="${id == review.r_writer }">
							<tr>
								<td colspan="2" align="right"><input type="button" class="modify btn btn-success" value="수정"><input type="button" class="del btn btn-danger" value="삭제"></td>
							</tr>
							</c:if>
					</c:forEach>
					</c:when>
				</c:choose>
				</table>
				</div>
				
				<div class="col-md-4" align="right" id="detailTable">
			<table border="1">
				<tbody>
					<tr>
						<td>상품명</td>
						<td>${detail.p_name}</td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td>${detail.p_price}</td>
					</tr>
					<tr>
						<td>중량</td>
						<td>${detail.p_weight}</td>
					</tr>
					<tr>
						<td>등급</td>
						<td>${detail.p_grade}</td>
					</tr>
					<tr>
						<td>이력번호</td>
						<td>${detail.p_history}</td>
					</tr>
					<tr>
						<td>원산지</td>
						<td>${detail.p_origin}</td>
					</tr>
				</tbody>
			</table>
			<form id="form" method="get" name="form">
				<br>
				<table>
					<tr>
						<td>수량 :<input type=hidden name="sell_price"
							value="${detail.p_price}" id="price">
							<input type="text" name="amount" value="1" size="3" onchange="change();" id="amount">
							<input type="button" value=" + " onclick="add();">
							<input type="button" value=" - " onclick="del();"><br>
							금액 :<input type="text" id="sum" name="sum" size="11" value="${detail.p_price }" readonly>원
						</td>
					</tr>
				</table>
				<%--============================ 장바구니,바로구매버튼 추가 ==================================--%>
					<br>
				<c:if test="${id != null }">
				<table id="productBeefBtn">
					<tr>
						<td><input type="button" value="장바구니" id="cartBtn" class="btn btn-default"> <input
							type="button" value="바로구매" id="buyBtn" class="btn btn-default"></td>
					</tr>
				</table>
				</c:if>
			</form>
		</div>
		
</body>
</html>