<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>

<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/css/delivery.css" />

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		/* 검색 후 검색 대상과 검색 단어 출력 */
		var word = "<c:out value='${data.keyword}' />";
		var value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");

			//:contains()는 특정 텍스트를 포함한 요소반환
			if ($("#search").val() == 'o_num'){
				value = "#list tr td.goDetail";
			}else if ($("#search").val() == 'id'){
				value = "#list tr td.id";
			}
			$(value + ":contains('" + word + "')").each(
				function() {
					var regex = new RegExp(word, 'gi');
					$(this).html($(this).text().replace(regex, "<span class='required'>" + word + "</span>"));
				});
		}

		/* 한페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}' />");
		}

		$("#all").click(function() {
			$("#status").val('');
			$("#status_page").val('1');
			$("#statusForm").attr({
				"method" : "get",
				"action" : "/admin/delivery/deliveryList.do"
			});
			$("#statusForm").submit();
		});

		$("#1").click(function() {
			$("#status").val('입금 전');
			$("#status_page").val('1');
			$("#statusForm").attr({
				"method" : "get",
				"action" : "/admin/delivery/deliveryList.do"
			});
			$("#statusForm").submit();
		});

		$("#2").click(function() {
			$("#status").val('입금 확인');
			$("#status_page").val('1');
			$("#statusForm").attr({
				"method" : "get",
				"action" : "/admin/delivery/deliveryList.do"
			});
			$("#statusForm").submit();
		});

		$("#3").click(function() {
			$("#status").val('배송준비중');
			$("#status_page").val('1');
			$("#statusForm").attr({
				"method" : "get",
				"action" : "/admin/delivery/deliveryList.do"
			});
			$("#statusForm").submit();
		});

		$("#4").click(function() {
			$("#status").val('배송처리');
			$("#status_page").val('1');
			$("#statusForm").attr({
				"method" : "get",
				"action" : "/admin/delivery/deliveryList.do"
			});
			$("#statusForm").submit();
		});

		$("#5").click(function() {
			$("#status").val('배송완료');
			$("#status_page").val('1');
			$("#statusForm").attr({
				"method" : "get",
				"action" : "/admin/delivery/deliveryList.do"
			});
			$("#statusForm").submit();
		});

		$("#6").click(function() {
			$("#status").val('환불처리');
			$("#status_page").val('1'); 
			$("#statusForm").attr({
				"method" : "get",
				"action" : "/admin/delivery/deliveryList.do"
			});
			$("#statusForm").submit();
		});

		$("#7").click(function() {
			$("#status").val('구매 확정');
			$("#status_page").val('1');
			$("#statusForm").attr({
				"method" : "get",
				"action" : "/admin/delivery/deliveryList.do"
			});
			$("#statusForm").submit();
		});

		/* 주문정보 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {
			var o_serialnum = $(this).parents("tr").attr("data-num");
			$("#o_num").val(o_num);
			console.log("주문번호 : " + o_num);
			// 상세 페이지로 이동하기 위해 form추가 (id: detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/delivery/deliveryDetail.do"
			});
			$("#detailForm").submit();
		});
	
		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("search").val() == "all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});

		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if ($("#search").val() != "all") {
				if (!chkSubmit($('#keyword'), "검색어를"))
					return;
			}
			goPage(1);
		});

		/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});

	});
	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 */
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#o_status").val($("#status").val());
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/delivery/deliveryList.do"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>주문 리스트</h3>
		</div>

		<%-- 상세 페이지 이동을 위한 FORM --%>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="o_num" id="o_num"> 
			<input type="hidden" name="page" value="${data.page}"> 
			<input type="hidden" name="pageSize" value="${data.pageSize}">
		</form>

		<%-- 검색을 위한 FORM --%>
		<form name="statusForm" id="statusForm">
			<input type="hidden" id="status" name="o_status" value="${data.o_status }"> 
			<input type="hidden" name="page" value="${data.page}" id="status_page"> 
			<input type="hidden" name="pageSize" value="${data.pageSize}">
		</form>

		<%-- 주문진행상태와 검색 --%>
		<div id="deliverySearch">
			<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}">
			<input type="hidden" id="o_status" name="o_status">
				<table summary="주문진행상태와 검색">
					<thead>
						<tr>
							<th colspan="2" align="left">주문진행상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="2" id="btd1">
							<input type="button" id="all" class="btn btn-default btn-lg" value="전체"> 
							<input type="button" id="1" class="btn btn-default btn-lg" value="입금 전">
							<input type="button" id="2" class="btn btn-default btn-lg" value="입금 확인"> 
							<input type="button" id="3" class="btn btn-default btn-lg" value="배송준비중"> 
							<input type="button" id="4" class="btn btn-default btn-lg" value="배송처리">
							<input type="button" id="5" class="btn btn-default btn-lg" value="배송완료"> 
							<input type="button" id="6" class="btn btn-default btn-lg" value="환불처리">
							<input type="button" id="7" class="btn btn-default btn-lg" value="구매 확정">
							</td>
						</tr>
						<tr>
							<th colspan="2" align="left">조건검색</th>
						</tr>
						<tr>
							<td>
								<select id="search" name="search">
									<option value="all">전체</option>
									<option value="o_num">일련번호</option>
									<option value="id">회원ID</option>
								</select> 
								<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요."> 
								<input type="button" id="searchData" value="찾기">
							</td>
							<td align="right">한페이지에 
								<select id="pageSize" name="pageSize">
									<option value="1">1줄</option>
									<option value="3">3줄</option>
									<option value="5">5줄</option>
									<option value="7">7줄</option>
									<option value="10">10줄</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<%-- 주문진행상태와 검색 종료 --%>

		<%-- 리스트 시작 --%>
		<div id="deliveryList">
			<table summary="주문 리스트">
				<colgroup>
					<col width="6%">
					<col width="12%">
					<col width="18%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="12%">
					<col width="12%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>일련번호</th>
						<th>주문일자</th>
						<th>주문번호</th>
						<th>회원 ID</th>
						<th>주문방법</th>
						<th>주문금액</th>
						<th>주문진행상태</th>
						<th>배송희망날짜</th>
					</tr>
				</thead>
				<tbody id="list">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty deliveryList}">
							<c:forEach var="delivery" items="${deliveryList}"
								varStatus="status">
								<tr class="tac" data-num="${delivery.o_num}">
									<td class="goDetail">${count - status.index}</td>
									<td class="goDetail">${delivery.o_num}</td>
									<td class="goDetail">${delivery.o_date}</td>
									<td class="goDetail">${delivery.o_serialnum}</td>
									<td class="goDetail">${delivery.id}</td>
									<td class="goDetail">${delivery.o_paymethod}</td>
									<td class="goDetail">${delivery.o_totalprice}</td>
									<td class="goDetail">${delivery.o_status}</td>
									<td class="goDetail">${delivery.o_delivery}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="9" class="tac">주문내역이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- 리스트 종료 --%>

		<%-- 페이지 네비게이션 시작 --%>
		<div id="deliveryPage">
			<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}" />
		</div>
		<%-- 페이지 네비게이션 종료 --%>
	</div>
</body>
</html>