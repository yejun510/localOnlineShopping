<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
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
		/*답변 삭제 버튼 클릭시 처리 이벤트*/
		$(".replyBtn").click(function() {
			$("#a_num").val($(this).parent().parent().parent().prev().val());
			$("#a_image").val($(this).parent().prev().val());
			var check = confirm("삭제하시겠습니까?");

			if (check) {
				$("#del").attr({
					"action" : "/admin/reply/replyDelete.do",
					"method" : "post"
				});
				$("#del").submit();
			}
		});
		/*답변 등록 버튼 클릭 시 처리 이벤트*/
		$("#boardReplyUpdateBtn").click(function() {
			if (!chkSubmit($('#q_reply'), "문의 답변 내용을"))
				return;
			else {
				alert("답변 완료")
				$("#reply").val('답변 완료');
				$("#data").attr({
					"method" : "post",
					"action" : "/admin/reply/replyInsert.do"
				});
				$("#data").submit();
			}
		});

		/*목록 버튼 클릭 시 처리 이벤트 */
		$("#boardListBtn").click(function() {
			location.href = "/admin/board/boardList.do"
		});

	});
</script>
<title>문의게시판 상세</title>
</head>
<body>
	<form id="del">
		<input type="hidden" id="a_num" name="a_num"> <input
			type="hidden" value="${detail.q_num}" name="q_num">
		<input type="hidden" name="a_image" id="a_image"> 	
	</form>

	<form name="data" id="data" method="post" enctype="multipart/form-data">
		<input type="hidden" id="q_num" value="${detail.q_num}" name="q_num">
		<input type="hidden" id="reply" value="${detail.q_reply}" name="q_reply">
		<div>
			<div class="page-wrapper">
				<div class="container-fluid">
						<!--게시판 넓이 -->
						<div class="col-lg-12">
							<h3 class="page-header" align="center">문의게시판 상세 페이지</h3>
						</div>
						<div class="row">
							<div class="col-lg-12"></div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading" align="center">문의게시판</div>
							<div class="panel-body">
								<div class="row form-group">
									<label class="col-lg-2">제목</label>
									<div class="col-lg-8">
										<p>${detail.q_title}</p>
									</div>
								</div>
								<div class="row form-group">
									<label class="col-lg-2">작성자</label>
									<div class="col-lg-4">
										<p>${detail.q_writer}</p>
									</div>
									<label class="col-lg-2">등록일</label>
									<div class="col-lg-2">
										<p>${detail.q_date}</p>
									</div>
								</div>
								<div class="row form-group">
									<label class="col-lg-2">내용</label>
									<div class="col-lg-8">
										<p>${detail.q_content}</p>
									</div>
								</div>
								<c:if test="${detail.q_image1 != null ||  detail.q_image2 != null || detail.q_image3 != null}">
								<div class="row form-group">
									<label class="col-lg-2">이미지</label>
									<div class="col-lg-8">
										<c:if test="${detail.q_image1 != null}">
											<img src="/uploadStorage/board/${detail.q_image1}" width="100px" height="100px" title="클릭하시면 원본크기로 보실 수 있습니다." style="cursor: pointer;" onclick="doImgPop('/uploadStorage/board/${detail.q_image1}')">
										</c:if>
										<c:if test="${detail.q_image2 != null}">
											<img src="/uploadStorage/board/${detail.q_image2}" width="100px" height="100px" title="클릭하시면 원본크기로 보실 수 있습니다." style="cursor: pointer;" onclick="doImgPop('/uploadStorage/board/${detail.q_image2}')">
										</c:if>
										<c:if test="${detail.q_image3 != null}">
											<img src="/uploadStorage/board/${detail.q_image3}" width="100px" height="100px" title="클릭하시면 원본크기로 보실 수 있습니다." style="cursor: pointer;" onclick="doImgPop('/uploadStorage/board/${detail.q_image3}')">
										</c:if>
									</div>
								</div>
								</c:if>
								<hr>
								<div class="row form-group">
									<label class="col-lg-2">문의 답변</label>
									<div class="col-lg-8">
										<textarea id="q_reply" class="form-control" name="a_content"></textarea>
									</div>
								</div>
								<div class="row form-group">
									<label class="col-lg-2">첨부 이미지</label>
									<div class="col-lg-8">
										<input type="file" name="a_file" id="file">
									</div>
								</div>
								<div class="contentBtn" align="center">
									<input type="button" value="답변등록" class="btn btn-outline btn-info" id="boardReplyUpdateBtn">
									<input type="button" value="목록" class="btn btn-outline btn-primary" id="boardListBtn">
								</div>
							</div>
						</div>
					
						<c:choose>
							<c:when test="${not empty replyWrite }">
								<c:forEach var="reply" items="${replyWrite }">
									<input type="hidden" id="re" value="${reply.a_num }">
									<div class="panel panel-default">
										<div class="panel-heading" align="center">답변 댓글</div>
										<div class="panel-body">
											<div class="row form-group">
												<label class="col-lg-2">답변 현황</label>
												<div class="col-lg-8">
													<p>${detail.q_reply}</p>
												</div>
											</div>
											<div class="row form-group">
												<label class="col-lg-2">문의 내용</label>
												<div class="col-lg-8">
													<p>${detail.q_content}</p>
												</div>
											</div>
											<div class="row form-group">
												<label class="col-lg-2">답변 내용</label>
												<div class="col-lg-8">
													<p>${reply.a_content}</p>
												</div>
											</div>
											<c:if test="${reply.a_image != null}">
											<div class="row form-group">
												<label class="col-lg-2">첨부 이미지</label>
												<div class="col-lg-8">
												<img src="/uploadStorage/reply/${reply.a_image}" width="100px" height="100px" style="cursor: pointer;" onclick="doImgPop('/uploadStorage/reply/${reply.a_image}')">
												</div>
											</div>
											</c:if>
											<input type="hidden" value="${reply.a_image}"> 
											<div class="contentBtn" align="center">
												<input type="button" value="답변삭제" class="btn btn-outline btn-danger replyBtn">
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="panel panel-default">
									<div class="panel-heading" align="center">답변 댓글</div>
									<div class="panel-body">
										<div class="row form-group">
											<label class="col-lg-2">답변 현황</label>
											<div class="col-lg-8">
												<p>${detail.q_reply}</p>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<%-- ============= 페이지 네비게이션 시작 ============ --%>
				<div id="boardPage">
					<tag:paging page="${param.page }" total="${total }" list_size="10" />
				</div>
			</div>
	</form>
</body>
</html>