<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품QnA 상세보기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//수정
	$("#productQnaDetailUpdate").click(function() {
		$("#productQnaDetailUpdateForm").attr({
			"method" : "POST",
			"action" : "/product/productQnaDetailUpdate.do"
		});
		$("#productQnaDetailUpdateForm").submit();
	})
	//목록으로
	$("#productList").click(function() {
		$("#productQnaDetailUpdateForm").attr({
			"method" : "POST",
			"action" : "/product/productList.do"
		});
		$("#productQnaDetailUpdateForm").submit();
	})
})
</script>
</head>
<body>
<div align="center">
		<h2>상품Q&A 상세보기</h2>
		
			<input type="button" id="productQnaDetailUpdate"
				name="userBoardDetailUpdate" value="수정" />
			<input type="button" id="productQnaDetailDelete"
				name="userBoardDetailDelete" value="삭제" />
		
		<input type="button" id="productList" name="productList"
			value="목록" />
	</div>

	<form id="productQnaDetailUpdateForm" name="productQnaDetailUpdateForm">
		<input type="hidden" id="productQna_number" name="productQna_number"
			value="${productQnaDetail.productQna_number}">

		<table border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly="readonly" value="${userid}"/></td>
				<td>작성일</td>
				<td><input type="text" id="productQna_writedate" name="productQna_writedate" value="${productQnaDetail.productQna_writedate}" /> </td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><input type="text" id="productQna_content" name="productQna_content" value="${productQnaDetail.productQna_content}"/></td>
			</tr>
			
		</table>
	</form>

	
</body>
</html>