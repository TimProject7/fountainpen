<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>

<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<form id="cartListForm" name="cartListForm">
		<c:choose>
			<c:when test="${not empty sessionScope.UVO}">
				<input type="text" id="user_number" name="user_number"
					value="${sessionScope.UVO.user_number}" />
				<input type="text" id="user_name" name="user_name"
					value="${sessionScope.UVO.user_name}" />
			</c:when>
		</c:choose>
		<table>
			<tr>
				<td><input type="checkbox" />
				<td>이미지</td>
				<td>상품명</td>
				<td>금액</td>
				<td>수량</td>
				<td>합계</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>