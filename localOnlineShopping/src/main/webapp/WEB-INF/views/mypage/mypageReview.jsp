<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style type="text/css">
.reviewTable{
	font-family: 'Nanum Brush Script', cursive;
}
h3{
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

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#cancel").click(function(){
			var check = confirm("정말로 취소하시겠습니까?");
			
			if(check){
					location.href = "/mypage/mypageOrder";
				}
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
		
		$("#r_file").on("change",handleImgFileSelect);
	});
	function handleImgFileSelect(e){
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
				$("#img").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
<title>주지육림-리뷰작성</title>
</head>
<body>
	
	
	<h3 align="center">리뷰작성 페이지</h3>
	<div id="logreg-forms">
	<form id="reviewForm" enctype="multipart/form-data">
	<input type="hidden" name="o_serialnum" id="o_serialnum" value="${review.o_serialnum }"/>
	<input type="hidden" name="p_num" id="p_num" value="${review.p_num }"/>
	
		<table align="center" class="reviewTable">
			<tr>
				<th align="center">만족도</th>
				<td><select id="r_satisfaction" name="r_satisfaction" class="form-control">
						<option>만족도를 선택해주세요</option>
						<option value="매우만족">매우만족</option>
						<option value="만족">만족</option>
						<option value="보통">보통</option>
						<option value="불만">불만</option>
						<option value="매우불만">매우불만</option>
						</select></td>
			</tr>
			<tr>
				<td colspan="2"><br><textarea rows="20" cols="60" id="r_content" name="r_content" class="form-control"></textarea><br></td>
			</tr>
			<tr>
				<td><input type="file" name="r_file" id="r_file"></td>
				<td><img id="img" width="100px" height="100px"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><br><input type="button" value="작성완료" id="regist" class="btn btn-success">&nbsp;<input type="button" value="취소" id="cancel" class="btn btn-warning">	
		</table>
	
	</form>
	</div>
	
</body>
</html>