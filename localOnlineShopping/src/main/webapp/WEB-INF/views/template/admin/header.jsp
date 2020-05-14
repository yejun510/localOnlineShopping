<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function logout(){
    if(confirm("로그아웃하시겠습니까?")){
        location.href = "/admin/logout.do";
        return true;
    } else {
        return false;
    }
}
</script>
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar" aria-expanded="false"
			aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> 
			<span class="icon-bar"></span>
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span>
		</button>
		<c:if test="${id == null or id == ''}">
			<a class="navbar-brand" >주지육림 관리자 페이지</a>
		</c:if>
		<c:if test="${id != null and id != ''}">
			<a class="navbar-brand" href="/admin">주지육림 관리자 페이지</a>
		</c:if>
	</div>
	<div id="navbar" class="collapse navbar-collapse ">
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${id == null or id == ''}">
				<li><a href="/admin/loginPage.do">로그인</a></li>
			</c:if>
			<c:if test="${id != null and id != ''}">
				<fieldset id="loginAfter">
						<strong>관리자님 반갑습니다</strong>
				</fieldset>
				<a href="#" onclick="logout();">로그아웃</a>
			</c:if>
		</ul>
	</div>
</div>