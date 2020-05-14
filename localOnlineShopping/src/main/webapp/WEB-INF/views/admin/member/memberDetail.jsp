<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세 보기</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/member.css" />
	
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		/* 목록버튼 클릭 시 처리 이벤트 */
		$("#memberListBtn").click(function(){
			$("#f_data").attr("action","/admin/member/memberList.do");
			$("#f_data").submit();
		});
	});
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit"><h3>회원 상세정보</h3></div>
		<form name="f_data" id="f_data" method="GET">
			<input type="hidden" name="id" value="${detail.id}" />
			<input type="hidden" name="page" value="${detail.page}">
			<input type="hidden" name="pageSize" value="${detail.pageSize}">
		</form>
		
		<%-- 상세정보 보여주기 --%>
		<div class="contentTB">
			<table>
				<colgroup>
					<col width="25%" />
					<col width="75%" />
					
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">아이디</td>
						<td>${detail.id}</td>
					</tr>
					<tr>
						<td class="ac">회원명</td>
						<td>${detail.name}</td>
					</tr>
					<tr>
						<td class="ac">주소</td>
						<td>${detail.address}</td>
					</tr>
					<tr>
						<td class="ac">휴대전화</td>
						<td>${detail.tel}</td>
					</tr>
					<tr>
						<td class="ac">e-mail</td>
						<td>${detail.email}</td>
					</tr>
					<tr>
						<td class="ac">배송지(1)</td>
						<td>${detail.s_address1}</td>
					</tr>
					<tr>
						<td class="ac">배송지(2)</td>
						<td>${detail.s_address2}</td>
					</tr>
					<tr>
						<td class="ac">배송지(3)</td>
						<td>${detail.s_address3}</td>
					</tr>
					<tr>
						<td class="ac">가입일</td>
						<td><fmt:formatDate value="${detail.join_date}" pattern="yyyy.MM.dd"/></td>
					</tr>
				</tbody>
			</table>
			<div>
				<input type="button" value="확인" id="memberListBtn" class="btn btn-outline btn-primary">
			</div>
		</div>
		<%-- 상세정보 보여주기 종료 --%>
	</div>
</body>
</html>