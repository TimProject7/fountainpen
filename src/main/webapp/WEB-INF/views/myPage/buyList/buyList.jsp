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
<title>Insert title here</title>
<link rel="stylesheet" href="/css/buyList.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		/* 검색후 검색 대상과 검색단어 출력 */
		if ("<c:out value='${data.keyword}'/>" != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
		}
		/* /* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});
		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("글 목록 전체");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
			;
		});

		//검색버튼
		$("#searchData").click(function() {
			//검색조건이 전체가 아닐시 키워드로 검색
			if ($("#search").val() == "all") {
				$("#keyword").val("");
			} else {
				if (!chkSubmit($('#keyword'), "검색어를")) {
					return;
				}
			}
			goPage(1);
		});
		//최근1주 라디오버튼
		$("#week1_buy").click(function() {
			$("#week1_buy").val()

			goPage(1)
		})

		//최근2주 라디오버튼
		$("#week2_buy").click(function() {
			$("#week2_buy").val()

			goPage(1)
		})
		//최근한달 라디오버튼
		$("#month1_buy").click(function() {
			$("#month1_buy").val()

			goPage(1)
		})

	});
	//검색한페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
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
	<div class="alldiv">
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
				<li><a href="/myPage/userInfo/userInfoPassword.do">회원정보변경</a></li>
				<li><a href="/myPage/buyList/buyList.do"><b>구매내역</b></a></li>
				<li><a href="/myPage/question/question.do">1:1문의</a></li>
				<li><a href="/cart/cartList.do">장바구니</a></li>
				<li><a href="/myPage/delivery/delivery.do">배송정보</a></li>
			</ul>

			<h2>구매내역</h2>
		</div>
		<!-- 페이지 넘버 -->
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <input
				type="hidden" id="pageSize" name="pageSize" value="${data.pageSize}" />
			<center>
			<label for="month1_buy">최근1달<input type="radio" id="month1_buy" name="month1_buy" value="month1"></label> 
			<label for="week2_buy">최근2주<input type="radio" id="week2_buy" name="week2_buy" value="week2"></label> 
			<label for="week1_buy">최근1주<input type="radio" id="week1_buy" name="week1_buy" value="week1"></label>
			</center>
			
		</form>

		<!-- 구매내역 리스트 -->
		<div>
			<table class="buylistTable">
				<tr></tr>
				<tr>
					<th>구매번호</th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>수량</th>
					<th>구매날짜</th>
				</tr>
				<c:choose>
					<c:when test="${not empty buyListlist}">
						<!-- varStatus 순서대로 나오게 루프 돌리는애 -->
						<!-- 컨트롤러에서 가져옴 -->
						<c:forEach var="buyListlist" items="${buyListlist}">
							<tr>
								<td>${buyListlist.buy_number}</td>
								<td><img src="../../images/${buyListlist.buy_image}" width="100%" height="150px"> </td>
								<td>${buyListlist.buy_product}</td>
								<td><fmt:formatNumber value="${buyListlist.buy_price}" pattern="###,###,###" /> 원</td>
								<td>${buyListlist.buy_quantity}</td>
								<td><fmt:formatDate value="${buyListlist.buy_day}"
										pattern="yyyy-MM-dd" /></td>
								<%-- <td>${buyListlist.buy_day}</td> --%>

							</tr>
							<tr><td colspan="6"><hr></td></tr>
							<%-- <input type="hidden" value="${buytotal+=buytotal }"> --%>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td>등록된 상품이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<!-- 페이지출력 -->
		<div id="buyListPage" align="center">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize}" />
		</div>

		<!--검색-->
			<table summary="검색"style="width: 310px;">

				<tr>
					<td><select name="search" id="search">

							<option value="all">전체</option>
							<option value="buy_product">상품명</option>
							<option value="buy_day">구매날짜</option>

					</select> <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
						<input type="button" value="검색" id="searchData"></td>
				</tr>
			</table>

	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>