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
				"method" : "get",
				"action" : "/product/productDetail.do"
			});
			$("#productQnaDetailUpdateForm").submit();
		})
	})
</script>
</head>
<body>
	<div align="center">
		<h2>상품Q&A 상세보기</h2>
		<c:if test="${userid == productQnaDetail.productQna_name}">
			<input type="button" id="productQnaDetailUpdate"
				name="userBoardDetailUpdate" value="수정" />
			<input type="button" id="productQnaDetailDelete"
				name="userBoardDetailDelete" value="삭제" />
		</c:if>
		<input type="button" id="productList" name="productList" value="목록" />
	</div>

	<form id="productQnaDetailUpdateForm" name="productQnaDetailUpdateForm">
		<input type="hidden" id="productId" name="productId"
			value="${productId}"> <input type="hidden"
			id="productQna_number" name="productQna_number"
			value="${productQnaDetail.productQna_number}">

		<table border="1">
			<tr>
				<td>문의유형</td>
				<td colspan="3"><label for="productQna_type"><input
						type="radio" id="productQna_type" name="productQna_type"
						value="상품문의">상품문의</label> <label for="productQna_type"><input
						type="radio" id="productQna_type" name="productQna_type"
						value="배송문의">배송문의</label> <label for="productQna_type"><input
						type="radio" id="productQna_type" name="productQna_type"
						value="교환&변경">교환&변경</label> <label for="productQna_type"><input
						type="radio" id="productQna_type" name="productQna_type"
						value="취소">취소</label> <label for="productQna_type"><input
						type="radio" id="productQna_type" name="productQna_type"
						value="기타">기타</label></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly="readonly"
					value="${productQnaDetail.productQna_name}" /></td>
				<td>작성일</td>
				<td><input type="text" id="productQna_writedate"
					name="productQna_writedate"
					value="${productQnaDetail.productQna_writedate}" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><input type="text" id="productQna_content"
					name="productQna_content"
					value="${productQnaDetail.productQna_content}" /></td>
			</tr>

		</table>
	</form>
	<table>
		<c:choose>

			<c:when test="${not empty productQnaReply }">
				<tr>
					<td>안녕하세요. ${productQnaReply.user_name }님</td>
					<td>${productQnaReply.productQnaReply_writedate}</td>
				</tr>
				<Tr>
					<td colspan="2">${productQnaReply.productQnaReply_content}</td>
				</Tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2">등록된 답변이 없습니다.</td>
				</tr>
			</c:otherwise>

		</c:choose>
	</table>

</body>
</html>