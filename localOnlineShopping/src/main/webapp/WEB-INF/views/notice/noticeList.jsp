<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#includeAside{
		float: left;
	}
	#noticePage{
		text-decoration: underline;
		font-size: 20px;
	}
	.table {
		cursor: default;	
	}
</style>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript"
src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	/* 상품명 클릭 시 처리 이벤트 */
	$(".goDetail").click(function () {
		var n_num = $(this).parent().attr("data-num");
		$("#n_num").val(n_num);
		console.log("글번호:"+n_num);
		// 상세 페이지로 이동하기 위해 form 추가 (id:detailForm)
		$("#detailForm").attr({
			"method":"get",
			"action":"/notice/noticeDetail.do"
		});
		$("#detailForm").submit();
	});

});
function goPage(page){
	$("#page").val(page);
	$("#pageForm").attr({
		"method":"get",
		"action":"/notice/noticeList.do"
	});
	$("#pageForm").submit();
}
</script>
</head>
<body>
	<div id="includeAside" class="col-md-1">
		<jsp:include page="../template/client/aside1.jsp"/>
	</div>
	<div id="includeAside" class="col-md-1"></div>
		<div align="center" class="row  col-md-8">
			<div class="detailTit"><h3>공지사항</h3></div>
		
	<%-- ============================= 리스트시작 ========================== --%>
		<form id="pageForm">
		<input type="hidden" id="page" name="page" value="${nvo.page }">
		</form>
			<!-- 데이터 출력 -->
		<form name="detailForm" id="detailForm">
		<input type="hidden" name="n_num" id="n_num">
		<input type="hidden" name="page" value="${nvo.page }">
		</form>
		
		<table align="center" class="table table-striped table-hover table-bordered">
			<tr>
				<td>제목</td>
				<td>등록일</td>
				<td>작성자</td>
				<td>조회수</td>
			</tr>
			<c:choose>
				<c:when test="${not empty noticeList}">
				<c:forEach var="notice" items="${noticeList}"
					varStatus="status">
					
						
						
							
								<tr data-num = "${notice.n_num }">
									<td class="goDetail">${notice.n_title}</td>
									<td class="goDetail">${notice.n_date}</td>
									<td class="goDetail">${notice.n_writer}</td>
									<td class="goDetail">${notice.n_view}</td>
								</tr>
						
					
					</c:forEach> 
				</c:when>
			</c:choose>
			</table>
			<div id="boardPage" align="center">
			<tag:paging page="${param.page }" total="${total }" list_size="${nvo.pageSize }"/>
			</div>
		</div>
</body>
</html>