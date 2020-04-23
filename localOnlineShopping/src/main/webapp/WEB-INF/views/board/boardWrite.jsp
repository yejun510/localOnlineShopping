<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#write").click(function(){
			var check = confirm("정말로 작성하시겠습니까?");
			
			 if(check){
				 if($("#q_category").val() == '카테고리'){
						alert("카테고리를 지정해주세요.");
					}else if($("#q_title").val().length<1 || $("#q_content").val().length<1 ||$("#q_passwd").val().length<1){
						alert("입력하지 않은 항목이 있습니다.");	
					}else{
						$("#writeForm").attr({
							"action" : "/board/insertBoard",
							"method" : "post"
						});
						$("#writeForm").submit();
				}
			 }
		});
		
		$("#cancel").click(function(){
			location.href = "/board/boardList";
		});
		
	});
</script>
<title>주지육림-문의 게시글 작성</title>
</head>
<body>
	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
		
	
	<h3 align="center">게시글 상세 보기</h3>	
	<form id="writeForm" enctype="multipart/form-data">
	<div align="center"><select name="q_category" id="q_category">
			<option>카테고리</option>
			<option>환불/반품</option>
			<option>기타</option>
		</select>
		</div>
		<table border="0" align="center">
			<tr>
				<td align="center">제목 : <input type="text" name="q_title" id="q_title"></td>
			</tr>
			
			<tr>
				<td align="center">작성자 : ${id }<br></td>
			</tr>
			
			<tr>
				<td><input type="file" name="file1"><input type="file" name="file2"><input type="file" name="file3"></td>
			</tr>
			
			<tr>
				<td align="center"><textarea rows="20" cols="50" name="q_content" id="q_content"></textarea>
			</tr>
			<tr>
				<td align="center">비밀번호 : <input type="password" name="q_passwd" id="q_passwd"></td>
			<tr>
			<tr>
				<td align="center">
				<input type="button" value="작성" id="write">
				<input type="button" value="취소" id="cancel"></td>
			</tr>
		</table>		
	</form>
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>