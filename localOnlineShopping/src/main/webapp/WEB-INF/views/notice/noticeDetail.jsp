<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$("#list").click(function(){
			$("#postForm").submit();
		});
	});
</script>
</head>
<body>
	<div id="includeAside" class="col-md-1">
		<jsp:include page="../template/client/aside1.jsp"/>
	</div>
		<form action="/notice/noticeList.do" method="get" id="postForm">
			<input type="hidden" name="page" value="${noticeDetail.page }">
		</form>
		<div class="col-md-3"></div>
						<div class="col-md-5">
							<h3 align="center">공지 사항</h3>
							<table align="center" class="table">
								<tr>
									<td colspan="3">제목 : ${noticeDetail.n_title}</td>
								</tr>
								<tr>
									<td>조회수:[${noticeDetail.n_view}]</td><td>작성자:[${noticeDetail.n_writer}]</td><td>등록일:[${noticeDetail.n_date}]</td>
								</tr>
								<tr>
									<td colspan="3"><textarea rows="20" cols="70" readonly="readonly">${noticeDetail.n_content}</textarea></td>
								</tr>
								
								<c:if test="${noticeDetail.n_image1 != null}">
								<tr>
									<td colspan="3"><img src="/uploadStorage/notice/${noticeDetail.n_image1}" width="100px" height="100px">${noticeDetail.n_image1}</td>
								</tr>
								</c:if>
								<c:if test="${noticeDetail.n_image2 != null}">
								<tr>
									<td colspan="3"><img src="/uploadStorage/notice/${noticeDetail.n_image2}" width="100px" height="100px">${noticeDetail.n_image2}</td>
								</tr>
								</c:if>
								<c:if test="${noticeDetail.n_image3 != null}">
								<tr>
									<td colspan="3"><img src="/uploadStorage/notice/${noticeDetail.n_image3}" width="100px" height="100px">${noticeDetail.n_image3}</td>
								</tr>
								</c:if>
								<tr>
									<td colspan="3" align="right"><input type="button" value="공지사항 목록" id="list" class="btn btn-default"></td>
								</tr>
							</table>
						</div>
	
</body>
</html>