<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ page session="true"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송정보</title>

<link rel="stylesheet" href="/css/delivery.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	/* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
	if ("<c:out value='${data.pageSize}'/>" != "") {
		$("#pageSize").val("<c:out value='${data.pageSize}'/>");
	}

	/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
	$("#pageSize").change(function() {
		goPage(1);
	});

	//검색한페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page) {
		/* if ($("#search").val() == "all") {
			$("#keyword").val("");
		} */
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/myPage/delivery/delivery.do"
		});
		$("#f_search").submit();

	}
</script>
</head>
<body>

	<div class="alldiv">

		<div id="myPageForm" align="center">
			<ul id="myPageForm_nav_ul">
				<li><a href="/myPage/userInfo/userInfoPassword.do">회원정보변경</a></li>
				<li><a href="/myPage/buyList/buyList.do">구매내역</a></li>
				<li><a href="/myPage/question/question.do">1:1문의</a></li>
				<li><a href="/cart/cartList.do">장바구니</a></li>
				<li><a href="/myPage/delivery/delivery.do"><b>배송정보</b></a></li>
			</ul>
			<br>
			<h2>배송정보</h2>
			<br>
		</div>
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" />
			
		</form>
		<div align="center">
			<table class="deliveryTable">
				<tr>
					<th id="delth">주문일자</th>
					<th id="delth">주문번호</th>
					<th id="delth">상품명</th>
					<th id="delth">주문금액</th>
					<th id="delth">진행상황</th>
				</tr>
				<c:forEach var="delivery" items="${deliveryList}">
					<tr>
						<td>${delivery.buy_number}</td>
						<td>${delivery.buy_day}</td>
						<td>${delivery.buy_product}</td>
						<td>${delivery.buy_price}</td>
						<td>${delivery.buy_status}</td>
					</tr>
					<tr>
							<td colspan="6"><img src="/images/line.png" style="width: 100%;" > </td>
							</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 페이지출력 -->
		<!-- total 전체레코드 data.pageSize 페이지갯수-->
		<div id="questionPage" align="center">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize}" />
		</div>
		
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>