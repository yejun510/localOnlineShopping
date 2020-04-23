<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".detail").click(function(){
			var q_view = $(this).parent().prev().prev().val();
			var q_num = $(this).parent().prev().val();
			$("#q_view").val(q_view);
			$("#q_num").val(q_num);
			$("#detailForm").submit();
		});
		
		$("#write").click(function(){
			location.href = "/board/boardWrite";
		});
		
		$("#category").change(function(){
			$("#categoryForm").attr({
				"action" : "/board/boardList",
				"method" : "get"
			});
			$("#categoryForm").submit();
		});
	});
	function goPage(page){
		$("#page").val(page);
		$("#pageForm").attr({
			"method":"get",
			"action":"/board/boardList"
		});
		$("#pageForm").submit();
	}
</script>
<meta charset="UTF-8">
<title>주지육림-문의게시판</title>
</head>
<body>
	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	
	<form id="pageForm">
		<input type="hidden" id="page" name="page" value="${bvo.page }">
		<input type="hidden" id="s_category" name="q_category" value="${bvo.q_category }">
	</form>
	
	
	<form id="detailForm" action="/board/boardDetail" method="get">
		<input type="hidden" name="q_num" id="q_num"/>
		<input type="hidden" name="q_view" id="q_view"/>
		<input type="hidden" name="page" value="${bvo.page }">
	</form>
	
	
	<h3 align="center">문의 게시판</h3>
	<form id="categoryForm">
	<input type="hidden" name="page" value="1">
	<div align="center">
		<select id="category" name="q_category">
			<option>모두</option>
			<option <c:if test="${bvo.q_category == '환불/반품' }">selected</c:if>>환불/반품</option>
			<option <c:if test="${bvo.q_category == '기타' }">selected</c:if>>기타</option>
		</select>
	</div>
	<input type="hidden" name="page" value="${bvo.page }">
	</form>
	
	카테고리 : 	${bvo.q_category }
	
	<table align="center" border="1">
		<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
			<th>카테고리</th>
		</tr>
	
		<c:choose>
			<c:when test="${not empty boardList }">
				<c:forEach var="board" items="${boardList }">
					<input type="hidden" value="${board.q_view }">
					<input type="hidden" value="${board.q_num }"/>
					<tr>
						<td>${board.q_num }</td>
						<td class="detail">${board.q_title }[${board.q_reply}]</td>
						<td>${board.q_writer }</td>
						<td>${board.q_date }</td>
						<td>${board.q_view }</td>
						<td>${board.q_category }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<tr>
						<td colspan="6">등록된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
		</c:choose>
		<c:if test="${id != null }">
			<tr>
				<td colspan="6" align="right"><input type="button" value="작성" id="write"></td>
			</tr>
			</c:if>
	</table>
		<div id="boardPage" align="center">
			<tag:paging page="${param.page }" total="${total }" list_size="${bvo.pageSize }"/>
		</div>
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>