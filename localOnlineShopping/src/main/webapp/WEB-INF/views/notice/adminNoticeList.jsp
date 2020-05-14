<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
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
<script type="text/javascript">
	$(function() {
		/*등록 버튼 클릭시 처리 이벤트*/
		$("#regist").click(function() {
			location.href = "/notice/noticeWrite.do"
		});

		/*제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
		$(".goDetail").click(function() {
			var n_num = $(this).parents("tr").attr("data-num");
			$("#n_num").val(n_num);
			console.log("글번호 :" + n_num);
			//상세 페이지로 이동하기 위해 form추가 (id:detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/notice/noticeDetail.do"
			});
			$("#detailForm").submit();
		});

	});

	/*페이징 처리*/
	function goPage(page) {
		$("#page").val(page);

		$("#f_search").attr({
			"method" : "GET",
			"action" : "/notice/noticeList.do"
		});
		$("#f_search").submit();
	}
</script>
<title>공지사항 메인 페이지</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이  -->
				<div class="col-lg-12">
					<h1 class="page-header" align="center">공지사항 목록 페이지</h1>
				</div>
				<%-- 상세 페이지를 이동을 위한 FORM --%>
				<form name="detailForm" id="detailForm">
					<input type="hidden" name="n_num" id="n_num">
				</form>
				<%--페이징 처리 --%>
				<form id="f_search">
					<input type="hidden" name="page" id="page" value="${data.page }">
				</form>
				<div class="row"></div>
				<div class="panel panel-default">
					<div class="panel-heading" align="center">공지사항</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>관리자</th>
									<th data-value="n_date" class="order">등록일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<!-- 데이터 출력 -->
								<c:choose>
									<c:when test="${not empty noticeList}">
										<c:forEach items="${noticeList}" var="notice"
											varStatus="status">
											<tr class="tac" data-num="${notice.n_num}">
												<td class="col-lg-1">${notice.n_num}</td>
												<td class="goDetail tal"><a href='#'>${notice.n_title}</a></td>
												<td class="col-lg-1">${notice.n_writer}</td>
												<td class="col-lg-2">${notice.n_date}</td>
												<td class="col-lg-1">${notice.n_view}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<%-- ============= 페이지 네비게이션 시작 ============ --%>
						<div id="noticePage" align="center">
							<tag:paging page="${param.page }" total="${total }" list_size="5" />
						</div>
						<%-- ============= 페이지 네비게이션 종료 ============ --%>
					</div>
				</div>
				<div class="col-lg-12" align="center">
					<button class="btn btn-outline btn-info" id="regist">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
