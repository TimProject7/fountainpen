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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//글쓰기버튼
		$("#questionListBtn").on("click", function() {
			//입력값 체크
			var ext = $('#Question_image').val().split('.').pop().toLowerCase();
			if(jQuery.inArray(ext,['gif','png','jpg','jpeg'])==-1){
				alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.')
			}
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
	<c:choose>
		<c:when test="${not empty sessionScope.UVO}">




			<form id="question_insertForm" name="question_insertForm"
				action="/myPage/question/questionInsert.do" method="post" enctype="multipart/form-data">
				회원번호<input type="text" id="user_number" name="user_number"
					value="${sessionScope.UVO.user_number}">
				<table border="1">
					<tr>

						<td>작성자</td>
						<td><input type="text" id="user_name" name="user_name"
							value="${sessionScope.UVO.user_name}" /><br /></td>

					</tr>
					<tr>
						<td>글제목</td>
						<td><input type="text" id="question_title"
							name="question_title" /><br /></td>
					</tr>
					<tr>
						<td>글내용</td>
						<td><textarea rows="10" cols="30" id="question_content"
								name="question_content"></textarea><br /></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" id="Question_url"
							name="Question_url" /><br/></td>
					</tr>
				</table>
				<input type="submit" id="questionInsertBtn" name="questionInsertBtn"
					value="작성">
			</form>
		</c:when>
	</c:choose>

	<input type="button" id="questionListBtn" name="questionListBtn"
		value="목록" />
	<%@ include file="/footer.jsp"%>
</body>
</html>