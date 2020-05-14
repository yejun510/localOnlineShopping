<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돼지고기 상품리스트</title>
	<style type="text/css">
	#includeAside{
		float: left;
	}
		#porkPage{
		text-decoration: underline;
		font-size: 20px;
		}
	</style>
   
<script type="text/javascript"
src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		/* 상품명 클릭 시 처리 이벤트 */
		$(".goDetail").click(function () {
			var p_num = $(this).parent().prev().val();
			$("#p_num").val(p_num);
			console.log("글번호:"+p_num);
			// 상세 페이지로 이동하기 위해 form 추가 (id:detailForm)
			$("#detailForm").attr({
				"method":"get",
				"action":"/product/productDetail.do"
			});
			$("#detailForm").submit();
		});
	$(function () {
		$("#fileImage").attr({
			src:"/uploadStorage/product/${beef.p_file}",
			width:"450px",
			height:"200px"
		});	
	});
});
</script>
</head>
<body>
	<div id="includeAside" class="col-md-1">
		<jsp:include page="../template/client/aside1.jsp"/>
	</div>
	<div class="detailTit"><h3 align="center">돼지고기 상품리스트</h3></div>
	<%-- ======================상세 페이지 이동을 위한 FORM ======================== --%>
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="p_num" id="p_num">
	</form>
	<%-- ============================= 리스트시작 ========================== --%>
	
		<div class="col-md-3"></div>
	
	<div id="beefList" class="col-md-5">
	
		<c:set var="a" value="0"/>
		
		
			<!-- 데이터 출력 -->
			<c:choose>
				<c:when test="${not empty porkList}">
				<c:forEach var="pork" items="${porkList}"
					varStatus="status">
				<input type="hidden" value="${pork.p_num }"/>
					<div class="col-md-4" align="center">
						<div class="row goDetail"><img src="/uploadStorage/product/${pork.p_file}" width="100px" height="100px"></div>
						<div class="row goDetail">${pork.p_name}</div>
						<div class="row goDetail">${pork.p_price}</div>
					</div>
					<c:set var="a" value="${a+1 }"/><c:if test="${a == 3 }"><div class="row"></div><c:set var="a" value="0"/></c:if>
				
					</c:forEach> 
				</c:when>
			</c:choose>
	</div>
</body>
</html>