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
		if ('${productQnaDetail.productQna_type}' == '상품문의') {
			$("input[id=productQna1]").prop("checked", true);
		}else if ('${productQnaDetail.productQna_type}' == '배송문의') {
			$("input[id=productQna2]").prop("checked", true);
		} else if ('${productQnaDetail.productQna_type}' == '변경') {
			$("input[id=productQna3]").prop("checked", true);
		} else if ('${productQnaDetail.productQna_type}' == '취소/환불') {
			$("input[id=productQna4]").prop("checked", true);
		} else if ('${productQnaDetail.productQna_type}' == '기타') {
			$("input[id=productQna5]").prop("checked", true);
		}
		/* 
		if ('param.productQna_type' == '상품문의') {
			$('input[id]:input[value=' +상품문의+ ']').attr(
					"checked", true)
		} else if (radiochk == '배송문의') {
			$('input[type=radio][name=productQna_type]:input[value=' + 배송문의 + ']').attr(
					"checked", true)
		 } else if (radiochk == '변경') {
			$('input[type=radio][name=productQna_type]:input[value=' + 변경 + ']').attr(
					"checked", true)
		} else if (radiochk == '취소/환불') {
			$('input[type=radio][name=productQna_type]:input[value=' + 취소/환불 + ']').attr(
					"checked", true)
		} else if (radiochk == '기타') {
			$(':input[type=radio][name=productQna_type]:input[value=' + 기타 + ']').attr(
					"checked", true)
		} */

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
<link rel="stylesheet" type="text/css" href="../css/qnaDetail.css" />
</head>
<body>
	<div id="alldiv">
		<div align="center">
			<h2>상품Q&A 상세보기</h2>
			<br>
			<c:if test="${userid == productQnaDetail.productQna_name}">
				<input type="button" id="productQnaDetailUpdate"
					name="userBoardDetailUpdate" value="수정" />
				<input type="button" id="productQnaDetailDelete"
					name="userBoardDetailDelete" value="삭제" />
			</c:if>
			<input type="button" id="productList" name="productList" value="목록" />
		</div>

		<form id="productQnaDetailUpdateForm"
			name="productQnaDetailUpdateForm">
			<input type="hidden" id="productId" name="productId"
				value="${productId}"> <input type="hidden"
				id="productQna_number" name="productQna_number"
				value="${productQnaDetail.productQna_number}"> <br>
			
			<table id="qnaDatailtb">
				<tr>
					<th>문의유형</th>
					<td colspan="3"><label for="productQna_type"><input
							type="radio" id="productQna1" name="productQna_type" value="상품문의">상품문의</label>
						<label for="productQna_type"><input type="radio"
							id="productQna2" name="productQna_type" value="배송문의">배송문의</label>
						<label for="productQna_type"><input type="radio"
							id="productQna3" name="productQna_type" value="교환&변경">교환&변경</label>
						<label for="productQna_type"><input type="radio"
							id="productQna4" name="productQna_type" value="취소/환불">취소/환불</label>
						<label for="productQna_type"><input type="radio"
							id="productQna5" name="productQna_type" value="기타">기타</label></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" readonly="readonly"
						value="${productQnaDetail.productQna_name}" /></td>
					<th>작성일</th>
					<td><input type="text" id="productQna_writedate"
						name="productQna_writedate"
						value="${productQnaDetail.productQna_writedate}" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><input type="text" id="productQna_content"
						name="productQna_content" size="110"
						value="${productQnaDetail.productQna_content}" /></td>
				</tr>

			</table>
		</form>
		<br>
		<hr>
		<br>
		<table id="qnaDatailtb">
			<c:choose>
				<c:when test="${not empty productQnaReply }">

					<tr>
						<th>안녕하세요. ${productQnaDetail.user_name }님
						</td>
						<th>${productQnaReply.productQnaReply_writedate}
						</td>
					</tr>
					<Tr>
						<td colspan="2" align="center">${productQnaReply.productQnaReply_content}</td>
					</Tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="2">등록된 답변이 없습니다.</td>
					</tr>
				</c:otherwise>

			</c:choose>
		</table>
	</div>
</body>
</html>