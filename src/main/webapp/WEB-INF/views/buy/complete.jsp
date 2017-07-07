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

<link rel="stylesheet" href="/css/complete.css">

</head>
<body>
	<div class="all">
	
	<div id="myPageForm" align="center">
			<ul id="myPageForm_nav_ul">
				<li><a href="/myPage/userInfo/userInfoPassword.do">회원정보변경</a></li>
				<li><a href="/myPage/buyList/buyList.do">구매내역</a></li>
				<li><a href="/myPage/question/question.do">1:1문의</a></li>
				<li><a href="/cart/cartList.do"><b>장바구니</b></a></li>
				<li><a href="/myPage/delivery/delivery.do">배송정보</a></li>
			</ul>

		</div>
		<br>
		<table class="stepTable">
			<tr>
				<td><p class="gold">STEP1</p> <b class="white">장바구니</b></td>
				<td><p class="gold">STEP2</p> <b class="white">주문/결제</b></td>
				<td class="choose"><p class="gold">STEP3</p> <b class="white">주문완료</b></td>
			</tr>
		</table>
		<br>

	<div align="center">
		
		<div style="background-image: url('../images/complete.png'); width: 784px; height: 410px; "  >
			<h1 align="right">결제가 완료되었습니다</h1>
			<p id="userid"><b><em>${sessionScope.UVO.user_id}</em></b></p>
		</div>
	</div>
	<div align="center">
		<a href="/"><input type="button" id="mainBtn" name="mainBtn" value="메인으로"/></a>
		<button id="DeliveryBtn">배송정보</button>
	</div>
	<div>
		<h1>구매내역</h1>
		<table id="completetb" border="1">
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
	
	</div>



	<%@ include file="/footer.jsp"%>
</body>
</html>