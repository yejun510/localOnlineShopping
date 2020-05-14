<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
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
		/*수정 버튼 클릭 시 처리 이벤트*/
		$("#noticeUpdateBtn").click(function() {
			var check = confirm("수정하시겠습니까?");

			if (check) {
				$("#data").attr({
					"action" : "/admin/notice/updateForm.do"
				});
				$("#data").submit();
			}
		});

		/*삭제 버튼 클릭 시 처리 이벤트 */
		$("#noticeDeleteBtn").click(function() {
			var check = confirm("삭제하시겠습니까?");

			if (check) {
				$("#data").attr({
					"action" : "/admin/notice/noticeDelete.do"
				});
				$("#data").submit();
			}
		});

		/*목록 버튼 클릭 시 처리 이벤트 */
		$("#noticeListBtn").click(function() {
			location.href = "/admin/notice/noticeList.do"
		});
	});
</script>
<title>공지사항 상세 페이지</title>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit" align="center">
			<h3>공지사항 상세 페이지</h3>
		</div>
		
		<form id="data" method="get">
			<input type="hidden" name="n_num" value="${detail.n_num}">
			<input type="hidden" name="n_image1" value="${detail.n_image1}">	
			<input type="hidden" name="n_image2" value="${detail.n_image2}">
			<input type="hidden" name="n_image3" value="${detail.n_image3}">
		</form>
		
		<div class="row">
			<div class="col-lg-12"></div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading" align="center">공지사항</div>
			<div class="panel-body">
				<div class="row form-group">
					<label class="col-lg-2">제목</label>
					<div class="col-lg-8">
						<p>${detail.n_title}</p>
					</div>
				</div>
				<div class="row form-group">
					<label class="col-lg-2">작성자</label>
					<div class="col-lg-4">
						<p>${detail.n_writer}</p>
					</div>
					<label class="col-lg-2">등록일</label>
					<div class="col-lg-4">
						<p>${detail.n_date}</p>
					</div>
				</div>
				<div class="row form-group">
					<label class="col-lg-2">내용</label>
					<div class="col-lg-8">
						<p>${detail.n_content}</p>
					</div>
				</div>
				<c:if test="${detail.n_image1 != null ||  detail.n_image2 != null || detail.n_image3 != null}">
				<div class="row form-group">
					<label class="col-lg-2">첨부 이미지</label>
					<div class="col-lg-8">
						<c:if test="${detail.n_image1 != null}">
						<img src="/uploadStorage/notice/${detail.n_image1}" width="100px" height="100px" style="cursor: pointer;" onclick="doImgPop('/uploadStorage/notice/${detail.n_image1}')">
						</c:if>
						<c:if test="${detail.n_image2 != null}">
						<img src="/uploadStorage/notice/${detail.n_image2}" width="100px" height="100px" style="cursor: pointer;" onclick="doImgPop('/uploadStorage/notice/${detail.n_image2}')">
						</c:if>
						<c:if test="${detail.n_image3 != null}">
						<img src="/uploadStorage/notice/${detail.n_image3}" width="100px" height="100px" style="cursor: pointer;" onclick="doImgPop('/uploadStorage/notice/${detail.n_image3}')">
						</c:if>
					</div>
				</div>
				</c:if>
				<div class="contentBtn" align="center">
					<input type="button" value="수정" class="btn btn-outline btn-info" id="noticeUpdateBtn"> 
					<input type="button" value="목록" class="btn btn-outline btn-primary" id="noticeListBtn"> 
					<input type="button" value="삭제" class="btn btn-outline btn-danger" id="noticeDeleteBtn">
				</div>
			</div>
		</div>
	</div>
</body>
</html>

