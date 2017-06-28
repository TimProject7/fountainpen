<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ include file="/header.jsp"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	/* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
	if ("<c:out value='${data.pageSize}'/>" != "") {
		$("#pageSize").val("<c:out value='${data.pageSize}'/>");
	}

	/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
	$("#pageSize").change(function() {
		goPage(1);
	});
	
});
	function goProductDetail(productId) {
		location.href = "/product/productDetail.do?productId=" + productId;
	}
	
	
	/* 상세 페이지 이동 함수(location 객체로 이동 url은 한라인으로 작성한다.) */
	function goDetail(productId, page, pageSize){
		location.href="/product/productDetail.do?productId=" +productId + "&page = " +page + "&pageSize =" +pageSize;
	}
	
</script>
</head>
<body>
	<%-- 	<h2>상품목록</h2>
	<table border="1">
		<tr>
			<th>상품ID</th>
			<th>이미지</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		<c:forEach var="row" items="${list }">
			<tr>
				<td>
					${row.productId }
				</td>
				<td>
					<a href="/product/detail/${row.productId }.do">
						<img src="/images/${row.productImage }" width="120px" height="110px">
					</a>
				</td>
				<td>
					<a href="/product/detail/${row.productId }.do">${row.productName }</a>
				</td>
				
				<td>
					<fmt:formatNumber value="${row.productPrice }" pattern="###,###,###"/>
				</td>
			</tr>
		</c:forEach>
	</table> --%>
	<h2>상품 목록</h2>
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>이미지</th>
			<th>상품명</th>
			<th>가격</th>
			<th>제조사</th>
			<th>원산지</th>
		</tr>
		<c:choose>
			<c:when test="${not empty productList }">

				<c:forEach var="product" items="${productList }" varStatus="status">
						
					<tr>
					
						<%-- <td>${count - (status.count-1)}</td> --%>
						<!-- 상품번호 -->
						<td>${product.productId }</td>
						<!-- 이미지 -->
						<%-- <td><a href="javascript:goProductDetail(${product.productId })"> <img
								src="${product.productImage }" width="150px" height="150px">
						</a></td> --%>
						<td align="left">
							<a href="javascript:goProductDetail(${product.productId },${data.page },${data.pageSize })"><img
								src="${product.productImage }" width="150px" height="150px"></a>
						</td>
					
						
						<!-- 상품명 -->
						<td>${product.productName }</td>
						<!-- 상품가격 -->
						<td><fmt:formatNumber value="${product.productPrice }"
								pattern="###,###,###" /></td>
						<!-- 제조사 -->
						<td>${product.productCompany }</td>
						<!-- 원산지 -->
						<td>${product.productOrigin }</td>
					</tr>
				</c:forEach>

			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">등록된 상품이 없습니다</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	<!-- 페이지 네비 -->
	<div id="productPage" align="center">
		<tag:paging page="${param.page }" total="${total }" list_size="${data.pageSize }"/>
	</div>
	
	<%@ include file="/footer.jsp"%>
</body>
</html>