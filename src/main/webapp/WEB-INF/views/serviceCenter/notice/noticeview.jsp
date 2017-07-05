<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice 게시물 보기</title>

<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

a {
	text-decoration: none;
	color: green;
}

a:HOVER {
	font-size: 1.1em;
	color: teal;
}

h2 {
	text-align: center;
}

th {
	text-align: left;
	background-color: black;
	color: white;
}

td {
	padding-left: 2%;
}
</style>

<script>
	$(document).ready(function() {

		//목록버튼
		$("#btnlist").click(function() {
			document.form1.action = "noticelist";
			document.form1.submit();

		});

	});
</script>

</head>

<body>


	<h2>게시글 보기</h2>

	<br>

	<form name="form1" method="post">
		<table>
			<tr>
				<th>작성일자</th>
				<td><fmt:formatDate value="${dto.notice_regdate}"
						pattern="yyyy-MM-dd a HH:mm:ss" /></td>
			</tr>

			<tr>
				<th>조회수</th>
				<td>${dto.notice_viewcnt}</td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input name="notice_title" id="notice_title" size="80"
					value="${dto.notice_title}"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea name="notice_content" id="notice_content"
						rows="4" cols="83">${dto.notice_content}</textarea></td>
			</tr>

			<tr>
				<th>작성자</th>
				<td><input name="notice_writer" id="notice_writer" size="80"
					value="${dto.notice_writer}" readonly="readonly"></td>
			</tr>
		</table>
		<div style="width: 650px; text-align: center;">
			<!-- 게시물번호를 hidden으로 처리 -->
			<input type="hidden" name="notice_no" value="${dto.notice_no}">
			<button type="button" id="btnlist">목록보기</button>
		</div>
	</form>

</body>
</html>