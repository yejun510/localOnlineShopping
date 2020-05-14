<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 화면</title>
<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/css/product.css" />
	
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		/* 등록 버튼 클릭 시 처리 이벤트 */
		$("#productRegistBtn").click(function(){
			// 입력값 체크
			if(!chkSubmit($('#p_num'),"상품번호를")) return;
			else if(!chkSubmit($('#p_name'),"상품명을")) return;
			else if(!chkSubmit($('#p_price'),"상품가격을")) return;
			else if(!chkSubmit($('#p_weight'),"중량을")) return;
			else if(!chkSubmit($('#p_detail'),"상세설명을")) return;
			else {
				if($('#file').val()!=""){
					if(!chkFile($('#file'))) return;
				}
				$("#p_registForm").attr({
					"method" : "POST",
					"action" : "/admin/product/productRegist.do"
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
		<div class="contentTit"><h3>상품 등록</h3></div>
		
		<div class="contentTB">
			<form id="p_registForm" name="p_registForm" enctype="multipart/form-data">
				<table id="productRegist">
					<colgroup>
						<col width="17%" />
						<col width="83%" />
					</colgroup>
					<tr>
						<td class="ac">상품명</td>
						<td><input type="text" name="p_name" id="p_name" placeholder="상품명 입력"></td>
					</tr>
					<tr>
						<td class="ac">상품번호</td>
						<td><input type="text" name="p_num" id="p_num" placeholder="상품번호 입력: 소고기(100번대),돼지고기(200번대)"></td>
					</tr>
					<tr>
						<td class="ac">상품가격</td>
						<td><input type="text" name="p_price" id="p_price" placeholder="상품가격 입력"></td>
					</tr>
					<tr>
						<td class="ac">중량</td>
						<td><input type="text" name="p_weight" id="p_weight" placeholder="중량 입력 : 숫자만 입력"></td>
					</tr>
					<tr>
						<td class="ac">상품 이미지</td>
						<td><input type="file" name="file" id="file"></td>
					</tr>
					<tr>
						<td class="ac">원산지</td>
						<td><input type="text" name="p_origin" id="p_origin" placeholder="국내산" value="국내산"></td>
					</tr>
					<tr>
						<td class="ac">등급</td>
						<td><input type="text" name="p_grade" id="p_grade" placeholder="1등급" value="1등급"></td>
					</tr>
					<tr>
						<td class="ac">축산물 이력번호</td>
						<td><input type="text" name="p_history" id="p_history" placeholder="이력번호 표시제품임" value="이력번호 표시제품임"></td>
					</tr>
					<tr>
						<td class="ac">상세설명</td>
						<td><textarea name="p_detail" id="p_detail"></textarea> </td>
					</tr>
				</table>
			</form>
		</div>
		
		<div class="contentBtn">
			<input type="button" value="저장" class="but" id="productRegistBtn" class="btn btn-outline btn-primary">
			<input type="button" value="취소" class="but" id="productListBtn" class="btn btn-outline btn-info">
		</div>
	</div>
</body>
</html>