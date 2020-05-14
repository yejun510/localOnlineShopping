<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style type="text/css">
	.boardH3{
		font-family: 'Nanum Brush Script', cursive;
	}
	#q_category{
		width: 120px;
		font-family: 'Nanum Brush Script', cursive;
	}
	#q_passwd{
		width: 200px;
	}
	.updateTable{
		font-family: 'Nanum Brush Script', cursive;
	}
	#logreg-forms{
    width:412px;
    margin:10vh auto;
    background-color:#f3f3f3;
    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
}
#logreg-forms form {
    width: 100%;
    max-width: 410px;
    padding: 15px;
    margin: auto;
}
#logreg-forms .form-control {
    position: relative;
    box-sizing: border-box;
    height: auto;
    padding: 5px;
    font-size: 15px;
}
#logreg-forms .form-control:focus { z-index: 2; }


#logreg-forms{
	width: 970px;
	
}
#includeAside{
		float: left;
	}
	#boardPage{
		text-decoration: underline;
		font-size: 20px;
	}
	#logreg-forms{
	margin-top: 30px;
}
	
</style>
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
		
		$("#file1").on("change",handleImgFileSelect1);
		$("#file2").on("change",handleImgFileSelect2);
		$("#file3").on("change",handleImgFileSelect3);
		
		$("#file1").change(function(){
			$("#image1").remove();
		});
		$("#file2").change(function(){
			$("#image2").remove();
		});
		$("#file3").change(function(){
			$("#image3").remove();
		});
	});
	
	function handleImgFileSelect1(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다");
				return;
			}
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#file1_1").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	function handleImgFileSelect2(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다");
				return;
			}
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#file2_1").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	function handleImgFileSelect3(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다");
				return;
			}
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#file3_1").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
<title>주지육림 - 게시글 수정</title>
</head>
<body>
	<div id="includeAside" class="col-md-1">
		<jsp:include page="../template/client/aside1.jsp"/>
	</div>
	
	<div class="col-md-1"></div>
	
	<form id="cancelForm" action="/board/boardDetail" method="post">
	<input type="hidden" name="q_num" value="${detail.q_num }">
	<input type="hidden" name="q_view" value="${detail.q_view }">
	</form>
	
	<form id="updateForm" enctype="multipart/form-data">
	<input type="hidden" value="${detail.q_image1 }" name="q_image1">
	<input type="hidden" value="${detail.q_image2 }" name="q_image2">
	<input type="hidden" value="${detail.q_image3 }" name="q_image3">
	<input type="hidden" name="q_num" value="${detail.q_num }">
	<div id="logreg-forms" class="col-md-5">
	<h3 align="center" class="boardH3">게시글 수정</h3>
	<br>
	<div align="center"><select name="q_category" id="q_category" class="form-control">
			<option>카테고리</option>
			<option <c:if test="${detail.q_category == '환불/반품' }">selected</c:if>>환불/반품</option>
			<option <c:if test="${detail.q_category == '기타' }">selected</c:if>>기타</option>
		</select>
		</div><br>
		<table border="0" align="center" class="updateTable">
			<tr>
				<td align="center" ><div class="form-inline">제목 :<input type="text" value="${detail.q_title}" name="q_title" class="form-control"></div></td>
			</tr>
			<tr>
				<td align="center" >작성자 : ${detail.q_writer } 등록일 : ${detail.q_date }</td>
			<tr>
			<tr>
				<td align="center"><br><input type="file" name="file1" id="file1">
						<c:if test="${detail.q_image1 != null }">첨부파일1 : ${detail.q_image1 }</c:if>
									   <input type="file" name="file2" id="file2">
						<c:if test="${detail.q_image2 != null }">첨부파일2 : ${detail.q_image2 }</c:if>
									   <input type="file" name="file3" id="file3">
						<c:if test="${detail.q_image3 != null }"> 첨부파일3 : ${detail.q_image3 }</c:if><br></td>
			</tr>
			
			<tr>
				<td align="center"><br><img id="file1_1" width="100px" height="100px" src="/uploadStorage/board/${detail.q_image1}"><img id="file2_1" width="100px" height="100px" src="/uploadStorage/board/${detail.q_image2}"><img id="file3_1" width="100px" height="100px" src="/uploadStorage/board/${detail.q_image3}"></td>
			</tr>
			<tr>
				<td align="center" ><br><textarea rows="20" cols="60" name="q_content" class="form-control">${detail.q_content }</textarea>
			</tr>
			<tr>
				<td align="center" ><br><div class="form-inline">비밀번호 : <input type="password" value="${detail.q_passwd }" name="q_passwd" class="form-control"></div><br></td>
			<tr>
				<td align="center" ><input type="button" id="modify" value="수정" class="btn btn-success">&nbsp;<input type="button" value="취소" id="cancel" class="btn btn-warning"></td>
			</tr>
		</table>
		<br>
		</div>
	</form>
	
	
</body>
</html>