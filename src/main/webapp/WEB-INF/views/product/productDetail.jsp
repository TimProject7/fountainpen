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
<style>
.tabmenu {
	position: relative;
	width: 400px;
	height: 200px;
	font-family: dotum, "", verdana;
	line-height: 17px;
	font-size: 12px;
	color: #555;
}

.tabmenu img {
	border: none;
	vertical-align: top;
}

.tabmenu ul {
	margin: 0px;
	padding: 0px;
	list-style: none;
	margin-top: 15px;
}

.tabmenu ul li {
	float: left
}

.tabmenu .tabcontent {
	display: none;
	width: 240px;
	height: 125px;
	position: absolute;
	left: 0px;
	top: 60px
}

.tabmenu .morebtn {
	position: absolute;
	right: 0;
	top: 30px;
}
</style>


<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	/* $(document).ready(function(){
		$("#insertCart").click(function(){//[장부구니에 담기]버튼클릭
			var buye = $("#buyer").val();
			
		})
	}) */
	$(document).ready(function() {

		$("#cartBtn").click(function() {//[장바구니에담기] 버튼클릭

			$("#form1").attr({
				"method" : "POST",
				"action" : "/cart/cartInsert.do"
			});
			$("#form1").submit();
		});

		$("#buyBtn").click(function() {//[구매하기] 버튼클릭

			$("#form1").attr({
				"method" : "POST",
				"action" : "/buy/buycartInsert.do"
			});
			$("#form1").submit();
		});

		$(".tabmenu").each(function() {
			var tab = $(this).children("ul");
			var tabBtn = tab.children("li").children("a");
			var content = tabBtn.nextAll();

			// 탭버튼을 클릭했을때
			tabBtn.click(function() {
				// 이미 on 상태면 pass
				if ($(this).hasClass("on"))
					return;

				// 모든 컨텐츠 부분을 안보이게 한뒤
				content.hide();

				// 클릭한 tab 버튼(a태그) 옆의 모든 태그들은 보이도록
				$(this).nextAll().show();

				// 모든탭 버튼에 있던 on 클래스를 빼고
				// 현재 클릭한 탭메뉴 버튼에 on 클래스 추가
				tabBtn.removeClass("on");
				$(this).addClass("on");

				// 탭버튼를 쭉 돌면서 on 클래스가 있는 버튼만 on 이미지로 바꾸고
				// 나머지 버튼들은 off 이미지로 바꾼다.
				tabBtn.each(function() {
					var src;
					var img = $(this).children("img");
					if ($(this).hasClass("on")) {
						src = img.attr("src").replace("_off.", "_on.");
					} else {
						src = img.attr("src").replace("_on.", "_off.");
					}

					img.attr("src", src);
				});
			});

			// 맨첫번째 탭버튼 클릭처리
			tabBtn.eq(0).click();
		});

	});
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
					<td rowspan="6"><img
						src="/admin/resources/images/${detail.productImage }" width="100%"
						height="300px"></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>${detail.productName}</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${detail.productPrice}</td>
				</tr>
				<tr>
					<td>제조사</td>
					<td>${detail.productCompany}</td>
				</tr>
				<tr>
					<td>원산지</td>
					<td>${detail.productOrigin}</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<form id="form1" name="form1" method="POST">
							<!-- action="/cart/cartInsert.do" -->


							<input type="hidden" name="productId" value="${detail.productId}">
							<input type="hidden" name="userId" id="userId"
								value="${sessionScope.UVO.user_number}"> <select
								name="cartlistQuantity">
								<c:forEach begin="1" end="10" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>&nbsp;개
							<!-- <input type="submit" value="장바구니에 담기"> -->
						</form> <input type="button" value="장바구니" id="cartBtn" /> <input
						type="button" value="구매하기" id="buyBtn" /> <!-- <a href="/buy/buyList.do">구매하기</a> -->

						<a href="/product/productList.do">상품 목록</a>
					</td>
				</tr>
			</tbody>

		</table>
		<div align="center">
			<p>상품상세설명</p>
			<p>${detail.productContent}</p>
		</div>

	</div>
	<div class="tabmenu">
		<h2>첫번째 탭메뉴</h2>

		<ul>
			<li><a href="#link"><img src="../images/menu_01_off.gif"
					alt="메뉴01" /></a>
				<ul class="tabcontent">
					<li><jsp:include page="productQnaReply.jsp"></jsp:include></li>
				</ul>
				<p class="morebtn">
					<a href="#"><img src="../images/more.gif" alt="MORE" /></a>
				</p></li>
			<li><a href="#link"><img src="../images/menu_02_off.gif"
					alt="메뉴02" /></a>
				<ul class="tabcontent">
					<li><jsp:include page="productReviewReply.jsp"></jsp:include></li>
				</ul>
				<p class="morebtn">
					<a href="#"><img src="../images/more.gif" alt="MORE" /></a>
				</p></li>

		</ul>
	</div>




	<%@ include file="/footer.jsp"%>
</body>
</html>
