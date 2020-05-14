<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		/*등록 버튼 클릭 시 처리 이벤트*/
		$("#noticeInsertBtn").click(function() {
			//입력값 체크
			if (!chkSubmit($('#n_title'), "공지사항 제목을"))
				return;
			else if (!chkSubmit($('#n_writer'), "작성자명을"))
				return;
			else if (!chkSubmit($('#n_content'), "공지사항 내용을"))
				return;
			else {
				$("#n_writeForm").attr({
					"method" : "POST",
					"action" : "/admin/notice/noticeInsert.do"
				});
				$("#n_writeForm").submit();
			}
		});

		/*취소 버튼 클릭 시 처리 이벤트*/
		$("#noticeListBtn").click(function() {
			location.href = "/admin/notice/noticeList.do";
		});
	});
</script>
<title>공지사항 등록 페이지</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h3 class="page-header" align="center">공지사항 등록 페이지</h3>
				</div>
				<div class="row">
					<div class="col-lg-12"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" align="center">공지사항</div>
					<div class="panel-body">
						<form id="n_writeForm" name="n_writeForm" action="/admin/notice/noticeWrite.do" method="post" enctype="multipart/form-data">
							<div class="row form-group">
								<label class="col-lg-2">제목</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="n_title" name="n_title" min="1" max="3" placeholder="제목을 입력하세요.">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2">작성자</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="n_writer" name="n_writer" min="1" max="3" value="주지육림 관리자">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2">내용</label>
								<div class="col-lg-8">
									<textarea class="form-control" id="n_content" name="n_content" placeholder="내용을 입력하세요."></textarea>
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2">첨부 이미지</label>
								<div class="col-lg-8">
									<input type="file" name="file1" id="file1">
									<input type="file" name="file2" id="file2">
									<input type="file" name="file3" id="file3">
								</div>
							</div>
						</form>
						<div class="contentBtn" align="center">
							<input type="button" value="등록" class="btn btn-outline btn-info"
								id="noticeInsertBtn"> <input type="button" value="취소"
								class="btn btn-outline btn-primary" id="noticeListBtn">
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>