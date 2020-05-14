<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<style type="text/css">
.boardH3 {
	font-family: 'Nanum Brush Script', cursive;
}

#q_category {
	width: 120px;
	font-family: 'Nanum Brush Script', cursive;
}

#q_passwd {
	width: 200px;
}

.writeTable {
	font-family: 'Nanum Brush Script', cursive;
}

#logreg-forms {
	width: 412px;
	margin: 10vh auto;
	background-color: #f3f3f3;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
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

#logreg-forms .form-control:focus {
	z-index: 2;
}

#logreg-forms {
	width: 970px;
}

#includeAside {
	float: left;
}

#boardPage {
	text-decoration: underline;
	font-size: 20px;
}
#logreg-forms{
	margin-top: 30px;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#write").click(
				function() {
					var check = confirm("정말로 작성하시겠습니까?");

					if (check) {
						if ($("#q_category").val() == '카테고리') {
							alert("카테고리를 지정해주세요.");
						} else if ($("#q_title").val().length < 1
								|| $("#q_content").val().length < 1
								|| $("#q_passwd").val().length < 1) {
							alert("입력하지 않은 항목이 있습니다.");
						} else {
							$("#writeForm").attr({
								"action" : "/board/insertBoard",
								"method" : "post"
							});
							$("#writeForm").submit();
						}
					}
				});

		$("#cancel").click(function() {
			location.href = "/board/boardList";
		});

		$("#file1").on("change", handleImgFileSelect1);
		$("#file2").on("change", handleImgFileSelect2);
		$("#file3").on("change", handleImgFileSelect3);
	});

	function handleImgFileSelect1(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("이미지 확장자만 가능합니다");
				return;
			}
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#file1_1").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

	function handleImgFileSelect2(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("이미지 확장자만 가능합니다");
				return;
			}
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#file2_1").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

	function handleImgFileSelect3(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("이미지 확장자만 가능합니다");
				return;
			}
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#file3_1").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
<title>주지육림-문의 게시글 작성</title>
</head>
<body>
	<div id="includeAside" class="col-md-1">
		<jsp:include page="../template/client/aside1.jsp" />
	</div>
	

	
	
	<div class="col-md-1"></div>
	<div id="logreg-forms" class="col-md-1">
	<h3 align="center" class="boardH3">게시글 작성하기</h3>
		<form id="writeForm" enctype="multipart/form-data">
			<div align="center">
				<select name="q_category" id="q_category" class="form-control">
					<option>카테고리</option>
					<option>환불/반품</option>
					<option>기타</option>
				</select>
			</div>
			<br>
			<table border="0" align="center" class="writeTable">
				<tr>
					<td align="center"><div class="form-inline">
							제목 : <input type="text" name="q_title" id="q_title"
								class="form-control">
						</div></td>
				</tr>

				<tr>
					<td align="center">작성자 : ${id }<br></td>
				</tr>

				<tr>
					<td><br>
					<input type="file" name="file1" id="file1"><input
						type="file" name="file2" id="file2"><input type="file"
						name="file3" id="file3"><br></td>
				</tr>

				<tr>
					<td align="center"><img id="file1_1" width="100px"
						height="100px"><img id="file2_1" width="100px"
						height="100px"><img id="file3_1" width="100px"
						height="100px"></td>
				</tr>

				<tr>
					<td align="center"><textarea rows="20" cols="60"
							name="q_content" id="q_content" class="form-control"></textarea><br></td>
				</tr>
				<tr>
					<td align="center"><div class="form-inline">
							비밀번호 : <input type="password" name="q_passwd" id="q_passwd"
								class="form-control">
						</div></td>
				<tr>
				<tr>
					<td align="center"><br> <input type="button" value="작성"
						id="write" class="btn btn-success"> <input type="button"
						value="취소" id="cancel" class="btn btn-warning"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>