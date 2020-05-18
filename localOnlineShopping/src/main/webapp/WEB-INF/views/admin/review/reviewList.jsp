<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
</style>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/review.css" />

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	//이미지 클릭시 원본 크기로 팝업 보기
	function doImgPop(img){
	 img1= new Image();
	 img1.src=(img);
	 imgControll(img);
	}
	 
	function imgControll(img){
	 if((img1.width!=0)&&(img1.height!=0)){
	    viewImage(img);
	  }
	  else{
	     controller="imgControll('"+img+"')";
	     intervalID=setTimeout(controller,20);
	  }
	}
	
	function viewImage(img){
	 W=img1.width;
	 H=img1.height;
	 O="width="+W+",height="+H+",scrollbars=yes";
	 imgWin=window.open("","",O);
	 imgWin.document.write("<html><head><title>이미지 상세보기</title></head>");
	 imgWin.document.write("<body topmargin=0 leftmargin=0>");
	 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	 imgWin.document.close();
	}

	$(function() {
		/* 조회버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			$("#r_satis").val($("input[name='check']:checked").val());

			if ($("#search").val() == "all") {
				$("#p_num").val($("#all").val());
				$("#f_data").attr({
					"method" : "get",
					"action" : "/admin/review/reviewList.do"
				});
				$("#f_data").submit();
			} else if ($("#search").val() == "beef") {
				$("#p_num").val($("#beef").val());
				$("#f_data").attr({
					"method" : "get",
					"action" : "/admin/review/reviewList.do"
				});
				$("#f_data").submit();
				
			} else if ($("#search").val() == "pork") {
				$("#p_num").val($("#pork").val());
				$("#f_data").attr({
					"method" : "get",
					"action" : "/admin/review/reviewList.do"
				});
				$("#f_data").submit();
			}

		});

		/* 삭제버튼 클릭 시 처리 이벤트 */
		$(".reviewDelete").click(function() {
			$("#r_num").val($(this).parent().parent().prev().val());
			$("#r_image").val($(this).parent().parent().attr("data-num"));
			var chkConfirm = confirm("삭제하시겠습니까?");
			if (chkConfirm) {
				goUrl = "/admin/review/reviewDelete.do";
				$("#d_data").attr("action", goUrl);
				$("#d_data").submit(); 
			}
		});
	});
	
	/* 상위 셀렉트로 하위 셀렉트 제어하기 */
	function showSub(obj) {
		f = document.forms.select_meat;

		if (obj == 'all') {
			f.all.style.display = "";
			f.beef.style.display = "none";
			f.pork.style.display = "none";
		} else if (obj == 'beef') {
			f.all.style.display = "none";
			f.beef.style.display = "";
			f.pork.style.display = "none";
		} else if (obj == 'pork') {
			f.all.style.display = "none";
			f.beef.style.display = "none";
			f.pork.style.display = "";
		}
	}
</script>

