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
	$(document)
			.ready(
					function() {
						$("#conShopping").click(function() { //[쇼핑계속] 버튼클릭
							window.location.href = "/product/productList.do";
						});
						$("#shopMain").click(function() { //[메인으로] 버튼클릭
							window.location.href = "/";
						});
						$("#buyBtn").click(function() {//[구매하기] 버튼클릭

							$("#listForm").attr({
								"method" : "POST",
								"action" : "/buy/buyInsert.do"
							});
							$("#listForm").submit();
						});
						/* //선택수정
						$("#updateBtn").click(function(){
							if($(":checkbox[name='chk']:checked").length==0){
								alert("수정할 항목을 하나이상 체크해주세요.");
								return;
							}else{
								alert("상품수량을 변경하시겠습니까");
								$("#listForm").attr("method", "POST");
								$("#listForm").attr("action", "/cart/cartUpdate.do");
								$("#listForm").submit();
								alert("상품수량이 변경되었습니다.");
							}
						}); */
						$("#updateBtn").click(
								function() { //[수량수정] 버튼클릭
									alert("상품수량을 변경하시겠습니까");
									$("#listForm").attr("method", "POST");
									$("#listForm").attr("action",
											"/cart/cartUpdate.do");
									$("#listForm").submit();
									alert("상품수량이 변경되었습니다.");
								});
						//체크박스 전체선택 
						$("#checkAll").click(function() {
							//클릭되었으면
							if ($("#checkAll").is(":checked")) {
								//input 태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
								$("input[name=chk]").prop("checked", true);
								//클릭이 안되있으면
							} else {
								//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
								$("input[name=chk]").prop("checked", false);
							}
						});

						//선택삭제 할때 아무것도 선택이안됬을시
						$("#deleteBtn")
								.click(
										function(e) {
											e.preventDefault();
											var chk = new Array();
											if ($(":checkbox[name='chk']:checked").length == 0) {
												alert("삭제할 항목을 하나이상 체크해주세요.");
												return;
											} else {
												if ($(":checkbox[name=chk]:checked").val()) {
													/* $(":checkbox[name='chk']:checked").each(function() {
														alert($(this).val());
														chk.push($(this).val());
													}); */
													$("#listForm").attr("method", "POST");
													/* $("#listForm").attr("action", "/cart/cartDelete.do?cartlistId=${cart.cartlistId}"); */
													$("#listForm").attr("action", "/cart/cartDelete.do");
													$("#listForm").submit();
												}
											}
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
				<td class="choose"><p class="gold">STEP1</p><b class="white">장바구니</b></td>
				<td><p class="gold">STEP2</p><b class="white">주문/결제</b></td>
				<td><p class="gold">STEP3</p><b class="white">주문완료</b></td>
			</tr>
		</table>


		<div class="body">
			<form name="listForm" id="listForm" method="post">
				<!-- action="/buy/buyInsert.do" -->
				<br>
				<table class="cartListtable">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" /></th>
							<th>이미지</th>
							<th>상품명</th>
							<th>원산지</th>
							<th>제조사</th>
							<th>가격</th>
							<th>수량</th>
							<th>합계</th>
							<th>배송비</th>
							<th>취소</th>
						</tr>
					</thead>

					<c:choose>
						<c:when test="${not empty cartList }">

							<c:forEach var="cart" items="${cartList}" varStatus="status">

								<tbody>
									<tr>
										<td align="center"><input type="checkbox" name="chk" value="${cart.cartlistId }" id="chk" /></td>
										<td>${cart.cartlistImage }<input type="hidden" name="productId" value="${cart.productId }"> 
										<input type="hidden" name="userId" value="${cart.userId }"></td>
										<td>${cart.cartlistName }</td>
										<td>${cart.cartlistOrigin }</td>
										<td>${cart.cartlistCompany }</td>
										<td><fmt:formatNumber pattern="###,###,###"
												value="${cart.cartlistPrice }" /></td>

										<td>
											<input type="hidden" name="cartlistId" value="${cart.cartlistId }">
											<input type="hidden" name="productId" value="${cart.productId }"> 
											<input type="hidden" name="userId" id="userId" value="${sessionScope.UVO.user_number }">
											<input type="number" min="1" style="width: 40px" id="cartlistQuantity" name="cartlistQuantity" value="${cart.cartlistQuantity }">개
										</td>
										<td><fmt:formatNumber pattern="###,###,###"
												value="${cart.money }" /></td>
										<td>무료</td>
										<td><a
											href="/cart/cartDelete.do?cartlistId=${cart.cartlistId}">삭제</a></td>

									</tr>
									
									<tr>
							<td colspan="10"><img src="/images/line.png" style="width: 100%;" > </td>
							</tr>


								</tbody>

							</c:forEach>
							<tfoot>
								<tr>
									<td><input type="button" id="deleteBtn" name="deleteBtn"
										value="선택삭제" /></td>
									<td><input type="button" id="updateBtn" name="updateBtn"
										value="수량수정" /></td>
								</tr>
								<tr>
									<td colspan="10" align="right">총 합계금액 :
									<fmt:formatNumber pattern="###,###,###"
											value="${total }" /> 원</td>
								</tr>
								<tr>

									<td colspan="10" align="right"><input type="button"
										id="buyBtn" name="buyBtn" value="구매하기" /> <!-- <input type="submit"
										value="구매하기"> --></td>

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
	<div align="center">
		<button id="conShopping">쇼핑계속</button>
		<button id="shopMain">메인으로</button>
	</div>

	<%@ include file="/footer.jsp"%>
</body>
</html>