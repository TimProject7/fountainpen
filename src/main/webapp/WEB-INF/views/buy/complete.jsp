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
<title>결제완료</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js">
	$(document).ready(function() {
		$("#DeliveryBtn").click(function() { //[배송정보] 버튼클릭
			window.location.href = "/";
		});
		$("#MainBtn").click(function() { //[메인으로] 버튼클릭
			window.location.href = "/";
		});
	});
</script>

<style type="text/css">
div {
	width: 100%;
}

table {
	border: 1px solid black;
}
</style>
</head>
<body>
	<div>
		<h1 align="left">3.주문완료</h1>
		<h3 align="right">1.장바구니 > 2.주문/결제 > 3.주문완료</h3>
	</div>
	<div align="center">
		<h1>결제가 완료되었습니다</h1>
	</div>
	<div align="center">
		<a href="/"><input type="button" id="mainBtn" name="mainBtn" value="메인으로"/></a>
		<button id="DeliveryBtn">배송정보</button>
	</div>
	<div>
		<h1>구매내역</h1>
		<table>
			<tr>
				<th>구매번호</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>상품수량</th>
				<th>구매날짜</th>
				<th>배송상태</th>
				<th>결제상태</th>
			</tr>
			<c:choose>
				<c:when test="${not empty completeList }">
					<c:forEach var="complete" items="${completeList}">
						<tr>
							<td>${complete.buy_number }</td>
							<td>${complete.buy_image }</td>
							<td>${complete.buy_product }</td>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${complete.buy_price }" /></td>
							<td>${complete.buy_quantity }</td>
							<td><fmt:formatDate value="${complete.buy_day}"
									pattern="yyyy-MM-dd" /></td>
							<td>${complete.buy_status }</td>
							<td>${complete.buy_status2}</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>

	</div>



	<%@ include file="/footer.jsp"%>
</body>
</html>