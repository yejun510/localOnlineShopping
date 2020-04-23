<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#modify").click(function(){
			var check = confirm("정말로 수정하시겠습니까?");
			
			if($("#q_category").val() == '카테고리'){
				alert("카테고리를 지정해야합니다.");
			}else if(check){
					$("#updateForm").attr({
						"action" : "/board/updateBoard",
						"method" : "post"
					});
					
					$("#updateForm").submit();
				}
		});
		$("#cancel").click(function(){
			var check = confirm("정말로 취소하시겠습니까?");
			
			if(check){
				$("#cancelForm").submit();
			}
		});
	});
</script>
<title>주지육림 - 게시글 수정</title>
</head>
<body>
	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	
	<h3 align="center">게시글 수정</h3>
	
	<form id="cancelForm" action="/board/boardDetail" method="post">
	<input type="hidden" name="q_num" value="${detail.q_num }">
	<input type="hidden" name="q_view" value="${detail.q_view }">
	</form>
	
	<form id="updateForm" enctype="multipart/form-data">
	<input type="hidden" value="${detail.q_image1 }" name="q_image1">
	<input type="hidden" value="${detail.q_image2 }" name="q_image2">
	<input type="hidden" value="${detail.q_image3 }" name="q_image3">
	<input type="hidden" name="q_num" value="${detail.q_num }">
	<div align="center"><select name="q_category" id="q_category">
			<option>카테고리</option>
			<option <c:if test="${detail.q_category == '환불/반품' }">selected</c:if>>환불/반품</option>
			<option <c:if test="${detail.q_category == '기타' }">selected</c:if>>기타</option>
		</select>
		</div>
		<table border="0" align="center">
			<tr>
				<td align="center" >제목 :<input type="text" value="${detail.q_title}" name="q_title"></td>
			</tr>
			<tr>
				<td align="center" >작성자 : ${detail.q_writer } 등록일 : ${detail.q_date }</td>
			<tr>
			<tr>
				<td align="center"><input type="file" name="file1">
							   <input type="file" name="file2">
							   <input type="file" name="file3"></td>
			</tr>
			<tr>
				<td align="center" ><textarea rows="20" cols="50" name="q_content">${detail.q_content }</textarea>
			</tr>
			<tr>
				<td align="center" >비밀번호 : <input type="password" value="${detail.q_passwd }" name="q_passwd"></td>
			<tr>
				<td align="center" ><input type="button" id="modify" value="수정"><input type="button" value="취소" id="cancel"></td>
			</tr>
		</table>
	</form>
	
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>