<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	$(document).ready(function() {
						//선택삭제 할때 아무것도 선택이안됬을시
						$("#cancleBtn").click(function(e) {
											e.preventDefault();
											var chk = new Array();
											if ($(":checkbox[name='chk']:checked").length == 0) {
												alert("삭제할 항목을 하나이상 체크해주세요.");
												return;
											} else {
												if ($(":checkbox[name=chk]:checked").val()) {
													$("#deliveryForm").attr("method", "POST");
													$("#deliveryForm").attr("action","/myPage/delivery/deliveryDeleteForm.do");
													$("#deliveryForm").submit();
												}
											}
										});
						//배송확인
						$("#okBtn").click(function(e) {
							e.preventDefault();
							var chk = new Array();
							if ($(":checkbox[name='chk']:checked").length == 0) {
								alert("삭제할 항목을 하나이상 체크해주세요.");
								return;
							} else {
								if ($(":checkbox[name=chk]:checked").val()) {
									$("#deliveryForm").attr("method", "POST");
									$("#deliveryForm").attr("action","/myPage/delivery/deliveryOkForm.do");
									$("#deliveryForm").submit();
								}
							}
						});
									});
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
<c:if test="${msg == '완료성공'}">
<script>alert('배송완료 되었습니다');location.href="/myPage/delivery/delivery.do"</script>
</c:if>

<c:if test="${msg == '취소성공'}">
<script>alert('취소 되었습니다');location.href="/myPage/delivery/delivery.do"</script>
</c:if>

<c:if test="${msg == '실패'}">
<script>alert('배송상태를 확인해주세요');location.href="/myPage/delivery/delivery.do"</script>
</c:if>

	<div class="alldiv">

		<div id="myPageForm" align="center">
			<ul id="myPageForm_nav_ul">
				<li><a href="/myPage/userInfo/userInfoPassword.do">회원정보변경</a></li>
				<li><a href="/myPage/buyList/buyList.do">구매내역</a></li>
				<li><a href="/myPage/question/question.do">1:1문의</a></li>
				<li><a href="/cart/cartList.do">장바구니</a></li>
				<li><a href="/myPage/delivery/delivery.do"><b>배송정보</b></a></li>
			</ul>
			<h2>배송정보</h2>
			<br>
		</div>
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" />
			
		</form>

		<div align="center">
			<form id="deliveryForm" name="deliveryForm">
				<table class="deliveryTable">
					<tr>
						<th>선택</th>
						<th>주문일자</th>
						<th>주문번호</th>
						<th>상품명</th>
						<th>주문금액</th>
						<th>진행상황</th>
					</tr>
					<c:forEach var="delivery" items="${deliveryList}">
						<tr>
							<td align="center"><input type="checkbox" name="chk"
								value="${delivery.buy_number }" id="chk" /></td>
							<td><fmt:formatDate value="${delivery.buy_day}"
									pattern="yyyy-MM-dd" /></td>
							<td>${delivery.buy_number}</td>
							<td>${delivery.buy_product}</td>
							<td><fmt:formatNumber value="${delivery.buy_price}" pattern="###,###,###" /> 원</td>
							<td>${delivery.buy_status}</td>
						</tr>
						<tr><td colspan="6"><hr></td></tr>
					</c:forEach>
				</table>
			</form>
			<input type="button" id="cancleBtn" name="cancleBtn" value="주문취소" />
			<input type="button" id="okBtn" name="okBtn" value="배송완료" />
			<p style="color: red;"><b>※배송완료는 배송중 일때만, 주문취소는 배송전 상태에서만 가능합니다.</b></p>
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