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
<title>주문/결제 페이지</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cartList").click(function(){ //[상품수정] 버튼클릭
		window.location.href="/cart/cartList.do";	
	});
});
	
</script>
<style type="text/css">
div {
	border: 1px;
	width: 80%;
	background: yellow;
}

table {
	border: 1px solid black;
	width: 80%;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<h1 align="left">2.주문/결제</h1>
		<h3 align="right">1.장바구니 > 2.주문/결제 > 3.주문완료</h3>
	</div>
	<div>
		<h1>주문내역</h1>
		<table>
			<tr>
				<th>이미지</th>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>합계</th>
				<th>배송비</th>
			</tr>
			<c:choose>
				<c:when test="${not empty buyList }">
					<c:forEach var="buy" items="${buyList}">
						<tr>
							<td>${buy.buy_image }</td>
							<td>${buy.buy_product }</td>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${buy.buy_price }" /></td>
							<td>${buy.buy_quantity }</td>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${buy.money }" /></td>
							<td>무료</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		
	</div>
	<button id="cartList">상품수정</button>
	<div>
		<section>
			<table>
				<tr>
					<td>구매자정보</td>
					<th>회원이름</th>
					<th>전화번호</th>
					<th>핸드폰번호</th>
					<th>이메일</th>
				</tr>

				<c:choose>
					<c:when test="${not empty buyList }">
						<c:forEach var="buyList" items="${buyList}" begin="0" end="0">
							<tr>
								<td></td>
								<td>${buyList.user_name}</td>
								<td>${buyList.user_cell}</td>
								<td>${buyList.user_phone}</td>
								<td>${buyList.user_email}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
		</section>
	</div>
	<div>
		<section>
			<table>
				<tr>
					<th>배송정보</th>
					<th colspan="2">주소</th>
				</tr>
				<c:choose>
					<c:when test="${not empty buyList }">
						<c:forEach var="buyList" items="${buyList}" begin="0" end="0">
							<tr>
								<td></td>
								<td colspan="2">${buyList.buy_address }</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				<tr>
					<td>배송메시지</td>
					<td><input type="text" /></td>
					<td>*배송시 참고될 사항이 있으면 적어주세요</td>
				</tr>
			</table>
		</section>
	</div>
	<div>
		<h1>결제금액</h1>
		<table>
			<tr>
				<td>총 결제 하실 금액 :</td>
				<td><fmt:formatNumber pattern="###,###,###" value="${total }" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="결제하기" /></td>
			</tr>
		</table>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>