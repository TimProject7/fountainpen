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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#conShopping").click(function(){ //[쇼핑계속] 버튼클릭
		window.location.href="/product/productList.do";	
	});
	$("#shopMain").click(function(){ //[메인으로] 버튼클릭
		window.location.href="/";
	});
	
	//체크박스 전체선택 
	$("#checkAll").click(function(){
		//클릭되었으면
		if($("#checkAll").prop("checked")){
			//input 태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			$("input[name=chk]").prop("checked",true);
			//클릭이 안되있으면
		}else{
			//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
			$("input[name=chk]").prop("checked",false);
		}
	});
	
	// 체크되어 있는 값 추출
	$("#getCheckedAll").click(function(){
		$("input[name=chk]:checked").each(function(){
			var test = $(this).val();
			console.log(test);
		});
	});
	
	
});	
	
	
	
</script>
<style type="text/css">
.all {
	width: 100%;
	margin: 0 auto;
	padding: 0;
}

.header {
	border: 1px;
	width: 80%;
	height: 100px;
	background: yellow;
}

.body {
	background: blue;
	width: 80%;
}

table {
	width: 80%;
}
</style>
</head>
<body>
	<div class="all">
		<div class="header">
			<h1 align="left">1.장바구니확인</h1>
			<h3 align="right">1.장바구니 > 2.주문/결제 > 3.주문완료</h3>
		</div>
		<div class="body">
			<form name="listForm" id="listForm" method="post"
				action="/buy/buyInsert.do">

				<table>
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
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
										<td align="center"><input type="checkbox" name="chk" /></td>
										<td>${cart.cartlistImage }<input type="hidden"
											name="productId" value="${cart.productId }"> <input
											type="hidden" name="userId" value="${cart.userId }"></td>
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

									<td colspan="10" align="right"><input type="submit"
										value="구매하기"></td>
										
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