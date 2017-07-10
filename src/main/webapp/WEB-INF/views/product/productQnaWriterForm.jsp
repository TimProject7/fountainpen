<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>

<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품QnA글쓰기</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body>
	<div>
		<h2>상품Q&A글쓰기</h2>
		
		<form id="productQnaWriterForm" name="productQnaWriterForm"
			action="/product/productQnaInsert.do" method="post">
			<input type="text" id="productId" name="productId" value="${productId}"/>
			<table border="1">
				<tr>
					<td>문의유형</td>
					<td colspan="3"><input type="text" id="productQna_type"
						name="productQna_type"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" id="productQna_name"
						name="productQna_name" value="${sessionScope.UVO.user_id}"></td>

				</tr>

				<tr>
					<td>내용</td>
					<td><textarea id="productQna_content"
							name="productQna_content"></textarea></td>
				</tr>

			</table>
			<input type="submit" id="productQnawriterBtn"
				name="productQnawriterBtn" value="작성">
		</form>

	</div>
	<input type="button" id="productListBtn" name="productListBtn"
		value="목록">

</body>
</html>