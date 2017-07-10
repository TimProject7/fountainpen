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
<title>상품 상세정보</title>
<style>
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab li {
	float: left;
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	background-color: rgb(0, 154, 200);
	padding: 6px 12px;
	color: #fff;
}

ul.tab li.current {
	background-color: rgb(0, 154, 200);
	color: #222;
}

.tabcontent.current {
	display: block;
}
</style>


<link rel="stylesheet" href="/css/productDetail.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
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

		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});

		/* /* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});
		//글쓰기폼으로이동
		$("#writerForm").click(function() {
			//입력값 체크

			$("#productQnaInsertForm").attr({
				"method" : "post",
				"action" : "/product/productQnaWriterForm.do"
			});
			$("#productQnaInsertForm").submit();
		});

	});

	//검색한페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page) {
		/* if ($("#search").val() == "all") {
			$("#keyword").val("");
		} */
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/product/productQna.do"
		});
		$("#f_search").submit();

	}
</script>
</head>
<body>

	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" name="productId" id="productId"
			value="${detail.productId}" />
	</form>
	<div id="productDetail_all">
		<h2>상품 상세정보</h2>
		<br>
		<table id="productDetail_table">
			<tbody>

				<tr>
					<td align="left" colspan="2"><b>${detail.productName }</b></td>
					<td align="right" style="font-size: 0.8em;"><b><a
							href="/product/productList.do">상품 목록</a></b></td>
				</tr>

				<tr>
					<td colspan="3"><hr> <br></td>
				</tr>

				<tr>
					<td rowspan="6" width="60%"><img
						src="../images/${detail.productImage }" width="100%"
						height="300px"></td>
				</tr>
				<tr>
					<th width="10%">상품명</th>
					<td width="30%%">${detail.productName }</td>
				</tr>
				<tr>
					<th>가격</th>
					<td><fmt:formatNumber value="${detail.productPrice }"
							pattern="###,###,###" /> 원</td>
				</tr>
				<tr>
					<th>제조사</th>
					<td>${detail.productCompany }</td>
				</tr>
				<tr>
					<th>원산지</th>
					<td>${detail.productOrigin }</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<form id="form1" name="form1" method="POST">
							<!-- action="/cart/cartInsert.do" -->


							<input type="hidden" name="productId"
								value="${detail.productId }"> <input type="hidden"
								name="userId" id="userId"
								value="${sessionScope.UVO.user_number }"> <select
								name="cartlistQuantity">
								<c:forEach begin="1" end="10" var="i">
									<option value="${i}">${i }</option>
								</c:forEach>
							</select>&nbsp;개
							<!-- <input type="submit" value="장바구니에 담기"> -->
						</form> <br> <!-- <input type="button" value="장바구니" id="cartBtn" /> -->
						<input type="image" src="../images/btn02.gif" id="cartBtn">
						<!-- <input type="button" value="구매하기" id="buyBtn" /> --> <input
						type="image" src="../images/btn01.gif" id="buyBtn">

					</td>
				</tr>
			</tbody>

		</table>
		<div align="center">
			<p>상품상세설명</p>
			<p>${detail.productContent }</p>
		</div>

	</div>

	<!-- 여기서부터 상품 Q&A -->


	<div id="container">
		<ul class="tab">
			<li class="current" data-tab="tab1" style="width: 50%;"><a
				href="#">Q&A</a></li>
			<li data-tab="tab2" style="width: 50%;"><a href="#">리뷰</a></li>
		</ul>

		<div id="tab1" class="tabcontent current">
			<h3>About</h3>

			<!-- 페이지 넘버 가져오는 폼 -->
			<input type="text" id="product_number" name="product_number"
				value="${productId}" />
			<form id="f_search" name="f_search">
				<input type="hidden" id="page" name="page" value="${data.page}" />


			</form>
			<div class="all" align="center">
				<h2>Q&A</h2>
				<br>
				<form id="productQnaInsertForm" name="productQnaInsertForm">
				 
					<input type="hidden" name="productId" id="productId"
						value="${detail.productId}" />
					<table id="productQnaTable" border="1">
						<tr>
							
							<th>문의유형</th>
							<th width="60%">글내용</th>
							<th>작성자</th>
							<th>작성일</th>
							<th width="5%">조회수</th>
						</tr>
						<!-- 데이터 전체를 List로 불러와서 포이치문으로 출력 -->
						<c:choose>
							<c:when test="${not empty ProductQnaList}">
								<c:forEach var="ProductQnaList" items="${ProductQnaList}">
								<input type="hidden" id="productQna_number" name="productQna_number" value="${ProductQnaList.productQna_number}" />
									<tr>
										
										<td>${ProductQnaList.productQna_type}</td>
										<td id="title"><a
											href="/product/productQnaDetail.do?productQna_number=${ProductQnaList.productQna_number}&productId=${ProductQnaList.productId}">${ProductQnaList.productQna_content}</a></td>
										<td id="writer">${ProductQnaList.productQna_name}</td>
										<td id="center">${ProductQnaList.productQna_writedate}</td>
										<td id="center">${ProductQnaList.productQna_viewCnt}</td>
									</tr>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td>등록된 게시물이 존재하지않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<p id="right">
						<input type="button" id="writerForm" name="writerForm" value="글쓰기">
					</p>
				</form>
			</div>
			<!-- 페이지출력 -->
			<div id="questionPage" align="center">
				<tag:paging page="${param.page}" total="${total}"
					list_size="${data.pageSize}" />
			</div>
		</div>

		<div id="tab2" class="tabcontent">
			<h3>Portfolio</h3>
			<jsp:include page="productReviewReply.jsp"></jsp:include>
		</div>

	</div>


	<%@ include file="/footer.jsp"%>
</body>
</html>