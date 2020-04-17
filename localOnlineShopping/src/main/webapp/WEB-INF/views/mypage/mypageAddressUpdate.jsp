<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.a{
		width :600px;
	}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 주소 API -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		//우편번호 찾기 버튼(배송지 1)
		$("#search1").click(function(){
			$("#s_address1").val('');
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
		                    document.getElementById("s_address1").value = '';
		                }
		                alert("상세 주소가 있다면 주소 뒤에 입력해주세요");
							      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("s_address1").value = data.zonecode+"-";
		                document.getElementById("s_address1").value += addr;
		                document.getElementById("s_address1").value += extraAddr;
		                // 커서를 상세주소 필드로 이동한다.
		               $("#s_address1").focus();
		            }
		        }).open();
		});//카카오 API 메소드 끝
		
		//우편번호 찾기 버튼(배송지 2)
		$("#search2").click(function(){
			$("#s_address2").val('');
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
		                    document.getElementById("s_address2").value = '';
		                }
		                alert("상세 주소가 있다면 주소 뒤에 입력해주세요");
							      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("s_address2").value = data.zonecode+"-";
		                document.getElementById("s_address2").value += addr;
		                document.getElementById("s_address2").value += extraAddr;
		                // 커서를 상세주소 필드로 이동한다.
		               $("#s_address2").focus();
		            }
		        }).open();
		});//카카오 API 메소드 끝
		
		//우편번호 찾기 버튼(배송지 2)
		$("#search3").click(function(){
			$("#s_address3").val('');
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
		                    document.getElementById("s_address3").value = '';
		                }
		                alert("상세 주소가 있다면 주소 뒤에 입력해주세요");
							      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("s_address3").value = data.zonecode+"-";
		                document.getElementById("s_address3").value += addr;
		                document.getElementById("s_address3").value += extraAddr;
		                // 커서를 상세주소 필드로 이동한다.
		               $("#s_address3").focus();
		            }
		        }).open();
		});//카카오 API 메소드 끝
		$("#cancel").click(function(){
			var check = confirm("정말로 취소 하시겠습니까?");
			if(check){
				location.href = "/mypage/mypageAddress";
			}
		});
	});
</script>
<title>주지육림 - 배송지 등록/수정</title>
</head>
<body>
		<div name="header1">
		<jsp:include page="../template/client/header.jsp"></jsp:include>
		</div>
		
		<h3 align="center">배송지 수정</h3>
		
		<form id="addressForm" action="/mypage/modifyAddress" method="post">
		<table align="center" border="1">
			<tr>
				<td><label>배송지1</label></td>
				<td><input type="text" id="s_address1" name="s_address1" value="${member.s_address1 }" class="a">
				<input type="button" name="search1" id="search1" value="우편번호 찾기"></td>
			</tr>
			<tr>
				<td><label>배송지2</label></td>
				<td><input type="text" id="s_address2" name="s_address2" value="${member.s_address2 }" class="a">
				<input type="button" name="search2" id="search2" value="우편번호 찾기"></td>
			</tr>
			<tr>
				<td><label>배송지3</label></td>
				<td><input type="text" id="s_address3" name="s_address3" value="${member.s_address3 }" class="a">
				<input type="button" name="search3" id="search3" value="우편번호 찾기"></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" id="modify" value="등록/수정"><input type="button" id="cancel" value="취소">
		</table>
		</form>
		<div name="footer1">
		<jsp:include page="../template/client/footer.jsp"></jsp:include>
		</div>
</body>
</html>