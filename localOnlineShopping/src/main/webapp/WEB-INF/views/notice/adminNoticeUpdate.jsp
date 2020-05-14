<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		/*수정 버튼 클릭 시 수정후 상세페이지로 이동 처리 이벤트*/
		$("#noticeUpdateBtn").click(function() {
			//입력값 체크
			if (!chkSubmit($('#n_title'), "제목을 "))
				return;
			else if (!chkSubmit($('#n_writer'), "작성자명을 "))
				return;
			else if (!chkSubmit($('#n_content'), "작성할 내용을 "))
				return;
			else {
				alert("수정 완료")
				$("#n_writeForm").attr({
					"method" : "GET",
					"action" : "/notice/noticeUpdate.do"
				});
				$("#n_writeForm").submit();
			}
		});

		/*취소 버튼 클릭 시 상세 페이지로 이동 처리 이벤트 */
		$("#noticeDetailBtn").click(function() {
			console.log("글번호:" + n_num);
			//상세 페이지로 되돌아 가기 위한 처리 이벤트
			$("#n_writeForm").attr({
				"method" : "GET",
				"action" : "/notice/noticeDetail.do"
			});
			$("#n_writeForm").submit();
		});
	});
</script>
<title>공지사항 수정 페이지</title>
</head>
<body>
	<form id="n_writeForm" name="n_writeForm">
		<input type="hidden" id="n_num" name="n_num"
			value="${updateData.n_num }" />
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="col-lg-8">
					<!--게시판 넓이 -->
					<div class="col-lg-12">
						<h1 class="page-header" align="center">공지사항 수정 페이지</h1>
					</div>
					<div class="row">
						<div class="col-lg-12"></div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" align="center">공지사항</div>
						<div class="panel-body">
							<div class="row form-group">
								<label class="col-lg-2">제목</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="n_title"
										value="${updateData.n_title}" name="n_title" min="1" max="3">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2">작성자</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="n_writer"
										value="${updateData.n_writer}" name="n_writer">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2">내용</label>
								<div class="col-lg-8">
									<textarea name="n_content" id="n_content" class="form-control">${updateData.n_content}</textarea>
								</div>
							</div>
							<div class="contentBtn" align="center">
								<input type="button" value="수정" class="btn btn-outline btn-info"
									id="noticeUpdateBtn"> <input type="button" value="취소"
									class="btn btn-outline btn-primary" id="noticeDetailBtn">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
