<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">
	#id{text-align: center;}
	
	#includeAside{
		float: left;
	}
</style>
<script type="text/javascript"
src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {

	   $("#all_buyBtn").click(function() {
	      location.href = "/cart/cartListBuying";
	   });

	   $("#chose_buyBtn").click(function(){
		   if($("input[name='seq']:checked").val() != null){
			      var resultString ="";
			      for (var i = 0 ; i < $('[name=seq]:checked').length; i++){
			    	  resultString += $('[name=seq]:checked:eq('+i+')').val() + ",";
			      }
			      location.href = "/cart/cartListBuying?seqList="+resultString;
		   }else{
			   alert("구매할 상품을 체크해 주세요");
		   }
		  });
	   
	   $("#del_btn").click(function(){
		   if($("input[name='seq']:checked").val() != null){
			      var resultString ="";
			      for (var i = 0 ; i < $('[name=seq]:checked').length; i++){
			    	  resultString += $('[name=seq]:checked:eq('+i+')').val() + ",";
			      }
			      location.href = "/cart/cartDelete?seqList="+resultString;
		   }else{
			   alert("삭제할 상품을 체크해 주세요");
		   }
	   });
	});
</script>
</head>
<body>
	<c:set var="sum" value="0"/>
	<div id="includeAside" class="col-md-1">
		<jsp:include page="../template/client/aside1.jsp"/>
	</div>
	<h3 id="title">장바구니</h3>
	<div class="col-md-3"></div>
	<%-- ================ 리스트 시작 ================== --%>
	<div id="cartList" class="col-md-6">
	
	<form id="cartForm">
		<table summary="장바구니 리스트" class="table">
			<colgroup>
				<thead>
					<tr>
						<th>선택</th>
						<th>상품 이미지</th>
						<th>상품명</th>
						<th>장바구니추가일</th>
						<th>수량</th>
						<th>상품가격</th>
						<th>선택하신 상품의 총 가격</th>
					</tr>
				</thead>
				<tbody id="list">
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty cartList}">
					<c:forEach var="cart" items="${cartList}"
					varStatus="status">
						<tr class="tac"
						data-num = "${cart.c_num}">
							<td><input type="checkbox" name="seq"
							value="${cart.c_num}"></td>
							<td><img src="/uploadStorage/product/${cart.c_image}" width="100px" height="100px"></td>
							<td>${cart.c_name}</td>
							<td>${cart.c_date}</td>
							<td>${cart.c_quantity}</td>
							<td>${cart.c_price}</td>
							<td>${cart.c_totalprice}
								<c:set var="sum" value="${sum+cart.c_totalprice }"/></td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">장바구니에 등록된 상품이 없습니다.</td>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tr>
				<td>총 가격 : ${sum } </td>		
			</tr>
			<tr>
				<td colspan="9" align="right">
					<input type="button" value="전체상품구매" id="all_buyBtn" class="btn btn-default">
					<input type="button" value="선택상품구매" id="chose_buyBtn" class="btn btn-default">
					<input type="button" value="상품삭제" id="del_btn" class="btn btn-default">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>