<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<%@ page session="true"%>

<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원게시판 상세보기</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../css/userDetail.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#userBoardDetailDelete").click(function() {
			alert('삭제완료')
			$("#userBoardDetailUpdateForm").attr({
				"method" : "POST",
				"action" : "/serviceCenter/userBoard/userBoardDetailDelete.do"
			});
			$("#userBoardDetailUpdateForm").submit();
		})

		$("#userBoardDetailUpdate").click(function() {
			alert('수정완료')
			$("#userBoardDetailUpdateForm").attr({
				"method" : "POST",
				"action" : "/serviceCenter/userBoard/userBoardDetailUpdate.do"
			});
			$("#userBoardDetailUpdateForm").submit();
		})
		//목록으로
		$("#userBoardList").click(function() {
			$("#userBoardDetailUpdateForm").attr({
				"method" : "POST",
				"action" : "/serviceCenter/userBoard/userBoard.do"
			});
			$("#userBoardDetailUpdateForm").submit();
		})
	})
</script>
</head>
<body>

	<div style="width: 55%;">
	<h2 align="center">회원게시판 상세보기</h2>
	<div align="right">
		<input type="button" id="userBoardList" name="userBoardList"
			value="목록" />
			
	</div>

	<form id="userBoardDetailUpdateForm" name="userBoardDetailUpdateForm">
		<input type="hidden" id="userboard_number" name="userboard_number"
			value="${userBoardDetail.userboard_number}">

		<table id="userDetailTB">
			<tr>
				<th>제목</th>
				<td><input type="text" id="userboard_title" name="userboard_title" value="${userBoardDetail.userboard_title}"/></td>
				<td style="text-align: right;">${userBoardDetail.userboard_writedate}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="2"><input type="text" readonly="readonly" id="userboard_name" name="userboard_name" value="${userBoardDetail.userboard_name}"/></td>
				
			</tr>
			
			<tr>
				<th>내용</th>
				<td colspan="2"><textarea cols="115" rows="20" id="userboard_content" name="userboard_content">${userBoardDetail.userboard_content}</textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td colspan="2"><img id="userboard_image" name="userboard_image" src="../../resources/images/${userBoardDetail.userboard_image}"></td>
				
			</tr>
		</table>
	</form>
	<div align="center">
		<c:if test="${userid==userBoardDetail.userboard_name}">
			<input type="button" id="userBoardDetailUpdate"
				name="userBoardDetailUpdate" value="수정" />
			<input type="button" id="userBoardDetailDelete"
				name="userBoardDetailDelete" value="삭제" />
		</c:if>
	</div>

	<!-- 댓글 -->
	<jsp:include page="userBoardReply.jsp"></jsp:include>
</div>
</body>
</html>
<%@ include file="/footer.jsp"%>