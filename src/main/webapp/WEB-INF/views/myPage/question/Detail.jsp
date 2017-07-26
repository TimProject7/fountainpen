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
<link rel="stylesheet" type="text/css"
	href="../../css/questionDetail.css" />
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
	<div class="alldiv">
		<h2 align="center">1:1문의 상세보기</h2>
		<form id="updateForm" name="updateForm">

			<input type="hidden" id="user_number" name="user_number"
				value="${sessionScope.UVO.user_number}" />



			<table id="questionTb" border="1">
				<tr>
					<th>작성자</th>
					<td><input type="text" id="user_name" name="user_name"
						value="${sessionScope.UVO.user_name}" readonly="readonly" /></td>
					<th>작성일</th>
					<td><input type="text" id="user_regdate" name="user_regdate"
						value="${sessionScope.UVO.user_regdate}" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" id="question_title"
						name="question_title" value="${questionDetail.question_title}"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea id="question_content"
							name="question_content"
							style="width: 975px; height: 250px; max-width: 975px; max-height: 250px;"
							readonly="readonly">${questionDetail.question_content}                     
                  </textarea></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td colspan="3"><img
						style="min-width: 200px; min-height: 200px;"
						src="/resources/images/${questionDetail.question_image}"
						width="150"></td>
				</tr>
			</table>


		</form>
		<p align="center">
			<input type="button" id="questionUpdateBtn" name="questionUpdateBtn"
				value="수정" /> <input type="button" id="questionListBtn"
				name="questionListBtn" value="목록으로" />
		<p>
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
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>