<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세 보기</title>

<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/css/product.css" />
	
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
var goUrl = ""; //수정버튼과 삭제버튼을 구별하기 위한 변수
	$(function(){
		
		/* 첨부파일 이미지 보여주기 위한 속성 추가 */
		var file = "<c:out value='${detail.p_file}' />";
		if(file !=""){
			$("#fileImage").attr({
				src:"/uploadStorage/product/${detail.p_file}", 
				width:"75%",
				height:"75%"
			});
		}
		
		/* 수정버튼 클릭 시 처리 이벤트 */
		$("#updateFormBtn").click(function(){
			var chkConfirm = confirm("수정하시겠습니까?");
			if(chkConfirm){
			goUrl = "/admin/product/updateForm.do";
			$("#f_data").attr("action",goUrl);
			$("#f_data").submit();
			}
		});
		
		/* 삭제버튼 클릭 시 처리 이벤트 */
		$("#productDeleteBtn").click(function(){
			var chkConfirm = confirm("삭제하시겠습니까?");
			if(chkConfirm){
			goUrl = "/admin/product/productDelete.do";
			$("#f_data").attr("action",goUrl);
			$("#f_data").submit();
			}
		});
		
		/* 목록버튼 클릭 시 처리 이벤트 */
		$("#productListBtn").click(function(){
			$("#f_data").attr("action","/admin/product/productList.do");
			$("#f_data").submit();
		});
	});
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit"><h3>상품 상세정보</h3></div>
		<form name="f_data" id="f_data" method="GET">
			<input type="hidden" name="p_name" value="${detail.p_name}" />
			<input type="hidden" name="page" value="${detail.page}">
			<input type="hidden" name="pageSize" value="${detail.pageSize}">
		</form>
		
		<%-- 상세정보 보여주기 --%>
		<div class="contentTB">
			<table>
				<colgroup>
					<col width="25%" />
					<col width="75%" />
					
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">상품명</td>
						<td>${detail.p_name}</td>
					</tr>
					<tr>
						<td class="ac">상품번호</td>
						<td>${detail.p_num}</td>
					</tr>
					<tr>
						<td class="ac">상품가격</td>
						<td>${detail.p_price}</td>
					</tr>
					<tr>
						<td class="ac">중량</td>
						<td>${detail.p_weight}</td>
					</tr>
					<c:if test="${detail.p_file !=''}">
					<tr>
						<td class="ac vm">상품 이미지</td>
						<td>
						<img id="fileImage"></td>
					</tr>
					</c:if>
					<tr>
						<td class="ac">원산지</td>
						<td>${detail.p_origin}</td>
					</tr>
					<tr>
						<td class="ac">등급</td>
						<td>${detail.p_grade}</td>
					</tr>
					<tr>
						<td class="ac">축산물 이력번호</td>
						<td>${detail.p_history}</td>
					</tr>
					<tr>
						<td class="ac">상세설명</td>
						<td>${detail.p_detail}</td>
					</tr>
				</tbody>
			</table>
			<div>
				<input type="button" value="확인" id="productListBtn">
				<input type="button" value="수정" id="updateFormBtn">
				<input type="button" value="삭제" id="productDeleteBtn">
			</div>
		</div>
		<%-- 상세정보 보여주기 종료 --%>
	</div>
</body>
</html>