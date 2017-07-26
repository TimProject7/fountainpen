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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//목록으로
	$("#productListBtn").click(function() {
		$("#productQnaWriterForm").attr({
			"method" : "POST",
			"action" : "/product/productList.do"
		});
		$("#productQnaWriterForm").submit();
	})
})
</script>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/qnaWriter.css" />
</head>
<body>
	<div id="alldiv">
		<h2 align="center">상품Q&A글쓰기</h2>
			<br>
		<form id="productQnaWriterForm" name="productQnaWriterForm"
			action="/product/productQnaInsert.do" method="post">
			<input type="hidden" id="productId" name="productId"
				value="${productId}" />
			<table id="qnaWritertb">
				<tr>
					<th>문의유형</th>
					<td colspan="3" align="center"><label for="productQna_type"><input
							type="radio" id="productQna_type" name="productQna_type"
							value="상품문의">상품문의</label> <label for="productQna_type"><input
							type="radio" id="productQna_type" name="productQna_type"
							value="배송문의">배송문의</label> <label for="productQna_type"><input
							type="radio" id="productQna_type" name="productQna_type"
							value="교환&변경">교환or변경</label> <label for="productQna_type"><input
							type="radio" id="productQna_type" name="productQna_type"
							value="취소">취소</label> <label for="productQna_type"><input
							type="radio" id="productQna_type" name="productQna_type"
							value="기타">기타</label></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" id="productQna_name"
						name="productQna_name" value="${sessionScope.UVO.user_id}" readonly="readonly"></td>

				</tr>

				<tr>
					<th>내용</th>
					<td><textarea id="productQna_content"
							name="productQna_content" cols="115"  ></textarea></td>
				</tr>

			</table>
			<p align="center">
			<input type="submit" id="productQnawriterBtn"
				name="productQnawriterBtn" value="작성">
				<input type="button" id="productListBtn" name="productListBtn"
		value="목록">
		<input type=button value="되돌아가기" onClick="history.back();">
		</p>
		</form>

	</div>
	

</body>
</html>
<%@ include file="/footer.jsp"%>