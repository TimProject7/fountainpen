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
<title>Insert title here</title>
<link rel="stylesheet" href="/css/buyList.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var buytotal = 0;

	})
	/* /* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
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
			"action" : "/myPage/buyList/buyList.do"
		});
		$("#f_search").submit();

	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.UVO}">
			<input type="hidden" id="user_number" name="user_number"
				value="${sessionScope.UVO.user_number}" />
			<input type="hidden" id="user_name" name="user_name"
				value="${sessionScope.UVO.user_name}" />

		</c:when>
	</c:choose>

	<div id="myPageForm" align="center">
		<ul id="myPageForm_nav_ul">
			<li><a href="/myPage/myPageForm.do">회원정보변경</a></li>
			<li><a href="/myPage/buyList/buyList.do">구매내역</a></li>
			<li><a href="/myPage/question/question.do">1:1문의</a></li>
			<li><a href="/myPage/cartList/cartList.do">장바구니</a></li>
			<li><a href="/myPage/delivery/delivery.do">배송정보</a></li>
		</ul>
	
		<h2>구매내역</h2>
	</div>
	<!-- 페이지 넘버 -->
	<form id="f_search" name="f_search">
		<input type="hidden" id="page" name="page" value="${data.page}" />
	</form>
	<!-- 구매내역 리스트 -->
	<div>
		<table border="1">
			<tr></tr>
			<tr>
				<td>구매번호
				<td>상품이미지</td>
				<td>상품명</td>
				<td>상품가격</td>
				<td>수량</td>
				<td>구매날짜</td>
				<td>합계</td>
			</tr>
			<c:choose>
				<c:when test="${not empty buyList}">
					<!-- varStatus 순서대로 나오게 루프 돌리는애 -->
					<!-- 컨트롤러에서 가져옴 -->
					<c:forEach var="buy" items="${buyList}">
						<tr>
							<td>${buy.buy_number}</td>
							<td>${buy.product_image}</td>
							<td>${buy.product_name}</td>
							<td>${buy.product_price}</td>
							<td>${buy.buy_quantity}</td>
							<td>${buy.buy_day}</td>
							<td>${buytotal=buy.buy_quantity*buy.product_price}</td>

						</tr>
						<input type="hidden" value="${buytotal+=buytotal }">
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>등록된 상품이 없습니다</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		총합계${total}
	</div>
	<!-- 페이지출력 -->
	<div id="questionPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>

</body>
</html>