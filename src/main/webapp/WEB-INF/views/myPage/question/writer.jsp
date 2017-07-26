<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../css/questionWriter.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//목록버튼
		$("#questionListBtn").on("click", function() {
		
			$("#question_insertForm").attr({
				"method" : "POST",
				"action" : "/myPage/question/question.do"
			});
			$("#question_insertForm").submit();
		});
	});
</script>
</head>
<body>
	<div class="alldiv">
	<c:choose>
		<c:when test="${not empty sessionScope.UVO}">




			<form id="question_insertForm" name="question_insertForm"
				action="/myPage/question/questionInsert.do" method="post" enctype="multipart/form-data">
				<input type="hidden" id="user_number" name="user_number"
					value="${sessionScope.UVO.user_number}">
					<h2 align="center">1:1 문의 작성</h2>
				<table id="questionWriterTB">
					<tr>

						<th>작성자</th>
						<td><input type="text" id="user_name" name="user_name"
							value="${sessionScope.UVO.user_name}" readonly="readonly" /><br /></td>

					</tr>
					<tr>
						<th>글제목</th>
						<td><input type="text" id="question_title"
							name="question_title" size="100" /><br /></td>
					</tr>
					<tr>
						<th>글내용</th>
						<td><textarea rows="10" cols="103" id="question_content"
								name="question_content"></textarea><br /></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" id="Question_url"
							name="Question_url" /><br/></td>
					</tr>
				</table>
				<p align="center">
				<input type="submit" id="questionInsertBtn" name="questionInsertBtn"
					value="작성">
					<input type="button" id="questionListBtn" name="questionListBtn"
		value="목록" /></p>
			</form>
		</c:when>
	</c:choose>

	
		</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>