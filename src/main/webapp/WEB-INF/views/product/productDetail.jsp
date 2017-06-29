<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세정보</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
</script>
<link rel="stylesheet" href="/css/productDetail.css">
</head>
<body>
	<h2>상품 상세정보</h2>
	<div class="productDetail_all">
	<h1>[PARKER] ${detail.productName }</h1>
	<a class="list" href="/product/productList.do">상품 목록</a>
	<img class="line_img" src="/images/라인.PNG">

		<form name="f_data" id="f_data" method="POST">
			<input type="hidden" name="productId" id="productId"
				value="${detail.productId}" />
		</form>
			
					
			<table class="productDetail_table">
				<tbody>

					<tr>
						<td rowspan="6" width="50%"><img
							src="/resources/images/${detail.productImage}" width="100%"
							height="400px"></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${detail.productName }</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><fmt:formatNumber pattern="###,###,###"
								value="${detail.productPrice}" /></td>
					</tr>
					<tr>
						<th>제조사</th>
						<td>${detail.productCompany }</td>
					</tr>
					<tr>
						<th>원산지</th>
						<td>${detail.productOrigin }</td>
					</tr>
					
					<tr align="center">
					
						<td colspan="3">
							<form id="form1" name="form1" method="post"
								action="/cart/cartInsert.do">

									<input type="hidden" name="productId"
									value="${detail.productId }"> <input type="hidden"
									name="userId" id="userId"
									value="${sessionScope.UVO.user_number }"> <select
									name="cartlistQuantity">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i }</option>
									</c:forEach>
								</select>&nbsp; 개
								<br><br>

								<input type="image" src="/images/btn02.gif" id="submit">
							</form>
							<a href="/buy/buyList.do"><img src="/images/btn01.gif"></a><br>
						</td>
						
						
						
					</tr>
				</tbody>

			</table>
			<div align="center">
				<br>
				<h2>상품상세설명</h2>
				<br>
				<hr>
				<p>${detail.productContent }</p>
			</div>


	</div>

	<%@ include file="/footer.jsp"%>
</body>
</html>
