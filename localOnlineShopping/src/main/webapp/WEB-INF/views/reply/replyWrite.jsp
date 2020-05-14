<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
</script>
<title>답변 댓글</title>
</head>
<body>
	<div>
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="col-lg-8">
					<!--게시판 넓이 -->
					<div class="col-lg-12">
						<h1 class="page-header" align="center">답변 댓글 등록 페이지</h1>
					</div>
					<div class="row">
						<div class="col-lg-12"></div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" align="center">답변 댓글</div>
						<div class="panel-body"></div>
						<div class="row form-group">
							<label class="col-lg-2">댓글 번호</label>
							<div class="col-lg-2">
								<p>${reply.a_num}</p>
							</div>
							<label class="col-lg-1">게시글 번호</label>
							<div class="col-lg-2">
								<p>${board.q_num}</p>
							</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2">작성자</label>
							<div class="col-lg-8">
								<p>${reply.a_name}</p>
							</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2">등록일</label>
							<div class="col-lg-8">
								<p>${reply.a_date}</p>
							</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2">이미지</label>
							<div class="col-lg-8">
								<p>${reply.a_image}</p>
							</div>
						</div>
						<div class="row form-group">
							<label class="col-lg-2">내용</label>
							<div class="col-lg-8">
								<p>${reply.a_content}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>