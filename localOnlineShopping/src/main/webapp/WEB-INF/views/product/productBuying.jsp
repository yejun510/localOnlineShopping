<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매페이지</title>
<style type="text/css">
	
	.order-table{
		width: 1200px;
	}
	
	.reciver-table{
		width: 1000px;
	}
	
</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 주소 API -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	// 이메일주소 선택
	$(function() {
		$("input[name='s_address']").click(function(){
			$("#re_postalcode").val('')
			$("#re_postalcode").val($('input[name="s_address"]:checked').val());
		});
		
		

		

		$("#buyNow").click(
				
				function() {
					if($("#O_Name").val().length<1 || $("#first_add").val().length<1||$("#first_num").val().length<1||$("#orderMail1").val().length<1||
							$("#o_recieverName").val().length<1 || $("#re_postalcode").val().length<1 || $("#first_num2").val().length<1 || $("#str_email01").val().length<1){
						alert("입력하지 않은 정보가 있습니다.");
					}else{
					var check = confirm("구매하시겠습니까?");
					
					if(check){
					var paymethod = $("input[name='method']:checked").val();
					
					$("#paymethod").val(paymethod);
					$("#paymethod1").val(paymethod);
					
					$("#o_tel").val($("#first_num").val());
					$("#o_tel1").val($("#first_num").val());
					
					
					$("#o_address").val($("#re_postalcode").val());
					$("#o_address1").val($("#re_postalcode").val());
					
					var r_name = $("#o_recieverName").val();
					$("#o_reciever").val(r_name);
					$("#o_reciever1").val(r_name);

					$("#o_reciever_number").val($("#first_num2").val());
					$("#o_reciever_number1").val($("#first_num2").val());

					var d_date = $("#hopeDate").val();
					$("#o_delivery").val(d_date);
					$("#o_delivery1").val(d_date);

					
					 if(${not empty product_one} ){
						$("#o_data").attr({
							"action" : "/product/buyingInsert.do",
							"method" : "post"
						});
	 
						$("#o_data").submit(); 
					}else{
						
						$("#c_buy").attr({
							"action" : "/cart/insertCartBuying",
							"method" : "post"
						});
	
						$("#c_buy").submit();
					}
					}
					}
				});

		//우편번호 찾기 버튼
		$("#re_post")
				.click(
						function() {
							$("input[name='s_address']").attr("checked",false);
							$("#re_postalcode").val('');
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraAddr !== '') {
													extraAddr = ' ('
															+ extraAddr + ')';
												}
												// 조합된 참고항목을 해당 필드에 넣는다.

											} else {
												document
														.getElementById("re_add").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('re_postalcode').value = data.zonecode;
											document.getElementById("re_postalcode").value += "-"+addr;
											document.getElementById("re_postalcode").value += extraAddr;
											// 커서를 상세주소 필드로 이동한다.
											alert("상세주소가 있다면 이어서 입력해주세요");
											$("#re_postalcode").focus();
										}
									}).open();
						});//카카오 API 메소드 끝

	});
