<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.table{
		cursor: default;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
		$(function(){
			$(".detail").click(function(){
				$("#q_num").val($(this).parent().prev().val());
				$("#q_view").val($(this).parent().prev().prev().val());
				
				$("#detail").attr({
					"action" : "/board/boardDetail",
					"method" : "get"
				});
				
				$("#detail").submit();
			});
			
			$("#category").change(function(){
				$("#categoryForm").attr({
					"action" : "/mypage/mypagePost",
					"method" : "get"
				});
				$("#categoryForm").submit();
			});
		});
		function goPage(page){
			$("#page").val(page);
			$("#pageForm").attr({
				"method":"get",
				"action":"/mypage/mypagePost"
			});
			$("#pageForm").submit();
		}
</script>
<title>주지육림-나의 게시글</title>
</head>
<body>
	
	
	<h3 align="center">나의 게시글 관리</h3>
	
	<form id="detail">
		<input type="hidden" name="q_num" id="q_num">
		<input type="hidden" name="q_view" id="q_view">
		<input type="hidden" name="page" value="${bvo.page }">
	</form>
	
	<form id="pageForm">
		<input type="hidden" id="page" name="page" value="${bvo.page }">
		<input type="hidden" id="s_category" name="q_category" value="${bvo.q_category }">
	</form>
	
	<form id="categoryForm">
	<input type="hidden" name="page" value="1">
	<div align="center">
		<select id="category" name="q_category">
			<option>모두</option>
			<option <c:if test="${bvo.q_category == '환불/반품' }">selected</c:if>>환불/반품</option>
			<option <c:if test="${bvo.q_category == '기타' }">selected</c:if>>기타</option>
		</select>
	</div>
	</form>
	
	<table align="center" class="table table-striped table-hover table-bordered">
		<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회 수</th>
			<th>카테고리</th>
			<th>답변상태</th>
		</tr>
		
		<c:choose>
			<c:when test="${not empty boardList }">
				<c:forEach var="board" items="${boardList }">
				<input type="hidden" value="${board.q_view }">
				<input type="hidden" value="${board.q_num }">
					<tr>
						<td class="detail">${board.q_num }</td>
						<td class="detail">${board.q_title }</td>
						<td class="detail">${board.q_writer }</td>
						<td class="detail">${board.q_date }</td>
						<td class="detail">${board.q_view }</td>
						<td class="detail">${board.q_category }</td>
						<td class="detail">${board.q_reply }</td>
					</tr>
				</c:forEach>
				<tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7">등록하신 게시물이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
			
	</table>
		<div id="boardPage" align="center">
			<tag:paging page="${param.page }" total="${total }" list_size="${bvo.pageSize }"/>
		</div>
	
</body>
</html>