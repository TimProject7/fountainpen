<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>

<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../css/userWriterForm.css" />
<link rel="stylesheet" type="text/css"
	href="../../cleditor/jquery.cleditor.css">
<link rel="stylesheet" href="../../cleditor/jquery.cleditor.css" />
<script src="../../cleditor/jquery-1.4.4.min.js"></script>
<script src="../../cleditor/jquery.cleditor.min.js"></script>
<script src="../../cleditor/jquery.cleditor.table.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#userboard_content").cleditor({
			width : 500,
			height : 300
		});
		
		$("#userboardListBtn").click(function() {
			$("#userboardwriterForm").attr({
				"method" : "POST",
				"action" : "/serviceCenter/userBoard/userBoard.do"
			});
			$("#userboardwriterForm").submit();
		})
			

	});
</script>
</head>
<body>
	<div class="alldiv">
		<h2 align="center">회원게시판 글쓰기</h2>
		<form id="userboardwriterForm" name="userboardwriterForm"
			action="/serviceCenter/userBoard/userBoardInsert.do" method="post"
			enctype="multipart/form-data">
			<table border="1" id="userWriterTB">
				<tr>
					<th>작성자</th>
					<td><input type="text" id="userboard_name"
						name="userboard_name" value="${sessionScope.UVO.user_id}"></td>

				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" id="userboard_title"
						name="userboard_title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="userboard_content" name="userboard_content"></textarea>
					</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td colspan="3"><input type="file" id="userboard_url"
						name="userboard_url"></td>
				</tr>

			</table>
			<p align="center">
			<input type="submit" id="userboardwriterBtn"
				name="userboardwriterBtn" value="작성">
				<input type="button" id="userboardListBtn" name="userboardListBtn"
		value="목록"></p>
		</form>

	</div>
	

</body>
</html>