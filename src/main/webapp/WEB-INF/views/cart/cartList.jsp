<%@ include file="/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품장바구니 목록</title>
<link rel="stylesheet" href="/css/cartList.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="all">
	
	<div id="cartListForm" align="center">
			<ul id="myPageForm_nav_ul">
				<li><a href="/myPage/myPageForm.do">회원정보변경</a></li>
				<li><a href="/myPage/buyList/buyList.do">구매내역</a></li>
				<li><a href="/myPage/question/question.do">1:1문의</a></li>
				<li><a href="/cart/cartList.do">장바구니</a></li>
				<li><a href="/myPage/delivery/delivery.do">배송정보</a></li>
			</ul>
			<br>
		</div>
	
		<div class="cartListheader">
			<h1>장바구니</h1>
			<br>
			<table class="stepTable">
				<tr>
					<td class="choose"><p class="gold">STEP1</p><h2 class="white">장바구니</h2></td>
					<td><p class="gold">STEP2</p>주문/결제</td>
					<td><p class="gold">STEP3</p>주문완료</td>
				</tr>
			</table>
			<br>
		</div>
		
		<div class="body">
		<br><br>
			<form name="listForm" id="listForm" method="post" action="/buy/buyInsert.do">

				<table class="cartListtable">
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th width="10%">이미지</th>
							<th>상품명</th>
							<th>원산지</th>
							<th>제조사</th>
							<th>가격</th>
							<th>수량</th>
							<th>합계</th>
							<th>배송비</th>
							<th>삭제</th>
						</tr>
					</thead>

					<c:choose>
						<c:when test="${not empty cartList }">

							<c:forEach var="cart" items="${cartList}">

								<tbody>
									<tr>
										<td align="center"><input type="checkbox"></td>
										
										<td><img src="/resources/images/${cart.cartlistImage}" width="100%" height="70px"> <input type="hidden" name="productId" value="${cart.productId }">
										<input type="hidden" name="userId" value="${cart.userId }"></td>
										
										<td>${cart.cartlistName }</td>
										<td>${cart.cartlistOrigin }</td>
										<td>${cart.cartlistCompany }</td>
										<td><fmt:formatNumber pattern="###,###,###"
												value="${cart.cartlistPrice }" /></td>
										<td><input type="number" style="width: 40px"
											name="cartlistQuantity" value="${cart.cartlistQuantity }"
											min="1"></td>
										<td><fmt:formatNumber pattern="###,###,###"
												value="${cart.money }" /></td>
										<td>무료</td>
										<td><a
											href="/cart/cartDelete.do?cartlistId=${cart.cartlistId}">삭제</a></td>

									</tr>


								</tbody>

							</c:forEach>
							<tfoot>
								<tr>
									<td colspan="8" align="right">총 합계금액 :</td>
									<td><fmt:formatNumber pattern="###,###,###"
											value="${total }" /></td>
								</tr>
								<tr>
									<td colspan="10" align="right"><input type="submit" value="구매하기"></td>
								</tr>
								<tr>
									<td colspan="10" align="right"><a
										href="/product/productList.do">상품목록가기</a></td>
								</tr>
							</tfoot>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" align="center"><h1>장바구니가 비어있습니다.</h1></td>
							</tr>

						</c:otherwise>
					</c:choose>
				</table>

			</form>
		</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>