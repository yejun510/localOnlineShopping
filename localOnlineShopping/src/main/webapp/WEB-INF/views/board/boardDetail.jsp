<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style type="text/css">
	.detailTable{
		font-family: 'Nanum Brush Script', cursive;
	}
	.h3{
		font-family: 'Nanum Brush Script', cursive;
	}
	.reply_table{
		width: 600px;
	}
	#includeAside{
		float: left;
	}
	#boardPage{
		text-decoration: underline;
		font-size: 20px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#image1").click(function(){
			if($("#image1").attr("width") != '300px'){
				$("#image1").attr({
					"width" : "300px",
					"height" : "300px"
				});
			}else{
				$("#image1").attr({
					"width" : "100px",
					"height" : "100px"
				});
			}
		});
		
		$("#image2").click(function(){
			if($("#image2").attr("width") != '300px'){
				$("#image2").attr({
					"width" : "300px",
					"height" : "300px"
				});
			}else{
				$("#image2").attr({
					"width" : "100px",
					"height" : "100px"
				});
			}
		});
		
		$("#image3").click(function(){
			if($("#image3").attr("width") != '300px'){
				$("#image3").attr({
					"width" : "300px",
					"height" : "300px"
				});
			}else{
				$("#image3").attr({
					"width" : "100px",
					"height" : "100px"
				});
			}
		});
		
		$(".reply_image").click(function(){
			if($(this).attr("width") != '300px'){
				$(this).attr({
					"width" : "300px",
					"height" : "300px"
				});
			}else{
				$(this).attr({
					"width" : "100px",
					"height" : "100px"
				});
			}
		});
		
		$("#myList").click(function(){
			$("#postForm").submit();
		});
		
		$("#delete").click(function(){
			var check = confirm("정말로 삭제하시겠습니까?");
			var query = { q_num : $("#q_num").val() };
			
			if(check){
				var prom = prompt("게시글 비밀번호를 입력해주세요.");
				if(prom){
					if($("#q_passwd").val() == prom){
						
						$.ajax({
							url: "/board/deleteReply",
							type: "post",
							data: query,
							success: function(data){
								if(data == 1){
									$("#deleteForm").submit();
								}else{
									alert("삭제 할 수 없습니다.");
								}
							}
						});
						
						
						}else{
							alert("입력하신 비밀번호와 게시글 비밀번호가 일치하지 않습니다.");
						}
				}
			}
		});
		
		$("#modify").click(function(){
			var check = confirm("정말로 수정하시겠습니까?");
			var query = { q_num : $("#q_num").val() };
			if(check){
				var prom = prompt("게시글 비밀번호를 입력해주세요.");
				if(prom){
					if($("#q_passwd").val() == prom){
						
						$.ajax({
							url: "/board/searchReply",
							type: "post",
							data: query,
							success: function(data){
								if(data == 1){
									$("#updateForm").submit();
								}else{
									alert("답변이 완료된 게시글은 수정할 수 없습니다.");
								}
							}
						});
						
						
					}else{
						alert("입력하신 비밀번호와 게시글 비밀번호가 일치하지 않습니다.");
					}
				}
			}
		});
		
		$("#list").click(function(){
			$("#pageForm").submit();
		})
	});
</script>
<meta charset="UTF-8">
<title>주지육림 게시글 상세 보기</title>
</head>
<body>
	<div id="includeAside">
		<jsp:include page="../template/client/aside1.jsp"/>
	</div>
		
	<form action="/board/boardList" id="pageForm" method="get">
		<input type="hidden" name="page" value="${detail.page }">
	</form>
	
	<form action="/mypage/mypagePost" id="postForm" method="get">
		<input type="hidden" name="page" value="${detail.page }">
	</form>
	
	<form id="deleteForm" action="/board/deleteBoard" method="post">
		<input type="hidden" id="q_num" value="${detail.q_num }" name="q_num">
		<input type="hidden" name="q_image1" value="${detail.q_image1 }">
		<input type="hidden" name="q_image2" value="${detail.q_image2 }">
		<input type="hidden" name="q_image3" value="${detail.q_image3 }">
	</form>
	
	<form id="updateForm" action="/board/updateBoardForm" method="get">
		<input type="hidden" id="q_num2" value="${detail.q_num }" name="q_num">
		<input type="hidden" name="q_category" value="${detail.q_category }">
		<input type="hidden" name="q_image1" value="${detail.q_image1 }">
		<input type="hidden" name="q_image2" value="${detail.q_image2 }">
		<input type="hidden" name="q_image3" value="${detail.q_image3 }">
	</form>
	
	<input type="hidden" id="q_passwd" value="${detail.q_passwd }" name="q_passwd">
	
	<h3 align="center" class="h3">게시글 상세 보기</h3>	
		<table border="0" align="center" class="detailTable">
			<tr>
				<td align="center">제목 : ${detail.q_title}[${detail.q_reply }]</td>
			</tr>
			<tr>
				<td align="center">작성자 : [${detail.q_writer }] 등록일 : [${detail.q_date }] 조회수 : [${detail.q_view }]</td>
			<tr>
			<tr>
				<td align="center"><c:if test="${detail.q_image1 != null }"><img src="/uploadStorage/board/${detail.q_image1}" width="100px" height="100px" id="image1"></c:if> 
					<c:if test="${detail.q_image2 != null }"><img src="/uploadStorage/board/${detail.q_image2}" width="100px" height="100px" id="image2"></c:if>
					<c:if test="${detail.q_image3 != null }"><img src="/uploadStorage/board/${detail.q_image3}" width="100px" height="100px" id="image3"></c:if></td>
			</tr>
			<tr>
				<td align="center"><textarea rows="20" cols="50" readonly="readonly">${detail.q_content }</textarea>
			</tr>
			<tr>
				<td align="center"><c:if test="${id == detail.id }"><br>
				<input type="button" value="수정" id="modify" class="btn btn-success">
				<input type="button" value="삭제" id="delete" class="btn btn-danger"></c:if></td>
			</tr>
		</table>
		
		<br><br>
		<h3 align="center">댓글 목록</h3>
		<table align="center" class="table reply_table">
			<c:choose>	
				<c:when test="${not empty reply_list }">
					<c:forEach var="reply" items="${reply_list }">
						<tr>
							<td rowspan="2" align="center"><img src="/uploadStorage/review/${reply.a_image}" width="100px" height="100px" class="reply_image"></td>
							<td>${reply.a_name }</td>
							<td>${reply.a_date }</td>
						</tr>
						<tr>
							<td colspan="3" height="80px">${reply.a_content }</td>
						</tr>	
					</c:forEach>
				</c:when>
				<c:otherwise>
						<tr>
							<td>등록된 댓글이 없습니다.</td>
						</tr>
				</c:otherwise>
			</c:choose>
		</table>
		
		<div align="center"><br><input type="button" value="문의게시판 목록" id="list" class="btn btn-default"><c:if test="${id == detail.id }"><input type="button" value="내 게시글 목록" id="myList" class="btn btn-default"></c:if></div>		
		
		
	
</body>
</html>