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
		/*수정 버튼 클릭 시 처리 이벤트*/
		$("#noticeUpdateBtn").click(function() {
			var check = confirm("수정하시겠습니까?");
			
			if (check) {
				$("#data").submit();
			}
		});

		/*삭제 버튼 클릭 시 처리 이벤트 */
		$("#noticeDeleteBtn").click(function() {
			var check = confirm("삭제하시겠습니까?");
			
			if(check) {
				$("#data").attr({
					"action" : "/notice/noticeDelete.do"
				});
				$("#data").submit();
			}
		});

		/*목록 버튼 클릭 시 처리 이벤트 */
		$("#noticeListBtn").click(function() {
			location.href = "/notice/noticeList.do"
		});
	});
</script>
<title>공지사항 상세 페이지</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header" align="center">공지사항 상세 페이지</h1>
				</div>
				<form id="data" action="/notice/updateForm.do" method="get">
				<input type="hidden" name="n_num" value="${detail.n_num}">
				</form>
				<div class="row">
					<div class="col-lg-12"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" align="center">공지사항</div>
					<div class="panel-body">
						<div class="row form-group">
							<label class="col-lg-2">제목</label>
							<div class="col-lg-8">
								<p>${detail.n_title}</p>
							</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2">작성자</label>
							<div class="col-lg-2">
								<p>${detail.n_writer}</p>
							</div>
							<label class="col-lg-2">등록일</label>
							<div class="col-lg-2">
								<p>${detail.n_date}</p>
							</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2">내용</label>
							<div class="col-lg-8">
								<p>${detail.n_content}</p>
							</div>
						</div>
						<div class="contentBtn" align="center">
							<input type="button" value="수정" 
							class="btn btn-outline btn-info" id="noticeUpdateBtn"> 
								<input type="button" value="목록"
								class="btn btn-outline btn-primary" id="noticeListBtn">
							<input type="button" value="삭제"
								class="btn btn-outline btn-danger" id="noticeDeleteBtn">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
