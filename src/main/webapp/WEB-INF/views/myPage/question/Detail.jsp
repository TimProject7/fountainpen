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
		//수정완료버튼
		$("#questionUpdateBtn").click(function() {
			//입력값 체크

			$("#updateForm").attr({
				"method" : "POST",
				"action" : "/myPage/question/DetailUpdate.do"
			});
			$("#updateForm").submit();
		});

		//목록보기버튼
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
				<input type="hidden" id="user_number" name="user_number"
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
						<td colspan="3"><textarea id="question_content"
								name="question_content" style="width: 500px; height: 250px;">${questionDetail.question_content}                     
                  </textarea></td>
					</tr>
					<tr>
						<td>이미지</td>
						<td colspan="3"><img
							style="min-width: 200px; min-height: 200px;"
							src="/resources/images/${questionDetail.question_image}"
							width="150"></td>
					</tr>
				</table>
            ${questionDetail.question_status}
            <c:if test="${questionDetail.question_status == 'Y'}">

					<table border="1">
						<tr align="center">
							<th colspan="3">안녕하세요? ${sessionScope.UVO.user_name}님</th>
							<td>답변일자 <br>${questionReply.questionreply_writedate}</td>
						</tr>
						<tr>
							<td><img alt=""
								src="/admin/resources/images/${questionReply.questionreply_image}"></td>
							<td colspan="3"><span style="width: 400px">${questionReply.questionreply_content}</span></td>
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