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
<title>1:1문의 상세보기창 수정가능 삭제는 관리자만가능</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//글쓰기폼으로이동
		$("#questionUpdateBtn").click(function() {
			//입력값 체크

			$("#updateForm").attr({
				"method" : "POST",
				"action" : "/myPage/question/DetailUpdate.do"
			});
			$("#updateForm").submit();
		});

		$("#questionListBtn").click(function() {
			//입력값 체크

			$("#updateForm").attr({
				"method" : "post",
				"action" : "/myPage/question/question.do"
			});
			$("#updateForm").submit();
		});

	});
</script>
</head>
<body>
	<form id="updateForm" name="updateForm">
		<c:choose>
			<c:when test="${not empty sessionScope.UVO}">
				<input type="text" id="user_number" name="user_number"
					value="${sessionScope.UVO.user_number}" />


				<table border="1">
					<tr>
						<td>작성자</td>
						<td><input type="text" id="user_name" name="user_name"
							value="${sessionScope.UVO.user_name}" /></td>
						<td>작성일</td>
						<td><input type="text" id="user_regdate" name="user_regdate"
							value="${sessionScope.UVO.user_regdate}" /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" id="question_title"
							name="question_title" value="${questionDetail.question_title}" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3"><input type="text" id="question_content"
							name="question_content"
							value="${questionDetail.question_content}" /></td>
					</tr>
					<tr>
						<td>이미지</td>
						<td colspan="3"><img
							src="/resources/images/${questionDetail.question_image}"
							width="150"></td>
					</tr>
				</table>
				<c:if test="${questionDetail.question_seq == 2}">
					<table>
						<tr>
							<td>이미지</td>
							<td>내용</td>
							<td>답변일자</td>
						</tr>
						<tr>
							<td>${questionReply.questionreply_image }</td>
							<td>${questionReply.questionreply_content }</td>
							<td>${questionReply.questionreply_regdate }</td>
						</tr>
					</table>
				</c:if>
			</c:when>
		</c:choose>
	</form>
	<input type="button" id="questionUpdateBtn" name="questionUpdateBtn"
		value="수정" />
	<input type="button" id="questionListBtn" name="questionListBtn"
		value="목록으로" />
</body>
</html>