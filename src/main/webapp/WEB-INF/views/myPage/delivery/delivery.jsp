<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
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

	<div id="myPageForm" align="center">
		<ul id="myPageForm_nav_ul">
			<li><a href="/myPage/myPageForm.do">회원정보변경</a></li>
			<li><a href="/myPage/buyList/buyList.do">구매내역</a></li>
			<li><a href="/myPage/question/question.do">1:1문의</a></li>
			<li><a href="/myPage/cartList/cartList.do">장바구니</a></li>
			<li><a href="/myPage/delivery/delivery.do">배송정보</a></li>
		</ul>
		<h2>배송정보</h2>
	</div>
	<form id="f_search" name="f_search">
		<input type="hidden" id="page" name="page" value="${data.page}" />
	</form>
	<div align="center">
		<ul id="search_nav">
			<li></li>
			<li>달력</li>
			<li></li>
			<li>달력</li>
			<li>조회버튼</li>
			<li>최근2주</li>
			<li>1개월</li>
			<li>3개월</li>
			<li>6개월</li>
			<li>1년</li>
		</ul>
	</div>
	<div align="center">
		<table border="1">
			<tr>
				<td>주문일자</td>
				<td>주문번호</td>
				<td>상품명</td>
				<td>주문금액</td>
				<td>진행상황</td>
			</tr>
			<c:forEach var="delivery" items="${deliveryList}">
				<tr>
					<td>${delivery.buy_number}</td>
					<td>${delivery.buy_day}</td>
					<td>${delivery.buy_product}</td>
					<td>${delivery.buy_price}</td>
					<td>${delivery.buy_status}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 페이지출력 -->
	<div id="questionPage" align="center">
		<!-- total 전체레코드
		data.pageSize 페이지갯수
	 -->
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>

</body>
</html>