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
		/*제목 클릭시 상세 페이지 이동을 위한 처리*/
		$(".goDetail").click(function() {
			var q_num = $(this).parents("tr").attr("data-num");
			$("#q_num").val(q_num);
			console.log("글번호:" + q_num);
			//상세 페이지로 이동하기 위해 form 추가 (id :detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/boardDetail.do"
			});
			$("#detailForm").submit();
		});

		$("#category").change(function() {
			$("#q_category").val($("#category").val());
			$("#categoryForm").submit();
		});
	});

	/*페이징 처리*/
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#pageCategory").val($("#category").val());

		$("#f_search").attr({
			"method" : "GET",
			"action" : "/board/boardList.do"
		});
		$("#f_search").submit();
	}
</script>
<title>문의게시판 메인 페이지</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이  -->
				<div class="col-lg-12">
					<h1 class="page-header" align="center">문의게시판 목록 페이지</h1>
				</div>
				<%-- 상세 페이지 이동을 위한 form --%>
				<form name="detailForm" id="detailForm">
					<input type="hidden" name="q_num" id="q_num">
				</form>
				<%-- 페이징 처리 --%>
				<form id="f_search">
					<input type="hidden" name="page" id="page" value="${data.page }">
					<input type="hidden" name="q_category" id="pageCategory">
				</form>
				<form action="/board/boardList.do" method="get" id="categoryForm">
					<input type="hidden" name="q_category" id="q_category">
				</form>
				<table>
					<tr>
						<td>카테고리 &nbsp;</td>
						<td><select id="category">
								<option>전체</option>
								<option
									<c:if test="${data.q_category == '환불/반품' }">selected</c:if>>환불/반품</option>
								<option <c:if test="${data.q_category == '기타'}">selected</c:if>>기타</option>
						</select></td>
					</tr>
				</table>
				<div class="row"></div>
				<div class="panel panel-default">
					<div class="panel-heading" align="center">문의게시판</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>이름</th>
									<th>등록일</th>
									<th>조회수</th>
									<th>답변현황</th>
								</tr>
							</thead>
							<tbody>
								<!-- 데이터 출력 -->
								<c:choose>
									<c:when test="${not empty boardList}">
										<c:forEach items="${boardList}" var="question_board"
											varStatus="status">
											<tr class="tac" data-num="${question_board.q_num}">
												<td class="col-lg-1">${question_board.q_num}</td>
												<td class="col-lg-2">${question_board.q_category}</td>
												<td class="goDetail tal"><a href='#'>${question_board.q_title}</a></td>
												<td class="col-lg-1">${question_board.id}</td>
												<td class="col-lg-2">${question_board.q_date}</td>
												<td class="col-lg-1">${question_board.q_view}</td>
												<td class="col-lg-1">${question_board.q_reply}</td>
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
					</div>
					<%-- ============= 페이지 네비게이션 시작 ============ --%>
					<div id="boardPage" align="center">
						<tag:paging page="${param.page }" total="${total }" list_size="10" />
					</div>
					<%-- ============= 페이지 네비게이션 종료 ============ --%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
