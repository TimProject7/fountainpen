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
<link rel="stylesheet" href="/css/b_buyList.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cartList").click(function(){ //[상품수정] 버튼클릭
		window.location.href="/cart/cartList.do";	
	});
	$("#completeBtn").click(function(){ //[결제하기] 버튼클릭
		window.location.href="/buy/completeList.do";
		
	});
});
	
</script>
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
				<td><p class="gold">STEP1</p><b class="white">장바구니</b></td>
				<td class="choose"><p class="gold">STEP2</p><b class="white">주문/결제</b></td>
				<td><p class="gold">STEP3</p><b class="white">주문완료</b></td>
			</tr>
		</table>
	<br>

	<div>
		<h1>주문내역</h1>
		<table class="b_buyList_tb">
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
		<br>
	</div>
	<button id="cartList">상품수정</button>
	<br>
	<div>
		<section>
			<table class="b_buyList_tb">
				<tr>
					<th>회원이름</th>
					<th>전화번호</th>
					<th>핸드폰번호</th>
					<th>이메일</th>
				</tr>

				<c:choose>
					<c:when test="${not empty buyList }">
						<c:forEach var="buyList" items="${buyList}" begin="0" end="0">
							<tr>
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
	<br>
	<div>
		<section>
			<table class="b_buyList_tb">
				<tr>
					<th>주소</th>
					<th>배송시 요구 메세지</th>
				</tr>
				<c:choose>
					<c:when test="${not empty buyList }">
						<c:forEach var="buyList" items="${buyList}" begin="0" end="0">
							<tr>
								<td>${buyList.buy_address }</td>
								<td>배송시 요구 메세지 : <input type="text" /><br><p class="red">ex) 부재시 경비실에 맡겨주세요.</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
		</section>
	</div>
	<div>
	<br>
		<h1>결제금액</h1>
		<table>
			<tr>
				<td>총 결제 하실 금액 :</td>
				<td><fmt:formatNumber pattern="###,###,###" value="${total }" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="결제하기" id="completeBtn"/></td>
			</tr>
		</table>
	</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>