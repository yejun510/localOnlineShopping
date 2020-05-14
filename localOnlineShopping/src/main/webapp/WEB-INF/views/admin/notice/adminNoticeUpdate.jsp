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
		/*수정 버튼 클릭 시 수정후 상세페이지로 이동 처리 이벤트*/
		$("#noticeUpdateBtn").click(function() {
			//입력값 체크
			if (!chkSubmit($('#n_title'), "수정할 제목을"))
				return;
			else if (!chkSubmit($('#n_writer'), "작성자명을"))
				return;
			else if (!chkSubmit($('#n_content'), "수정할 내용을"))
				return;
			else {
				alert("수정 완료")
				$("#n_writeForm").attr({
					"method" : "POST",
					"action" : "/admin/notice/noticeUpdate.do"
				});
				$("#n_writeForm").submit();
			}
		});
	});
</script>
<title>공지사항 수정 페이지</title>
</head>
<body>
	<form id="n_writeForm" name="n_writeForm" enctype="multipart/form-data">
		<input type="hidden" id="n_num" name="n_num" value="${updateData.n_num }" />
		<div class="page-wrapper">
			<div class="container-fluid">
					<!--게시판 넓이 -->
					<div class="col-lg-12">
						<h3 class="page-header" align="center">공지사항 수정 페이지</h3>
					</div>
					<div class="row">
						<div class="col-lg-12"></div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" align="center">공지사항</div>
						<div class="panel-body">
							<div class="row form-group">
								<label class="col-lg-2">제목</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="n_title" value="${updateData.n_title}" name="n_title" min="1" max="3">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2">작성자</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="n_writer" value="${updateData.n_writer}" name="n_writer">
								</div>
							</div>
							<div class="row form-group">
								<label class="col-lg-2">내용</label>
								<div class="col-lg-8">
									<textarea name="n_content" id="n_content" class="form-control">${updateData.n_content}</textarea>
								</div>
							</div>
								<div class="row form-group">
									<label class="col-lg-2">첨부 이미지</label>
									<div class="col-lg-8">
										<img src="/uploadStorage/notice/${updateData.n_image1}" width="100px" height="100px" title="클릭하시면 원본크기로 보실 수 있습니다." style="cursor: pointer;" onclick="doImgPop('/uploadStorage/notice/${updateData.n_image1}')">
										<img src="/uploadStorage/notice/${updateData.n_image2}" width="100px" height="100px" title="클릭하시면 원본크기로 보실 수 있습니다." style="cursor: pointer;" onclick="doImgPop('/uploadStorage/notice/${updateData.n_image2}')">
										<img src="/uploadStorage/notice/${updateData.n_image3}" width="100px" height="100px" title="클릭하시면 원본크기로 보실 수 있습니다." style="cursor: pointer;" onclick="doImgPop('/uploadStorage/notice/${updateData.n_image3}')">
										<input type="file" name="file1" id="file1">
										<input type="hidden" name="n_image1" value="${updateData.n_image1}"> 
										<input type="file" name="file2" id="file2">
										<input type="hidden" name="n_image2" value="${updateData.n_image2}"> 
										<input type="file" name="file3" id="file3">
										<input type="hidden" name="n_image3" value="${updateData.n_image3}"> 
									</div>
								</div>
							<div class="contentBtn" align="center">
								<input type="button" value="수정" class="btn btn-outline btn-info" id="noticeUpdateBtn"> 
								<input type="button" value="취소" class="btn btn-outline btn-primary" id="noticeDetailBtn" onclick="history.go(-1)">
							</div>
						</div>
					</div>
				</div>
			</div>
	</form>
</body>
</html>