</head>
<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>상품후기 선택</h3>

			<%-- 조회를 위한 FORM --%>
			<form name="f_data" id="f_data" method="GET">
				<input type="hidden" id="p_num" name="p_num" />
				<input type="hidden" id="r_satis" name="r_satisfaction" />
 			</form>
			
			<%-- 삭제를 위한 FORM --%>
			<form name="d_data" id="d_data" method="GET">
				<input type="hidden" id="r_num" name="r_num">
				<input type="hidden" id="r_image" name="r_image">
			</form>
		</div>

		<div id="reviewSearch">
			<table summary="검색">
				<tr>
					<td>
						<label>구매자 평점</label>
					</td>
					<td> 
						<input type="radio" class="ckeck" name="check" id="allCheck" value="전체선택" checked="checked">전체선택 
						<input type="radio" class="check" name="check" id="verygood" value="매우만족">매우만족 
						<input type="radio" class="check" name="check" id="good" value="만족">만족
						<input type="radio" class="check" name="check" id="normal" value="보통">보통 
						<input type="radio" class="check" name="check" id="bad" value="불만">불만 
						<input type="radio" class="check" name="check" id="verybad" value="매우불만">매우불만
					</td>
				</tr>
				<tr>
					<form name="select_meat">
					<td>
						<!-- 상위셀렉트 박스 -->
						<label>카테고리 </label>
					</td>
					<td>
						<!-- 전체 카테고리 -->
						<select name="meat" id="search" onChange="showSub(this.options[this.selectedIndex].value);">
							<option value="all">전체</option>
							<option value="beef">소고기</option>
							<option value="pork">돼지고기</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<!-- 하위셀렉트 박스 -->
						<label>상 품 명 </label>
					</td>
					<td>
						<select name="all" id="all" style="display: ;">
							<option>전체</option>
						</select>
						<!-- 소고기 카테고리 -->
						<select name="beef" id="beef" style="display: none;">
							<option>소고기전체</option>
							<option value="100a">안심</option>
							<option value="100b">등심</option>
							<option value="100c">살치살</option>
							<option value="100d">새우살</option>
							<option value="100e">차돌박이</option>
							<option value="100f">양지</option>
							<option value="100g">채끝</option>
						</select>
						<!-- 돼지고기 카테고리 -->
						<select name="pork" id="pork" style="display: none;">
							<option>돼지고기전체</option>
							<option value="200a">뒷다리불고기</option>
							<option value="200b">삼겹살</option>
							<option value="200c">대패삼겹살</option>
							<option value="200d">목살</option>
							<option value="200e">찌개용</option>
						</select>
					</td>
					</form>
				</tr>
			</table>
		</div>

		<input type="button" id="searchData" name="searchData" class="btn btn-outline btn-primary" value="조회">
		<input type="button" id="cancel" class="btn btn-outline btn-info" value="취소">

		<h3>목록</h3>

		<%-- 리스트 시작 --%>
		<div id="reviewList">
			<table summary="후기 목록" style="width:100%; table-layout:fixed; word-break:break-all; height: auto;">
				<colgroup>
					<col width="7%" />
					<col width="9%" />
					<col width="12%" />
					<col width="9%" />
					<col width="25%" />
					<col width="12%" />
					<col width="9%" />
					<col width="9%" />
					<col width="8%" />
				</colgroup>
				<thead>
					<tr>
						<th>리뷰번호</th>
						<th>카테고리</th>
						<th>상품명</th>
						<th>회원ID</th>
						<th>상품평</th>
						<th>이미지</th>
						<th>평점</th>
						<th>작성일자</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty reviewList }">
							<c:forEach var="review" items="${reviewList}">
								<input type="hidden" value="${review.r_num }">
								<tr data-num="${review.r_image}">
									<td>${review.r_num}</td>
									<td><c:choose>
											<c:when test="${review.p_num.contains('100')}">소고기</c:when>
											<c:when test="${review.p_num.contains('200')}">돼지고기</c:when>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${review.p_num=='100a'}">안심</c:when>
											<c:when test="${review.p_num=='100b'}">등심</c:when>
											<c:when test="${review.p_num=='100c'}">살치살</c:when>
											<c:when test="${review.p_num=='100d'}">새우살</c:when>
											<c:when test="${review.p_num=='100e'}">차돌박이</c:when>
											<c:when test="${review.p_num=='100f'}">양지</c:when>
											<c:when test="${review.p_num=='100g'}">채끝</c:when>
											<c:when test="${review.p_num=='200a'}">뒷다리불고기</c:when>
											<c:when test="${review.p_num=='200b'}">삼겹살</c:when>
											<c:when test="${review.p_num=='200c'}">대패삼겹살</c:when>
											<c:when test="${review.p_num=='200d'}">목살</c:when>
											<c:when test="${review.p_num=='200e'}">찌개용</c:when>
										</c:choose></td>
									<td>${review.id}</td>
									<td>${review.r_content}</td>
									<td>
										<c:if test="${review.r_image != null}">
										<img src="/uploadStorage/review/${review.r_image}" width="100px" height="100px" 
										style="cursor: pointer;" onclick="doImgPop('/uploadStorage/review/${review.r_image}')" />
										</c:if>
									</td>
									<td>${review.r_satisfaction}</td>
									<td>${review.r_date}</td>
									<td><input type="button" class="btn btn-outline btn-danger reviewDelete" value="삭제"></td>             
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="9" class="tac">리뷰내역이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>