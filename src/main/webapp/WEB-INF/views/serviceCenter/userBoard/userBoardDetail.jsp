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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#userBoardDetailUpdate").click(function() {
			$("#userBoardDetailUpdateForm").attr({
				"method" : "POST",
				"action" : "/serviceCenter/userBoard/userBoardDetailUpdate.do"
			});
			$("#userBoardDetailUpdateForm").submit();
		})
		
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
	<div align="center">
		<h2>회원게시판 상세보기</h2>
		<c:if test="${username == userBoardDetail.userboard_name}">
		<input type="button" id="userBoardDetailUpdate" name="userBoardDetailUpdate" value="수정" /> 
		<input type="button" id="userBoardDetailDelete" name="userBoardDetailDelete" value="삭제" />
		</c:if>
		<input type="button" id="userBoardList" name="userBoardList" value="목록" />
	</div>

	<form id="userBoardDetailUpdateForm" name="userBoardDetailUpdateForm">
	<input type="hidden" id="userboard_number" name="userboard_number" value="${userBoardDetail.userboard_number}">
	
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" id="userboard_name"
					name="userboard_name" value="${userBoardDetail.userboard_name}" />
				</td>
				<td>작성일</td>
				<td><input type="text" id="userboard_writedate"
					name="userboard_writedate"
					value="${userBoardDetail.userboard_writedate}" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><input type="text" id="userboard_title"
					name="userboard_title" value="${userBoardDetail.userboard_title}" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" id="userboard_content"
					name="userboard_content"
					value="${userBoardDetail.userboard_content}" /></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="text" id="userboard_image"
					name="userboard_image" value="${userBoardDetail.userboard_image}" />
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 댓글 -->
	<jsp:include page="userBoardReply.jsp"></jsp:include>

</body>
</html>