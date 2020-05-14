<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.a{
		width: 600px;
		cursor: default;
	}
	.btn { font-family: 'Nanum Brush Script', cursive;}
  
	.btn:hover{color:#fff;}

	.hover1:hover{ box-shadow: 100px 0 0 0 rgba(0,0,0,0.5) inset; }
	
	.a{
	border-style: none;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#modify").click(function(){
			location.href = "/mypage/mypageAddressUpdate";
		});
		
		$("#remove").click(function(){
			if($("#check1").is(":checked") == false && $("#check2").is(":checked") == false && $("#check3").is(":checked") == false){
				alert("삭제를 원하는 배송지에 체크 해주세요");
			}else{ 
				if($("#check1").is(":checked") == true && $("#check2").is(":checked") == true && $("#check3").is(":checked") == true){
					$("#s_address1").attr("value",'');
					$("#check1").attr("checked",false);
					$("#s_address2").attr("value",'');
					$("#check2").attr("checked",false);
					$("#s_address3").attr("value",'');
					$("#check3").attr("checked",false);
				}
				else if($("#check1").is(":checked") == true && $("#check2").is(":checked") == true){
					$("#s_address1").attr("value",'');
					$("#check1").attr("checked",false);
					$("#s_address2").attr("value",'');
					$("#check2").attr("checked",false);
				}
				else if($("#check1").is(":checked") == true && $("#check3").is(":checked") == true){
					$("#s_address1").attr("value",'');
					$("#check1").attr("checked",false);
					$("#s_address3").attr("value",'');
					$("#check3").attr("checked",false);
				}
				else if($("#check2").is(":checked") == true && $("#check3").is(":checked") == true){
					$("#s_address2").attr("value",'');
					$("#check2").attr("checked",false);
					$("#s_address3").attr("value",'');
					$("#check3").attr("checked",false);
				}
				else if($("#check1").is(":checked") == true){
					$("#s_address1").attr("value",'');
					$("#check1").attr("checked",false);
				}
				else if($("#check2").is(":checked") == true){
					$("#s_address2").attr("value",'');
					$("#check2").attr("checked",false);
				}
				else if($("#check3").is(":checked") == true){
					$("#s_address3").attr("value",'');
					$("#check3").attr("checked",false);
				}
				
				var check = confirm("정말로 삭제하시겠습니까?");
				if(check){
				$("#addressForm").attr({
					"action" : "/mypage/modifyAddress",
					"method" : "post"
				});
				$("#addressForm").submit();
				}
		}
		});
		$(".ck1").click(function(){
			if($("#check1").is(":checked") == false){
				$("#check1").prop("checked","checked");
			}else{
				$("#check1").prop("checked",false);
			}
		});
		$(".ck2").click(function(){
			if($("#check2").is(":checked") == false){
				$("#check2").prop("checked","checked");
			}else{
				$("#check2").prop("checked",false);
			}
		});
		$(".ck3").click(function(){
			if($("#check3").is(":checked") == false){
				$("#check3").prop("checked","checked");
			}else{
				$("#check3").prop("checked",false);
			}
		});
	});
</script>
<title>주지육림-ADDRESS</title>
</head>
<body>
	
	
	<h3 align="center">배송지 관리</h3>
	
	<form id="addressForm">
	<table align="center" class="table table-striped table-hover table-bordered">
			<tr>
			<td class="ck1"><label>배송지1</label></td>
			<td class="ck1"><input type="text" readonly="readonly" value="${member.s_address1 }" class="a" id="s_address1" name="s_address1"></td>
			<td><input type="checkbox" id="check1"></td>
		</tr>
		<tr>
			<td class="ck2"><label>배송지2</label></td>
			<td class="ck2"><input type="text" readonly="readonly" value="${member.s_address2 }" class="a" id="s_address2" name="s_address2"></td>
			<td><input type="checkbox" id="check2"></td>
		</tr>
		<tr>
			<td class="ck3"><label>배송지3</label></td>
			<td class="ck3"><input type="text" readonly="readonly" value="${member.s_address3 }" class="a" id="s_address3" name="s_address3"></td>
			<td><input type="checkbox" id="check3"></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="button" id="modify" value="등록/수정" class="btn hover1 btn-default"><input type="button" id="remove" value="삭제" class="btn hover1 btn-default"></td>
	</table>
	</form>
	
</body>
</html>