<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<h2 class="page-header">메인페이지</h2>
<div class="table-responsive col-sm-12">
	<table class="table table-hover">
		<tr>
			<td class="col-sm-6" align="center">
			<a href="admin/product/productList.do">				
				<img alt="상품" src="/resources/images/shopping-cart.png" style="width : 30%; height: 30%;" align="center">
				<h3>상품</h3>
				</a>
			</td>
			<td class="col-sm-6" align="center">
			<a href="admin/member/memberList.do">
				<img alt="회원" src="/resources/images/community.png" style="width : 30%; height: 30%;" align="center">
				<h3>회원</h3>
			</a>
			</td>
		</tr>
		<tr>
			<td class="col-sm-6" align="center">
			<a href="admin/graph/monthGraph.do">
				<img alt="통계" src="/resources/images/statistics.png" style="width : 30%; height: 30%;" align="center">
				<h3>통계</h3>
			</a>
			</td>
			<td class="col-sm-6" align="center">
			<a href="admin/notice/noticeList.do">
				<img alt="고객센터" src="/resources/images/faq.png" style="width : 30%; height: 30%;" align="center">
				<h3>고객센터</h3>
			</a>
			</td>
		</tr>
	</table>
</div>