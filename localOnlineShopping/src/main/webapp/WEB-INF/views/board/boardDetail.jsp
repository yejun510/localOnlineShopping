<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		
		$("#myList").click(function(){
			$("#postForm").submit();
		});
		
		$("#delete").click(function(){
			var check = confirm("정말로 삭제하시겠습니까?");
			
			if(check){
				var prom = prompt("게시글 비밀번호를 입력해주세요.");
				if(prom){
					if($("#q_passwd").val() == prom){
						$("#deleteForm").submit();
						}else{
							alert("입력하신 비밀번호와 게시글 비밀번호가 일치하지 않습니다.");
						}
				}
			}
		});
		
		$("#modify").click(function(){
			var check = confirm("정말로 수정하시겠습니까?");
			
			if(check){
				var prom = prompt("게시글 비밀번호를 입력해주세요.");
				if(prom){
					if($("#q_passwd").val() == prom){
						$("#updateForm").submit();
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
	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
		
		디테일 페이지 : ${detail.page }
		
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
	
	<h3 align="center">게시글 상세 보기</h3>	
		<table border="0" align="center">
			<tr>
				<td align="center">제목 : ${detail.q_title}</td>
			</tr>
			<tr>
				<td align="right">작성자 : ${detail.q_writer } 등록일 : ${detail.q_date }</td>
			<tr>
			<tr>
				<td align="center"><c:if test="${detail.q_image1 != null }"><img src="/uploadStorage/board/${detail.q_image1}" width="100px" height="100px"></c:if> 
					<c:if test="${detail.q_image2 != null }"><img src="/uploadStorage/board/${detail.q_image2}" width="100px" height="100px"></c:if>
					<c:if test="${detail.q_image3 != null }"><img src="/uploadStorage/board/${detail.q_image3}" width="100px" height="100px"></c:if></td>
			</tr>
			<tr>
				<td align="center"><textarea rows="20" cols="50" readonly="readonly">${detail.q_content }</textarea>
			</tr>
			<tr>
				<td align="center"><c:if test="${id == detail.id }">
				<input type="button" value="수정" id="modify">
				<input type="button" value="삭제" id="delete"></c:if></td>
			</tr>
			<tr>
				<td align="center"><input type="button" value="문의게시판 목록" id="list"><input type="button" value="내 게시글 목록" id="myList"></td>
			</tr>
		</table>		
		
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>