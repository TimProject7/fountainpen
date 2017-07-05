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

	});
</script>
</head>
<body>
	<div>
		<h2>회원게시판 글쓰기</h2>
		<form id="userboardwriterForm" name="userboardwriterForm"
			action="/serviceCenter/userBoard/userBoardInsert.do" method="post"
			enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><input type="text" id="userboard_name"
						name="userboard_name" value="${sessionScope.UVO.user_id}"></td>

				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" id="userboard_title"
						name="userboard_title"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea id="userboard_content" name="userboard_content"></textarea>
					</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td colspan="3"><input type="file" id="userboard_url"
						name="userboard_url"></td>
				</tr>

			</table>
			<input type="submit" id="userboardwriterBtn"
				name="userboardwriterBtn" value="작성">
		</form>

	</div>
	<input type="button" id="userboardListBtn" name="userboardListBtn"
		value="목록">

</body>
</html>