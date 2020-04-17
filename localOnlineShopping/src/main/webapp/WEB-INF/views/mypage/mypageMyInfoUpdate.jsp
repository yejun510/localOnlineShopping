<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#address{
	width :600px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 주소 API -->
<script type="text/javascript">
	$(function(){
		$("#cancel").click(function(){
			var check = confirm("정말로 취소하시겠습니까?");
			if(check){
				location.href = "/mypage/mypageMyInfo";
			}
		});
		$("#modify").click(function(){
			
			var passCheck = /^[a-z0-9]{8,20}$/g; //비밀번호 정규식
			
			
			if($("#passwd").val().length<1 || $("#passCheck").val().length<1){
				alert("비밀 번호를 입력하지 않았습니다.");
			}else if($("#passwd").val() != $("#passCheck").val()){
				alert("입력하신 비밀번호 항목과 비밀번호 확인 항목이 일치 하지 않습니다.");
				$("#passwd").val('');
				$("#passCheck").val('');
				$("#passwd").focus();
			}else if(!passCheck.test($("#passwd").val())){
				alert("입력하신 비밀번호 형식이 맞지 않습니다.");
				$("#passwd").val('');
				$("#passCheck").val('');
				$("#passwd").focus('');
			}else{
				$("#profile").attr({
					"method":"post",
					"action":"/mypage/modify"
				});
				
				$("#profile").submit();
			}
		});
		
		//우편번호 찾기 버튼
		$("#search").click(function(){
			$("#address").val('');
			 new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    
		                
		                } else {
		                    document.getElementById("address").value = '';
		                }
		                alert("상세 주소가 있다면 주소 뒤에 입력해주세요");
							      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("address").value = data.zonecode+"-";
		                document.getElementById("address").value += addr;
		                document.getElementById("address").value += extraAddr;
		                // 커서를 상세주소 필드로 이동한다.
		               $("#address").focus();
		            }
		        }).open();
		});//카카오 API 메소드 끝
	});
</script>
<title>주지육림 - 내 정보 수정</title>
</head>
<body>

	<div name="header1">
	<jsp:include page="../template/client/header.jsp"></jsp:include>
	</div>
	
	<h3 align="center">내 정보 수정</h3>
	<br>
	<br>
	<form id="profile">
	<table align="center" border="1">
		<tr>
			<td><label>비밀번호</label></td>
			<td><input type="password" id="passwd" name="passwd" placeholder="영문/숫자 포함 8~20자"></td>
		</tr>
		<tr>
			<td><label>비밀번호 확인</label></td>
			<td><input type="password" id="passCheck" placeholder="영문/숫자 포함 8~20자"></td>
		<tr>
			<td><label>이름</label></td>
			<td><input type="text" value="${member.name }" id="name" name="name"></td>
		</tr>
		<tr>
			<td><label>핸드폰 번호</label></td>
			<td><input type="text" id="tel" value="${member.tel }" name="tel"></td>
		</tr>
		<tr>
			<td><label>주소</label></td>
			<td><input type="text" id="address" value="${member.address }" name="address"><input type="button" name="search" id="search" value="우편번호 찾기"></td>
		</tr>

		<tr>
			<td colspan="2" align="center"><input type="button" id="modify" value="수정 완료"><input type="reset" value="취소" id="cancel"></td> 
		</tr>
	</table>
	</form>
	
	<div name="footer1">
	<jsp:include page="../template/client/footer.jsp"></jsp:include>
	</div>
</body>
</html>