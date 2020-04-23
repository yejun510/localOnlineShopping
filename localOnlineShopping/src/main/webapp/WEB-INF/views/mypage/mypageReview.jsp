<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#cancel").click(function(){
			location.href = "/mypage/mypageOrder";
		});
		
		$("#regist").click(function(){
			var check = confirm("정말로 작성하시겠습니까?");
			
			if(check){
				if($("#r_satisfaction").val() == '만족도를 선택해주세요'){
					alert("만족도를 선택해주세요");
				}else if($("#r_content").val() == null || $("#r_content").val() == ''){
					alert("내용을 입력해 주세요.");
				}else{
					$("#reviewForm").attr({
						"action" : "/review/writeReview" ,
						"method" : "post"
					});
					$("#reviewForm").submit();
				}
			}
		});
		
		
	});
</script>
<title>주지육림-리뷰작성</title>
</head>
<body>
	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	주문번호 ${review.o_serialnum } 상품 번호 ${review.p_num }
	<h3 align="center">리뷰작성 페이지</h3>
	<form id="reviewForm" enctype="multipart/form-data">
	<input type="hidden" name="o_serialnum" id="o_serialnum" value="${review.o_serialnum }"/>
	<input type="hidden" name="p_num" id="p_num" value="${review.p_num }"/>
	<fieldset>
		<table align="center">
			<tr>
				<th>만족도</th>
				<td><select id="r_satisfaction" name="r_satisfaction">
						<option>만족도를 선택해주세요</option>
						<option value="매우만족">매우만족</option>
						<option value="만족">만족</option>
						<option value="보통">보통</option>
						<option value="불만">불만</option>
						<option value="매우불만">매우불만</option>
						</select></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="20" cols="60" id="r_content" name="r_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="r_file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="작성완료" id="regist"><input type="button" value="취소" id="cancel">	
		</table>
	</fieldset>
	</form>
	
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>