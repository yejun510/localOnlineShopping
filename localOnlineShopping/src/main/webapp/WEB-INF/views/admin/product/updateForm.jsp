<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정 화면</title>
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/product.css" />
	
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#productUpdateBtn").click(function(){
			// 입력값 체크
			if(!chkSubmit($('#p_name'),"상품명을")) return;
			else if(!chkSubmit($('#p_price'),"상품가격을")) return;
			else if(!chkSubmit($('#p_weight'),"중량을")) return;
			else if(!chkSubmit($('#p_detail'),"상세설명을")) return;
			else {
				$("#p_registForm").attr({
					"method" : "POST",
					"action" : "/admin/product/productUpdate.do"
				});
				$("#p_registForm").submit();
			}
		});
		
		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#productListBtn").click(function(){
			location.href = "/admin/product/productList.do";
		});
	});
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit"><h3>상품 정보 수정</h3></div>
		
		<div class="contentTB">
			<form id="p_registForm" name="p_registForm" enctype="multipart/form-data">
				<input type="hidden" id="p_num" name="p_num" value="${updateData.p_num}" />
				<input type="hidden" id="p_file" name="p_file" value="${updateData.p_file}" />
				<input type="hidden" id="page" name="page" value="${param.page}" />
				<input type="hidden" id="pageSize" name="pageSize" value="${param.pageSize}" />
				<table>
					<colgroup>
						<col width="25%" />
						<col width="75%" />
					</colgroup>
					<tr>
						<td class="ac">상품명</td>
						<td><input type="text" name="p_name" id="p_name" value="${updateData.p_name}" ></td>
					</tr>
					<tr>
						<td class="ac">상품가격</td>
						<td><input type="text" name="p_price" id="p_price" value="${updateData.p_price}"></td>
					</tr>
					<tr>
						<td class="ac">중량</td>
						<td><input type="text" name="p_weight" id="p_weight" value="${updateData.p_weight}"></td>
					</tr>
					<tr>
						<td class="ac">상품 이미지</td>
						<td><input type="file" name="file" id="file">
						<label>이미지파일명 : ${updateData.p_file}</label>
						<img src="/uploadStorage/product/${updateData.p_file}" width="100px" height="100px" style="cursor: pointer;" onclick="doImgPop('/uploadStorage/product/${updateData.p_file}')">
						</td>
					</tr>
					<tr>
						<td class="ac">상세설명</td>
						<td><textarea name="p_detail" id="p_detail">${updateData.p_detail}</textarea></td>
					</tr>
				</table>
			</form>
		</div>
		
		<div class="contentBtn">
			<input type="button" value="수정" id="productUpdateBtn">
			<input type="button" value="취소" id="productListBtn">
		</div>
	</div>
</body>
</html>