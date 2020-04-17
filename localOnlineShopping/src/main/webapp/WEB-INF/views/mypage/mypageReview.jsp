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
		
		
		
	});
</script>
<title>주지육림-리뷰작성</title>
</head>
<body>
	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	
	<a href="/review/a">여기</a>
	<h3 align="center">리뷰작성 페이지</h3>
	<form id="reviewForm" action="/review/writeReview" method="get">
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
				<td colspan="2"><input type="file" name="r_image" id="r_image"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="작성완료" id="regist"><input type="button" value="취소" id="cancel">	
		</table>
	</fieldset>
	</form>
	
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>