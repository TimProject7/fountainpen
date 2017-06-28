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
	$(document).ready(function(){
		$("#insertCart").click(function(){//[장부구니에 담기]버튼클릭
			var buye = $("#buyer").val();
			var b
		})
	})
</script>
</head>
<body>
	<h2>상품 상세정보</h2>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" name="productId" id="productId"
			value="${detail.productId}" />
	</form>
	<div id="productDetail">
		<table border="1">
			<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
			</colgroup>
			<tbody>

				<tr>
					<td>이미지</td>
					<td>${detail.productImage }</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>${detail.productName }</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${detail.productPrice }</td>
				</tr>
				<tr>
					<td>제조사</td>
					<td>${detail.productCompany }</td>
				</tr>
				<tr>
					<td>원산지</td>
					<td>${detail.productOrigin }</td>
				</tr>
				<tr align="center">
					<td colspan="2">
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
							</select>&nbsp;개 <input type="submit" value="장바구니에 담기">
						</form> 
						<a href="/buy/buyList.do">구매하기</a>
						<a href="/product/productList.do">상품 목록</a>
					</td>
				</tr>
			</tbody>

		</table>
		<div align="center">
			<p>상품상세설명</p>
			<p>${detail.productContent }</p>
		</div>

	</div>

	<%@ include file="/footer.jsp"%>
</body>
</html>