</script>
</head>
<body>
	<%-- ================ 리스트 시작 ================== --%>
	<c:set var="val" value="0"/>
	<form id="o_data">
		<input type="hidden" name="o_paymethod" id="paymethod">
		<input type="hidden" name="o_address" id="o_address"> 
		<input type="hidden" name="o_tel" id="o_tel"> 
		<input type="hidden" name="o_reciever" id="o_reciever"> 
		<input type="hidden" name="o_reciever_number" id="o_reciever_number">
		<input type="hidden" name="o_delivery" id="o_delivery"> 
		<input type="hidden" name="p_num" value="${product_one.p_num}">
		 <input type="hidden" name="o_quantity" value="${p_quantity}"> 
		<input type="hidden" name="o_totalprice" 
		value="${product_one.p_price * p_quantity}">
		<input type="hidden" name="o_price" value="${product_one.p_price}">
		<input type="hidden" name="o_product" value="${product_one.p_name}">
		<input type="hidden" name="o_image" value="${product_one.p_file}">
	</form>
	
	<form id="c_buy">
		<input type="hidden" name="o_paymethod" id="paymethod1">
		<input type="hidden" name="o_address" id="o_address1">
		<input type="hidden" name="o_tel" id="o_tel1">
		<input type="hidden" name="o_reciever" id="o_reciever1">
		<input type="hidden" name="o_reciever_number" id="o_reciever_number1">
		<input type="hidden" name="o_delivery" id="o_delivery1">
		<input type="hidden" name="seqList" value="${seqList }">
	</form>
	<form id="productForm">
		<div id="buyList">
			<table summary="상품구매페이지" class="table">
				<colgroup>
				<thead>
					<tr>
						<th class="order">상품번호</th>
						<th>상품명</th>
						<th>선택하신 수량</th>
						<th>상품가격</th>
						<th>상품총가격</th>
						<th>상품 이미지</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${not empty product }">
						<c:forEach var="product" items="${product }">
								<tr>
									<td>${product.p_num}</td>
									<td>${product.c_name}</td>
									<td>${product.c_quantity}</td>
									<td>${product.c_price}</td>
									<td>${product.c_totalprice}
										<c:set var="val" value="${val+product.c_totalprice }"/></td>
									<td><img src="/uploadStorage/product/${product.c_image}" width="100px" height="100px"></td>
								</tr>
							</c:forEach>
					</c:when>
					<c:when test="${not empty product_list }">
						<c:forEach var="pro" items="${product_list }">
						<tr>
							<td>${pro.p_num}</td>
							<td>${pro.c_name}</td>
							<td>${pro.c_quantity}</td>
							<td>${pro.c_price}</td>
							<td>${pro.c_totalprice}
								<c:set var="val" value="${val+pro.c_totalprice }"/></td>
							<td><img src="/uploadStorage/product/${pro.c_image}" width="100px" height="100px"></td>
						</tr>
						</c:forEach>
					</c:when>
					<c:when test="${not empty product_one }">
						<tr>
							<td>${product_one.p_num}</td>
							<td>${product_one.p_name}</td>
							<td>${p_quantity}</td>
							<td>${product_one.p_price}</td>
							<td>${product_one.p_price * p_quantity}
								<c:set var="val" value="${product_one.p_price * p_quantity}"/></td>
							<td><img src="/uploadStorage/product/${product_one.p_file}" width="100px" height="100px"></td>
						</tr>
					</c:when>
				</c:choose>
					<tr>
						<td colspan="6">상품 총 가격 : ${val }</td>
					</tr>
			</table>
		</div>
	</form>
	<form id="orderForm">
	
		<h3 align="center">주문정보</h3>
		<table class="table order-table" align="center">
			<colgroup>
			<col width="10%">
			<col width="50%">
			<col width="20%">
			<col width="20%">
			</colgroup>
			<!------------------------------ 주문자 폼 ------------------------------>
			<tr>
				<th style="width: 250pdx;">주문자 성함</th>
				<th>주소</th>
				<th>휴대전화</th>
				<th>이메일</th>

			</tr>
			<tr>
				<td><input type="text" id="O_Name" style="text-align: center; align-content: center;" value="${member.name }" class="form-control"></td>

				<td><input type="text" id="first_add" value="${member.address }" class="form-control">
					</td>
					
				<td><input type="text" id="first_num" value="${member.tel }" class="form-control">
					</td>
					
				<td><input type="text" id="orderMail1" value="${member.email }" class="form-control"></td>
			</tr>
		</table>
	</form>
	
	<h3 align="center">받는 사람 정보 </h3>
	<form id="recipientForm">
		<div align="center">
		<input type="radio" name="s_address" checked="checked" value="${member.address }">회원 주소  <input type="radio" name="s_address" value="${member.s_address1 }">배송지1  <input type="radio" name="s_address" value="${member.s_address2 }">배송지2  <input type="radio" name="s_address" value="${member.s_address3 }">배송지3 
		</div>
		<table border="1" align="center" class="table reciver-table">
		<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
			<tr>
				<!------------------------------ 수령자 폼 ------------------------------>
				<td>받으시는 분 </td>
				<td><input type="text" placeholder="받으시는 분 성함"
					id="o_recieverName" value="${member.name }" class="form-control">
				</td>
			</tr>
			<tr>	
				<td>주소</td>
				<td><input type="text" id="re_postalcode" value="${member.address }" class="form-control">
					<input type="button" value="주소찾기" id="re_post"></td>
			</tr>
			<tr>	
				<td>휴대전화</td>
				<td><input type="text" name="first_num2" id="first_num2" value="${member.tel }" class="form-control"></td>
			</tr>
			<tr>
				<td>이메일 </td>
				<td><input type="text" name="str_email01" id="str_email01" value="${member.email }" class="form-control"></td>
			</tr>
			<tr>
				<!-- 배송 희망날짜 -->
				<td>배송희망 날짜 </td>
				<td><input type="date" id="hopeDate"
					value="${minSimple }" min="${minSimple }" max="${maxSimple }" class="form-control"></td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td>
					<input type="radio" value="신용카드"  name="method" checked="checked"><label>신용카드</label>
					<input type="radio" value="계좌이체"  name="method"><label>계좌이체</label>
					<input type="radio" value="무통장 입금"  name="method"><label>무통장입금</label>
					
				</td>
			<tr>
				<td align="center"><input type="button" value="구매하기" id="buyNow">
				<input type="button" value="구매취소" id="buyCancel" onclick="history.back(-1);"></td>
			</tr>
		</table>
	</form>
</body>
</html>