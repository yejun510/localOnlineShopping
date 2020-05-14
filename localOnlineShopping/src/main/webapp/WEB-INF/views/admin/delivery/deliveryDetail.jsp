<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보 상세 보기</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/delivery.css" />

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		/* 목록버튼 클릭 시 처리 이벤트 */
		$("#deliveryListBtn").click(function() {
			location.href="/admin/delivery/deliveryList.do"
		});

		/* 수정버튼 클릭 시 처리 이벤트 */
		$("#updateBtn").click(
				function() {
					var chkConfirm = confirm("수정하시겠습니까?");
					$("#status").val($("#o_status").val());

					if (chkConfirm) {
						$("#f_data").attr("action", "/admin/delivery/deliveryupdate.do");
						$("#f_data").submit();
					}
				});

	});
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>주문 상세 정보</h3>
		</div>
		<form name="f_data" id="f_data" method="GET">
			<input type="hidden" name="o_serialnum" value="${detail.o_serialnum}" />
			<input type="hidden" name="page" value="${data.page}"> 
			<input type="hidden" name="pageSize" value="${data.pageSize}">
			<input type="hidden" name="o_status" id="status" value="${data.o_status}"/>
		</form>

		<%-- 상세정보 보여주기 --%>
		<div class="contentTB">
			<table>
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tbody>
					<tr>
						<td colspan="4" align="left"><strong>주문 상세 정보</strong></td>
					</tr>
					<tr>
						<td><strong>주문번호</strong></td>
						<td>${detail.o_serialnum}</td>
						<td><strong>주문금액</strong></td>
						<td>${detail.o_totalprice}</td>
					</tr>
					<tr>
						<td><strong>주문일자</strong></td>
						<td>${detail.o_date}</td>
						<td><strong>상품</strong></td>
						<td>${detail.o_product}</td>
					</tr>
					<tr>
						<td><strong>결제방법</strong></td>
						<td>${detail.o_paymethod}</td>
						<td><strong>구매수량</strong></td>
						<td>${detail.o_quantity}</td>
					</tr>
					<tr>
						<td><strong>주문처리상태</strong></td>
						<td><select id="o_status">
								<option
									<c:if test="${detail.o_status == '주문접수' }">selected</c:if>>주문접수</option>
								<option
									<c:if test="${detail.o_status == '결제완료' }">selected</c:if>>결제완료</option>
								<option
									<c:if test="${detail.o_status == '배송준비중' }">selected</c:if>>배송준비중</option>
								<option
									<c:if test="${detail.o_status == '배송처리' }">selected</c:if>>배송처리</option>
								<option
									<c:if test="${detail.o_status == '배송완료' }">selected</c:if>>배송완료</option>
								<option
									<c:if test="${detail.o_status == '주문취소' }">selected</c:if>>주문취소</option>
								<option
									<c:if test="${detail.o_status == '환불처리' }">selected</c:if>>환불처리</option>
								<option
									<c:if test="${detail.o_status == '구매 확정' }">selected</c:if>>구매 확정</option>
						</select> <input type="button" value="수정" id="updateBtn" class="btn btn-outline btn-info" ></td>
						<td><strong>희망배송일</strong></td>
						<td>${detail.o_delivery}</td>
					</tr>

					<tr>
						<td colspan="4" align="left"><strong>주문자 정보</strong></td>
					</tr>
					<tr>
						<td><strong>주문자 ID</strong></td>
						<td colspan="3">${detail.id}</td>
					</tr>
					<tr>
						<td><strong>전화번호</strong></td>
						<td colspan="3">${detail.o_tel}</td>
					</tr>
					<tr>
						<td colspan="4" align="left"><strong>수취인 정보</strong></td>
					</tr>
					<tr>
						<td><strong>수취인명</strong></td>
						<td colspan="3">${detail.o_reciever}</td>
					</tr>
					<tr>
						<td><strong>배송지 연락처</strong></td>
						<td colspan="3">${detail.o_reciever_number}</td>
					</tr>
					<tr>
						<td><strong>배송지 주소</strong></td>
						<td colspan="3">${detail.o_address}</td>
					</tr>
				</tbody>
			</table>
			<div>
				<input type="button" value="확인" id="deliveryListBtn" class="btn btn-outline btn-primary">
			</div>
		</div>
		<%-- 상세정보 보여주기 종료 --%>
	</div>
</body>
</html>